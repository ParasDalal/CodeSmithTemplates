-- Skipping FidelityImport because it does not have a primary key
-- Processing __EFMigrationsHistory
--region Drop Existing Procedures

IF OBJECT_ID(N'[dbo].[usp_Insert__EFMigrationsHistory]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_Insert__EFMigrationsHistory]

IF OBJECT_ID(N'[dbo].[usp_Update__EFMigrationsHistory]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_Update__EFMigrationsHistory]

IF OBJECT_ID(N'[dbo].[usp_InsertUpdate__EFMigrationsHistory]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUpdate__EFMigrationsHistory]

IF OBJECT_ID(N'[dbo].[usp_Delete__EFMigrationsHistory]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_Delete__EFMigrationsHistory]

IF OBJECT_ID(N'[dbo].[usp_Delete__EFMigrationsHistoriesDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_Delete__EFMigrationsHistoriesDynamic]

IF OBJECT_ID(N'[dbo].[usp_Select__EFMigrationsHistory]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_Select__EFMigrationsHistory]

IF OBJECT_ID(N'[dbo].[usp_Select__EFMigrationsHistoriesDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_Select__EFMigrationsHistoriesDynamic]

IF OBJECT_ID(N'[dbo].[usp_Select__EFMigrationsHistoriesAll]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_Select__EFMigrationsHistoriesAll]

IF OBJECT_ID(N'[dbo].[usp_Select__EFMigrationsHistoriesPaged]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_Select__EFMigrationsHistoriesPaged]

--endregion

GO

--region [dbo].[usp_Insert__EFMigrationsHistory]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_Insert__EFMigrationsHistory]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_Insert__EFMigrationsHistory]
	@MigrationId nvarchar(150),
	@ProductVersion nvarchar(32)
AS

SET NOCOUNT ON

INSERT INTO [dbo].[__EFMigrationsHistory] (
	[MigrationId],
	[ProductVersion]
) VALUES (
	@MigrationId,
	@ProductVersion
)

--endregion

GO

--region [dbo].[usp_Update__EFMigrationsHistory]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_Update__EFMigrationsHistory]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_Update__EFMigrationsHistory]
	@MigrationId nvarchar(150),
	@ProductVersion nvarchar(32)
AS

SET NOCOUNT ON

UPDATE [dbo].[__EFMigrationsHistory] SET
	[ProductVersion] = @ProductVersion
WHERE
	[MigrationId] = @MigrationId

--endregion

GO

--region [dbo].[usp_InsertUpdate__EFMigrationsHistory]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUpdate__EFMigrationsHistory]
------------------------------------------------------------------------------------------------------------------------
--region [dbo].[usp_Delete__EFMigrationsHistory]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_Delete__EFMigrationsHistory]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_Delete__EFMigrationsHistory]
	@MigrationId nvarchar(150)
AS

SET NOCOUNT ON


DELETE FROM [dbo].[__EFMigrationsHistory]
WHERE
	[MigrationId] = @MigrationId

--endregion

GO

--region [dbo].[usp_Delete__EFMigrationsHistoriesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_Delete__EFMigrationsHistoriesDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_Delete__EFMigrationsHistoriesDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[__EFMigrationsHistory]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_Select__EFMigrationsHistory]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_Select__EFMigrationsHistory]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_Select__EFMigrationsHistory]
	@MigrationId nvarchar(150)
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[MigrationId],
	[ProductVersion]
FROM
	[dbo].[__EFMigrationsHistory]
WHERE
	[MigrationId] = @MigrationId

--endregion

GO

--region [dbo].[usp_Select__EFMigrationsHistoriesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_Select__EFMigrationsHistoriesDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_Select__EFMigrationsHistoriesDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[MigrationId],
	[ProductVersion]
FROM
	[dbo].[__EFMigrationsHistory]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_Select__EFMigrationsHistoriesAll]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_Select__EFMigrationsHistoriesAll]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_Select__EFMigrationsHistoriesAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[MigrationId],
	[ProductVersion]
FROM
	[dbo].[__EFMigrationsHistory]

--endregion

GO

--region [dbo].[usp_Select__EFMigrationsHistoriesPaged]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_Select__EFMigrationsHistoriesPaged]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_Select__EFMigrationsHistoriesPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[MigrationId],
	[ProductVersion]
FROM
	[dbo].[__EFMigrationsHistory]

--endregion

GO

-- Processing Account
--region Drop Existing Procedures

IF OBJECT_ID(N'[dbo].[usp_InsertAccount]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertAccount]

IF OBJECT_ID(N'[dbo].[usp_UpdateAccount]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_UpdateAccount]

IF OBJECT_ID(N'[dbo].[usp_InsertUpdateAccount]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUpdateAccount]

IF OBJECT_ID(N'[dbo].[usp_DeleteAccount]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteAccount]

IF OBJECT_ID(N'[dbo].[usp_DeleteAccountsDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteAccountsDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectAccount]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAccount]

IF OBJECT_ID(N'[dbo].[usp_SelectAccountsDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAccountsDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectAccountsAll]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAccountsAll]

IF OBJECT_ID(N'[dbo].[usp_SelectAccountsPaged]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAccountsPaged]

--endregion

GO

--region [dbo].[usp_InsertAccount]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertAccount]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertAccount]
	@AccountNumber nvarchar(30),
	@Description nvarchar(30),
	@Active bit,
	@PortfolioId int,
	@Taxable bit,
	@TaxDeferred bit,
	@TaxPaid bit,
	@SecurityIdCash int,
	@Id int OUTPUT
AS

SET NOCOUNT ON

INSERT INTO [dbo].[Account] (
	[AccountNumber],
	[Description],
	[Active],
	[PortfolioId],
	[Taxable],
	[TaxDeferred],
	[TaxPaid],
	[SecurityIdCash]
) VALUES (
	@AccountNumber,
	@Description,
	@Active,
	@PortfolioId,
	@Taxable,
	@TaxDeferred,
	@TaxPaid,
	@SecurityIdCash
)

SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_UpdateAccount]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_UpdateAccount]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateAccount]
	@Id int,
	@AccountNumber nvarchar(30),
	@Description nvarchar(30),
	@Active bit,
	@PortfolioId int,
	@Taxable bit,
	@TaxDeferred bit,
	@TaxPaid bit,
	@SecurityIdCash int
AS

SET NOCOUNT ON

UPDATE [dbo].[Account] SET
	[AccountNumber] = @AccountNumber,
	[Description] = @Description,
	[Active] = @Active,
	[PortfolioId] = @PortfolioId,
	[Taxable] = @Taxable,
	[TaxDeferred] = @TaxDeferred,
	[TaxPaid] = @TaxPaid,
	[SecurityIdCash] = @SecurityIdCash
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_InsertUpdateAccount]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUpdateAccount]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateAccount]
	@AccountNumber nvarchar(30),
	@Description nvarchar(30),
	@Active bit,
	@PortfolioId int,
	@Taxable bit,
	@TaxDeferred bit,
	@TaxPaid bit,
	@SecurityIdCash int,
	@Id int OUTPUT
AS

SET NOCOUNT ON


IF EXISTS(SELECT [Id] FROM [dbo].[Account] WHERE [Id] = @Id)
BEGIN
	UPDATE [dbo].[Account] SET
		[AccountNumber] = @AccountNumber,
		[Description] = @Description,
		[Active] = @Active,
		[PortfolioId] = @PortfolioId,
		[Taxable] = @Taxable,
		[TaxDeferred] = @TaxDeferred,
		[TaxPaid] = @TaxPaid,
		[SecurityIdCash] = @SecurityIdCash
	WHERE
		[Id] = @Id
