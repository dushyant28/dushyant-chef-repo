# Cookbook Name:: wcf
# Recipe:: getSource

cookbook_file 'sxs.zip' do
	path node['tmp'] + 'sxs.zip'
	backup false
	action :create_if_missing
end

#TODO: What if there is an error unzipping after the folder is created? This would break
# Need to find a way to only unzip if the file has changed, or the checksum of the folder?
windows_zipfile node['wcf']['source'] do
	source  node['tmp'] + 'sxs.zip'
	action :unzip
	not_if {::Dir.exists?(node['tmp'] + 'sxs')}
end
