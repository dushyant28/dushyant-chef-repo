#Hostname of the MS-SQL server
default['mssql']['hostname'] = "#{node.hostname}"

#Local admin acount
default['mssql']['local_username'] = 'administrator'
default['mssql']['local_password'] = 'password'

#SA password (SQL authentication)
default['mssql']['sa_password'] = 'password'

#MS-SQL installable on the web server
default['mssql']['sql_installable_path'] = 'TBD'

#Instance ID
default['mssql']['instance_id'] = 'MSSQLSERVER'

#Specify the root installation directory for native shared components and installation directory
default['mssql']['installshareddir'] = 'INSTALLSHAREDDIR="D:\Program Files\Microsoft SQL Server"'

#Specify the root installation directory for the WOW64 shared components
default['mssql']['installsharedwowdir'] = 'D:\Program Files (x86)\Microsoft SQL Server'

#Specify the root data directory
default['mssql']['installsqldatadir'] = 'D:\Program Files\Microsoft SQL Server'

#Specifies a Windows collation or an SQL collation to use for the Database Engine
default['mssql']['sql_collation'] = 'SQL_Latin1_General_CP1_CI_AS'