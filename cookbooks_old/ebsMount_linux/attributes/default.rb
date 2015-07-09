#Device name in AWS. This is the name that we give while provisioning the volume in AWS
default['EBSMount']['device_name'] = '/dev/xvdf'

#Mount point. The EBS would be attached to this directory. 
default['EBSMount']['mount_point'] = '/home/ubuntu/mount_point'