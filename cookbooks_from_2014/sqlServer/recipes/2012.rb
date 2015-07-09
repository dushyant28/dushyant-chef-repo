# Cookbook Name:: sqlServer
# Recipe:: default

# Set up the configuration variables
configFile = node['tmp'] + 'sqlServerConfig.ini'
packageName = 'SQL Server 2012 Database Engine Services'

# Create the config file for unattended installation
template configFile do
	source 'sqlServer2012Config.ini.erb' 
	action :create
end	

#windows_zipfile node['sqlServer']['source'] do
	#source 'http://localhost:8081/artifactory/libs-release-local/SqlServer/Installer/2012/Installer-2012.zip'
	#action :unzip
	#not_if {::Dir.exists?(node['sqlServer']['source'])}
#end

#Run the sql installer with our config file
windows_package packageName do
	source  node['sqlServer']['source'] + '2012withSP2/' + 'setup.exe'
	timeout node['sqlServer']['timeout']
	installer_type :custom
	options '/ConfigurationFile=' + configFile
	action :install
	not_if{! ::Dir.exists?(node['sqlServer']['source'] + '2012withSP2/') }
end