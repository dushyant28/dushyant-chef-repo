key = Chef::DataBagItem.load("key", "secret_key") 
aws_credentials = Chef::EncryptedDataBagItem.load("credentials", "aws", key["data_bag_key"])

access_key = aws_credentials["access_key"]
secret_key = aws_credentials["secret_key"]

#Powershell modules for DSC
package = 'All_Resources.zip'

s3_get_get "Downloading the Powershell 5.0 installer from S3" do
	region  "us-east-1"
	target_location Chef::Config[:file_cache_path]
	bucket "chef-packages-geip-us-standard"
	key package
	aws_access_key "#{access_key}"
	aws_secret_access_key "#{secret_key}"
	action :get
end

windows_zipfile 'C:\\Program Files\\WindowsPowerShell\\Modules' do
  source Chef::Config[:file_cache_path] + '\\' + package
  action :unzip
end
