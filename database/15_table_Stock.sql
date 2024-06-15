USE [ndemo];
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- cp VN30
-- https://www.hsx.vn/Modules/Listed/Web/StockIndexView/1964531007

--
-- Table [dbo].[Stock]
--
IF (EXISTS (SELECT * 
			FROM INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_CATALOG='ndemo' AND TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Stock'))
BEGIN
	DROP TABLE [dbo].[Stock]
END
GO

IF (EXISTS (SELECT * 
			FROM INFORMATION_SCHEMA.TABLES 
			WHERE TABLE_CATALOG='ndemo' AND TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'StockDetail'))
BEGIN
	DROP TABLE [dbo].[StockDetail]
END
GO

BEGIN
	CREATE TABLE [dbo].[Stock](
		[StockId] 		INT IDENTITY(1,1) NOT NULL,
		[StockNo] 		NVARCHAR(20) NOT NULL,
		[StockName] 	NVARCHAR(250) NULL,
		[StockDesc] 	NVARCHAR(250) NULL,
		[Link] 			NVARCHAR(250) DEFAULT NULL,
		[Active] 		INT DEFAULT 1,
		[Shares_Outstanding] DECIMAL(18,4) DEFAULT 0, 	-- Khối lượng cổ phiếu đang lưu hành
		[Shares_Listed] 	 DECIMAL(18,4) DEFAULT 0, 	-- Khối lượng cổ phiếu đang niêm yết
		[Authorized_Capital] DECIMAL(18,4) DEFAULT 0, 	-- Vốn điều lệ

		[Author] 		NVARCHAR(50) DEFAULT NULL,
		[Created] 		[datetime] DEFAULT CURRENT_TIMESTAMP,
		[Editor] 		NVARCHAR(50) DEFAULT NULL,
		[Updated] 		[datetime] DEFAULT CURRENT_TIMESTAMP
	CONSTRAINT [PK_StockId] PRIMARY KEY CLUSTERED 
	(
		[StockId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

-- add stock
INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('ACB', N'Ngân hàng Thương mại Cổ phần Á Châu', '', 'https://finance.vietstock.vn/ACB-ngan-hang-tmcp-a-chau.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('BID', N'Ngân hàng Thương mại Cổ phần Đầu tư và Phát triển Việt Nam', '', 'https://finance.vietstock.vn/BID-ngan-hang-tmcp-dau-tu-va-phat-trien-viet-nam.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('BVH', N'Tập đoàn Bảo Việt', '', 'https://finance.vietstock.vn/BVH-tap-doan-bao-viet.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('CTG', N'Ngân hàng Thương mại Cổ phần Công Thương Việt Nam', '', 'https://finance.vietstock.vn/CTG-ngan-hang-tmcp-cong-thuong-viet-nam.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('FPT', N'Công ty Cổ phần FPT', '', 'https://finance.vietstock.vn/FPT-ctcp-fpt.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('GAS', N'Tổng Công ty Khí Việt Nam - Công ty Cổ phần', '', 'https://finance.vietstock.vn/GAS-tong-cong-ty-khi-viet-nam-ctcp.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('GVR', N'Tập đoàn Công nghiệp Cao su Việt Nam - Công ty Cổ phần', '', 'https://finance.vietstock.vn/GVR-tap-doan-cong-nghiep-cao-su-viet-nam-ctcp.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('HDB', N'Ngân hàng TMCP Phát triển Thành phố Hồ Chí Minh', '', 'https://finance.vietstock.vn/HDB-ngan-hang-tmcp-phat-trien-tphcm.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('HPG', N'Công ty Cổ phần Tập đoàn Hòa Phát', '', 'https://finance.vietstock.vn/HPG-ctcp-tap-doan-hoa-phat.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('KDH', N'Công ty Cổ phần Đầu tư và Kinh doanh Nhà Khang Điền', '', 'https://finance.vietstock.vn/KDH-ctcp-dau-tu-va-kinh-doanh-nha-khang-dien.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('MBB', N'Ngân hàng Thương mại Cổ phần Quân Đội', '', 'https://finance.vietstock.vn/MBB-ngan-hang-tmcp-quan-doi.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('MSN', N'Công ty Cổ phần Tập đoàn MaSan', '', 'https://finance.vietstock.vn/MSN-ctcp-tap-doan-masan.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('MWG', N'Công ty Cổ phần Đầu tư Thế Giới Di Động', '', 'https://finance.vietstock.vn/MWG-ctcp-dau-tu-the-gioi-di-dong.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('NVL', N'Công ty Cổ phần Tập đoàn Đầu tư Địa ốc No Va', '', 'https://finance.vietstock.vn/NVL-ctcp-tap-doan-dau-tu-dia-oc-no-va.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('PDR', N'Công ty Cổ phần Phát triển Bất động sản Phát Đạt', '', 'https://finance.vietstock.vn/PDR-ctcp-phat-trien-bat-dong-san-phat-dat.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('PLX', N'Tập đoàn Xăng dầu Việt Nam', '', 'https://finance.vietstock.vn/PLX-tap-doan-xang-dau-viet-nam.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('PNJ', N'Công ty Cổ phần Vàng bạc Đá quý Phú Nhuận', '', 'https://finance.vietstock.vn/PNJ-ctcp-vang-bac-da-quy-phu-nhuan.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('POW', N'Tổng Công ty Điện lực Dầu khí Việt Nam - CTCP', '', 'https://finance.vietstock.vn/POW-tong-cong-ty-dien-luc-dau-khi-viet-nam-ctcp.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('SAB', N'Tổng Công ty Cổ phần Bia – Rượu – Nước giải khát Sài Gòn', '', 'https://finance.vietstock.vn/SAB-tong-cong-ty-co-phan-bia-ruou-nuoc-giai-khat-sai-gon.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('SSI', N'Công ty Cổ phần Chứng khoán SSI', '', 'https://finance.vietstock.vn/SSI-ctcp-chung-khoan-ssi.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('STB', N'Ngân hàng Thương mại Cổ phần Sài Gòn Thương Tín', '', 'https://finance.vietstock.vn/STB-ngan-hang-tmcp-sai-gon-thuong-tin.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('TCB', N'Ngân hàng TMCP Kỹ Thương Việt Nam', '', 'https://finance.vietstock.vn/TCB-ngan-hang-tmcp-ky-thuong-viet-nam.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('TPB', N'Ngân hàng Thương mại Cổ phần Tiên Phong', '', 'https://finance.vietstock.vn/TPB-ngan-hang-tmcp-tien-phong.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('VCB', N'Ngân hàng TMCP Ngoại Thương Việt Nam', '', 'https://finance.vietstock.vn/VCB-ngan-hang-tmcp-ngoai-thuong-viet-nam.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('VHM', N'Công ty Cổ phần Vinhomes', '', 'https://finance.vietstock.vn/VHM-ctcp-vinhomes.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('VIC', N'Tập đoàn Vingroup - Công ty Cổ phần', '', 'https://finance.vietstock.vn/VIC-tap-doan-vingroup-ctcp.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('VJC', N'Công ty Cổ phần Hàng không VietJet', '', 'https://finance.vietstock.vn/VJC-ctcp-hang-khong-vietjet.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('VNM', N'Công ty Cổ phần Sữa Việt Nam', '', 'https://finance.vietstock.vn/VNM-ctcp-sua-viet-nam.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('VPB', N'Ngân hàng TMCP Việt Nam Thịnh Vượng', '', 'https://finance.vietstock.vn/VPB-ngan-hang-tmcp-viet-nam-thinh-vuong.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

INSERT INTO [dbo].[Stock] (StockNo, StockName, StockDesc, Link, Active,  Created, Author, Updated, Editor)
VALUES ('VRE', N'Công ty Cổ phần Vincom Retail', '', 'https://finance.vietstock.vn/VRE-ctcp-vincom-retail.htm', 1, GETDATE(), 'SYSTEM', GETDATE(), 'SYSTEM');

-- update capital
-- khối lượng: 	1.000 ck
-- giá trị: 	1.000.000.000 = 1 tỷ đồng
UPDATE [dbo].[Stock] 
SET Shares_Outstanding 	= 2701948,
	Shares_Listed 		= 2701948, 
	Authorized_Capital 	= 27019
WHERE StockNo = 'ACB'

UPDATE [dbo].[Stock] 
SET Shares_Outstanding 	= 5058524,
	Shares_Listed 		= 5058524, 
	Authorized_Capital 	= 50585
WHERE StockNo = 'BID'

UPDATE [dbo].[Stock] 
SET Shares_Outstanding 	= 742323,
	Shares_Listed 		= 742323, 
	Authorized_Capital 	= 7423
WHERE StockNo = 'BID'

UPDATE [dbo].[Stock] 
SET Shares_Outstanding 	= 907552,
	Shares_Listed 		= 907552, 
	Authorized_Capital 	= 9075
WHERE StockNo = 'FPT'

UPDATE [dbo].[Stock] 
SET Shares_Outstanding 	= 1913950,
	Shares_Listed 		= 1913950, 
	Authorized_Capital 	= 19139
WHERE StockNo = 'GAS'

UPDATE [dbo].[Stock] 
SET Shares_Outstanding 	= 4000000,
	Shares_Listed 		= 4000000, 
	Authorized_Capital 	= 40000
WHERE StockNo = 'GVR'

UPDATE [dbo].[Stock] 
SET Shares_Outstanding 	= 2012209,
	Shares_Listed 		= 2007291, 
	Authorized_Capital 	= 20072
WHERE StockNo = 'HDB'

UPDATE [dbo].[Stock] 
SET Shares_Outstanding 	= 4472923,
	Shares_Listed 		= 4472923, 
	Authorized_Capital 	= 44729
WHERE StockNo = 'HPG'

UPDATE [dbo].[Stock] 
SET Shares_Outstanding 	= 642937,
	Shares_Listed 		= 642937, 
	Authorized_Capital 	= 6429
WHERE StockNo = 'KDH'

UPDATE [dbo].[Stock] 
SET Shares_Outstanding 	= 3778322,
	Shares_Listed 		= 3778322,
	Authorized_Capital 	= 37783
WHERE StockNo = 'MBB'

UPDATE [dbo].[Stock] 
SET Shares_Outstanding 	= 1416642,
	Shares_Listed 		= 1180535,
	Authorized_Capital 	= 11805
WHERE StockNo = 'MSN'

UPDATE [dbo].[Stock] 
SET Shares_Outstanding 	= 732024,
	Shares_Listed 		= 732256,
	Authorized_Capital 	= 7322
WHERE StockNo = 'MWG'

UPDATE [dbo].[Stock] 
SET Shares_Outstanding 	= 1949726,
	Shares_Listed 		= 1930421, 
	Authorized_Capital 	= 19304
WHERE StockNo = 'NVL'

UPDATE [dbo].[Stock] 
SET Shares_Outstanding 	= 671646,
	Shares_Listed 		= 492772,
	Authorized_Capital 	= 4927
WHERE StockNo = 'PDR'

UPDATE [dbo].[Stock]
SET Shares_Outstanding 	= 1270592,
	Shares_Listed 		= 1293878,
	Authorized_Capital 	= 12938
WHERE StockNo = 'PLX'

UPDATE [dbo].[Stock]
SET Shares_Outstanding 	= 242367,
	Shares_Listed 		= 242612,
	Authorized_Capital 	= 2426
WHERE StockNo = 'PNJ'

UPDATE [dbo].[Stock]
SET Shares_Outstanding 	= 2341872,
	Shares_Listed 		= 2341872,
	Authorized_Capital 	= 23418
WHERE StockNo = 'POW'

UPDATE [dbo].[Stock]
SET Shares_Outstanding 	= 641281,
	Shares_Listed 		= 641281, 
	Authorized_Capital 	= 6412
WHERE StockNo = 'SAB'

UPDATE [dbo].[Stock]
SET Shares_Outstanding 	= 992764,
	Shares_Listed 		= 994750,
	Authorized_Capital 	= 9947
WHERE StockNo = 'SSI'

UPDATE [dbo].[Stock]
SET Shares_Outstanding 	= 1885216,
	Shares_Listed 		= 1885216,
	Authorized_Capital 	= 18852
WHERE StockNo = 'STB'

UPDATE [dbo].[Stock]
SET Shares_Outstanding 	= 3510915,
	Shares_Listed 		= 3510915,
	Authorized_Capital 	= 35109
WHERE StockNo = 'TCB'

UPDATE [dbo].[Stock]
SET Shares_Outstanding 	= 1581755,
	Shares_Listed 		= 1581755,
	Authorized_Capital 	= 15817
WHERE StockNo = 'TPB'

UPDATE [dbo].[Stock]
SET Shares_Outstanding 	= 4732517,
	Shares_Listed 		= 4732517,
	Authorized_Capital 	= 47325
WHERE StockNo = 'VCB'

UPDATE [dbo].[Stock]
SET Shares_Outstanding 	= 4354367,
	Shares_Listed 		= 4354367,
	Authorized_Capital 	= 43543
WHERE StockNo = 'VHM'

UPDATE [dbo].[Stock]
SET Shares_Outstanding 	= 3813936,
	Shares_Listed 		= 3813936,
	Authorized_Capital 	= 38139
WHERE StockNo = 'VIC'

UPDATE [dbo].[Stock]
SET Shares_Outstanding 	= 2089955,
	Shares_Listed 		= 2089955,
	Authorized_Capital 	= 20899
WHERE StockNo = 'VNM'

UPDATE [dbo].[Stock]
SET Shares_Outstanding 	= 4445473,
	Shares_Listed 		= 4505693,
	Authorized_Capital 	= 45056
WHERE StockNo = 'VPB'

UPDATE [dbo].[Stock]
SET Shares_Outstanding 	= 2272318,
	Shares_Listed 		= 2328818,
	Authorized_Capital 	= 23288
WHERE StockNo = 'VRE'
