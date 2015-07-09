name             'powershell4'
maintainer       'GE'
maintainer_email 'james.mcneice@ge.com'
license          'All rights reserved'
description      'Installs powershell4'
version		 '1.0.0'
depends 'dotnet45'
depends 'windows'
long_description <<-EOH
= REQUIREMENTS: 
- Requires the Windows cookbook and dotnet45. 
- Tested on Windows Server 2012 and Windows Server 2008 but expected to work elsewhere.

= USAGE:
Usage
Include powershell4 in your run list
EOH
attribute 'powershell4/allowUnsigned',
	:description => 'If true sets the execution policy to allow unsigned powershell scripts',
	:type => 'boolean',
	:required => 'optional',
	:default => true

attribute 'tmp',
	:description => 'A local location where the installer can be stored',
	:type => 'string',
	:required => 'optional',
	:default => 'C:/Windows/Temp/'

