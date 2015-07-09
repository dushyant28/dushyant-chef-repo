#
# Cookbook Name:: ip_iis_feature
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#node.default['windows']['feature_provider'] = "powershell"


node.override['windows']['feature_provider'] = "powershell"

#override!['windows']['feature_provider'] = "powershell"

include_recipe 'ip_iis_feature::install'

include_recipe 'ip_iis_feature::remove'
