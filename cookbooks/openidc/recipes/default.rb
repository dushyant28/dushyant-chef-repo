#
# Cookbook Name:: openidc
# Recipe:: default
#
# Copyright (C) 2015 Josh Schneider
#
# All rights reserved - Do Not Redistribute
# #installs the apache server with openID

# ##Variables used in this cookbook
# tmp_path = "#{Chef::Config['file_cache_path']}"

include_recipe 'selinux::permissive'

case node['platform_family']
when 'rhel'
  # include_recipe 'hc_apache::configure_setup'

  if node.platform_version.to_i <= 6  && node.apache.version == '2.2'
    log 'executing supermarket apache2 recipe'
    include_recipe 'apache2'
  elsif node.platform_version.to_i >= 7 && node.apache.version == '2.4'
    include_recipe 'apache2'
    apache_module 'authz_default' do
      enable false
    end
  else
    log 'This configuration not supported!'
  end
else
  log "This cookbook does not support this OS! #{node['platform']}"
end

include_recipe 'openidc::mod_auth_openidc'

apache_site 'default' do
  enable true
end

service 'httpd' do
  supports restart: true, reload: true
  action [:enable, :start]
end
