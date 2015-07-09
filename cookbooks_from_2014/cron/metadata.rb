name 'cron'
maintainer 'Opscode, Inc.'
maintainer_email 'cookbooks@opscode.com'
license 'Apache 2.0'
description 'Installs cron'

version '1.4.2'

recipe 'cron', 'Installs the cron package and starts the crond service.'

supports 'amazon'
supports 'centos'
supports 'redhat'
supports 'scientific'
supports 'oracle'
supports 'fedora'
supports 'debian'
supports 'smartos'
supports 'omnios'
supports 'solaris2'
supports 'raspbian'
supports 'gentoo'