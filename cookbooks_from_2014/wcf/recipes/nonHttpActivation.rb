# Cookbook Name:: wcf
# Recipe:: nonHttpActivation

require 'chef/win32/version'
windowsVersion = Chef::ReservedNames::Win32::Version.new

# For windows 2008 the /all feature didn't exist in dism
if(windowsVersion.windows_server_2008? || windowsVersion.windows_server_2008_r2?)
	%w{NetFx3 IIS-NetFxExtensibility WAS-WindowsActivationService WAS-ProcessModel  WAS-NetFxEnvironment WAS-ConfigurationAPI WCF-NonHTTP-Activation}.each do |i|
		windows_feature i do
			action :install
		end
	end
else
	include_recipe 'wcf::getSource'
	
	windows_feature 'WCF-NonHTTP-Activation' do
		source node['wcf']['source']
		action :install
		all true
	end
end
