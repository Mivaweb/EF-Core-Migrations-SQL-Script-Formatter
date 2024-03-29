IF OBJECT_ID(N'[TestHelper].[__EFMigrationsHistory]') IS NULL
BEGIN
    IF SCHEMA_ID(N'TestHelper') IS NULL EXEC(N'CREATE SCHEMA [TestHelper];');
    CREATE TABLE [TestHelper].[__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191004135307_db_init')
BEGIN
    IF SCHEMA_ID(N'TestHelper') IS NULL EXEC(N'CREATE SCHEMA [TestHelper];');
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191004135307_db_init')
BEGIN
    CREATE TABLE [TestHelper].[TestGroup] (
        [Id] int NOT NULL IDENTITY,
        [Key] uniqueidentifier NOT NULL,
        [Code] nvarchar(max) NULL,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_TestGroup] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191004135307_db_init')
BEGIN
    INSERT INTO [TestHelper].[__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191004135307_db_init', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191004135334_db_sp')
BEGIN

                        USE [StagingDB]
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191004135334_db_sp')
BEGIN
    SET ANSI_NULLS ON
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191004135334_db_sp')
BEGIN
    SET QUOTED_IDENTIFIER ON
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191004135334_db_sp')
BEGIN
EXEC('CREATE PROCEDURE [TestHelper].[CsvImportService]
    	                    @ImportId INT,
    	                    @Path NVARCHAR(255)
                        AS
                        BEGIN
    	                    -- DROP TEMP TABLE IF EXITSTS
    	                    DROP TABLE IF EXISTS [TestHelper].[_tmpImportData]

    	                    -- CREATE TEMP TABLE
    	                    CREATE TABLE [TestHelper].[_tmpImportData]
    	                    (
    			                    DataSupplierID		INT
    		                    ,	DataSupplier		NVARCHAR(255)
    		                    ,	ArticleNumber		NVARCHAR(255)
    		                    ,	ArticleNumberNorm	NVARCHAR(255)
    		                    ,	GenNo				INT
    		                    ,	GenDescription		NVARCHAR(255)
    		                    ,	State				BIT
    	                    )

    	                    -- BULK INSERT DATA FROM FILESHARE
    	                    EXEC(''BULK INSERT [TestHelper].[_tmpImportData] FROM '''''' + @Path + '''''' WITH ( FIELDTERMINATOR = '''';'''',ROWTERMINATOR = ''''\n'''')'')

    	                    -- STEP 1: FORMAT DATA
    	                    -- REMOVE DOUBLE QUOTES = CHAR(34)
    	                    UPDATE [TestHelper].[_tmpImportData] 
    		                    SET		DataSupplier = REPLACE(DataSupplier, CHAR(34), '''')
    		                    ,		ArticleNumber = REPLACE(ArticleNumber, CHAR(34), '''')
    		                    ,		ArticleNumberNorm = REPLACE(ArticleNumberNorm, CHAR(34), '''')
    		                    ,		GenDescription = REPLACE(GenDescription, CHAR(34), '''')

    	                    -- Drop table
    	                    DROP TABLE [TestHelper].[_tmpImportData]

                        END
');
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191004135334_db_sp')
BEGIN
    INSERT INTO [TestHelper].[__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191004135334_db_sp', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191008093824_db_view')
BEGIN

                        USE [StagingDB]
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191008093824_db_view')
BEGIN
EXEC('CREATE VIEW [TestHelper].[CustomView] AS

                        SELECT		*
                        FROM		dbo.DbTable
');
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191008093824_db_view')
BEGIN
    INSERT INTO [TestHelper].[__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191008093824_db_view', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191008121934_db_func')
BEGIN

                    USE [StagingDB]
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191008121934_db_func')
BEGIN
EXEC('CREATE FUNCTION [TestHelper].[TestGroupsWithMetaData] (
    	                @param1 INT
                    )

                    RETURNS TABLE
                    AS 
                    RETURN
    	                SELECT		*
    	                FROM		dbo.DbTable
    	                WHERE param = @param1
');
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191008121934_db_func')
BEGIN
    INSERT INTO [TestHelper].[__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191008121934_db_func', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191021111757_db_view')
BEGIN

                        USE [StagingDB]
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191021111757_db_view')
BEGIN
EXEC('ALTER VIEW [TestHelper].[CustomView] AS

                        SELECT		*
                        FROM		dbo.DbTable
						ORDER BY Id DESC
');
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191021111757_db_view')
BEGIN
    INSERT INTO [TestHelper].[__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191021111757_db_view', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191021112455_db_func')
BEGIN

                    USE [StagingDB]
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191021112455_db_func')
BEGIN
EXEC('ALTER FUNCTION [TestHelper].[TestGroupsWithMetaData] (
    	                @param1 INT
                    )

                    RETURNS TABLE
                    AS 
                    RETURN
    	                SELECT		*
    	                FROM		dbo.DbTable
    	                WHERE param = @param1
						ORDER BY Id DESC
');
END;

GO

IF NOT EXISTS(SELECT * FROM [TestHelper].[__EFMigrationsHistory] WHERE [MigrationId] = N'20191021112455_db_func')
BEGIN
    INSERT INTO [TestHelper].[__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191021112455_db_func', N'2.2.6-servicing-10079');
END;

GO




