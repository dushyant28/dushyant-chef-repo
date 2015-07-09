#
# Cookbook Name:: s3_get
# Resources:: get
#
# All rights reserved - Do Not Redistribute
#

actions :get, :delete

attribute :region, kind_of: String, required: true
attribute :target_location, kind_of: String, required: true
attribute :bucket, kind_of: String, required: true
attribute :key, kind_of: String, required: true
attribute :aws_access_key, kind_of: String, required: true
attribute :aws_secret_access_key, kind_of: String, required: true

def initialize(*args)
  super
  @action = :get
end