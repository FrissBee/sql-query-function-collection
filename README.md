# Description

This repo contains a collection of MySQL query functions.

With database queries, you always have similar database queries, such as `SELECT * FROM table_name;` or `SELECT * FROM table_name WHERE id = 1;` or `SELECT COUNT('id') AS count FROM table_name;` or `UPDATE table_name SET name = 'Hello World' WHERE id = 1;`.

In this repo, such database queries are summarized and can be used flexibly.

Simply add them to your project and save yourself the trouble of writing lots of MySQL functions.

This repo contains the MySQL functions and examples of how to use them.

Of course you can extend and supplement the functions as you wish.

# Instruction

The instructions refer to the use of XAMPP.

### For run the repo

1. download or clone the repo in a folder in `C:\xampp\htdocs` and run XAMPP with Apache and MySQL.
2. open `http://localhost/phpmyadmin/` in your browser and create a new database with the name `sql-query-function-collection` (or whatever name you want).
3. import the file `sql-query-function-collection.sql` from the `_DB` folder of this repo.
4. set your database connection credentials in `db_connection.inc.php` in the `inc` folder.
5. open the `index.php` file in your browser. You will now see all examples.
6. look into the files `db_functions.inc.php` and `db_connection.inc.php` for more information.

### For use the MySQL functions

1. add the two files `db_functions.inc.php` and `db_connection.inc.php` to your project.
2. use the MySQL functions. That was it! Enjoy :-)
