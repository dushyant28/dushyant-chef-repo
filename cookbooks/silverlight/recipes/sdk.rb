# Cookbook Name:: silverlight
# Recipe:: sdk

installer = 'silverlight_sdk-5-x64.exe'
packageName = 'Microsoft Silverlight 5 SDK'
installerPath = Chef::Config[:file_cache_path] + '\\' + "#{installer}"

key = Chef::DataBagItem.load("key", "secret_key") 
aws_credentials = Chef::EncryptedDataBagItem.load("credentials", "aws", key["data_bag_key"])

access_key = aws_credentials["access_key"]
secret_key = aws_credentials["secret_key"]

s3_get_get "Downloading the file from S3" do
	region  "us-east-1"
	target_location Chef::Config[:file_cache_path]
	bucket "chef-packages-geip-us-standard"
	key "<name of the object>"
	aws_access_key "#{access_key}"
	aws_secret_access_key "#{secret_key}"
	action :get
end

windows_package packageName do
	source  installerPath
	options '/q'
	installer_type :custom
	action :install
end

