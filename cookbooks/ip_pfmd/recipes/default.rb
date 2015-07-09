#
# Cookbook Name:: ip_pfmd
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

key = Chef::DataBagItem.load("key", "secret_key") 
aws_credentials = Chef::EncryptedDataBagItem.load("credentials", "aws", key["data_bag_key"])

access_key = aws_credentials["access_key"]
secret_key = aws_credentials["secret_key"]

case node['ip_pfmd']['arch']
when "32-bit"
	installer = 'pfmsolutions32bit.msi'
when "64-bit"
	installer = 'pfmsolutions64bit.msi' 
else 
	chef.log 'Invalid value for architecture attibute (32-bit or 64-bit)'
end

s3_get_get "Downloading the file from S3" do
	region  "us-east-1"
	target_location Chef::Config[:file_cache_path]
	bucket node['ip_pfmd']['bucket_name']
	key installer
	aws_access_key "#{access_key}"
	aws_secret_access_key "#{secret_key}"
	action :get
end

# Stopping Services
windows_service "Proficyserver" do
  action :stop
end

windows_service "ProficySTS" do
  action :stop
end

windows_service "ProficyPublisherService" do
  action :stop
end

installdir = 'C:\\Program Files\\Proficy\\Proficy Workflow\\Program\\ProductOptions\\PFMCommon_6.3.204.777.pf'

powershell_script 'Installing PFMD application' do
  code <<-EOH

  msiexec /i #{Chef::Config[:file_cache_path]}\\#{installer} /quiet

  EOH
  flags '-ExecutionPolicy Unrestricted'
  guard_interpreter :powershell_script
  not_if 'Test-Path #{installdir}'
end

cookbook_file Chef::Config[:file_cache_path] + '\\' + 'ConfigureSiteConfig.xml' do
  source 'ConfigureSiteConfig.xml'
end

powershell_script 'PMF Configure Site' do
	code <<-EOH

  		C:\\Program Files\\Proficy\\Proficy Workflow\\Program\\ConfigureSite.exe /s /c #{Chef::Config[:file_cache_path]}\\ConfigureSiteConfig.xml

  	EOH
flags '-ExecutionPolicy Unrestricted'
guard_interpreter :powershell_script
not_if 'Test-Path #{installdir}'
end

powershell_script 'Proficy Updater' do
	code <<-EOH
  
		if ([System.Environment]::Is64BitProcess) {
			C:\\Program Files\\Proficy\\Proficy Workflow\\Program\\ProficyUpdater.exe /s /d
  		} 
  		else {
			C:\\Program Files (x86)\\Proficy\\Proficy Workflow\\Program\\ProficyUpdater.exe /s /d
  		}
  	EOH
flags '-ExecutionPolicy Unrestricted'
guard_interpreter :powershell_script
not_if ''
end

# Starting Services
windows_service "Proficyserver" do
  action :start
end

windows_service "ProficySTS" do
  action :start
end

windows_service "ProficyPublisherService" do
  action :start
end
