# Cookbook Name:: ProficyConnect
# Recipe:: default
require 'net/http'
include_recipe 'chef-client::config'

artifactory = "#{node['proficy']['artifactory']['protocol']}#{node['proficy']['artifactory']['username']}:#{node['proficy']['artifactory']['password']}@#{node['proficy']['artifactory']['url']}"

#Find the latest version
version = ""
if node['proficy']['version']
	version = node['proficy']['version']
	puts "Installing requested version of proficy: #{version}"
else
	getLatestAddress = '/artifactory/api/search/latestVersion?g=com.ge.proficysoa&a=core&v=2.5.0-SNAPSHOT&repos=PROFICYINF-SNAPSHOT'
	uri = URI(artifactory + getLatestAddress)
	puts "Using host: #{uri.host} and port #{uri.port}"
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	request = Net::HTTP::Get.new(uri.request_uri)
	request.basic_auth(node['proficy']['artifactory']['username'], node['proficy']['artifactory']['password'] )
	res = http.request(request)
	
	version = res.body
	puts "Installing latest version of proficy: #{version}"
end

#Download the chosen version
installer = "core-#{version}-PlatformInstall"
installerZip = node['tmp'] + "#{installer}.zip"
installerAddress = "#{artifactory}/artifactory/PROFICYINF-SNAPSHOT/com/ge/proficysoa/core/2.5.0-SNAPSHOT/#{installer}.zip"
remote_file "Download the proficy installer" do
	path installerZip
	source installerAddress
	retries 5
	backup 0
	action :create
end

#Unzip the downloaded file
installerDir = "#{node['tmp']}/#{installer}"
windows_zipfile "Unzip the installer" do
	path installerDir
	source  installerZip
	overwrite true
	action :unzip
end

#Create the xml configuration files from templates
silentSOA = node['tmp'] + '/silentSOA.xml'
template "Create SOA config file" do
	path silentSOA
	source 'silentSOA.xml.erb' 
	action :create
end	

silentWeb = node['tmp'] + '/silentWeb.xml'
template "Create Web config file" do
	path silentWeb
	source 'silentWeb.xml.erb' 
	action :create
end	

#Install the downloaded version
soaResultTemplate = node['tmp'] + '/soaResultTemplate.xml'
execute 'Install SOA' do
	command '.\SetupApplicationServer.exe /s /c "'+silentSOA+'" /t "'+soaResultTemplate+'"'
	cwd installerDir
	action :run
end

webResultTemplate = node['tmp'] + '/webResultTemplate.xml'
execute 'Install Vision Web Client' do
	command '.\SetupWebServer.exe /s /c "'+silentWeb+'" /t "'+webResultTemplate+'"'
	cwd installerDir
	action :run
end

# Set Firewall Settings for Remote Connections
execute 'netsh' do
	command 'netsh advfirewall set currentprofile state off'
	action :run
end