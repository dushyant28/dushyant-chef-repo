# Cookbook Name:: sqlServer2012
# Recipe:: default
default['tmp'] = 'C:/Windows/Temp/'

default['sqlServer']['source'] = 'C:/SQLServer/';
default['sqlServer']['filePath'] = 'C:/SQLServer/Installer.zip';
#default['sqlServer2012']['source'] = '\\3.26.202.59\ciShare\SQLServer2012withSP2'
default['sqlServer']['timeout'] = 7200;
default['sqlServer2012']['sqlPassword'] = 'SmokeTe5t';
default['sqlServer2012']['sysAdminAccounts'] = 'BUILTIN\ADMINISTRATORS';

