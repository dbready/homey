# SQL

## Postgres parse unix epoch to datetime

`TO_TIMESTAMP` auto converts to local time zone, wrap in `TIMEZONE` to standardize to UTC

```
TIMEZONE('UTC', TO_TIMESTAMP(isotime_field::bigint / 1000)) AS datetime_utc
```