END
ELSE
BEGIN
		      -- CS_IsIdentity there
    
	INSERT INTO [dbo].[Account] (
		[AccountNumber],
		[Description],
		[Active],
		[PortfolioId],
		[Taxable],
		[TaxDeferred],
		[TaxPaid],
		[SecurityIdCash]
	) VALUES (
		@AccountNumber,
		@Description,
		@Active,
		@PortfolioId,
		@Taxable,
		@TaxDeferred,
		@TaxPaid,
		@SecurityIdCash
	)
END

IF IsNull(@Id, 0) = 0 
    SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_DeleteAccount]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteAccount]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteAccount]
	@Id int
AS

SET NOCOUNT ON


DELETE FROM [dbo].[Account]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_DeleteAccountsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteAccountsDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteAccountsDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[Account]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectAccount]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAccount]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAccount]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AccountNumber],
	[Description],
	[Active],
	[PortfolioId],
	[Taxable],
	[TaxDeferred],
	[TaxPaid],
	[SecurityIdCash]
FROM
	[dbo].[Account]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_SelectAccountsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAccountsDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAccountsDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[Id],
	[AccountNumber],
	[Description],
	[Active],
	[PortfolioId],
	[Taxable],
	[TaxDeferred],
	[TaxPaid],
	[SecurityIdCash]
FROM
	[dbo].[Account]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectAccountsAll]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAccountsAll]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAccountsAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AccountNumber],
	[Description],
	[Active],
	[PortfolioId],
	[Taxable],
	[TaxDeferred],
	[TaxPaid],
	[SecurityIdCash]
FROM
	[dbo].[Account]

--endregion

GO

--region [dbo].[usp_SelectAccountsPaged]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAccountsPaged]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAccountsPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AccountNumber],
	[Description],
	[Active],
	[PortfolioId],
	[Taxable],
	[TaxDeferred],
	[TaxPaid],
	[SecurityIdCash]
FROM
	[dbo].[Account]

--endregion

GO

-- Processing AccountPosition
--region Drop Existing Procedures

IF OBJECT_ID(N'[dbo].[usp_InsertAccountPosition]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertAccountPosition]

IF OBJECT_ID(N'[dbo].[usp_UpdateAccountPosition]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_UpdateAccountPosition]

IF OBJECT_ID(N'[dbo].[usp_InsertUpdateAccountPosition]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUpdateAccountPosition]

IF OBJECT_ID(N'[dbo].[usp_DeleteAccountPosition]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteAccountPosition]

IF OBJECT_ID(N'[dbo].[usp_DeleteAccountPositionsDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteAccountPositionsDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectAccountPosition]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAccountPosition]

IF OBJECT_ID(N'[dbo].[usp_SelectAccountPositionsDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAccountPositionsDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectAccountPositionsAll]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAccountPositionsAll]

IF OBJECT_ID(N'[dbo].[usp_SelectAccountPositionsPaged]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAccountPositionsPaged]

--endregion

GO

--region [dbo].[usp_InsertAccountPosition]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertAccountPosition]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertAccountPosition]
	@AccountId int,
	@TotalMV decimal(18, 2),
	@Id int OUTPUT
AS

SET NOCOUNT ON

INSERT INTO [dbo].[AccountPosition] (
	[AccountId],
	[TotalMV]
) VALUES (
	@AccountId,
	@TotalMV
)

SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_UpdateAccountPosition]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_UpdateAccountPosition]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateAccountPosition]
	@Id int,
	@AccountId int,
	@TotalMV decimal(18, 2)
AS

SET NOCOUNT ON

UPDATE [dbo].[AccountPosition] SET
	[AccountId] = @AccountId,
	[TotalMV] = @TotalMV
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_InsertUpdateAccountPosition]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUpdateAccountPosition]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateAccountPosition]
	@AccountId int,
	@TotalMV decimal(18, 2),
	@Id int OUTPUT
AS

SET NOCOUNT ON


IF EXISTS(SELECT [Id] FROM [dbo].[AccountPosition] WHERE [Id] = @Id)
BEGIN
	UPDATE [dbo].[AccountPosition] SET
		[AccountId] = @AccountId,
		[TotalMV] = @TotalMV
	WHERE
		[Id] = @Id
END
ELSE
BEGIN
		      -- CS_IsIdentity there
    
	INSERT INTO [dbo].[AccountPosition] (
		[AccountId],
		[TotalMV]
	) VALUES (
		@AccountId,
		@TotalMV
	)
END

IF IsNull(@Id, 0) = 0 
    SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_DeleteAccountPosition]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteAccountPosition]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteAccountPosition]
	@Id int
AS

SET NOCOUNT ON


DELETE FROM [dbo].[AccountPosition]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_DeleteAccountPositionsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteAccountPositionsDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteAccountPositionsDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[AccountPosition]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectAccountPosition]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAccountPosition]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAccountPosition]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AccountId],
	[TotalMV]
FROM
	[dbo].[AccountPosition]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_SelectAccountPositionsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAccountPositionsDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAccountPositionsDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[Id],
	[AccountId],
	[TotalMV]
FROM
	[dbo].[AccountPosition]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectAccountPositionsAll]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAccountPositionsAll]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAccountPositionsAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AccountId],
	[TotalMV]
FROM
	[dbo].[AccountPosition]

--endregion

GO

--region [dbo].[usp_SelectAccountPositionsPaged]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAccountPositionsPaged]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAccountPositionsPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AccountId],
	[TotalMV]
FROM
	[dbo].[AccountPosition]

--endregion

GO

-- Processing AssetSubType
--region Drop Existing Procedures

IF OBJECT_ID(N'[dbo].[usp_InsertAssetSubType]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertAssetSubType]

IF OBJECT_ID(N'[dbo].[usp_UpdateAssetSubType]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_UpdateAssetSubType]

IF OBJECT_ID(N'[dbo].[usp_InsertUpdateAssetSubType]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUpdateAssetSubType]

IF OBJECT_ID(N'[dbo].[usp_DeleteAssetSubType]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteAssetSubType]

IF OBJECT_ID(N'[dbo].[usp_DeleteAssetSubTypesDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteAssetSubTypesDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectAssetSubType]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAssetSubType]

IF OBJECT_ID(N'[dbo].[usp_SelectAssetSubTypesDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAssetSubTypesDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectAssetSubTypesAll]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAssetSubTypesAll]

IF OBJECT_ID(N'[dbo].[usp_SelectAssetSubTypesPaged]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAssetSubTypesPaged]

--endregion

GO

--region [dbo].[usp_InsertAssetSubType]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertAssetSubType]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertAssetSubType]
	@AssetTypeId int,
	@Description nvarchar(30),
	@Id int OUTPUT
AS

SET NOCOUNT ON

INSERT INTO [dbo].[AssetSubType] (
	[AssetTypeId],
	[Description]
) VALUES (
	@AssetTypeId,
	@Description
)

SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_UpdateAssetSubType]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_UpdateAssetSubType]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateAssetSubType]
	@Id int,
	@AssetTypeId int,
	@Description nvarchar(30)
AS

SET NOCOUNT ON

UPDATE [dbo].[AssetSubType] SET
	[AssetTypeId] = @AssetTypeId,
	[Description] = @Description
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_InsertUpdateAssetSubType]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUpdateAssetSubType]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateAssetSubType]
	@AssetTypeId int,
	@Description nvarchar(30),
	@Id int OUTPUT
AS

SET NOCOUNT ON


IF EXISTS(SELECT [Id] FROM [dbo].[AssetSubType] WHERE [Id] = @Id)
BEGIN
	UPDATE [dbo].[AssetSubType] SET
		[AssetTypeId] = @AssetTypeId,
		[Description] = @Description
	WHERE
		[Id] = @Id
