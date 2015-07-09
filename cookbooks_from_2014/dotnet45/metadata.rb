name             'dotnet45'
maintainer       'GE'
maintainer_email 'james.mcneice@ge.com'
license          'All rights reserved'
description      'Installs dotnet45'
version		 '1.0.0'
depends 'windows'
long_description <<-EOH
= REQUIREMENTS: 
- Requires the Windows cookbook. 
- Tested on Windows Server 2012 and Windows Server 2008 but expected to work elsewhere.

= USAGE:
Usage
Include dotnet45 in your run list
EOH
attribute 'tmp',
	:description => 'A local location where the installer can be stored',
	:type => 'string',
	:required => 'optional',
	:default => 'C:/Windows/Temp/'
