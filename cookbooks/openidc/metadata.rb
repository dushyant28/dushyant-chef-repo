name             'openidc'
maintainer       'Josh Schneider'
maintainer_email 'josh.schneider@ge.com'
license          'All rights reserved'
description      'Installs/Configures openidc'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

depends 'selinux'
depends 'apache2'
depends 'yum'
depends 'yum-epel'

supports 'oracle'
supports 'centos'

recipe 'openidc', 'Main openidc configuration'
recipe 'openidc::mod_auth_openidc', 'Installs mod auth openidc module'
