# Cookbook Name:: dotnet45
# Recipe:: default

require 'chef/win32/version'
windowsVersion = Chef::ReservedNames::Win32::Version.new
unless(windowsVersion.windows_server_2012? || windowsVersion.windows_server_2012_r2?)
	installer = 'NetFramework-4.5.1-x86-x64.exe'
	packageName = 'Microsoft .NET Framework 4.5.1'
	installerPath = node['tmp'] + installer

	cookbook_file installer do
		path installerPath
		backup false
		action :create_if_missing
	end

	include_recipe 'windows::reboot_handler'
	windows_reboot 30 do
		reason 'Finishing .Net 4.5.1 installation'
		action :nothing
	end

	windows_package packageName do
		source  installerPath
		options '/q /norestart'
		installer_type :custom
		action :install
		notifies :request, 'windows_reboot[30]'
	end
end
