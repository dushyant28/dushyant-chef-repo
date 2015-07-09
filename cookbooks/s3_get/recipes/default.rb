#
# Cookbook Name:: s3_get
# Recipe:: default
#
=begin
key = Chef::DataBagItem.load("key", "secret_key") 
aws_credentials = Chef::EncryptedDataBagItem.load("credentials", "aws", key["data_bag_key"])

access_key = aws_credentials["access_key"]
secret_key = aws_credentials["secret_key"]
=end

access_key = "AKIAJRXS2QVWHRBFCGVQ"
secret_key = "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"

s3_get_get "Downloading the file from S3" do
	region  "us-east-1"
	target_location Chef::Config[:file_cache_path]
	bucket "chef-packages-geip-us-standard"
	key 'WindowsBlue-KB3055381-x64.msu'
	aws_access_key "#{access_key}"
	aws_secret_access_key "#{secret_key}"
	action :get
end
