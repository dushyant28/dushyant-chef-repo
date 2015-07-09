# Cookbook Name:: sqlServer2008R2
# Recipe:: default

require 'chef/win32/version'
require 'artifactory'

# Set up the configuration variables
configFile = node['tmp'] + 'sqlServer2008Config.ini'
packageName = 'SQL Server 2008 R2 Database Engine Services'
windowsVersion = Chef::ReservedNames::Win32::Version.new

# Create the config file for unattended installation
template configFile do
	source 'sqlServer2008Config.ini.erb' 
	action :create
end	

#Prereq for Sql Server 2008 R2
if(windowsVersion.windows_server_2008? || windowsVersion.windows_server_2008_r2?)
	windows_feature 'NetFx3' do
		action :install
	end
end

directory "C:/SQLServer/" do 
	action :create
end

artifactory "Installer" do 
	group_id "SQLServer2008R2"
	version "2008"
	packaging "zip"
	dest node['sqlServer']['filePath']
	action :put
end

windows_zipfile node['sqlServer']['source'] do
	source node['sqlServer']['filePath']
	action :unzip
	not_if {::Dir.exists?(node['sqlServer']['source'])}
end

#Run the sql installer with our config file
windows_package packageName do
	source  node['sqlServer']['source'] + 'setup.exe'
	timeout node['sqlServer']['timeout']
	installer_type :custom
	options '/ConfigurationFile=' + configFile
	action :install
	#not_if{! ::Dir.exists?(node['sqlServer']['source']) }
end