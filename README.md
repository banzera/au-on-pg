# Accelerate United

MS Access to PostgresQL Migration

## Prerequisites

  - [Git SCM](https://git-scm.com/downloads)
  - A good text editor, e.g. [Visual Studio Code](https://code.visualstudio.com/)
  - Locally installed [PostgreSQL](https://www.postgresql.org/download/) Server
  - The [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
  - A [Ruby](https://rubyinstaller.org/downloads/) installation will be eventually necessary

## Getting Started

1. Setup Heroku CLI. See documentation at link above.
1. Setup PostgreSQL. Use the "Stack Builder" tool to install the ODBC drivers.

1. Create an ODBC System DSN:
  - Open Application 'ODBC Data Sources (64-bit)'
  - Choose 'System DSN' tab
  - Click 'Add'
    - Choose PostgreSQL Unicode(x64)  NB: Unicode vs. ANSI is a critical distintion!
    - Data Source: <choose name>
    - Database: <actual DB name on server>
    - SSL Mode: prefer
    - Server: DNS or IP of server
    - Port: 5432
    - User Name:
    - Password
    - Click 'Test' to ensure parameters are correct

or

1. Do the easy thing 💥:
  - Generate a batch file that generates the properly configured System DSN:

    ``` $ rake odbcconf ```

  - Run the batch file `create_system_dsn.bat` that was generated in the previous step


## To Export Data:

  - Open Current Access DB
  - Create a VB module
  - paste in contents of `export.vbs` from this project to the new module
  - save module as "export"
  - adjust TABLE_EXPORT_DESTINATION const at top of export module
  - in immediate window run: `export.dumpTables`

## To Bootstrap a local PostgresQL database:

  - Open a console at the location of this project
  - Run the following:

    ``` $ rake db:boostrap[<dbname>] ```

This will drop any existing DB with name of <dbname> before creating it and
loading the schema/indexes

## To Initialize a Heroku instance:

  ``` $ rake  heroku:rebuild[<dbname>] ```

This will reset the database attached to the configured Heroku applition and push
the named database up to Heroku

## To Link an Access DB to an (external) PostgreSQL DB:

  Before linking tables to the reomote datasource, the internal tables must be dropped.
  This can be done by importing the `export.vbs` into the Access DB as a module and invoking
  the routine `export.dropTables` from the immediate window of the VBA console.

  Additionally, before linking to external data via the `export.vbs` module, be sure to set the 
  value for the DSN constant at the top of the module definition. The value should be that of the
  name of the System DSN configured previously. 

  To link tables in, execute `export.linkTables` from the immediate window of the VBA console.

  > Note that the user will be prompted to specify the primary key field for a couple tables (tblPercent, tblUpdateNA)

  To link the views, execute `export.linkViews` from the immediate window of the VBA console.

  > Note that by their nature, a database view doesn't have a defined primary key, so user will be prompted to specify
  > unique row identifier for each linked view. This is generally the `skuid` or the `%itemid` field, but it varies
  > for each view.
  