END
ELSE
BEGIN
		      -- CS_IsIdentity there
    
	INSERT INTO [dbo].[AssetSubType] (
		[AssetTypeId],
		[Description]
	) VALUES (
		@AssetTypeId,
		@Description
	)
END

IF IsNull(@Id, 0) = 0 
    SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_DeleteAssetSubType]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteAssetSubType]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteAssetSubType]
	@Id int
AS

SET NOCOUNT ON


DELETE FROM [dbo].[AssetSubType]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_DeleteAssetSubTypesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteAssetSubTypesDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteAssetSubTypesDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[AssetSubType]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectAssetSubType]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAssetSubType]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAssetSubType]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AssetTypeId],
	[Description]
FROM
	[dbo].[AssetSubType]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_SelectAssetSubTypesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAssetSubTypesDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAssetSubTypesDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[Id],
	[AssetTypeId],
	[Description]
FROM
	[dbo].[AssetSubType]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectAssetSubTypesAll]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAssetSubTypesAll]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAssetSubTypesAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AssetTypeId],
	[Description]
FROM
	[dbo].[AssetSubType]

--endregion

GO

--region [dbo].[usp_SelectAssetSubTypesPaged]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAssetSubTypesPaged]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAssetSubTypesPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AssetTypeId],
	[Description]
FROM
	[dbo].[AssetSubType]

--endregion

GO

-- Processing AssetType
--region Drop Existing Procedures

IF OBJECT_ID(N'[dbo].[usp_InsertAssetType]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertAssetType]

IF OBJECT_ID(N'[dbo].[usp_UpdateAssetType]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_UpdateAssetType]

IF OBJECT_ID(N'[dbo].[usp_InsertUpdateAssetType]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUpdateAssetType]

IF OBJECT_ID(N'[dbo].[usp_DeleteAssetType]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteAssetType]

IF OBJECT_ID(N'[dbo].[usp_DeleteAssetTypesDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteAssetTypesDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectAssetType]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAssetType]

IF OBJECT_ID(N'[dbo].[usp_SelectAssetTypesDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAssetTypesDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectAssetTypesAll]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAssetTypesAll]

IF OBJECT_ID(N'[dbo].[usp_SelectAssetTypesPaged]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectAssetTypesPaged]

--endregion

GO

--region [dbo].[usp_InsertAssetType]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertAssetType]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertAssetType]
	@Description nvarchar(30),
	@Id int OUTPUT
AS

SET NOCOUNT ON

INSERT INTO [dbo].[AssetType] (
	[Description]
) VALUES (
	@Description
)

SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_UpdateAssetType]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_UpdateAssetType]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateAssetType]
	@Id int,
	@Description nvarchar(30)
AS

SET NOCOUNT ON

UPDATE [dbo].[AssetType] SET
	[Description] = @Description
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_InsertUpdateAssetType]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUpdateAssetType]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateAssetType]
	@Description nvarchar(30),
	@Id int OUTPUT
AS

SET NOCOUNT ON


IF EXISTS(SELECT [Id] FROM [dbo].[AssetType] WHERE [Id] = @Id)
BEGIN
	UPDATE [dbo].[AssetType] SET
		[Description] = @Description
	WHERE
		[Id] = @Id
END
ELSE
BEGIN
		      -- CS_IsIdentity there
    
	INSERT INTO [dbo].[AssetType] (
		[Description]
	) VALUES (
		@Description
	)
END

IF IsNull(@Id, 0) = 0 
    SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_DeleteAssetType]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteAssetType]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteAssetType]
	@Id int
AS

SET NOCOUNT ON


DELETE FROM [dbo].[AssetType]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_DeleteAssetTypesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteAssetTypesDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteAssetTypesDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[AssetType]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectAssetType]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAssetType]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAssetType]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Description]
FROM
	[dbo].[AssetType]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_SelectAssetTypesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAssetTypesDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAssetTypesDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[Id],
	[Description]
FROM
	[dbo].[AssetType]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectAssetTypesAll]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAssetTypesAll]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAssetTypesAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Description]
FROM
	[dbo].[AssetType]

--endregion

GO

--region [dbo].[usp_SelectAssetTypesPaged]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectAssetTypesPaged]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectAssetTypesPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Description]
FROM
	[dbo].[AssetType]

--endregion

GO

-- Processing Portfolio
--region Drop Existing Procedures

IF OBJECT_ID(N'[dbo].[usp_InsertPortfolio]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertPortfolio]

IF OBJECT_ID(N'[dbo].[usp_UpdatePortfolio]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_UpdatePortfolio]

IF OBJECT_ID(N'[dbo].[usp_InsertUpdatePortfolio]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUpdatePortfolio]

IF OBJECT_ID(N'[dbo].[usp_DeletePortfolio]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeletePortfolio]

IF OBJECT_ID(N'[dbo].[usp_DeletePortfoliosDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeletePortfoliosDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectPortfolio]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectPortfolio]

IF OBJECT_ID(N'[dbo].[usp_SelectPortfoliosDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectPortfoliosDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectPortfoliosAll]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectPortfoliosAll]

IF OBJECT_ID(N'[dbo].[usp_SelectPortfoliosPaged]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectPortfoliosPaged]

--endregion

GO

--region [dbo].[usp_InsertPortfolio]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertPortfolio]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertPortfolio]
	@Description nvarchar(30),
	@Active bit,
	@Id int OUTPUT
AS

SET NOCOUNT ON

INSERT INTO [dbo].[Portfolio] (
	[Description],
	[Active]
) VALUES (
	@Description,
	@Active
)

SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_UpdatePortfolio]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_UpdatePortfolio]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdatePortfolio]
	@Id int,
	@Description nvarchar(30),
	@Active bit
AS

SET NOCOUNT ON

UPDATE [dbo].[Portfolio] SET
	[Description] = @Description,
	[Active] = @Active
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_InsertUpdatePortfolio]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUpdatePortfolio]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdatePortfolio]
	@Description nvarchar(30),
	@Active bit,
	@Id int OUTPUT
AS

SET NOCOUNT ON


IF EXISTS(SELECT [Id] FROM [dbo].[Portfolio] WHERE [Id] = @Id)
BEGIN
	UPDATE [dbo].[Portfolio] SET
		[Description] = @Description,
		[Active] = @Active
	WHERE
		[Id] = @Id
END
ELSE
BEGIN
		      -- CS_IsIdentity there
    
	INSERT INTO [dbo].[Portfolio] (
		[Description],
		[Active]
	) VALUES (
		@Description,
		@Active
	)
END

IF IsNull(@Id, 0) = 0 
    SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_DeletePortfolio]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeletePortfolio]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeletePortfolio]
	@Id int
AS

SET NOCOUNT ON


DELETE FROM [dbo].[Portfolio]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_DeletePortfoliosDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeletePortfoliosDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeletePortfoliosDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[Portfolio]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectPortfolio]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectPortfolio]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectPortfolio]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Description],
	[Active]
FROM
	[dbo].[Portfolio]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_SelectPortfoliosDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectPortfoliosDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectPortfoliosDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[Id],
	[Description],
	[Active]
FROM
	[dbo].[Portfolio]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectPortfoliosAll]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectPortfoliosAll]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectPortfoliosAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Description],
	[Active]
FROM
	[dbo].[Portfolio]

--endregion

GO

--region [dbo].[usp_SelectPortfoliosPaged]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectPortfoliosPaged]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectPortfoliosPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Description],
	[Active]
FROM
	[dbo].[Portfolio]

--endregion

GO

-- Processing Position
--region Drop Existing Procedures

