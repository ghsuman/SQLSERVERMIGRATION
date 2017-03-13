--Get the list of all Login Accounts in a SQL Server
SELECT name AS Login_Name, type_desc AS Account_Type
FROM sys.server_principals 
WHERE TYPE IN ('U', 'S', 'G')
and name not like '%##%'
ORDER BY name, type_desc


--Get the list of all SQL Login Accounts only
SELECT name
FROM sys.server_principals 
WHERE TYPE = 'S'
and name not like '%##%'


--Get the list of all Windows Login Accounts only
SELECT name
FROM sys.server_principals 
WHERE TYPE = 'U'


--Get the list of all Windows Group Login Accounts only
SELECT name
FROM sys.server_principals 
WHERE TYPE = 'G'



-------------------------------

;with ServerPermsAndRoles as
(
    select
        spr.name as principal_name,
        spr.type_desc as principal_type,
        spm.permission_name collate SQL_Latin1_General_CP1_CI_AS as security_entity,
        'permission' as security_type,
        spm.state_desc
    from sys.server_principals spr
    inner join sys.server_permissions spm
    on spr.principal_id = spm.grantee_principal_id
    where spr.type in ('s', 'u')

    union all

    select
        sp.name as principal_name,
        sp.type_desc as principal_type,
        spr.name as security_entity,
        'role membership' as security_type,
        null as state_desc
    from sys.server_principals sp
    inner join sys.server_role_members srm
    on sp.principal_id = srm.member_principal_id
    inner join sys.server_principals spr
    on srm.role_principal_id = spr.principal_id
    where sp.type in ('s', 'u')
)
select *
from ServerPermsAndRoles
order by principal_name