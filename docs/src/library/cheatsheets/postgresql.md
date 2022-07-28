# PostgreSQL

> This article is under heavy development and is not considered production ready

> PostgreSQL best SQL -- _Everyone who knows what's up_

PostgreSQL also known as Postgres, is a free and open-source relational database management system (RDBMS). The name comes from its succession of its predecessor, Ingres. You are now a database nerd... there's no turning back.

## SQL

Structured Query Language (SQL) is a query language used to interact with databases. It is a "standard" language structure, although its implementation differs between implementations. It does more than just query as well (see the [Language Structures](#Language Structures) section below). Each discrete action in SQL is called a "statement", which does something like retrieving the results of a query or creating a new record, and multiple statements can be bundled together into a transaction.

Fortunately the key words used in SQL tend to be written in (mostly) plain english, so it's relatively easy to understand and pick up. Multiple statements, joins, and subqueries can also be used which is where things start to get complicated, and optimizing those operations (and the database) can get rather complex.

### Simple Query Structures

#### Common queries

Basic query

```sql
SELECT col1, col2 FROM schema.table WHERE col2 = 'value' ORDER BY col1;
```

Aggregated query

```sql
SELECT max(col1), col2 FROM schema.table
GROUP BY col2
HAVING col2 = 'value';
LIMIT n
OFFSET offset;
```

Basic joins

```sql
SELECT col1, col2
FROM table1
FULL OUTER JOIN table2 ON col1
```

#### Clone table

Duplicate table with data

```sql
CREATE TABLE new_table AS SELECT * FROM old_table;
```

Duplicate table structure

```sql
CREATE TABLE new_table AS
TABLE existing_table
WITH NO DATA;
```

Replicate table using subset

```sql
CREATE TABLE new_table AS
SELECT
*
FROM
    existing_table
WHERE
    condition;
```

## psql

Using the psql interactive terminal for postgresql. Note that the version of psql on the local system is likely required to be an equal or higher version than for any databases with which you intend on interacting.

### Installing psql

psql is installed alongside postgresql on many systems, however if it is not expected that the local machine will run a database server, psql can be installed using postgresql client libraries.

Debian

```text
sudo apt install postgresql-client
```

Mac

```text
brew link --force libpq
```

> $ psql --help

```text
psql is the PostgreSQL interactive terminal.

Usage:
  psql [OPTION]... [DBNAME [USERNAME]]

General options:
  -c, --command=COMMAND    run only single command (SQL or internal) and exit
  -d, --dbname=DBNAME      database name to connect to (default: "Username")
  -f, --file=FILENAME      execute commands from file, then exit
  -l, --list               list available databases, then exit
  -v, --set=, --variable=NAME=VALUE
                            set psql variable NAME to VALUE
                            (e.g., -v ON_ERROR_STOP=1)
  -V, --version            output version information, then exit
  -X, --no-psqlrc          do not read startup file (~/.psqlrc)
  -1 ("one"), --single-transaction
                            execute as a single transaction (if non-interactive)
  -?, --help[=options]     show this help, then exit
      --help=commands      list backslash commands, then exit
      --help=variables     list special variables, then exit

Input and output options:
  -a, --echo-all           echo all input from script
  -b, --echo-errors        echo failed commands
  -e, --echo-queries       echo commands sent to server
  -E, --echo-hidden        display queries that internal commands generate
  -L, --log-file=FILENAME  send session log to file
  -n, --no-readline        disable enhanced command line editing (readline)
  -o, --output=FILENAME    send query results to file (or |pipe)
  -q, --quiet              run quietly (no messages, only query output)
  -s, --single-step        single-step mode (confirm each query)
  -S, --single-line        single-line mode (end of line terminates SQL command)

Output format options:
  -A, --no-align           unaligned table output mode
      --csv                CSV (Comma-Separated Values) table output mode
  -F, --field-separator=STRING
                            field separator for unaligned output (default: "|")
  -H, --html               HTML table output mode
  -P, --pset=VAR[=ARG]     set printing option VAR to ARG (see \pset command)
  -R, --record-separator=STRING
                            record separator for unaligned output (default: newline)
  -t, --tuples-only        print rows only
  -T, --table-attr=TEXT    set HTML table tag attributes (e.g., width, border)
  -x, --expanded           turn on expanded table output
  -z, --field-separator-zero
                            set field separator for unaligned output to zero byte
  -0, --record-separator-zero
                            set record separator for unaligned output to zero byte

Connection options:
  -h, --host=HOSTNAME      database server host or socket directory (default: "local socket")
  -p, --port=PORT          database server port (default: "5432")
  -U, --username=USERNAME  database user name (default: "Username")
  -w, --no-password        never prompt for password
  -W, --password           force password prompt (should happen automatically)
```

#### abstract "Basic psql commands"

Example psql connection:

```text
psql -U username -d database_name -h localhost -p 5432;
```

Quit psql:

```text
\q;
```

List databases:

```text
\l;
```

Connect to database:

```text
\c database_name;
```

List schemas:

```text
\dn;
```

List tables:

```text
\dt;
```

List table info:

```text
\d+ table_name;
```

List functions:

```text
\df;
```

List views:

```text
\dv;
```

## cli

Additional command line tools for interacting with postgreql databases. Note that the version of cli tools on the local system is likely required to be an equal or higher version than for any databases with which you intend on interacting. CLI tools are typically installed along with postgresql. Please see the "installing psql" section above for instructions on how to install command line tools.

### pg_dump

> $ pg_dump --help

```text
pg_dump dumps a database as a text file or to other formats.

Usage:
  pg_dump [OPTION]... [DBNAME]

General options:
  -f, --file=FILENAME          output file or directory name
  -F, --format=c|d|t|p         output file format (custom, directory, tar,
                                plain text (default))
  -j, --jobs=NUM               use this many parallel jobs to dump
  -v, --verbose                verbose mode
  -V, --version                output version information, then exit
  -Z, --compress=0-9           compression level for compressed formats
  --lock-wait-timeout=TIMEOUT  fail after waiting TIMEOUT for a table lock
  --no-sync                    do not wait for changes to be written safely to disk
  -?, --help                   show this help, then exit

Options controlling the output content:
  -a, --data-only              dump only the data, not the schema
  -b, --blobs                  include large objects in dump
  -B, --no-blobs               exclude large objects in dump
  -c, --clean                  clean (drop) database objects before recreating
  -C, --create                 include commands to create database in dump
  -E, --encoding=ENCODING      dump the data in encoding ENCODING
  -n, --schema=PATTERN         dump the specified schema(s) only
  -N, --exclude-schema=PATTERN do NOT dump the specified schema(s)
  -O, --no-owner               skip restoration of object ownership in
                                plain-text format
  -s, --schema-only            dump only the schema, no data
  -S, --superuser=NAME         superuser user name to use in plain-text format
  -t, --table=PATTERN          dump the specified table(s) only
  -T, --exclude-table=PATTERN  do NOT dump the specified table(s)
  -x, --no-privileges          do not dump privileges (grant/revoke)
  --binary-upgrade             for use by upgrade utilities only
  --column-inserts             dump data as INSERT commands with column names
  --disable-dollar-quoting     disable dollar quoting, use SQL standard quoting
  --disable-triggers           disable triggers during data-only restore
  --enable-row-security        enable row security (dump only content user has
                                access to)
  --exclude-table-data=PATTERN do NOT dump data for the specified table(s)
  --extra-float-digits=NUM     override default setting for extra_float_digits
  --if-exists                  use IF EXISTS when dropping objects
  --inserts                    dump data as INSERT commands, rather than COPY
  --load-via-partition-root    load partitions via the root table
  --no-comments                do not dump comments
  --no-publications            do not dump publications
  --no-security-labels         do not dump security label assignments
  --no-subscriptions           do not dump subscriptions
  --no-synchronized-snapshots  do not use synchronized snapshots in parallel jobs
  --no-tablespaces             do not dump tablespace assignments
  --no-unlogged-table-data     do not dump unlogged table data
  --on-conflict-do-nothing     add ON CONFLICT DO NOTHING to INSERT commands
  --quote-all-identifiers      quote all identifiers, even if not key words
  --rows-per-insert=NROWS      number of rows per INSERT; implies --inserts
  --section=SECTION            dump named section (pre-data, data, or post-data)
  --serializable-deferrable    wait until the dump can run without anomalies
  --snapshot=SNAPSHOT          use given snapshot for the dump
  --strict-names               require table and/or schema include patterns to
                                match at least one entity each
  --use-set-session-authorization
                                use SET SESSION AUTHORIZATION commands instead of
                                ALTER OWNER commands to set ownership

Connection options:
  -d, --dbname=DBNAME      database to dump
  -h, --host=HOSTNAME      database server host or socket directory
  -p, --port=PORT          database server port number
  -U, --username=NAME      connect as specified database user
  -w, --no-password        never prompt for password
  -W, --password           force password prompt (should happen automatically)
  --role=ROLENAME          do SET ROLE before dump

If no database name is supplied, then the PGDATABASE environment
variable value is used.

Report bugs to <pgsql-bugs@lists.postgresql.org>.
```

#### Backup with pg_dump

pg_dump is a command line tool for backing up postgresql databases.

Simple example in bash:

```bash
pg_dump -U admin_user -x -n public -h localhost -p 5111 -d gis > data.sql
```

Complex example in Windows:

```cmd
"C:\Program Files\PostgreSQL\14\bin\pg_dump.exe" --file "C:\\backup\\data.sql" --host "127.0.0.1" --port "5234" --username "admin_user" --no-password --verbose --format=p --no-owner --no-privileges --no-tablespaces --no-unlogged-table-data --encoding "UTF8" --schema "public" "database_name"
```

## PostGIS

PostGIS is a spatial extension for PostgreSQL that provides spatial functions and datatypes.

Be sure to check out the reference documentation at [https://postgis.net/](https://postgis.net/documentation/).

### SRIDs

Spatial Reference Identifiers and Coordinate Reference System (CRS) management with PostGIS.

> Create Custom CRS Definitions

Example using custom Albers EE Conic (Southern Africa)

```sql
INSERT INTO spatial_ref_sys (srid,proj4text) VALUES (40030,
                            '+proj=aea +lat_0=0 +lon_0=25 +lat_1=-24 +lat_2=-33 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs +type=crs');
```

Use [UpdateGeometrySRID](https://postgis.net/docs/UpdateGeometrySRID.html) to update geometry SRIDs.

```sql
select UpdateGeometrySRID('table_name', 'geom', 4326);
```

## Language Structures

There are multiple "categories" in SQL which apply different functionalities to different entities within the database. These are Data Definition Language (DDL), Data Query Language (DQL), Data Manipulation Language (DML), Transaction Control Language (TCL), and Data Control Language (DCL).

Very basically, the nomenclature (and therefore the command used) may change between entities, and this makes it clear to the user and the database which entity or object the function should apply to. For example, you might use the _DELETE_ command to delete a record from the database, but you would use the _DROP_ command to delete a table, because tables and records are seen as different entities within the database. You can also do a _ROLLBACK_ in a transaction, but you can't do so with a record _INSERT_ command directly.

These definitions are, of course, not arbitrarily assigned, and databases are a mature and complex field of computer science, which is where these formal structures and definitions come into effect.

Read more on the topic at [geeksforgeeks.org](https://www.geeksforgeeks.org/sql-ddl-dql-dml-dcl-tcl-commands/).