IF OBJECT_ID(N'[dbo].[usp_InsertPosition]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertPosition]

IF OBJECT_ID(N'[dbo].[usp_UpdatePosition]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_UpdatePosition]

IF OBJECT_ID(N'[dbo].[usp_InsertUpdatePosition]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUpdatePosition]

IF OBJECT_ID(N'[dbo].[usp_DeletePosition]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeletePosition]

IF OBJECT_ID(N'[dbo].[usp_DeletePositionsDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeletePositionsDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectPosition]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectPosition]

IF OBJECT_ID(N'[dbo].[usp_SelectPositionsDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectPositionsDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectPositionsAll]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectPositionsAll]

IF OBJECT_ID(N'[dbo].[usp_SelectPositionsPaged]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectPositionsPaged]

--endregion

GO

--region [dbo].[usp_InsertPosition]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertPosition]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertPosition]
	@AccountPositionId int,
	@AccountId int,
	@SecurityId int,
	@Quantity decimal(10, 3),
	@AverageCost decimal(9, 2),
	@Id int OUTPUT
AS

SET NOCOUNT ON

INSERT INTO [dbo].[Position] (
	[AccountPositionId],
	[AccountId],
	[SecurityId],
	[Quantity],
	[AverageCost]
) VALUES (
	@AccountPositionId,
	@AccountId,
	@SecurityId,
	@Quantity,
	@AverageCost
)

SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_UpdatePosition]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_UpdatePosition]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdatePosition]
	@Id int,
	@AccountPositionId int,
	@AccountId int,
	@SecurityId int,
	@Quantity decimal(10, 3),
	@AverageCost decimal(9, 2)
AS

SET NOCOUNT ON

UPDATE [dbo].[Position] SET
	[AccountPositionId] = @AccountPositionId,
	[AccountId] = @AccountId,
	[SecurityId] = @SecurityId,
	[Quantity] = @Quantity,
	[AverageCost] = @AverageCost
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_InsertUpdatePosition]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUpdatePosition]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdatePosition]
	@AccountPositionId int,
	@AccountId int,
	@SecurityId int,
	@Quantity decimal(10, 3),
	@AverageCost decimal(9, 2),
	@Id int OUTPUT
AS

SET NOCOUNT ON


IF EXISTS(SELECT [Id] FROM [dbo].[Position] WHERE [Id] = @Id)
BEGIN
	UPDATE [dbo].[Position] SET
		[AccountPositionId] = @AccountPositionId,
		[AccountId] = @AccountId,
		[SecurityId] = @SecurityId,
		[Quantity] = @Quantity,
		[AverageCost] = @AverageCost
	WHERE
		[Id] = @Id
END
ELSE
BEGIN
		      -- CS_IsIdentity there
    
	INSERT INTO [dbo].[Position] (
		[AccountPositionId],
		[AccountId],
		[SecurityId],
		[Quantity],
		[AverageCost]
	) VALUES (
		@AccountPositionId,
		@AccountId,
		@SecurityId,
		@Quantity,
		@AverageCost
	)
END

IF IsNull(@Id, 0) = 0 
    SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_DeletePosition]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeletePosition]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeletePosition]
	@Id int
AS

SET NOCOUNT ON


DELETE FROM [dbo].[Position]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_DeletePositionsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeletePositionsDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeletePositionsDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[Position]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectPosition]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectPosition]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectPosition]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AccountPositionId],
	[AccountId],
	[SecurityId],
	[Quantity],
	[AverageCost]
FROM
	[dbo].[Position]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_SelectPositionsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectPositionsDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectPositionsDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[Id],
	[AccountPositionId],
	[AccountId],
	[SecurityId],
	[Quantity],
	[AverageCost]
FROM
	[dbo].[Position]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectPositionsAll]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectPositionsAll]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectPositionsAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AccountPositionId],
	[AccountId],
	[SecurityId],
	[Quantity],
	[AverageCost]
FROM
	[dbo].[Position]

--endregion

GO

--region [dbo].[usp_SelectPositionsPaged]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectPositionsPaged]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectPositionsPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AccountPositionId],
	[AccountId],
	[SecurityId],
	[Quantity],
	[AverageCost]
FROM
	[dbo].[Position]

--endregion

GO

-- Processing RebalModel
--region Drop Existing Procedures

IF OBJECT_ID(N'[dbo].[usp_InsertRebalModel]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertRebalModel]

IF OBJECT_ID(N'[dbo].[usp_UpdateRebalModel]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_UpdateRebalModel]

IF OBJECT_ID(N'[dbo].[usp_InsertUpdateRebalModel]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUpdateRebalModel]

IF OBJECT_ID(N'[dbo].[usp_DeleteRebalModel]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteRebalModel]

IF OBJECT_ID(N'[dbo].[usp_DeleteRebalModelsDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteRebalModelsDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectRebalModel]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectRebalModel]

IF OBJECT_ID(N'[dbo].[usp_SelectRebalModelsDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectRebalModelsDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectRebalModelsAll]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectRebalModelsAll]

IF OBJECT_ID(N'[dbo].[usp_SelectRebalModelsPaged]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectRebalModelsPaged]

--endregion

GO

--region [dbo].[usp_InsertRebalModel]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertRebalModel]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertRebalModel]
	@Description nvarchar(30),
	@Id int OUTPUT
AS

SET NOCOUNT ON

INSERT INTO [dbo].[RebalModel] (
	[Description]
) VALUES (
	@Description
)

SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_UpdateRebalModel]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_UpdateRebalModel]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateRebalModel]
	@Id int,
	@Description nvarchar(30)
AS

SET NOCOUNT ON

UPDATE [dbo].[RebalModel] SET
	[Description] = @Description
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_InsertUpdateRebalModel]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUpdateRebalModel]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateRebalModel]
	@Description nvarchar(30),
	@Id int OUTPUT
AS

SET NOCOUNT ON


IF EXISTS(SELECT [Id] FROM [dbo].[RebalModel] WHERE [Id] = @Id)
BEGIN
	UPDATE [dbo].[RebalModel] SET
		[Description] = @Description
	WHERE
		[Id] = @Id
END
ELSE
BEGIN
		      -- CS_IsIdentity there
    
	INSERT INTO [dbo].[RebalModel] (
		[Description]
	) VALUES (
		@Description
	)
END

IF IsNull(@Id, 0) = 0 
    SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_DeleteRebalModel]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteRebalModel]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteRebalModel]
	@Id int
AS

SET NOCOUNT ON


DELETE FROM [dbo].[RebalModel]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_DeleteRebalModelsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteRebalModelsDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteRebalModelsDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[RebalModel]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectRebalModel]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectRebalModel]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRebalModel]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Description]
FROM
	[dbo].[RebalModel]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_SelectRebalModelsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectRebalModelsDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRebalModelsDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[Id],
	[Description]
FROM
	[dbo].[RebalModel]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectRebalModelsAll]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectRebalModelsAll]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRebalModelsAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Description]
FROM
	[dbo].[RebalModel]

--endregion

GO

--region [dbo].[usp_SelectRebalModelsPaged]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectRebalModelsPaged]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRebalModelsPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Description]
FROM
	[dbo].[RebalModel]

--endregion

GO

-- Processing RebalModelTarget
--region Drop Existing Procedures

