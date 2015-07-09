name             'ProficyConnect'
maintainer       'GE'
maintainer_email 'james.mcneice@ge.com'
license          'All rights reserved'
description      'Installs the prerequisites for proficy connect'
version		 '1.1.5'
depends 'chef-client', '3.8.0'
depends 'iis', '2.1.2'
depends 'silverlight', '2.0.0'
depends 'jdk', '1.2.1'
depends 'nodejs', '1.3.0'
depends 'wcf', '1.0.0'
depends 'powershell4', '1.0.0'
depends 'dotnet45', '1.0.0'
depends 'tortoiseSVN', '1.0.0'
depends 'sqlServer'
depends 'chrome', '1.0.0'
long_description <<-EOH
= REQUIREMENTS: 
- Requires chef-client::config to have set up the proxy info properly in client.rb
- Only tested on Windows Server 2012 and Server 2008 but expected to work elsewhere.

= USAGE:
Set the chef-client/config/(http_proxy|https_proxy|no_proxy) to the GE proxy servers.
EOH
attribute 'iis/accept_eula',
	:description => 'If true accepts the eula when install IIS. IIS fails to install if false.',
	:type => 'boolean',
	:required => 'optional',
	:default => true

