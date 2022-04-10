# PostgreSQL

This will have some useful information one day.

## SQL

Structured Query Language (SQL) is a query language used to interact with databases.

### Simple Query Structures

??? abstract "Common queries"

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

??? abstract "Clone table"

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

??? abstract "Installing psql"

    psql is installed alongside postgresql on many systems, however if it is not expected that the local machine will run a database server, psql can be installed using postgresql client libraries.

    Debian
    ```text
    sudo apt install postgresql-client
    ```

    Mac
    ```text
    brew link --force libpq
    ```

??? abstract "$ psql --help"

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

??? abstract "Basic psql commands"

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