IF OBJECT_ID(N'[dbo].[usp_InsertRebalModelTarget]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertRebalModelTarget]

IF OBJECT_ID(N'[dbo].[usp_UpdateRebalModelTarget]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_UpdateRebalModelTarget]

IF OBJECT_ID(N'[dbo].[usp_InsertUpdateRebalModelTarget]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUpdateRebalModelTarget]

IF OBJECT_ID(N'[dbo].[usp_DeleteRebalModelTarget]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteRebalModelTarget]

IF OBJECT_ID(N'[dbo].[usp_DeleteRebalModelTargetsDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteRebalModelTargetsDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectRebalModelTarget]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectRebalModelTarget]

IF OBJECT_ID(N'[dbo].[usp_SelectRebalModelTargetsDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectRebalModelTargetsDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectRebalModelTargetsAll]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectRebalModelTargetsAll]

IF OBJECT_ID(N'[dbo].[usp_SelectRebalModelTargetsPaged]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectRebalModelTargetsPaged]

--endregion

GO

--region [dbo].[usp_InsertRebalModelTarget]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertRebalModelTarget]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertRebalModelTarget]
	@RebalModelId int,
	@AssetTypeId int,
	@AssetSubTypeId int,
	@TargetPercent decimal(5, 2),
	@Id int OUTPUT
AS

SET NOCOUNT ON

INSERT INTO [dbo].[RebalModelTarget] (
	[RebalModelId],
	[AssetTypeId],
	[AssetSubTypeId],
	[TargetPercent]
) VALUES (
	@RebalModelId,
	@AssetTypeId,
	@AssetSubTypeId,
	@TargetPercent
)

SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_UpdateRebalModelTarget]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_UpdateRebalModelTarget]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateRebalModelTarget]
	@Id int,
	@RebalModelId int,
	@AssetTypeId int,
	@AssetSubTypeId int,
	@TargetPercent decimal(5, 2)
AS

SET NOCOUNT ON

UPDATE [dbo].[RebalModelTarget] SET
	[RebalModelId] = @RebalModelId,
	[AssetTypeId] = @AssetTypeId,
	[AssetSubTypeId] = @AssetSubTypeId,
	[TargetPercent] = @TargetPercent
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_InsertUpdateRebalModelTarget]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUpdateRebalModelTarget]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateRebalModelTarget]
	@RebalModelId int,
	@AssetTypeId int,
	@AssetSubTypeId int,
	@TargetPercent decimal(5, 2),
	@Id int OUTPUT
AS

SET NOCOUNT ON


IF EXISTS(SELECT [Id] FROM [dbo].[RebalModelTarget] WHERE [Id] = @Id)
BEGIN
	UPDATE [dbo].[RebalModelTarget] SET
		[RebalModelId] = @RebalModelId,
		[AssetTypeId] = @AssetTypeId,
		[AssetSubTypeId] = @AssetSubTypeId,
		[TargetPercent] = @TargetPercent
	WHERE
		[Id] = @Id
END
ELSE
BEGIN
		      -- CS_IsIdentity there
    
	INSERT INTO [dbo].[RebalModelTarget] (
		[RebalModelId],
		[AssetTypeId],
		[AssetSubTypeId],
		[TargetPercent]
	) VALUES (
		@RebalModelId,
		@AssetTypeId,
		@AssetSubTypeId,
		@TargetPercent
	)
END

IF IsNull(@Id, 0) = 0 
    SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_DeleteRebalModelTarget]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteRebalModelTarget]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteRebalModelTarget]
	@Id int
AS

SET NOCOUNT ON


DELETE FROM [dbo].[RebalModelTarget]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_DeleteRebalModelTargetsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteRebalModelTargetsDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteRebalModelTargetsDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[RebalModelTarget]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectRebalModelTarget]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectRebalModelTarget]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRebalModelTarget]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[RebalModelId],
	[AssetTypeId],
	[AssetSubTypeId],
	[TargetPercent]
FROM
	[dbo].[RebalModelTarget]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_SelectRebalModelTargetsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectRebalModelTargetsDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRebalModelTargetsDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[Id],
	[RebalModelId],
	[AssetTypeId],
	[AssetSubTypeId],
	[TargetPercent]
FROM
	[dbo].[RebalModelTarget]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectRebalModelTargetsAll]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectRebalModelTargetsAll]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRebalModelTargetsAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[RebalModelId],
	[AssetTypeId],
	[AssetSubTypeId],
	[TargetPercent]
FROM
	[dbo].[RebalModelTarget]

--endregion

GO

--region [dbo].[usp_SelectRebalModelTargetsPaged]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectRebalModelTargetsPaged]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectRebalModelTargetsPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[RebalModelId],
	[AssetTypeId],
	[AssetSubTypeId],
	[TargetPercent]
FROM
	[dbo].[RebalModelTarget]

--endregion

GO

-- Processing Security
--region Drop Existing Procedures

IF OBJECT_ID(N'[dbo].[usp_InsertSecurity]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertSecurity]

IF OBJECT_ID(N'[dbo].[usp_UpdateSecurity]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_UpdateSecurity]

IF OBJECT_ID(N'[dbo].[usp_InsertUpdateSecurity]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUpdateSecurity]

IF OBJECT_ID(N'[dbo].[usp_DeleteSecurity]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteSecurity]

IF OBJECT_ID(N'[dbo].[usp_DeleteSecuritiesDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteSecuritiesDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectSecurity]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectSecurity]

IF OBJECT_ID(N'[dbo].[usp_SelectSecuritiesDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectSecuritiesDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectSecuritiesAll]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectSecuritiesAll]

IF OBJECT_ID(N'[dbo].[usp_SelectSecuritiesPaged]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectSecuritiesPaged]

--endregion

GO

--region [dbo].[usp_InsertSecurity]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertSecurity]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertSecurity]
	@Description nvarchar(100),
	@Symbol nvarchar(30),
	@AssetTypeId int,
	@Price decimal(9, 2),
	@SpecialPrice bit,
	@AssetSubTypeId1 int,
	@AssetSubType1Percent decimal(9, 2),
	@AssetSubTypeId2 int,
	@AssetSubType2Percent decimal(9, 2),
	@AssetSubTypeId3 int,
	@AssetSubType3Percent decimal(9, 2),
	@Id int OUTPUT
AS

SET NOCOUNT ON

INSERT INTO [dbo].[Security] (
	[Description],
	[Symbol],
	[AssetTypeId],
	[Price],
	[SpecialPrice],
	[AssetSubTypeId1],
	[AssetSubType1Percent],
	[AssetSubTypeId2],
	[AssetSubType2Percent],
	[AssetSubTypeId3],
	[AssetSubType3Percent]
) VALUES (
	@Description,
	@Symbol,
	@AssetTypeId,
	@Price,
	@SpecialPrice,
	@AssetSubTypeId1,
	@AssetSubType1Percent,
	@AssetSubTypeId2,
	@AssetSubType2Percent,
	@AssetSubTypeId3,
	@AssetSubType3Percent
)

SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_UpdateSecurity]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_UpdateSecurity]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateSecurity]
	@Id int,
	@Description nvarchar(100),
	@Symbol nvarchar(30),
	@AssetTypeId int,
	@Price decimal(9, 2),
	@SpecialPrice bit,
	@AssetSubTypeId1 int,
	@AssetSubType1Percent decimal(9, 2),
	@AssetSubTypeId2 int,
	@AssetSubType2Percent decimal(9, 2),
	@AssetSubTypeId3 int,
	@AssetSubType3Percent decimal(9, 2)
AS

SET NOCOUNT ON

UPDATE [dbo].[Security] SET
	[Description] = @Description,
	[Symbol] = @Symbol,
	[AssetTypeId] = @AssetTypeId,
	[Price] = @Price,
	[SpecialPrice] = @SpecialPrice,
	[AssetSubTypeId1] = @AssetSubTypeId1,
	[AssetSubType1Percent] = @AssetSubType1Percent,
	[AssetSubTypeId2] = @AssetSubTypeId2,
	[AssetSubType2Percent] = @AssetSubType2Percent,
	[AssetSubTypeId3] = @AssetSubTypeId3,
	[AssetSubType3Percent] = @AssetSubType3Percent
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_InsertUpdateSecurity]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUpdateSecurity]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateSecurity]
	@Description nvarchar(100),
	@Symbol nvarchar(30),
	@AssetTypeId int,
	@Price decimal(9, 2),
	@SpecialPrice bit,
	@AssetSubTypeId1 int,
	@AssetSubType1Percent decimal(9, 2),
	@AssetSubTypeId2 int,
	@AssetSubType2Percent decimal(9, 2),
	@AssetSubTypeId3 int,
	@AssetSubType3Percent decimal(9, 2),
	@Id int OUTPUT
