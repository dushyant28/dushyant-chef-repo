name             'ebsMount_linux'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures EBSMount'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe "ebsMount_linux::default",
"Runs the EBSMount scripts"

attribute "EBSMount/device_name",
 :display_name => "device_name",
 :recipes => ["EBSMount::default"],
 :default => "",
 :description => "Name of the storage device"

attribute "EBSMount/mount_point",
 :display_name => "mount_point",
 :recipes => ["EBSMount::default"],
 :default => "",
 :description => "Name of the storage device"