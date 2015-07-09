default['apache']['openidc']['OIDCProviderMetadataURL'] = 'https://fssfed.stage.ge.com/fss/.well-known/openid-configuration'
default['apache']['openidc']['OIDCClientID']            = 'nil'
default['apache']['openidc']['OIDCClientSecret']        = 'nil'
default['apache']['openidc']['OIDCRedirectURI']         = 'https://mySamleApp.com/redirect_uri'
default['apache']['openidc']['OIDCScope']               = '"nil"'
default['apache']['openidc']['OIDCCryptoPassphrase']    = 'nil'
default['apache']['openidc']['OIDCAuthNHeader']         = 'SM_USER'
default['apache']['openidc']['OIDCRemoteUserClaim']     = 'sub'
default['apache']['openidc']['OIDCClaimPrefix']         = 'ge_'
default['apache']['openidc']['modauthversion']          = '1.8.1'


if node.platform_version.to_f >= 7
    default['apache']['openidc']['package_name'] = "mod_auth_openidc-#{node.apache.openidc.modauthversion}-1.el7.centos.x86_64.rpm"
    default['apache']['openidc']['openidc_url'] = "https://github.com/pingidentity/mod_auth_openidc/releases/download/v#{node.apache.openidc.modauthversion}/#{node['apache']['openidc']['package_name']}"
  elsif node.platform_version.to_f <= 6
    default['apache']['openidc']['package_name'] = "mod_auth_openidc-#{node.apache.openidc.modauthversion}-1.el6.x86_64.rpm"
    default['apache']['openidc']['openidc_url'] = "https://github.com/pingidentity/mod_auth_openidc/releases/download/v#{node.apache.openidc.modauthversion}/#{node['apache']['openidc']['package_name']}"
    else
    default['apache']['openidc']['package_name'] = "mod_auth_openidc-#{node.apache.openidc.modauthversion}-1.el6.x86_64.rpm"
    default['apache']['openidc']['openidc_url'] = "https://github.com/pingidentity/mod_auth_openidc/releases/download/v#{node.apache.openidc.modauthversion}/#{node['apache']['openidc']['package_name']}"
  end
