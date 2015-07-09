#
# Cookbook Name:: EBSMount
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#The script would be pushed to this dicrectory 
directory "/home/scripts" do
recursive true
action :create
end

#Scrpit for mounting the EBS
template "/home/scripts/EBSMount.sh" do
  source "EBSMount.sh.erb"
  mode 0777
  owner "root"
  group "root"
end

#Running the script 
bash "Running the EBSMount script" do
code <<-EOH
sh /home/scripts/EBSMount.sh #{node['EBSMount']['device_name']} #{node['EBSMount']['mount_point']}
EOH
end