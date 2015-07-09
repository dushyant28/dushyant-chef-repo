default['apache']['default_site_enabled'] = true
if node['platform_version'].to_i <= 6
  default['apache']['version'] 	            = '2.2'
elsif node['platform_version'].to_i >= 7
  default['apache']['version'] 	            = '2.4'
else
  default['apache']['version'] 	            = '2.4'
end

default['apache']['subversion']           = ''
default['apache']['totalversion']         = "#{node['apache']['version']}#{node['apache']['subversion']}"
