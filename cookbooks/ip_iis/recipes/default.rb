#
# Cookbook Name:: ip_iis
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template Chef::Config[:file_cache_path] + '\\' + 'DeploymentConfigTemplate-IIS.XML' do
  source 'DeploymentConfigTemplate-IIS.XML.erb' 
  variables(:server_name => node['ip_iis']['server_name'])
end

#Poweshell to install the windows features 
powershell_script "name_of_script" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
  	Install-WindowsFeature –ConfigurationFilePath #{Chef::Config[:file_cache_path]}\\DeploymentConfigTemplate-IIS.XML   
  EOH
  flags '-NoLogo, -NonInteractive, -NoProfile, -ExecutionPolicy Unrestricted'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name Web-Server).Installed"
end