#
# Cookbook Name:: ip_historian
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# require 'win32/registry'

# local_username = "#{node['ip_historian']['hostname']}" + "\\" + "#{node['ip_historian']['local_username']}"

# config_file_path = Chef::Config[:file_cache_path] + '\\' "historian.iss"

ver = node['historian']['version']

key = Chef::DataBagItem.load("key", "secret_key") 
aws_credentials = Chef::EncryptedDataBagItem.load("credentials", "aws", key["data_bag_key"])


access_key = aws_credentials["access_key"]
secret_key = aws_credentials["secret_key"]

# sql_credentials = Chef::EncryptedDataBagItem.load("credentials", "sql", key["data_bag_key"])

# sa_password = sql_credentials["sa_password"]

=begin


template config_file_path  do
source "ConfigurationFile.ini.erb"
variables({
        :local_user => "#{local_username}",
        :local_password => node['ip_historian']['local_password'],
        :sa_password => sa_password,
        :instance_id => node['ip_historian']['instance_id'],
        :installshareddir => node['ip_historian']['installshareddir'],
        :installsharedwowdir => node['ip_historian']['installsharedwowdir'],
        :sql_collation => node['ip_historian']['sql_collation'],
        :installsqldatadir => node['ip_historian']['installsqldatadir']
})
action :create
end

=end




s3_get_get "Historian Installer" do
  region  "us-east-1"
  target_location Chef::Config[:file_cache_path]
  bucket node['historian']['bucket'] 
  key node['historian']['60']['installer'] 
  aws_access_key "#{access_key}"
  aws_secret_access_key "#{secret_key}"
  action :get
end



=begin
# unsecure download
remote_file Chef::Config[:file_cache_path] + '\SQL2012.zip' do
  source 'https://s3.amazonaws.com/chef-packages-geip-us-standard/SQL2012.zip'
  #checksum 'sha256checksum'
end
=end







# path to the MS-SQL .exe
setup_path = "#{Chef::Config[:file_cache_path]}\\#{node['historian']['60']['setup']}"
installer_path= "#{Chef::Config[:file_cache_path]}\\#{node['historian']['60']['installer']}"


puts setup_path 

windows_zipfile Chef::Config[:file_cache_path] do
  source installer_path
  action :unzip
  not_if {::File.exists?(setup_path)}
end



# cookbook_file Chef::Config[:file_cache_path] + '\\' + 'ConfigurationFile.ini' do
#   source 'ConfigurationFile.ini'
# end

=begin

# Install Historian if it is not already in place
windows_package "" do
  source "#{setup_path}"
  installer_type :custom
  timeout 6000
  options "/q /SkipRules=RebootRequiredCheck /ConfigurationFile=#{config_file_path}"
  action :install
end

=end
