name             'wcf'
maintainer       'GE'
maintainer_email 'james.mcneice@ge.com'
license          'All rights reserved'
description      'Installs WCF activation features'
version		 '1.0.0'
depends 'windows'
maintainer 'James McNeice'
maintainer_email 'james.mcneice@ge.com'
long_description <<-EOH
= REQUIREMENTS: 
- Requires the Windows cookbook. 
- Only tested on Windows Server 2012 but expected to work elsewhere.

= USAGE:
Usage
By default installs both HTTP and non-HTTP activation. Use one of the recipies seperately if you only want to install one.
EOH
attribute 'tmp',
	:description => 'A local location where the source files can be stored',
	:type => 'string',
	:required => 'optional',
	:default => 'C:/Windows/Temp/'