AS

SET NOCOUNT ON


IF EXISTS(SELECT [Id] FROM [dbo].[Security] WHERE [Id] = @Id)
BEGIN
	UPDATE [dbo].[Security] SET
		[Description] = @Description,
		[Symbol] = @Symbol,
		[AssetTypeId] = @AssetTypeId,
		[Price] = @Price,
		[SpecialPrice] = @SpecialPrice,
		[AssetSubTypeId1] = @AssetSubTypeId1,
		[AssetSubType1Percent] = @AssetSubType1Percent,
		[AssetSubTypeId2] = @AssetSubTypeId2,
		[AssetSubType2Percent] = @AssetSubType2Percent,
		[AssetSubTypeId3] = @AssetSubTypeId3,
		[AssetSubType3Percent] = @AssetSubType3Percent
	WHERE
		[Id] = @Id
END
ELSE
BEGIN
		      -- CS_IsIdentity there
    
	INSERT INTO [dbo].[Security] (
		[Description],
		[Symbol],
		[AssetTypeId],
		[Price],
		[SpecialPrice],
		[AssetSubTypeId1],
		[AssetSubType1Percent],
		[AssetSubTypeId2],
		[AssetSubType2Percent],
		[AssetSubTypeId3],
		[AssetSubType3Percent]
	) VALUES (
		@Description,
		@Symbol,
		@AssetTypeId,
		@Price,
		@SpecialPrice,
		@AssetSubTypeId1,
		@AssetSubType1Percent,
		@AssetSubTypeId2,
		@AssetSubType2Percent,
		@AssetSubTypeId3,
		@AssetSubType3Percent
	)
END

IF IsNull(@Id, 0) = 0 
    SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_DeleteSecurity]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteSecurity]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteSecurity]
	@Id int
AS

SET NOCOUNT ON


DELETE FROM [dbo].[Security]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_DeleteSecuritiesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteSecuritiesDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteSecuritiesDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[Security]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectSecurity]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectSecurity]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectSecurity]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Description],
	[Symbol],
	[AssetTypeId],
	[Price],
	[SpecialPrice],
	[AssetSubTypeId1],
	[AssetSubType1Percent],
	[AssetSubTypeId2],
	[AssetSubType2Percent],
	[AssetSubTypeId3],
	[AssetSubType3Percent]
FROM
	[dbo].[Security]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_SelectSecuritiesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectSecuritiesDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectSecuritiesDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[Id],
	[Description],
	[Symbol],
	[AssetTypeId],
	[Price],
	[SpecialPrice],
	[AssetSubTypeId1],
	[AssetSubType1Percent],
	[AssetSubTypeId2],
	[AssetSubType2Percent],
	[AssetSubTypeId3],
	[AssetSubType3Percent]
FROM
	[dbo].[Security]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectSecuritiesAll]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectSecuritiesAll]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectSecuritiesAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Description],
	[Symbol],
	[AssetTypeId],
	[Price],
	[SpecialPrice],
	[AssetSubTypeId1],
	[AssetSubType1Percent],
	[AssetSubTypeId2],
	[AssetSubType2Percent],
	[AssetSubTypeId3],
	[AssetSubType3Percent]
FROM
	[dbo].[Security]

--endregion

GO

--region [dbo].[usp_SelectSecuritiesPaged]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectSecuritiesPaged]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectSecuritiesPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Description],
	[Symbol],
	[AssetTypeId],
	[Price],
	[SpecialPrice],
	[AssetSubTypeId1],
	[AssetSubType1Percent],
	[AssetSubTypeId2],
	[AssetSubType2Percent],
	[AssetSubTypeId3],
	[AssetSubType3Percent]
FROM
	[dbo].[Security]

--endregion

GO

-- Processing TaxLot
--region Drop Existing Procedures

IF OBJECT_ID(N'[dbo].[usp_InsertTaxLot]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertTaxLot]

IF OBJECT_ID(N'[dbo].[usp_UpdateTaxLot]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_UpdateTaxLot]

IF OBJECT_ID(N'[dbo].[usp_InsertUpdateTaxLot]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUpdateTaxLot]

IF OBJECT_ID(N'[dbo].[usp_DeleteTaxLot]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteTaxLot]

IF OBJECT_ID(N'[dbo].[usp_DeleteTaxLotsDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteTaxLotsDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectTaxLot]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectTaxLot]

IF OBJECT_ID(N'[dbo].[usp_SelectTaxLotsDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectTaxLotsDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectTaxLotsAll]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectTaxLotsAll]

IF OBJECT_ID(N'[dbo].[usp_SelectTaxLotsPaged]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectTaxLotsPaged]

--endregion

GO

--region [dbo].[usp_InsertTaxLot]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertTaxLot]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertTaxLot]
	@AccountId int,
	@SecurityId int,
	@Trade_Date datetime2,
	@Quantity decimal(9, 2),
	@Id int OUTPUT
AS

SET NOCOUNT ON

INSERT INTO [dbo].[TaxLot] (
	[AccountId],
	[SecurityId],
	[Trade_Date],
	[Quantity]
) VALUES (
	@AccountId,
	@SecurityId,
	@Trade_Date,
	@Quantity
)

SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_UpdateTaxLot]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_UpdateTaxLot]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateTaxLot]
	@Id int,
	@AccountId int,
	@SecurityId int,
	@Trade_Date datetime2,
	@Quantity decimal(9, 2)
AS

SET NOCOUNT ON

UPDATE [dbo].[TaxLot] SET
	[AccountId] = @AccountId,
	[SecurityId] = @SecurityId,
	[Trade_Date] = @Trade_Date,
	[Quantity] = @Quantity
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_InsertUpdateTaxLot]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUpdateTaxLot]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateTaxLot]
	@AccountId int,
	@SecurityId int,
	@Trade_Date datetime2,
	@Quantity decimal(9, 2),
	@Id int OUTPUT
AS

SET NOCOUNT ON


IF EXISTS(SELECT [Id] FROM [dbo].[TaxLot] WHERE [Id] = @Id)
BEGIN
	UPDATE [dbo].[TaxLot] SET
		[AccountId] = @AccountId,
		[SecurityId] = @SecurityId,
		[Trade_Date] = @Trade_Date,
		[Quantity] = @Quantity
	WHERE
		[Id] = @Id
END
ELSE
BEGIN
		      -- CS_IsIdentity there
    
	INSERT INTO [dbo].[TaxLot] (
		[AccountId],
		[SecurityId],
		[Trade_Date],
		[Quantity]
	) VALUES (
		@AccountId,
		@SecurityId,
		@Trade_Date,
		@Quantity
	)
END

IF IsNull(@Id, 0) = 0 
    SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_DeleteTaxLot]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteTaxLot]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteTaxLot]
	@Id int
AS

SET NOCOUNT ON


