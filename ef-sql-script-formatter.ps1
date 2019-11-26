##------------------------------------------------------------------------------------------------
##
## Author:      Michaël Vanbrabandt
## Company:     Mivaweb
## Date:        26-11-2019
##
## Title:       ef-sql-script-formatter.ps1
##
## Description: 
## Contains a Powershell script to format the EF Core Migrations SQL Script. 
## It will encapsulate all CREATE and ALTER statements for Stored Procedures,
## Views and Functions into a `EXEC('...')` command. It will also escape every
## single quote with another single quote only inside these statements.
##
## --> Variables defined in the Azure DevOps CI pipeline
##
## $env:sql_script_path:    path to the exported SQL file during the Build pipeline
## $env:dev_db_name:        database name in DEV (local) environment
## $env:stage_db_name       database name in the current stage environment (staging, production)
##
##------------------------------------------------------------------------------------------------

## Declare Local Variables
$path = "$env:sql_script_path"
$devDb = "$env:dev_db_name"
$stageDb = "$env:stage_db_name"

## Get Content from the EF Migrations sql script file
$sql = get-content $path -raw

## Replace DEV Database Name with the correct stage Database Name
$sql = [regex]::replace($sql, "USE \[$devDb\]", "USE [$stageDb]", "ignorecase,singleline")

## Export formatted SQL script
$sql > $path