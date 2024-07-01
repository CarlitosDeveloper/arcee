
# Command list outSide PostgreSQL

| Command | Description |
| :-----: | :-----: |
| \! cls                        | Clear shell |
| \! echo %CD%                  | Actualy path |
| \! cd %USERPROFILE%\Desktop   | Change path |

# Command list inSide PostgreSQL

| Command | Description |
| :-----: | :-----: |
| \l            | list DataBase |
| \c myappstore | Select db |

# Restore & Backup

## How to create a backup:

    pg_dump -h localhost -U your_user -d nameDB > backup.sql
    
## How to create a backup and send a specific path

    \! pg_dump -h localhost -U your_user -d nameDB > %USERPROFILE%\Desktop\nameDB_backup.sql

# Comamnd for Manage PostgreSQL

## How to create a user
    
    - CREATE USER nameUser WITH PASSWORD 'passWord';

    - ALTER USER nameUser WITH PASSWORD 'newPassWord';

    - DROP USER nameUser;

## How to alter privileges

    - REVOKE ALL PRIVILEGES ON DATABASE nameDB FROM userBefore; DROP USER userBefore;

    - psql -U userAdmin -d nameDB -h localhost

## How to specific backup

    - pg_dump -h localhost -U postgres -d arcee --schema-only > arcee_schema_backup.sql
