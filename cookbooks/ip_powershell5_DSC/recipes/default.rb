#
# Cookbook Name:: ip_powershell5_DSC
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

#Installer name for 64-bit arch
installer_name = 'WindowsBlue-KB3055381-x64.msu'


s3_get_get "Downloading the Powershell 5.0 installer from S3" do
	region  "us-east-1"
	target_location Chef::Config[:file_cache_path]
	bucket "chef-packages-geip-us-standard"
	key installer_name
	aws_access_key "#{access_key}"
	aws_secret_access_key "#{secret_key}"
	action :get
end

powershell_script 'Updating Powershell 5 and installing DSC' do
  code <<-EOH
  
  write-host "testing"
  wusa #{Chef::Config[:file_cache_path]}\\#{installer_name} /quiet /norestart

  EOH
  flags '-ExecutionPolicy Unrestricted'
  guard_interpreter :powershell_script
  not_if 'if($PSversiontable.PSversion.Major -eq 5){return $true} return $false'
end

