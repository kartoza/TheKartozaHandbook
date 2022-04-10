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