DELETE FROM [dbo].[TaxLot]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_DeleteTaxLotsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteTaxLotsDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteTaxLotsDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[TaxLot]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectTaxLot]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectTaxLot]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTaxLot]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AccountId],
	[SecurityId],
	[Trade_Date],
	[Quantity]
FROM
	[dbo].[TaxLot]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_SelectTaxLotsDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectTaxLotsDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTaxLotsDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[Id],
	[AccountId],
	[SecurityId],
	[Trade_Date],
	[Quantity]
FROM
	[dbo].[TaxLot]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectTaxLotsAll]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectTaxLotsAll]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTaxLotsAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AccountId],
	[SecurityId],
	[Trade_Date],
	[Quantity]
FROM
	[dbo].[TaxLot]

--endregion

GO

--region [dbo].[usp_SelectTaxLotsPaged]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectTaxLotsPaged]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTaxLotsPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[AccountId],
	[SecurityId],
	[Trade_Date],
	[Quantity]
FROM
	[dbo].[TaxLot]

--endregion

GO

-- Processing TranType
--region Drop Existing Procedures

IF OBJECT_ID(N'[dbo].[usp_InsertTranType]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertTranType]

IF OBJECT_ID(N'[dbo].[usp_UpdateTranType]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_UpdateTranType]

IF OBJECT_ID(N'[dbo].[usp_InsertUpdateTranType]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUpdateTranType]

IF OBJECT_ID(N'[dbo].[usp_DeleteTranType]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteTranType]

IF OBJECT_ID(N'[dbo].[usp_DeleteTranTypesDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteTranTypesDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectTranType]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectTranType]

IF OBJECT_ID(N'[dbo].[usp_SelectTranTypesDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectTranTypesDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectTranTypesAll]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectTranTypesAll]

IF OBJECT_ID(N'[dbo].[usp_SelectTranTypesPaged]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectTranTypesPaged]

--endregion

GO

--region [dbo].[usp_InsertTranType]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertTranType]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertTranType]
	@Mnemonic varchar(5),
	@Description nvarchar(30),
	@Id int OUTPUT
AS

SET NOCOUNT ON

INSERT INTO [dbo].[TranType] (
	[Mnemonic],
	[Description]
) VALUES (
	@Mnemonic,
	@Description
)

SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_UpdateTranType]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_UpdateTranType]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateTranType]
	@Id int,
	@Mnemonic varchar(5),
	@Description nvarchar(30)
AS

SET NOCOUNT ON

UPDATE [dbo].[TranType] SET
	[Mnemonic] = @Mnemonic,
	[Description] = @Description
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_InsertUpdateTranType]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUpdateTranType]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateTranType]
	@Mnemonic varchar(5),
	@Description nvarchar(30),
	@Id int OUTPUT
AS

SET NOCOUNT ON


IF EXISTS(SELECT [Id] FROM [dbo].[TranType] WHERE [Id] = @Id)
BEGIN
	UPDATE [dbo].[TranType] SET
		[Mnemonic] = @Mnemonic,
		[Description] = @Description
	WHERE
		[Id] = @Id
END
ELSE
BEGIN
		      -- CS_IsIdentity there
    
	INSERT INTO [dbo].[TranType] (
		[Mnemonic],
		[Description]
	) VALUES (
		@Mnemonic,
		@Description
	)
END

IF IsNull(@Id, 0) = 0 
    SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_DeleteTranType]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteTranType]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteTranType]
	@Id int
AS

SET NOCOUNT ON


DELETE FROM [dbo].[TranType]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_DeleteTranTypesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteTranTypesDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteTranTypesDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[TranType]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectTranType]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectTranType]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTranType]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Mnemonic],
	[Description]
FROM
	[dbo].[TranType]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_SelectTranTypesDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectTranTypesDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTranTypesDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[Id],
	[Mnemonic],
	[Description]
FROM
	[dbo].[TranType]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectTranTypesAll]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectTranTypesAll]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTranTypesAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Mnemonic],
	[Description]
FROM
	[dbo].[TranType]

--endregion

GO

--region [dbo].[usp_SelectTranTypesPaged]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectTranTypesPaged]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectTranTypesPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Mnemonic],
	[Description]
FROM
	[dbo].[TranType]

--endregion

GO

-- Processing UserInfo
--region Drop Existing Procedures

IF OBJECT_ID(N'[dbo].[usp_InsertUserInfo]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUserInfo]

IF OBJECT_ID(N'[dbo].[usp_UpdateUserInfo]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_UpdateUserInfo]

IF OBJECT_ID(N'[dbo].[usp_InsertUpdateUserInfo]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUpdateUserInfo]

IF OBJECT_ID(N'[dbo].[usp_DeleteUserInfo]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteUserInfo]

IF OBJECT_ID(N'[dbo].[usp_DeleteUserInfosDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteUserInfosDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectUserInfo]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectUserInfo]

IF OBJECT_ID(N'[dbo].[usp_SelectUserInfosDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectUserInfosDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectUserInfosAll]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectUserInfosAll]

IF OBJECT_ID(N'[dbo].[usp_SelectUserInfosPaged]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectUserInfosPaged]

--endregion

GO

--region [dbo].[usp_InsertUserInfo]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUserInfo]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUserInfo]
	@Description nvarchar(30),
	@Password nvarchar(30),
	@PassPhrase nvarchar(80),
	@eMail nvarchar(40),
	@LastUsed datetime2,
	@Active bit,
	@PasswordHash varbinary(max),
	@PasswordSalt varbinary(max),
	@Id int OUTPUT
AS

SET NOCOUNT ON

INSERT INTO [dbo].[UserInfo] (
	[Description],
	[Password],
	[PassPhrase],
	[eMail],
	[LastUsed],
	[Active],
	[PasswordHash],
	[PasswordSalt]
) VALUES (
	@Description,
	@Password,
	@PassPhrase,
	@eMail,
	@LastUsed,
	@Active,
	@PasswordHash,
	@PasswordSalt
)

SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_UpdateUserInfo]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_UpdateUserInfo]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateUserInfo]
	@Id int,
	@Description nvarchar(30),
	@Password nvarchar(30),
	@PassPhrase nvarchar(80),
	@eMail nvarchar(40),
	@LastUsed datetime2,
	@Active bit,
	@PasswordHash varbinary(max),
	@PasswordSalt varbinary(max)
AS

SET NOCOUNT ON

UPDATE [dbo].[UserInfo] SET
	[Description] = @Description,
	[Password] = @Password,
	[PassPhrase] = @PassPhrase,
	[eMail] = @eMail,
	[LastUsed] = @LastUsed,
	[Active] = @Active,
	[PasswordHash] = @PasswordHash,
	[PasswordSalt] = @PasswordSalt
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_InsertUpdateUserInfo]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUpdateUserInfo]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateUserInfo]
	@Description nvarchar(30),
	@Password nvarchar(30),
	@PassPhrase nvarchar(80),
	@eMail nvarchar(40),
	@LastUsed datetime2,
	@Active bit,
	@PasswordHash varbinary(max),
	@PasswordSalt varbinary(max),
	@Id int OUTPUT
AS

SET NOCOUNT ON


IF EXISTS(SELECT [Id] FROM [dbo].[UserInfo] WHERE [Id] = @Id)
BEGIN
	UPDATE [dbo].[UserInfo] SET
		[Description] = @Description,
		[Password] = @Password,
		[PassPhrase] = @PassPhrase,
		[eMail] = @eMail,
		[LastUsed] = @LastUsed,
		[Active] = @Active,
		[PasswordHash] = @PasswordHash,
		[PasswordSalt] = @PasswordSalt
	WHERE
		[Id] = @Id
