USE [ndemo];
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--
-- Table structure for table `Heal_Profile`
--
IF (EXISTS (SELECT * 
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_CATALOG='ndemo' AND TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Heal_Profile'))
BEGIN
	DROP TABLE [dbo].[Heal_Profile]
END
GO

BEGIN
  CREATE TABLE [dbo].[Heal_Profile](
		[ProfileId]    	[INT] IDENTITY(1,1) NOT NULL,
		[ProfileKey]   	[NVARCHAR](50) NOT NULL,
		[FullName]  	[NVARCHAR](200) NOT NULL,
		[Email]  		[NVARCHAR](50) DEFAULT NULL,
		[CountryCode]	[NVARCHAR](3) NOT NULL,
		[PhoneNumber]  	[NVARCHAR](10) NOT NULL,
		[Sex]       	[INT] DEFAULT 0, -- Female = 0 || Male = 1
		[Age]       	[INT] DEFAULT 0,
		[Height]       	[INT] DEFAULT 0, -- cm
		[Weight]       	[INT] DEFAULT 0, -- kg
		[Married]      	[INT] DEFAULT 0, -- Single = 0 || Married = 1
		
		[Created]       [DATETIME] DEFAULT CURRENT_TIMESTAMP,
		[Updated]       [DATETIME] DEFAULT CURRENT_TIMESTAMP,
		[Author]        [NVARCHAR](50) DEFAULT NULL,
		[Editor]        [NVARCHAR](50) DEFAULT NULL,
		[Deleted]       [INT] DEFAULT 0
	CONSTRAINT [PK_ProfileId] PRIMARY KEY CLUSTERED
	(
		[ProfileId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO	

-- Sample data
INSERT INTO [dbo].[Heal_Profile] (ProfileKey, FullName, Email, CountryCode, PhoneNumber, Sex, Age, Height, Weight, Married, Author, Editor)
VALUES (NEWID(), 'Peter Hansom', 'peter@gmail.com', '084', '0903992606', 1, 25, 167, 82, 0, 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Heal_Profile] (ProfileKey, FullName, Email, CountryCode, PhoneNumber, Sex, Age, Height, Weight, Married, Author, Editor)
VALUES (NEWID(), 'Marcus Bloomberg', 'bloomberg@gmail.com', '084', '0908511622', 1, 71, 158, 72, 1, 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Heal_Profile] (ProfileKey, FullName, Email, CountryCode, PhoneNumber, Sex, Age, Height, Weight, Married, Author, Editor)
VALUES (NEWID(), 'Katerine Queen', 'katerine@gmail.com', '084', '0902887755', 0, 28, 176, 55, 0, 'SYSTEM', 'SYSTEM')

