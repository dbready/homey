# PostgreSQL

## Installation

```shell
sudo apt install postgresql postgresql-contrib 

# switch to `postgres` role
sudo -i -u postgres

# create new role same as linux account `newdbrolemaster`
createuser --interactive
## Enter name of role to add: newdbrolemaster
## Shall the new role be a superuser? (y/n) y

# create default database for the new role
createdb newdbrolemaster
```

## Set Role Password

Bug in DBeaver will not connect to a Postgres database account lacking a password.

```sql
ALTER ROLE newdbrolemaster WITH PASSWORD 'secret123';
```
