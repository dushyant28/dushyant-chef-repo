name             'sqlServer2012'
maintainer       'GE'
maintainer_email 'james.mcneice@ge.com'
license          'All rights reserved'
description      'Installs and configures SQL'
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
Include sqlServer2012 in your role, ensure the sql install files are available on each client, and sqlServer2012/source to be the location of the install files.
EOH
attribute 'tmp',
	:description => 'A local location where the JDK install can be stored',
	:type => 'string',
	:required => 'optional',
	:default => 'C:/Windows/Temp/'
attribute 'sqlServer2012/source',
	:description => 'The path where the installer files can be found',
	:type => 'string',
	:required => 'recommended',
	:default => 'C:/SQLServer2012withSP2'
attribute 'sqlServer2012/installer/timeout',
	:description => 'Time to wait for the sql installer to complete in seconds',
	:type => 'string',
	:required => 'optional',
	:default => '7200'
attribute 'sqlServer2012/sqlPassword',
	:description => 'The password that will be set for the sql server',
	:type => 'string',
	:required => 'optional',
	:default => 'Proficy1'
attribute 'sqlServer2012/sysAdminAccounts',
	:description => 'The accounts that will be set as administrators for the sql server',
	:type => 'string',
	:required => 'optional',
	:default => 'BUILTIN\ADMINISTRATORS'
