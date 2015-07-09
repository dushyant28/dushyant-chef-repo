name             'silverlight'
maintainer       'GE'
maintainer_email 'james.mcneice@ge.com'
license          'All rights reserved'
description      'Installs the silverlight plugin and sdk'
version		 '0.1.0'
depends 'windows'
depends 's3_get'


maintainer 'James McNeice'
maintainer_email 'james.mcneice@ge.com'
long_description <<-EOH
= REQUIREMENTS: 
- Requires the Windows cookbook. 
- Only tested on Windows Server 2012 but expected to work elsewhere.

= USAGE:
Usage
Include silverlight in your run list
EOH
attribute 'tmp',
	:description => 'A local location where the installers can be stored',
	:type => 'string',
	:required => 'optional',
	:default => 'C:/Windows/Temp/'
