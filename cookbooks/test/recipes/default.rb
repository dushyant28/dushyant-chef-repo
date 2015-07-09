#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
=begin

key = Chef::DataBagItem.load("key", "secret_file") 
aws_credentials = Chef::EncryptedDataBagItem.load("credentials", "aws", key["data_bag_key"])

access_key = aws_credentials["access_key"]
secret_key = aws_credentials["secret_key"]

puts "#{access_key}"
puts "#{secret_key}"
=end

puts "Hello World"

#Creating the data bag key
#openssl rand -base64 1024 | tr -d '\r\n' > my_secret_key

#Put this key in a data bag called key with secet file as the item and data_bag_key as the ID
#knife data bag create key secret_file 



#knife data bag create credentials aws --secret-file my_secret_key
#Give access_key and secret_key as the id's with corresponding values.