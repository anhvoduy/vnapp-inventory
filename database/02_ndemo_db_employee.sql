USE [ndemo];
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--
-- Table structure for table `Director`
--
IF (EXISTS (SELECT * 
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_CATALOG='ndemo' AND TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Director'))
BEGIN
	DROP TABLE [dbo].[Director]
END
GO

BEGIN
  CREATE TABLE [dbo].[Director](
		[DirectorId]    [INT] IDENTITY(1,1) NOT NULL,
		[DirectorKey]   [NVARCHAR](50) NOT NULL,
		[DirectorName]  [NVARCHAR](50) NOT NULL,
		[Description]   [NVARCHAR](250) DEFAULT NULL,
		[ManagerId]     [INT] DEFAULT 0, -- this is EmployeeId
		[Created]       [DATETIME] DEFAULT CURRENT_TIMESTAMP,
		[Updated]       [DATETIME] DEFAULT CURRENT_TIMESTAMP,
		[Author]        [NVARCHAR](50) DEFAULT NULL,
		[Editor]        [NVARCHAR](50) DEFAULT NULL,
		[Deleted]       [INT] DEFAULT 0
	CONSTRAINT [PK_Director] PRIMARY KEY CLUSTERED
	(
		[DirectorId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO	

-- Sample data
INSERT INTO [dbo].[Director] (DirectorKey, DirectorName, Description, ManagerId, Author, Editor)
VALUES (NEWID(), 'Director Department', 'Director Department in Viet Nam', '7', 'SYSTEM', 'SYSTEM')


--
-- Table structure for table `Department`
--
IF (EXISTS (SELECT * 
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_CATALOG='ndemo' AND TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Department'))
BEGIN
	DROP TABLE [dbo].[Department]
END
GO

BEGIN
  CREATE TABLE [dbo].[Department](
		[DepartmentId]    [INT] IDENTITY(1,1) NOT NULL,
		[DepartmentKey]   [NVARCHAR](50) NOT NULL,
		[DepartmentName]  [NVARCHAR](50) NOT NULL,
		[Description]     [NVARCHAR](250) DEFAULT NULL,
        [DirectorId]      [INT] DEFAULT 0,
		[ManagerId]       [INT] DEFAULT 0, -- this is EmployeeId
		[Created]         [DATETIME] DEFAULT CURRENT_TIMESTAMP,
		[Updated]         [DATETIME] DEFAULT CURRENT_TIMESTAMP,
		[Author]          [NVARCHAR](50) DEFAULT NULL,
		[Editor]          [NVARCHAR](50) DEFAULT NULL,
		[Deleted]         [INT] DEFAULT 0
	CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED
	(
		[DepartmentId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO	

-- Sample data
INSERT INTO [dbo].[Department] (DepartmentKey, DepartmentName, Description, DirectorId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Department 001', 'Department 001', '1', '1', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Department] (DepartmentKey, DepartmentName, Description, DirectorId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Department 002', 'Department 002', '1', '1001', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Department] (DepartmentKey, DepartmentName, Description, DirectorId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Department 003', 'Department 003', '1', '2001', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Department] (DepartmentKey, DepartmentName, Description, DirectorId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Department 004', 'Department 004', '1', '3001', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Department] (DepartmentKey, DepartmentName, Description, DirectorId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Department 005', 'Department 005 has No Employee', '0', '0', 'SYSTEM', 'SYSTEM')


--
-- Table structure for table `Team`
--
IF (EXISTS (SELECT * 
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_CATALOG='ndemo' AND TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Team'))
BEGIN
	DROP TABLE [dbo].[Team]
END
GO

BEGIN
  CREATE TABLE [dbo].[Team](
		[TeamId]          [INT] IDENTITY(1,1) NOT NULL,
		[TeamKey]         [NVARCHAR](50) NOT NULL,
		[TeamName]        [NVARCHAR](50) NOT NULL,
		[Description]     [NVARCHAR](250) DEFAULT NULL,
        [DepartmentId]    [INT] DEFAULT 0,
		[ManagerId]       [INT] DEFAULT 0, -- this is EmployeeId
		[Created]         [DATETIME] DEFAULT CURRENT_TIMESTAMP,
		[Updated]         [DATETIME] DEFAULT CURRENT_TIMESTAMP,
		[Author]          [NVARCHAR](50) DEFAULT NULL,
		[Editor]          [NVARCHAR](50) DEFAULT NULL,
		[Deleted]         [INT] DEFAULT 0
	CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED
	(
		[TeamId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

-- Department 01
INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 000', 'Team 000', '1', '001', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 001', 'Team 001', '1', '101', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 002', 'Team 002', '1', '201', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 003', 'Team 003', '1', '301', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 004', 'Team 004', '1', '401', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 005', 'Team 005', '1', '501', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 006', 'Team 006', '1', '601', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 007', 'Team 007', '1', '701', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 008', 'Team 008', '1', '801', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 009', 'Team 009', '1', '901', 'SYSTEM', 'SYSTEM')

-- Department 02
INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 010', 'Team 010', '2', '1001', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 011', 'Team 011', '2', '1101', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 012', 'Team 012', '2', '1201', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 013', 'Team 013', '2', '1301', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 014', 'Team 014', '2', '1401', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 015', 'Team 015', '2', '1501', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 016', 'Team 016', '2', '1601', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 017', 'Team 017', '2', '1701', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 018', 'Team 018', '2', '1801', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 019', 'Team 019', '2', '1901', 'SYSTEM', 'SYSTEM')

-- Department 03
INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 020', 'Team 020', '3', '2001', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 021', 'Team 021', '3', '2101', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 022', 'Team 022', '3', '2201', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 023', 'Team 023', '3', '2301', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 024', 'Team 024', '3', '2401', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 025', 'Team 025', '3', '2501', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 026', 'Team 026', '3', '2601', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 027', 'Team 027', '3', '2701', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 028', 'Team 028', '3', '2801', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 029', 'Team 029', '3', '2901', 'SYSTEM', 'SYSTEM')

-- Department 04
INSERT INTO [dbo].[Team] (TeamKey, TeamName, Description, DepartmentId, ManagerId, Author, Editor)
VALUES (NEWID(), 'Team 030', 'Team 030', '4', '3001', 'SYSTEM', 'SYSTEM')


--
-- Table structure for table `Employee`
--
IF (EXISTS (SELECT * 
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_CATALOG='ndemo' AND TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Employee'))
BEGIN
	DROP TABLE [dbo].[Employee]
END
GO

BEGIN
  CREATE TABLE [dbo].[Employee](
		[EmployeeId]      [INT] IDENTITY(1,1) NOT NULL,
		[EmployeeKey]     [NVARCHAR](50) NOT NULL,
		[EmployeeCode]    [NVARCHAR](50) NOT NULL,
        [EmployeeName]    [NVARCHAR](50) NOT NULL,
		[TeamIds]    	  [NVARCHAR](250) DEFAULT NULL,
		[Created]         [DATETIME] DEFAULT CURRENT_TIMESTAMP,
		[Updated]         [DATETIME] DEFAULT CURRENT_TIMESTAMP,
		[Author]          [NVARCHAR](50) DEFAULT NULL,
		[Editor]          [NVARCHAR](50) DEFAULT NULL,
		[Deleted]         [INT] DEFAULT 0
	CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED
	(
		[EmployeeId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO	

-- Sample data
INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000001', 'Employee No.001', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000002', 'Employee No.002', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000003', 'Employee No.003', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000004', 'Employee No.004', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000005', 'Employee No.005', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000006', 'Employee No.006', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000007', 'Employee No.007', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000008', 'Employee No.008', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000009', 'Employee No.009', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000010', 'Employee No.010', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000011', 'Employee No.011', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000012', 'Employee No.012', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000013', 'Employee No.013', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000014', 'Employee No.014', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000015', 'Employee No.015', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000016', 'Employee No.016', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000017', 'Employee No.017', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000018', 'Employee No.018', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000019', 'Employee No.019', 'SYSTEM', 'SYSTEM')

INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
VALUES (NEWID(), 'EMP_000020', 'Employee No.020', 'SYSTEM', 'SYSTEM')


-- FOR ... LOOPS ... 3000 employee(s)
DECLARE @cnt INT = 0;
DECLARE @emp_id NVARCHAR(20);
DECLARE @emp_code NVARCHAR(20);

WHILE @cnt < 3000
BEGIN
	PRINT 'Inside FOR ... LOOP: Employee on ndemo db...';

	-- insert employee
	INSERT INTO [dbo].[Employee] (EmployeeKey, EmployeeCode, EmployeeName, Author, Editor)
	VALUES (NEWID(), 'EmployeeCode', 'EmployeeName', 'SYSTEM', 'SYSTEM')

	-- update employee
	SET @emp_id = (SELECT MAX(EmployeeId) FROM [dbo].[Employee])
	SET @emp_code = 'EMP_' + @emp_id
	
	UPDATE [dbo].[Employee]
	SET EmployeeCode = @emp_code,
		EmployeeName = N'Employee No.' + @emp_id
	WHERE EmployeeId = @emp_id

	-- next
	SET @cnt = @cnt + 1;
	PRINT @cnt
END;

PRINT 'Done FOR ... LOOP: Employee on ndemo db';
GO


-- assign employee to Teams
UPDATE [dbo].[Employee] SET TeamIds = N'[1]' WHERE EmployeeId >= 0 AND EmployeeId < 100
UPDATE [dbo].[Employee] SET TeamIds = N'[1]' WHERE EmployeeId >= 100 AND EmployeeId < 200
UPDATE [dbo].[Employee] SET TeamIds = N'[2]' WHERE EmployeeId >= 200 AND EmployeeId < 300
UPDATE [dbo].[Employee] SET TeamIds = N'[3]' WHERE EmployeeId >= 300 AND EmployeeId < 400
UPDATE [dbo].[Employee] SET TeamIds = N'[4]' WHERE EmployeeId >= 400 AND EmployeeId < 500
UPDATE [dbo].[Employee] SET TeamIds = N'[5]' WHERE EmployeeId >= 500 AND EmployeeId < 600
UPDATE [dbo].[Employee] SET TeamIds = N'[6]' WHERE EmployeeId >= 600 AND EmployeeId < 700
UPDATE [dbo].[Employee] SET TeamIds = N'[7]' WHERE EmployeeId >= 700 AND EmployeeId < 800
UPDATE [dbo].[Employee] SET TeamIds = N'[8]' WHERE EmployeeId >= 800 AND EmployeeId < 900
UPDATE [dbo].[Employee] SET TeamIds = N'[9]' WHERE EmployeeId >= 900 AND EmployeeId < 1000

UPDATE [dbo].[Employee] SET TeamIds = N'[10]' WHERE EmployeeId >= 1000 AND EmployeeId < 1100
UPDATE [dbo].[Employee] SET TeamIds = N'[11]' WHERE EmployeeId >= 1100 AND EmployeeId < 1200
UPDATE [dbo].[Employee] SET TeamIds = N'[12]' WHERE EmployeeId >= 1200 AND EmployeeId < 1300
UPDATE [dbo].[Employee] SET TeamIds = N'[13]' WHERE EmployeeId >= 1300 AND EmployeeId < 1400
UPDATE [dbo].[Employee] SET TeamIds = N'[14]' WHERE EmployeeId >= 1400 AND EmployeeId < 1500
UPDATE [dbo].[Employee] SET TeamIds = N'[15]' WHERE EmployeeId >= 1500 AND EmployeeId < 1600
UPDATE [dbo].[Employee] SET TeamIds = N'[16]' WHERE EmployeeId >= 1600 AND EmployeeId < 1700
UPDATE [dbo].[Employee] SET TeamIds = N'[17]' WHERE EmployeeId >= 1700 AND EmployeeId < 1800
UPDATE [dbo].[Employee] SET TeamIds = N'[18]' WHERE EmployeeId >= 1800 AND EmployeeId < 1900
UPDATE [dbo].[Employee] SET TeamIds = N'[19]' WHERE EmployeeId >= 1900 AND EmployeeId < 2000

UPDATE [dbo].[Employee] SET TeamIds = N'[20]' WHERE EmployeeId >= 2000 AND EmployeeId < 2100
UPDATE [dbo].[Employee] SET TeamIds = N'[21]' WHERE EmployeeId >= 2100 AND EmployeeId < 2200
UPDATE [dbo].[Employee] SET TeamIds = N'[22]' WHERE EmployeeId >= 2200 AND EmployeeId < 2300
UPDATE [dbo].[Employee] SET TeamIds = N'[23]' WHERE EmployeeId >= 2300 AND EmployeeId < 2400
UPDATE [dbo].[Employee] SET TeamIds = N'[24]' WHERE EmployeeId >= 2400 AND EmployeeId < 2500
UPDATE [dbo].[Employee] SET TeamIds = N'[25]' WHERE EmployeeId >= 2500 AND EmployeeId < 2600
UPDATE [dbo].[Employee] SET TeamIds = N'[26]' WHERE EmployeeId >= 2600 AND EmployeeId < 2700
UPDATE [dbo].[Employee] SET TeamIds = N'[27]' WHERE EmployeeId >= 2700 AND EmployeeId < 2800
UPDATE [dbo].[Employee] SET TeamIds = N'[28]' WHERE EmployeeId >= 2800 AND EmployeeId < 2900
UPDATE [dbo].[Employee] SET TeamIds = N'[29]' WHERE EmployeeId >= 2900 AND EmployeeId < 3000

UPDATE [dbo].[Employee] SET TeamIds = N'[30]' WHERE EmployeeId >= 3000 AND EmployeeId < 3100
