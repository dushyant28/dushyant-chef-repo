#
# Cookbook Name:: ip_repo_update
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

begin
  include_recipe "ip_repo_update::#{node['platform_family']}"
rescue Chef::Exceptions::RecipeNotFound
  Chef::Log.warn <<-EOH
#{node['platform_family']} not supported 
EOH
end
