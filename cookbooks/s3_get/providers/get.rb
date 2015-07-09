#
# Cookbook Name:: s3_get
# Provider:: get
#
# All rights reserved - Do Not Redistribute
#

include GE::AwsS3

def whyrun_supported?
	true
end

def install_aws_sdk
	chef_gem "aws-sdk"
end

action :get do
	install_aws_sdk
	response_target = new_resource.target_location + "/" + new_resource.key
		converge_by("Downloaded S3 File: #{new_resource.key}") do
			s3.get_object(
				# required
				response_target: response_target,
				bucket: new_resource.bucket,
				key: new_resource.key
			)
			Chef::Log.info("Downloading S3 File: #{new_resource.key}")
		end
end

action :delete do
	# Nothing
end