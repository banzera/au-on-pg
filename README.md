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
    - Choose PostgreSQL ANSI(x64)
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

    ``` $ rake boostrap[<dbname>] ```

This will drop any existing DB with name of <dbname> before creating it and
loading the schema/indexes

## To Initialize a Heroku instance:

  ``` $ rake  rebuild_heroku[<dbname>] ```


## To Link An Access DB to an (external) PostgreSQL DB:

  WIP

