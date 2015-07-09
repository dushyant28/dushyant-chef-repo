#
# Cookbook Name:: openidc
# Recipe:: mod_auth_openidc
#
# Copyright (C) 2014 Josh Schneider
#
# All rights reserved - Do Not Redistribute
# Description: this recipe installs the mod_auth_openidc module for apache

# --------------------Install the mod_auth_openidc module


tmp_path = "#{Chef::Config['file_cache_path']}"

##Install packages
log "Install Epel Repo"
 include_recipe 'yum-epel'

%w{httpd-devel gcc epel-release jansson hiredis}.each do |pkg|
    package pkg do
        action :install
    end
end

remote_file "#{tmp_path}/#{node['apache']['openidc']['package_name']}" do
        backup false
        source "#{node['apache']['openidc']['openidc_url']}"
        # notifies :run, "execute[Install_openidc_module]", :immediately
        action :create_if_missing
end
execute "Install_openidc_module" do
    command "yum install -y #{tmp_path}/#{node['apache']['openidc']['package_name']}"
    not_if "rpm -qa | grep -q 'mod_auth_openidc'"
    # action :nothing
end

apache_module 'auth_openidc'


service "httpd" do
  supports :restart => true, :reload => true
  action [:enable, :start]
end
