# openidc-cookbook

This cookbook will install apache and also overlay the openid connect plugin on top of that


## Supported Platforms

supported on CentOS 7.0, CentOS 6.6, Oracle Linux 6.6

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['openidc']['default']</tt></td>
    <td>default</td>
    <td>installs apache w/ openidc</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Attributes
For more information on how to configure these attributes visit
## http://sc.ge.com/*oidc

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['apache']['openidc']['modauthversion']</tt></td>
    <td>string</td>
    <td>changes the version of mod_auth_openidc deployed</td>
    <td><tt>1.8.1</tt></td>
  </tr>
  <tr>
    <td><tt>['apache']['openidc']['OIDCProviderMetadataURL']</tt></td>
    <td>string</td>
    <td>url where openidc module will look at</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['apache']['openidc']['OIDCClientID'] </tt></td>
    <td>string</td>
    <td>Specify the openidc client id</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['apache']['openidc']['OIDCClientSecret'] </tt></td>
    <td>string</td>
    <td>secret password for client</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['apache']['openidc']['OIDCRedirectURI']  </tt></td>
    <td>string</td>
    <td>specify redirect URI</td>
    <td><tt>https://mySamleApp.com/redirect_uri</tt></td>
  </tr>
  <tr>
    <td><tt>['apache']['openidc']['OIDCScope'] </tt></td>
    <td>string</td>
    <td></td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['apache']['openidc']['OIDCCryptoPassphrase'] </tt></td>
    <td>string</td>
    <td>secret password for openidc</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['apache']['openidc']['OIDCAuthNHeader']  </tt></td>
    <td>string</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['apache']['openidc']['modauthversion']  </tt></td>
    <td>int</td>
    <td>specifies version of module to install. Currently only supports 1.7.2, 1.7.3, and 1.8.0</td>
    <td><tt>1.8.0</tt></td>
  </tr>
  <tr>
    <td><tt>['apache']['openidc']['OIDCRemoteUserClaim']  </tt></td>
    <td>string</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['apache']['openidc']['OIDCClaimPrefix']  </tt></td>
    <td>int</td>
    <td></td>
    <td><tt>ge_</tt></td>
  </tr>
</table>


## Usage

### openidc::default

Include `openidc` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[openidc::default]"
  ]
}
```


## Variables used in this cookbook
tmp_path = "#{Chef::Config['file_cache_path']}"


## Depends on:

<table>
<tr>
<td>yum-epel</td>
</tr>
<tr>
<td>yum</td>
</tr>
  <tr>
<td>selinux</td>
</tr>
<tr>
<td>apache2 version 2.4</td>
</tr>
</table>

## Installs

<table>
<tr>
<td>hiredis</td>
</tr>
  <tr>
<td>httpd-devel</td>
</tr>
<tr>
<td>gcc</td>
</tr>
 <tr>
<td>epel-release</td>
</tr>
<tr>
<td>jansson</td>
</tr>
</table>


### Included child recipe
### openidc::mod_auth_openidc

Starts and enables httpd service

Verifies the OS type and OS version

Install the mod_auth_openidc module

Installs mod_auth module version el7.centos.x86_64.rpm

#### Merges and copies conf/load files with predefined values from cookbook

Copies the mod_auth_openidc.conf and mod_auth_openidc.load files from cookbook with attributes to below folders on the server
<table><tr><td>
/etc/httpd/mods-available/mod_auth_openidc.conf
</td></tr>
<tr><td>
/etc/httpd/mods-available/mod_auth_openidc.load
</td></tr>
</table>

#### Updates name value pairs in conf and load files from the attributes file

<table><tr><td>
OIDCProviderMetadataURL
</td></tr>
<tr><td>
OIDCClientID
</td></tr>
<tr><td>
OIDCClientSecret
</td></tr>
<tr><td>OIDCRedirectURI
OIDCScope
</td></tr>
<tr><td>
OIDCCryptoPassphrase
</td></tr>
<tr><td>
OIDCAuthNHeader
</td></tr>
<tr><td>
modauthversion
</td></tr>
</table>

### Enables openidc in apache


### License and Authors

#### Primary Contact:: Matt Cochran

### Please reach out to Matt, for any support on this cookbook or the SSO Openidc POC

#### Authors:: Josh Schneider, Madhavi Mallela
=======
openidc
=======
