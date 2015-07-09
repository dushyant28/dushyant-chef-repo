# IZ Service Rail NTP Servers
default['ntp']['servers'] = ['10.38.8.70', '10.38.8.86']

# apache
# default['apache']['version'] = 2.4
# default['apache']['listen_ports'] = [80, 443]
default['apache']['contact'] = 'ge_ip_software_ops@ge.com'

# OIDC
default['apache']['openidc']['OIDCProviderMetadataURL'] = 'https://fssfed.stage.ge.com/fss/.well-known/openid-configuration'
default['apache']['openidc']['OIDCClientID'] = 'GECorp_BrilliantFactory_Client'
default['apache']['openidc']['OIDCClientSecret'] = 'fz21eQ2OpzKhHSmctyhp7lpPr3MHu2C9gUFoKb2DM3Ve6o4AuawDOkSetJGFZcgc' # move this to an encrypted databag!
default['apache']['openidc']['OIDCRedirectURI'] = 'http://Greenville-PW.GE-Brilliant-Factory.com/redirect_uri'
