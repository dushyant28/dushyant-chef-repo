#
# Cookbook Name:: mssql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
require 'win32/registry'

local_username = "#{node['mssql']['hostname']}" + "\\" + "#{node['mssql']['local_username']}"

config_file_path = "C:\\chef\\cache\\ConfigurationFile.ini"

template config_file_path do
source "ConfigurationFile.ini.erb"
variables({
        :local_user => "#{local_username}",
        :local_password => node['mssql']['local_password'],
        :sa_password => node['mssql']['sa_password'],
        :instance_id => node['mssql']['instance_id'],
        :installshareddir => node['mssql']['installshareddir'],
        :installsharedwowdir => node['mssql']['installsharedwowdir'],
        :sql_collation => node['mssql']['sql_collation'],
        :installsqldatadir => node['mssql']['installsqldatadir']
})
action :create
end

key = Chef::DataBagItem.load("key", "secret_file") 
aws_credentials = Chef::EncryptedDataBagItem.load("credentials", "aws", key["data_bag_key"])

access_key = aws_credentials["access_key"]
secret_key = aws_credentials["secret_key"]

s3_file "C:\\chef\\cache" do
    remote_path "/my/s3/key"
    bucket "my-s3-bucket"
    aws_access_key_id "#{access_key}"
    aws_secret_access_key "#{access_key}"
    s3_url "https://s3.amazonaws.com/bucket"
    action :create
end

#path to the MS-SQL .exe
setup_path = "C:\\chef\\cache\\<.exe>"

windows_package "MS-SQL Server 2012 R2" do
source "#{setup_path}"
installer_type :custom
timeout 6000
options "/q /SkipRules=RebootRequiredCheck /ConfigurationFile=#{config_file_path}"
action :install
end