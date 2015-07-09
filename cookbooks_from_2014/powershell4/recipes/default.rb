# Cookbook Name:: powershell4
# Recipe:: default

include_recipe 'windows::reboot_handler'
include_recipe 'dotnet45::default'

installer = ''
packageName = ''
require 'chef/win32/version'
windowsVersion = Chef::ReservedNames::Win32::Version.new

if(windowsVersion.windows_server_2008? || windowsVersion.windows_server_2008_r2? || windowsVersion.windows_7?)
	packageName = 'KB2819745'
	installer = 'Windows6.1-KB2819745-x64-MultiPkg.msu'
else
	packageName = 'KB2799888'
	installer = 'Windows8-RT-KB2799888-x64.msu'	
end

installerPath = node['tmp'] + installer

windows_reboot 30 do
    reason 'Finishing Powershell 4 installation'
    action :nothing
end

=begin
I did this using execute instead of powershell_script because of a bug in powershell_shell script
preventing setting the execution policy. The alternative workaround is to place the 
Set-ExecutionPolicy command in a ps script and sign the script.
=end
=begin
execute "AllowUnsigned" do
	command 'powershell.exe -NoLogo -NonInteractive -NoProfile -ExecutionPolicy unrestricted -InputFormat None -Command Set-ExecutionPolicy unrestricted -Force'
	action :nothing
	only_if { node['powershell4']['allowUnsigned'] }
end
=end

cookbook_file installer do
	path installerPath
	backup false
	retries 5
	action :create
end

windows_package packageName do
	source  installerPath
	options '/quiet /norestart'
	installer_type :custom
	action :install
	#notifies :run, 'execute[AllowUnsigned]'
	notifies :request, 'windows_reboot[30]'
		not_if do
		begin
			registry_data_exists?('HKLM\SOFTWARE\Microsoft\PowerShell\3\PowerShellEngine', {:name=>'PowerShellVersion', :type=>:string,:data=>'4.0'})
		rescue Chef::Exceptions::Win32RegKeyMissing
			false
		end
	end
end