END
ELSE
BEGIN
		      -- CS_IsIdentity there
    
	INSERT INTO [dbo].[UserInfo] (
		[Description],
		[Password],
		[PassPhrase],
		[eMail],
		[LastUsed],
		[Active],
		[PasswordHash],
		[PasswordSalt]
	) VALUES (
		@Description,
		@Password,
		@PassPhrase,
		@eMail,
		@LastUsed,
		@Active,
		@PasswordHash,
		@PasswordSalt
	)
END

IF IsNull(@Id, 0) = 0 
    SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_DeleteUserInfo]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteUserInfo]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteUserInfo]
	@Id int
AS

SET NOCOUNT ON


DELETE FROM [dbo].[UserInfo]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_DeleteUserInfosDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteUserInfosDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteUserInfosDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[UserInfo]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectUserInfo]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectUserInfo]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectUserInfo]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Description],
	[Password],
	[PassPhrase],
	[eMail],
	[LastUsed],
	[Active],
	[PasswordHash],
	[PasswordSalt]
FROM
	[dbo].[UserInfo]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_SelectUserInfosDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectUserInfosDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectUserInfosDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[Id],
	[Description],
	[Password],
	[PassPhrase],
	[eMail],
	[LastUsed],
	[Active],
	[PasswordHash],
	[PasswordSalt]
FROM
	[dbo].[UserInfo]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectUserInfosAll]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectUserInfosAll]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectUserInfosAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Description],
	[Password],
	[PassPhrase],
	[eMail],
	[LastUsed],
	[Active],
	[PasswordHash],
	[PasswordSalt]
FROM
	[dbo].[UserInfo]

--endregion

GO

--region [dbo].[usp_SelectUserInfosPaged]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectUserInfosPaged]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectUserInfosPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Description],
	[Password],
	[PassPhrase],
	[eMail],
	[LastUsed],
	[Active],
	[PasswordHash],
	[PasswordSalt]
FROM
	[dbo].[UserInfo]

--endregion

GO

-- Processing UserPortfolio
--region Drop Existing Procedures

IF OBJECT_ID(N'[dbo].[usp_InsertUserPortfolio]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUserPortfolio]

IF OBJECT_ID(N'[dbo].[usp_UpdateUserPortfolio]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_UpdateUserPortfolio]

IF OBJECT_ID(N'[dbo].[usp_InsertUpdateUserPortfolio]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_InsertUpdateUserPortfolio]

IF OBJECT_ID(N'[dbo].[usp_DeleteUserPortfolio]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteUserPortfolio]

IF OBJECT_ID(N'[dbo].[usp_DeleteUserPortfoliosDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_DeleteUserPortfoliosDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectUserPortfolio]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectUserPortfolio]

IF OBJECT_ID(N'[dbo].[usp_SelectUserPortfoliosDynamic]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectUserPortfoliosDynamic]

IF OBJECT_ID(N'[dbo].[usp_SelectUserPortfoliosAll]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectUserPortfoliosAll]

IF OBJECT_ID(N'[dbo].[usp_SelectUserPortfoliosPaged]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_SelectUserPortfoliosPaged]

--endregion

GO

--region [dbo].[usp_InsertUserPortfolio]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUserPortfolio]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUserPortfolio]
	@UserInfoId int,
	@PortfolioId int,
	@Owner bit,
	@View bit,
	@Modify bit,
	@Id int OUTPUT
AS

SET NOCOUNT ON

INSERT INTO [dbo].[UserPortfolio] (
	[UserInfoId],
	[PortfolioId],
	[Owner],
	[View],
	[Modify]
) VALUES (
	@UserInfoId,
	@PortfolioId,
	@Owner,
	@View,
	@Modify
)

SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_UpdateUserPortfolio]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_UpdateUserPortfolio]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_UpdateUserPortfolio]
	@Id int,
	@UserInfoId int,
	@PortfolioId int,
	@Owner bit,
	@View bit,
	@Modify bit
AS

SET NOCOUNT ON

UPDATE [dbo].[UserPortfolio] SET
	[UserInfoId] = @UserInfoId,
	[PortfolioId] = @PortfolioId,
	[Owner] = @Owner,
	[View] = @View,
	[Modify] = @Modify
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_InsertUpdateUserPortfolio]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_InsertUpdateUserPortfolio]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_InsertUpdateUserPortfolio]
	@UserInfoId int,
	@PortfolioId int,
	@Owner bit,
	@View bit,
	@Modify bit,
	@Id int OUTPUT
AS

SET NOCOUNT ON


IF EXISTS(SELECT [Id] FROM [dbo].[UserPortfolio] WHERE [Id] = @Id)
BEGIN
	UPDATE [dbo].[UserPortfolio] SET
		[UserInfoId] = @UserInfoId,
		[PortfolioId] = @PortfolioId,
		[Owner] = @Owner,
		[View] = @View,
		[Modify] = @Modify
	WHERE
		[Id] = @Id
END
ELSE
BEGIN
		      -- CS_IsIdentity there
    
	INSERT INTO [dbo].[UserPortfolio] (
		[UserInfoId],
		[PortfolioId],
		[Owner],
		[View],
		[Modify]
	) VALUES (
		@UserInfoId,
		@PortfolioId,
		@Owner,
		@View,
		@Modify
	)
END

IF IsNull(@Id, 0) = 0 
    SET @Id = SCOPE_IDENTITY()

--endregion

GO

--region [dbo].[usp_DeleteUserPortfolio]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteUserPortfolio]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteUserPortfolio]
	@Id int
AS

SET NOCOUNT ON


DELETE FROM [dbo].[UserPortfolio]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_DeleteUserPortfoliosDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_DeleteUserPortfoliosDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_DeleteUserPortfoliosDynamic]
	@WhereCondition nvarchar(500)
AS

SET NOCOUNT ON

DECLARE @SQL nvarchar(3250)

SET @SQL = '
DELETE FROM
	[dbo].[UserPortfolio]
WHERE
	' + @WhereCondition

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectUserPortfolio]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectUserPortfolio]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectUserPortfolio]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[UserInfoId],
	[PortfolioId],
	[Owner],
	[View],
	[Modify]
FROM
	[dbo].[UserPortfolio]
WHERE
	[Id] = @Id

--endregion

GO

--region [dbo].[usp_SelectUserPortfoliosDynamic]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectUserPortfoliosDynamic]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectUserPortfoliosDynamic]
	@WhereCondition nvarchar(500),
	@OrderByExpression nvarchar(250) = NULL
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

DECLARE @SQL nvarchar(3250)

SET @SQL = '
SELECT
	[Id],
	[UserInfoId],
	[PortfolioId],
	[Owner],
	[View],
	[Modify]
FROM
	[dbo].[UserPortfolio]
WHERE
	' + @WhereCondition

IF @OrderByExpression IS NOT NULL AND LEN(@OrderByExpression) > 0
BEGIN
	SET @SQL = @SQL + '
ORDER BY
	' + @OrderByExpression
END

EXEC sp_executesql @SQL

--endregion

GO

--region [dbo].[usp_SelectUserPortfoliosAll]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectUserPortfoliosAll]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectUserPortfoliosAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[UserInfoId],
	[PortfolioId],
	[Owner],
	[View],
	[Modify]
FROM
	[dbo].[UserPortfolio]

--endregion

GO

--region [dbo].[usp_SelectUserPortfoliosPaged]

------------------------------------------------------------------------------------------------------------------------
-- Procedure Name: [dbo].[usp_SelectUserPortfoliosPaged]
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[usp_SelectUserPortfoliosPaged]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[UserInfoId],
	[PortfolioId],
	[Owner],
	[View],
	[Modify]
FROM
	[dbo].[UserPortfolio]

--endregion

GO

