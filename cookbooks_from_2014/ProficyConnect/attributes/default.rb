# Cookbook Name:: proficyConnect
# Recipe:: default
default['tmp'] = 'C:/Windows/Temp/'
default['iis']['accept_eula'] = true

default['proficy']['artifactory']['url'] = 'devcloud.swcoe.ge.com'
default['proficy']['artifactory']['password'] = 'X7sUcMtsPS'
default['proficy']['artifactory']['username'] = 'svc-proficyinf'
default['proficy']['artifactory']['protocol'] = 'https://'

default['proficy']['config']['soa']['AdministratorName'] = 'admin'
default['proficy']['config']['soa']['AdministratorPassword'] = 'admin'
default['proficy']['config']['soa']['ServerDNSName'] = 'vision-accept'
default['proficy']['config']['soa']['SqlServerAuthenticationType'] = 'SqlServer'
default['proficy']['config']['soa']['SqlServerDatabaseName'] = 'SOADB'
default['proficy']['config']['soa']['SqlServerName'] = 'vision-accept'
default['proficy']['config']['soa']['SqlServerUserName'] = 'sa'
default['proficy']['config']['soa']['SqlServerPassword'] = 'SmokeTe5t'
default['proficy']['config']['soa']['CertificateConfiguration'] = 'Generate'
default['proficy']['config']['soa']['IISServerName'] = 'vision-accept' #Same as ServerDNSName generally
default['proficy']['config']['soa']['WebSiteName'] = 'Default Web Site'
default['proficy']['config']['soa']['PasswordComplexityRules'] = ''
default['proficy']['config']['soa']['KspUserPassword'] = 'SmokeTe5t'
default['proficy']['config']['soa']['InstallType'] = 'FullServer'
default['proficy']['config']['soa']['UseStandAloneDirectoryServices'] = 'true'
default['proficy']['config']['soa']['UseDefaultLocalSqlServerSettings'] = 'false'

default['proficy']['config']['web']['InstallLocation'] = 'C:\\Program Files\\proficy\\Proficy Vision'
default['proficy']['config']['web']['InstallType'] = 'WebServer'
default['proficy']['config']['web']['PredixServerName'] = 'vision-accept'
default['proficy']['config']['web']['PredixPort'] = '443'
default['proficy']['config']['web']['IdpClientSecret'] = 'SmokeTe5t'
default['proficy']['config']['web']['SqlServerName'] = 'vision-accept' 
default['proficy']['config']['web']['KspUserPassword'] = 'SmokeTe5t'
default['proficy']['config']['web']['SOAWSServerName'] = 'vision-accept'
default['proficy']['config']['web']['SOAWSServerPort'] = '8443'
default['proficy']['config']['web']['CertificateServiceUrl'] = 'https://vision-accept:8202/Certificates'
default['proficy']['config']['web']['CertificateServiceUserName'] = 'Administrator'
default['proficy']['config']['web']['CertificateServicePassword'] = 'SmokeTe5t'
