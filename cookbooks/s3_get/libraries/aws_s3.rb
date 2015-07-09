#
# Cookbook Name:: s3_get
# Library:: aws_s3
#
# All rights reserved - Do Not Redistribute
#


module GE
	module AwsS3
		def s3
			require 'aws-sdk'
			@@s3 ||= create_aws_interface(::Aws::S3::Client)
		end

		private

		def create_aws_interface(aws_interface)       
			require 'aws-sdk'
			creds = ::Aws::Credentials.new(new_resource.aws_access_key, new_resource.aws_secret_access_key)
			::Aws.config[:ssl_verify_peer] = false
			aws_interface.new(credentials: creds, region: new_resource.region)
		end
	end
end