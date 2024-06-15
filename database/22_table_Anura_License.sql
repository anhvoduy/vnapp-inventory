USE [ndemo];
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--
-- Table [dbo].[Anura_License]
--
IF (EXISTS (SELECT * 
			FROM INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_CATALOG='ndemo' AND TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Anura_License'))
BEGIN
	DROP TABLE [dbo].[Anura_License]
END
GO

BEGIN
	CREATE TABLE [dbo].[Anura_License](
		[License_Id] bigint 		IDENTITY(1,1) NOT NULL,
		[Application_Id] 		NVARCHAR(50) NOT NULL,
		[Sample_Rest_Url] 		NVARCHAR(100) NOT NULL,
		[Sample_Ws_Url] 		NVARCHAR(100) NOT NULL,
		[Partner_Id]			NVARCHAR(20) NOT NULL,
		[License_Key]			NVARCHAR(20) NOT NULL,
		[Study_Id]			NVARCHAR(20) NOT NULL,
		[Org_Key]			NVARCHAR(20) NOT NULL,
		[Visage_Key]			NVARCHAR(20) NOT NULL,		
		
		[Author] nvarchar(50) 		DEFAULT NULL,
		[Created] [datetime] 		DEFAULT CURRENT_TIMESTAMP,
		[Editor] nvarchar(50) 		DEFAULT NULL,
		[Updated] [datetime] 		DEFAULT CURRENT_TIMESTAMP,
		[Deleted] int DEFAULT 0
	CONSTRAINT [PK_License_Id] PRIMARY KEY CLUSTERED 
	(
		[License_Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

INSERT INTO [dbo].[Anura_License] (Application_Id, Sample_Rest_Url, Sample_Ws_Url, Partner_Id, License_Key, Study_Id, Org_Key, Visage_Key, 
	Created, Author, Updated, Editor)
VALUES ('com.appdoctor', 'https://api.deepaffex.ai:9443', 'wss://api.deepaffex.ai:9080', 'DuyTo', '0b13482a-40f9-4dc6-8da1-b537d25669fa', '3688f6ba-e7c1-4f37-8390-d420c4ff94d2', 'hsbc-life', '278-175-372-076-123-856-145-801-949-100-775',
	GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');
