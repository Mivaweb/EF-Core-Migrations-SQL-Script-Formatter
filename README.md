# EF-Core-Migrations-SQL-Script-Formatter

Contains a PowerShell script to format the exported EF Core SQL Script to be deployed to other environments using Azure DevOps Build pipelines.

## Description

Contains a Powershell script to format the EF Core Migrations SQL Script. 
It will encapsulate all CREATE and ALTER statements for Stored Procedures, Views and Functions into a `EXEC('...')` command. It will also escape every single quote with another single quote only inside these statements.

#### Variables defined in the Azure DevOps CI pipeline

`$env:sql_script_path`:    path to the exported SQL file during the Build pipeline

`$env:dev_db_name`:        database name in DEV (local) environment

`$env:stage_db_name`:      database name in the current stage environment (staging, production)
