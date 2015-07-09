# Cookbook Name:: ProficyConnect
# Recipe:: soa
include_recipe 'chef-client::config'
include_recipe 'dotnet45'
include_recipe 'iis'
include_recipe 'wcf'

#IIS::Application Dev Features
include_recipe 'iis::mod_aspnet'

#IIS::Security features
include_recipe 'iis::mod_auth_basic' #Basic auth
include_recipe 'iis::mod_auth_windows' #Windows auth
include_recipe 'iis::mod_security' #URL Authorization

require 'chef/win32/version'
windows_version = Chef::ReservedNames::Win32::Version.new
if Opscode::IIS::Helper.older_than_windows2008r2? || windows_version.windows_server_2008_r2?
  features = %w{IIS-HttpRedirect IIS-NetFxExtensibility IIS-ASP IIS-ASPNET}
else
  features = %w{IIS-HttpRedirect IIS-NetFxExtensibility45 IIS-ASP IIS-ASPNET45}
end
features.each do |feature|
  windows_feature feature do
    action :install
  end
end

#Make sure DirectoryBrowsing is removed
windows_feature 'IIS-DirectoryBrowsing' do
	action :remove
end

include_recipe 'silverlight'
include_recipe 'sqlServer::2012'
include_recipe 'powershell4'
include_recipe 'tortoiseSVN'
