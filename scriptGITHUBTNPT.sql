USE [master]
GO
/****** Object:  Database [TN_CSDLPT]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE DATABASE [TN_CSDLPT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TN_CSDLPT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TN_CSDLPT.mdf' , SIZE = 38912KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TN_CSDLPT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TN_CSDLPT_log.ldf' , SIZE = 52416KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TN_CSDLPT] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TN_CSDLPT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TN_CSDLPT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET ARITHABORT OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TN_CSDLPT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TN_CSDLPT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TN_CSDLPT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TN_CSDLPT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET RECOVERY FULL 
GO
ALTER DATABASE [TN_CSDLPT] SET  MULTI_USER 
GO
ALTER DATABASE [TN_CSDLPT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TN_CSDLPT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TN_CSDLPT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TN_CSDLPT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TN_CSDLPT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TN_CSDLPT', N'ON'
GO
USE [TN_CSDLPT]
GO
/****** Object:  User [TH234]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE USER [TH234] FOR LOGIN [hv1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [HTKN]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE USER [HTKN] FOR LOGIN [HTKN] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [MSmerge_PAL_role]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE ROLE [MSmerge_PAL_role]
GO
/****** Object:  DatabaseRole [MSmerge_EBC7BA160E1244948987EFB21F5C7BC8]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE ROLE [MSmerge_EBC7BA160E1244948987EFB21F5C7BC8]
GO
/****** Object:  DatabaseRole [MSmerge_B51F4BFBD34C458BB4789299796DAAF6]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE ROLE [MSmerge_B51F4BFBD34C458BB4789299796DAAF6]
GO
/****** Object:  DatabaseRole [MSmerge_5099059E0C4D4365A7F31036F711D142]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE ROLE [MSmerge_5099059E0C4D4365A7F31036F711D142]
GO
ALTER ROLE [db_owner] ADD MEMBER [TH234]
GO
ALTER ROLE [db_owner] ADD MEMBER [HTKN]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_EBC7BA160E1244948987EFB21F5C7BC8]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_B51F4BFBD34C458BB4789299796DAAF6]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_5099059E0C4D4365A7F31036F711D142]
GO
/****** Object:  Schema [MSmerge_PAL_role]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE SCHEMA [MSmerge_PAL_role]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_KTDaThi]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[FN_KTDaThi] (@MAMH NCHAR(8), @MALOP nchar(5), @LAN smallint)
RETURNS NCHAR(2)
AS
BEGIN
	DECLARE @CHECKED NCHAR(1)
	SET @CHECKED = ' '
	IF EXISTS(
	SELECT * 
	FROM dbo.BANGDIEM
	WHERE MAMH = @MAMH AND LAN = @LAN AND MASV IN(SELECT MASV FROM SINHVIEN WHERE MALOP = @MALOP))
	BEGIN
		SET @CHECKED = 'X'
		RETURN @CHECKED
	END
	RETURN @CHECKED
END


GO
/****** Object:  UserDefinedFunction [dbo].[FN_XuatDiemChu]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION  [dbo].[FN_XuatDiemChu]
	(@DIEM FLOAT)
	RETURNS NVARCHAR(10)
AS
BEGIN
	DECLARE @Result nvarchar(10), @StrThem nvarchar(10)
	SET @Result = ''
	SET @StrThem =''

	--TRƯỜNG HỢP ĐẶC BIỆT
	IF(@DIEM = 0.5) RETURN N'Nửa điểm'

	--ĐIỂM LÀM TRÒN TỚI NỬA ĐIỂM NÊN CHỈ DƯ 0.5 HOẶC KO DƯ
	--NẾU NHƯ CÓ PHẦN DƯ (VD statement: 3.5 - 3 = 0.5 > 0)
	IF (@DIEM - FLOOR(@DIEM) > 0) 
	BEGIN
		SET @StrThem = N' rưỡi'
		SET @DIEM = @DIEM - 0.5 --LÀM TRÒN ĐIỂM
	END
	
	IF (@DIEM = 0) SET @RESULT = N'Không' 
	ELSE IF (@DIEM = 1) SET @RESULT = N'Một' 
	ELSE IF (@DIEM = 2) SET @RESULT = N'Hai' 
	ELSE IF (@DIEM = 3) SET @RESULT = N'Ba' 
	ELSE IF (@DIEM = 4) SET @RESULT = N'Bốn' 
	ELSE IF (@DIEM = 5) SET @RESULT = N'Năm' 
	ELSE IF (@DIEM = 6) SET @RESULT = N'Sáu' 
	ELSE IF (@DIEM = 7) SET @RESULT = N'Bảy' 
	ELSE IF (@DIEM = 8) SET @RESULT = N'Tám' 
	ELSE IF (@DIEM = 9) SET @RESULT = N'Chín' 
	ELSE IF (@DIEM = 10) SET @RESULT = N'Mười'

	SET @RESULT = @RESULT + @StrThem
	RETURN @RESULT
END

GO
/****** Object:  Table [dbo].[BANGDIEM]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BANGDIEM](
	[IDBD] [bigint] NOT NULL,
	[MAMH] [char](5) NOT NULL,
	[MASV] [char](8) NOT NULL,
	[LAN] [smallint] NOT NULL,
	[NGAYTHI] [datetime] NULL CONSTRAINT [DF_BANGDIEM_NGAYTHI]  DEFAULT (getdate()),
	[DIEM] [float] NULL,
	[BAITHI] [nchar](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_6BDAB9466B1E406B91F37A8CC26AC539]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_BANGDIEM_1] PRIMARY KEY CLUSTERED 
(
	[IDBD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BODE]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BODE](
	[CAUHOI] [int] NOT NULL,
	[MAMH] [char](5) NOT NULL,
	[TRINHDO] [char](1) NOT NULL,
	[NOIDUNG] [nvarchar](500) NOT NULL,
	[A] [nvarchar](100) NOT NULL,
	[B] [nvarchar](100) NOT NULL,
	[C] [nvarchar](100) NOT NULL,
	[D] [nvarchar](100) NOT NULL,
	[DAP_AN] [char](1) NOT NULL,
	[MAGV] [char](8) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_5687C62E7A7941E6AABB95E08A7E383C]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_BODE] PRIMARY KEY CLUSTERED 
(
	[CAUHOI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COSO]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COSO](
	[MACS] [nchar](3) NOT NULL,
	[TENCS] [nvarchar](50) NOT NULL,
	[DIACHI] [nvarchar](100) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_BAE2D2AED2FD48D48E9E3A09290DE39C]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_COSO] PRIMARY KEY CLUSTERED 
(
	[MACS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CT_BAITHI]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_BAITHI](
	[IDBD] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CAUHOI] [int] NOT NULL,
	[DACHON] [nchar](5) NOT NULL,
	[STT] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_9A487871BAD3450198BE8DD43B09CCE9]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_CT_BAITHI] PRIMARY KEY CLUSTERED 
(
	[IDBD] ASC,
	[CAUHOI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GIAOVIEN]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GIAOVIEN](
	[MAGV] [char](8) NOT NULL,
	[HO] [varchar](40) NOT NULL,
	[TEN] [varchar](10) NOT NULL,
	[HOCVI] [varchar](50) NULL,
	[MAKH] [nchar](8) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_08239DF1D1624A349FE5EE282E43ED6F]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_GIAOVIEN] PRIMARY KEY CLUSTERED 
(
	[MAGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GIAOVIEN_DANGKY]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GIAOVIEN_DANGKY](
	[MAGV] [char](8) NOT NULL,
	[MAMH] [char](5) NOT NULL,
	[MALOP] [char](8) NOT NULL,
	[TRINHDO] [char](1) NOT NULL,
	[NGAYTHI] [datetime] NOT NULL CONSTRAINT [DF_GIAOVIEN_DANGKY_NGAYTHI]  DEFAULT (getdate()),
	[LAN] [smallint] NOT NULL,
	[SOCAUTHI] [smallint] NOT NULL,
	[THOIGIAN] [smallint] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_F150741D00C640338054CACDDA774E97]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_GIAOVIEN_DANGKY] PRIMARY KEY CLUSTERED 
(
	[MAMH] ASC,
	[MALOP] ASC,
	[LAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHOA]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOA](
	[MAKH] [nchar](8) NOT NULL,
	[TENKH] [nvarchar](50) NOT NULL,
	[MACS] [nchar](3) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_89BF2744207445A58D7B8A07D0539EFF]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_KHOA] PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOP]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOP](
	[MALOP] [char](8) NOT NULL,
	[TENLOP] [nvarchar](50) NOT NULL,
	[MAKH] [nchar](8) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_A21EF7F536D241979EB26B695C04EC21]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_LOP] PRIMARY KEY CLUSTERED 
(
	[MALOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MONHOC]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MONHOC](
	[MAMH] [char](5) NOT NULL,
	[TENMH] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_5EF5260530574580BF8E121469AC0E0B]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_TENMH] PRIMARY KEY CLUSTERED 
(
	[MAMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SINHVIEN]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SINHVIEN](
	[MASV] [char](8) NOT NULL,
	[HO] [nvarchar](50) NOT NULL,
	[TEN] [nvarchar](10) NOT NULL,
	[NGAYSINH] [datetime] NULL,
	[DIACHI] [nvarchar](500) NULL,
	[MALOP] [char](8) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_E9F882F45F23422A9F7206BCC7121A26]  DEFAULT (newsequentialid()),
	[MATKHAU] [varchar](20) NOT NULL DEFAULT ('123'),
 CONSTRAINT [PK_SINHVIEN] PRIMARY KEY CLUSTERED 
(
	[MASV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[V_DS_PHANMANH]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_DS_PHANMANH]
AS  
SELECT TEN_COSO = pub.description, TEN_SERVER = sub.subscriber_server 
FROM dbo.sysmergepublications pub, dbo.sysmergesubscriptions sub
WHERE pub.pubid = sub.pubid AND sub.subscriber_server <> @@SERVERNAME AND sub.subscriber_server <> 'DESKTOP-1UGMICG\SERVER3'
GO
INSERT [dbo].[BANGDIEM] ([IDBD], [MAMH], [MASV], [LAN], [NGAYTHI], [DIEM], [BAITHI], [rowguid]) VALUES (1, N'MMTCB', N'005     ', 1, CAST(N'2021-12-20 00:00:00.000' AS DateTime), 2, N'Test      ', N'2caca4b0-9961-ec11-a94e-b07d64b3996b')
INSERT [dbo].[BANGDIEM] ([IDBD], [MAMH], [MASV], [LAN], [NGAYTHI], [DIEM], [BAITHI], [rowguid]) VALUES (2, N'MMTCB', N'005     ', 2, CAST(N'2021-12-22 00:00:00.000' AS DateTime), 0, N'Test      ', N'8a56879c-d362-ec11-a94e-b07d64b3996b')
INSERT [dbo].[BANGDIEM] ([IDBD], [MAMH], [MASV], [LAN], [NGAYTHI], [DIEM], [BAITHI], [rowguid]) VALUES (3, N'AVCB ', N'004     ', 1, CAST(N'2021-12-23 00:00:00.000' AS DateTime), 0, N'Test      ', N'983ddb03-8163-ec11-a94e-b07d64b3996b')
INSERT [dbo].[BANGDIEM] ([IDBD], [MAMH], [MASV], [LAN], [NGAYTHI], [DIEM], [BAITHI], [rowguid]) VALUES (4, N'AVCB ', N'050     ', 1, CAST(N'2021-12-23 00:00:00.000' AS DateTime), 0, N'Test      ', N'710bbfd9-9363-ec11-a94e-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (1, N'MMTCB', N'A', N'mạng máy tính(compute netword) so với hệ thống tập trung multi-user', N'dễ phát triển hệ thống', N'tăng độ tin cậy', N'tiết kiệm chi phí', N'tất cả đều đúng', N'C', N'TH657   ', N'c66c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (3, N'MMTCB', N'A', N'để một máy tính truyền dữ liệu cho một số máy khác trong mạng, ta dùng loại địa chỉ', N'Broadcast', N'Broadband', N'multicast', N'multiple access', N'C', N'TH123   ', N'c76c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (4, N'MMTCB', N'A', N'thứ tự phân loại mạng theo chiều dài đường truyền', N'internet, lan, man, wan', N'internet, wan, man, lan', N'lan, wan, man, internet', N'man, lan, wan, internet', N'B', N'TH123   ', N'c86c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (5, N'MMTCB', N'A', N'mạng man được sử dụng trong phạm vi:', N'quốc gia', N'lục địa', N'khu phố', N'thành phố', N'D', N'TH123   ', N'c96c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (6, N'MMTCB', N'A', N'thuật ngữ man được viết tắt bởi:', N'middle area network', N'metropolitan area network', N'medium area network', N'multiple access network', N'D', N'TH123   ', N'ca6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (7, N'MMTCB', N'A', N'mạng man không kết nối theo sơ đồ:', N'bus', N'ring', N'star', N'tree', N'D', N'TH123   ', N'cb6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (8, N'MMTCB', N'A', N'kiến trúc mạng (network architechture) là:', N'tập các chức năng trong mạng', N'tập các cấp và các protocol trong mỗi cấp', N'tập các dịch vụ trong mạng', N'tập các protocol trong mạng', N'B', N'TH123   ', N'cc6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (9, N'MMTCB', N'A', N'thuật ngữ nào không cùng nhóm:', N'simplex', N'multiplex', N'half duplex', N'full duplex', N'B', N'TH123   ', N'cd6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (10, N'MMTCB', N'A', N'loại dịch vụ nào có thể nhận dữ liệu không đúng thứ tự khi truyền', N'point to point', N'có kết nối', N'không kết nối', N'broadcast', N'C', N'TH123   ', N'ce6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (11, N'MMTCB', N'A', N'dịch vụ không xác nhận (unconfirmed) chỉ sử dụng 2 phép toán cơ bản:', N'response and confirm', N'confirm and request', N'request and indication', N'indication and response', N'C', N'TH123   ', N'cf6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (12, N'MMTCB', N'A', N'Chọn câu sai trong các nguyên lý phân cấp của mô hình OSI', N'Mỗi cấp thực hiện 1 chức năng rõ ràng', N'Mỗi cấp được chọn sao cho thông tin trao đổi giữa các cấp tối thiểu', N'Mỗi cấp được tạo ra ứng với 1 mức trừu tượng hóa', N'Mỗi cấp phải cung cấp cùng 1 kiểu địa chỉ và dịch vụ', N'D', N'TH123   ', N'd06c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (13, N'MMTCB', N'A', N'Chức năng của cấp vật lý(physical)', N'Qui định truyền 1 hay 2 chiều', N'Quản lý lỗi sai', N'Xác định thời gian truyền 1 bit dữ liệu', N'Quản lý địa chỉ vật lý', N'C', N'TH123   ', N'd16c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (14, N'MMTCB', N'A', N'Chức năng câp liên kết dữ liệu (data link)', N'Quản lý lỗi sai', N'Mã hóa dữ liệu', N'Tìm đường đi cho dữ liệu', N'Chọn kênh truyền', N'A', N'TH123   ', N'd26c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (15, N'MMTCB', N'A', N'Chức năng cấp mạng (network)', N'Quản lý lưu lượng đường truyền', N'Điều khiển hoạt động subnet', N'Nén dữ liệu', N'Chọn điện áp trên kênh truyền', N'B', N'TH123   ', N'd36c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (16, N'MMTCB', N'A', N'Chức năng cấp vận tải (transport) ', N'Quản lý địa chỉ mạng', N'Chuyển đổi các dạng frame khác nhau', N'Thiết lập và hủy bỏ dữ liệu', N'Mã hóa và giải mã dữ liệu', N'C', N'TH123   ', N'd46c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (17, N'MMTCB', N'A', N'Cáp xoắn đôi trong mạng LAN dùng đầu nối', N'AUI', N'BNC', N'RJ11', N'RJ45', N'D', N'TH123   ', N'd56c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (18, N'MMTCB', N'A', N'T-connector dùng trong loại cáp', N'10Base-2', N'10Base-5', N'10Base-T', N'10Base-F', N'A', N'TH123   ', N'd66c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (19, N'MMTCB', N'A', N'chọn câu sai trong các nguyên lý phân cấp của mô hình osi', N'mỗi cấp thực hiện 1 chức năng rõ ràng', N'mỗi cấp được chọn sao cho thông tin trao đổi giữa các cấp tối thiểu', N'mỗi cấp được tạo ra ứng với 1 mức trừu tượng hóa', N'mỗi cấp phải cung cấp cùng một kiểu địa chỉ và dịch vụ', N'D', N'TH123   ', N'd76c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (20, N'AVCB ', N'A', N'The publishers suggested that the envelopes be sent to ...... by courier so that the film can be developed as soon as possible', N'they', N'their', N'theirs', N'them', N'D', N'TH234   ', N'd86c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (21, N'AVCB ', N'A', N'Board members ..... carefully define their goals and objectives for the agency before the monthly meeting next week.', N'had', N'should', N'used ', N'have', N'B', N'TH234   ', N'd96c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (22, N'AVCB ', N'A', N'For business relations to continue between our two firms, satisfactory agreement must be ...... reached and signer', N'yet', N'both', N'either ', N'as well as', N'C', N'TH234   ', N'da6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (23, N'AVCB ', N'A', N'The corporation, which underwent a major restructing seven years ago, has been growing steadily ......five years', N'for', N'on', N'from', N'since', N'A', N'TH234   ', N'db6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (24, N'AVCB ', N'A', N'Making advance arrangements for audiovisual equipment is....... recommended for all seminars.', N'sternly', N'strikingly', N'stringently', N'strongly', N'A', N'TH234   ', N'dc6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (25, N'AVCB ', N'A', N'Two assistants will be required to ...... reporter''s names when they arrive at the press conference', N'remark', N'check', N'notify', N'ensure', N'B', N'TH234   ', N'dd6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (26, N'AVCB ', N'A', N'The present government has an excellent ......to increase exports', N'popularity', N'regularity', N'celebrity', N'opportunity', N'D', N'TH234   ', N'de6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (27, N'AVCB ', N'A', N'While you are in the building, please wear your identification badge at all times so that you are ....... as a company employee.', N'recognize', N'recognizing', N'recognizable', N'recognizably', N'C', N'TH234   ', N'df6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (28, N'AVCB ', N'A', N'Our studies show that increases in worker productivity have not been adequately .......rewarded by significant increases in ......', N'compensation', N'commodity', N'compilation', N'complacency', N'B', N'TH234   ', N'e06c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (29, N'AVCB ', N'A', N'Conservatives predict that government finaces will remain...... during the period of the investigation', N'authoritative', N'summarized', N'examined', N'stable', N'D', N'TH234   ', N'e16c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (30, N'AVCB ', N'B', N'Battery-operated reading lamps......very well right now', N'sale', N'sold', N'are selling', N'were sold', N'C', N'TH234   ', N'e26c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (31, N'AVCB ', N'B', N'In order to place a call outside the office, you have to .......nine first. ', N'tip', N'make', N'dial', N'number', N'D', N'TH234   ', N'e36c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (32, N'AVCB ', N'B', N'We are pleased to inform...... that the missing order has been found.', N'you', N'your', N'yours', N'yourseld', N'A', N'TH234   ', N'e46c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (33, N'AVCB ', N'B', N'Unfortunately, neither Mr.Sachs....... Ms Flynn will be able to attend the awards banquet this evening', N'but', N'and', N'nor', N'either', N'C', N'TH234   ', N'e56c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (34, N'AVCB ', N'B', N'According to the manufacturer, the new generatir is capable of....... the amount of power consumed by our facility by nearly ten percent.', N'reduced', N'reducing', N'reduce', N'reduces', N'B', N'TH234   ', N'e66c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (35, N'AVCB ', N'B', N'After the main course, choose from our wide....... of homemade deserts', N'varied', N'various', N'vary', N'variety', N'D', N'TH234   ', N'e76c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (36, N'AVCB ', N'B', N'One of the most frequent complaints among airline passengers is that there is not ...... legroom', N'enough', N'many', N'very', N'plenty', N'A', N'TH234   ', N'e86c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (37, N'AVCB ', N'B', N'Faculty members are planning to..... a party in honor of Dr.Walker, who will retire at the end of the semester', N'carry', N'do', N'hold', N'take', N'D', N'TH234   ', N'e96c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (38, N'AVCB ', N'B', N'Many employees seem more ....... now about how to use the new telephone system than they did before they attended the workshop', N'confusion', N'confuse', N'confused', N'confusing', N'C', N'TH234   ', N'ea6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (39, N'AVCB ', N'B', N'.........our production figures improve in the near future, we foresee having to hire more people between now and July', N'During', N'Only', N'Unless', N'Because', N'D', N'TH234   ', N'eb6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (40, N'AVCB ', N'C', N'Though their performance was relatively unpolished, the actors held the audience''s ........for the duration of the play.', N'attentive', N'attentively', N'attention', N'attentiveness', N'C', N'TH234   ', N'ec6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (41, N'AVCB ', N'C', N'Dr. Abernathy''s donation to Owstion College broke the record for the largest private gift...... give to the campus', N'always', N'rarely', N'once', N'ever', N'C', N'TH234   ', N'ed6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (42, N'AVCB ', N'C', N'Savat Nation Park is ....... by train,bus, charter plane, and rental car.', N'accessible', N'accessing', N'accessibility', N'accesses', N'A', N'TH234   ', N'ee6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (43, N'AVCB ', N'C', N'In Piazzo''s lastest architectural project, he hopes to......his flare for blending contemporary and traditional ideals.', N'demonstrate', N'appear', N'valve', N'position', N'A', N'TH234   ', N'ef6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (44, N'AVCB ', N'C', N'Replacing the offic equipment that the company purchased only three years ago seems quite.....', N'waste', N'wasteful', N'wasting', N'wasted', N'C', N'TH234   ', N'f06c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (45, N'AVCB ', N'C', N'On........, employees reach their peak performance level when they have been on the job for at least two years.', N'common', N'standard', N'average', N'general', N'D', N'TH234   ', N'f16c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (46, N'AVCB ', N'C', N'We were........unaware of the problems with the air-conidtioning units in the hotel rooms until this week.', N'complete ', N'completely', N'completed', N'completing', N'D', N'TH234   ', N'f26c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (47, N'AVCB ', N'C', N'If you send in an order ....... mail, we recommend that you phone our sales division directly to confirm the order.', N'near', N'by', N'for', N'on', N'A', N'TH234   ', N'f36c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (48, N'AVCB ', N'C', N'A recent global survey suggests.......... demand for aluminum and tin will remain at its current level for the next five to ten years.', N'which', N'it ', N'that', N'both', N'C', N'TH234   ', N'f46c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (49, N'AVCB ', N'C', N'Rates for the use of recreational facilities do not include ta and are subject to change without.........', N'signal', N'cash', N'report', N'notice', N'A', N'TH234   ', N'f56c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (50, N'AVCB ', N'A', N'Aswering telephone calls is the..... of an operator', N'responsible', N'responsibly', N'responsive', N'responsibility', N'D', N'TH234   ', N'f66c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (51, N'AVCB ', N'A', N'A free watch will be provided with every purchase of $20.00 or more a ........ period of time', N'limit', N'limits', N'limited', N'limiting', N'C', N'TH234   ', N'f76c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (52, N'AVCB ', N'A', N'The president of the corporation has .......arrived in Copenhagen and will meet with the Minister of Trade on Monday morning', N'still', N'yet', N'already', N'soon', N'C', N'TH234   ', N'f86c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (53, N'AVCB ', N'A', N'Because we value your business, we have .......for card members like you to receive one thousand  dollars of complimentary life insurance', N'arrange', N'arranged', N'arranges', N'arranging', N'B', N'TH234   ', N'f96c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (54, N'AVCB ', N'A', N'Employees are........that due to the new government regulations. there is to be no smoking in the factory', N'reminded', N'respected', N'remembered', N'reacted', N'A', N'TH234   ', N'fa6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (55, N'AVCB ', N'A', N'MS. Galera gave a long...... in honor of the retiring vice-president', N'speak', N'speaker', N'speaking', N'speech', N'D', N'TH234   ', N'fb6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (56, N'AVCB ', N'A', N'Any person who is........ in volunteering his or her time for the campaign should send this office a letter of intent', N'interest', N'interested', N'interesting', N'interestingly', N'B', N'TH234   ', N'fc6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (57, N'AVCB ', N'A', N'Mr.Gonzales was very concerned.........the upcoming board of directors meeting', N'to', N'about', N'at ', N'upon', N'B', N'TH234   ', N'fd6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (58, N'AVCB ', N'A', N'The customers were told that no ........could be made on weekend nights because the restaurant was too busy', N'delays', N'cuisines', N'reservation', N'violations', N'C', N'TH234   ', N'fe6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (59, N'AVCB ', N'A', N'The sales representive''s presentation was difficult to understand ........ he spoke very quickly', N'because', N'althought', N'so that', N'than', N'A', N'TH234   ', N'ff6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (60, N'AVCB ', N'B', N'It has been predicted that an.......weak dollar will stimulate tourism in the United States', N'increased', N'increasingly', N'increases', N'increase', N'B', N'TH234   ', N'006d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (61, N'AVCB ', N'B', N'The firm is not liable for damage resulting from circumstances.........its control.', N'beyond', N'above', N'inside', N'around', N'A', N'TH234   ', N'016d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (62, N'AVCB ', N'B', N'Because of.......weather conditions, California has an advantage in the production of fruits and vegetables', N'favorite', N'favor', N'favorable', N'favorably', N'C', N'TH234   ', N'026d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (63, N'AVCB ', N'B', N'On international shipments, all duties and taxes are paid by the..........', N'recipient', N'receiving', N'receipt', N'receptive', N'A', N'TH234   ', N'036d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (64, N'AVCB ', N'B', N'Although the textbook gives a definitive answer,wise managers will look for........ own creative solutions', N'them', N'their', N'theirs', N'they', N'B', N'TH234   ', N'046d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (65, N'AVCB ', N'B', N'Initial ....... regarding the merger of the companies took place yesterday at the Plaza Conference Center.', N'negotiations', N'dedications', N'propositions', N'announcements', N'A', N'TH234   ', N'056d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (66, N'AVCB ', N'B', N'Please......... photocopies of all relevant docunments to this office ten days prior to your performance review date', N'emerge', N'substantiate', N'adapt', N'submit', N'D', N'TH234   ', N'066d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (67, N'AVCB ', N'B', N'The auditor''s results for the five year period under study were .........the accountant''s', N'same', N'same as', N'the same', N'the same as', N'D', N'TH234   ', N'076d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (68, N'AVCB ', N'B', N'.........has the marketing environment been more complex and subject to change', N'Totally', N'Negatively', N'Decidedly', N'Rarely', N'D', N'TH234   ', N'086d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (69, N'AVCB ', N'B', N'All full-time staff are eligible to participate in the revised health plan, which becomes effective the first ......... the month.', N'of', N'to', N'from', N'for', N'A', N'TH234   ', N'096d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (70, N'AVCB ', N'C', N'Contracts must be read........ before they are signed.', N'thoroughness', N'more thorough', N'thorough', N'thoroughly', N'D', N'TH234   ', N'0a6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (71, N'AVCB ', N'C', N'Passengers should allow for...... travel time to the airport in rush hour traffic', N'addition', N'additive', N'additionally', N'additional', N'D', N'TH234   ', N'0b6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (72, N'AVCB ', N'C', N'This fiscal year, the engineering team has worked well together on all phases ofproject.........', N'development', N'developed', N'develops', N'developer', N'A', N'TH234   ', N'0c6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (73, N'AVCB ', N'C', N'Mr.Dupont had no ....... how long it would take to drive downtown', N'knowledge', N'thought', N'idea', N'willingness', N'C', N'TH234   ', N'0d6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (74, N'AVCB ', N'C', N'Small company stocks usually benefit..........the so called January effect that cause the price of these stocks to rise between November and January', N'unless', N'from', N'to ', N'since', N'B', N'TH234   ', N'0e6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (75, N'AVCB ', N'C', N'It has been suggested that employees ........to work in their current positions until the quarterly review is finished.', N'continuity', N'continue', N'continuing', N'continuous', N'B', N'TH234   ', N'0f6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (76, N'AVCB ', N'C', N'It is admirable that Ms.Jin wishes to handle all transactions by........, but it might be better if several people shared the responsibility', N'she', N'herself', N'her', N'hers', N'B', N'TH234   ', N'106d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (77, N'AVCB ', N'C', N'This new highway construction project will help the company.........', N'diversity', N'clarify', N'intensify', N'modify', N'A', N'TH234   ', N'116d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (78, N'AVCB ', N'C', N'Ms.Patel has handed in an ........business plan to the director', N'anxious', N'evident', N'eager', N'outstanding', N'D', N'TH234   ', N'126d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (79, N'AVCB ', N'C', N'Recent changes in heating oil costs have affected..........production of turniture', N'local', N'locality', N'locally', N'location', N'A', N'TH234   ', N'136d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (80, N'MMTCB', N'A', N'Termiator là linh kiện dùng trong loại cáp mạng', N'Cáp quang', N'UTP và STP ', N'Xoắn đôi', N'Đồng trục', N'D', N'TH123   ', N'146d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (81, N'MMTCB', N'A', N'Mạng không dây dùng loại sóng nào không bị ảnh hưởng bởi khoảng cách địa lý', N'Sóng radio', N'Sống hồng ngoại', N'Sóng viba', N'Song cực ngắn', N'A', N'TH123   ', N'156d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (82, N'MMTCB', N'A', N'Đường truyền E1 gồm 32 kênh, trong đó sử dụng cho dữ liệu là:', N'32 kênh', N'31 kênh', N'30 kênh', N'24 kênh', N'C', N'TH123   ', N'166d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (83, N'MMTCB', N'A', N'Mạng máy tính thường sử dụng loại chuyển mach', N'Gói (packet switch)', N'Kênh (Circuit switch)', N'Thông báo(message switch)', N'Tất cả đều đúng', N'A', N'TH123   ', N'176d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (84, N'MMTCB', N'A', N'Cáp UTP hỗ trợ tôc độ truyền 100MBps là loại', N'Cat 3', N'Cat 4', N'Cat 5', N'Cat 6', N'C', N'TH123   ', N'186d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (85, N'MMTCB', N'A', N'Thiết bị nào làm việc trong cấp vật lý (physical) ', N'Terminator', N'Hub', N'Repeater', N'Tất cả đều đúng', N'D', N'TH123   ', N'196d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (86, N'MMTCB', N'A', N'Phương pháp dồn kênh phân chia tần số gọi là', N'FDM', N'WDM', N'TDM', N'CSMA', N'A', N'TH123   ', N'1a6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (87, N'MMTCB', N'A', N'Dịch vụ nào không sử dụng trong cấp data link', N'Xác nhận, có kết nối', N'Xác nhận, không kết nôi', N'Không xác nhận, có kết nối', N'Không xác nhận, không kết nối', N'C', N'TH123   ', N'1b6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (88, N'MMTCB', N'A', N'Nguyên nhân gây sai sót khi gửi/nhận dữ liệu trên mạng', N'Mất đồng bộ trong khi truyền', N'Nhiễu từ môi trường', N'Lỗi phần cứng hoặc phần mềm', N'Tất cả đều đúng ', N'D', N'TH123   ', N'1c6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (89, N'MMTCB', N'A', N'Để tránh sai sót khi truyền dữ liệu trong cấp data link', N'Đánh số thứ tự frame', N'Quản lý dữ liệu theo frame', N'Dùng vùng checksum', N'Tất cả đều đúng', N'D', N'TH123   ', N'1d6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (90, N'MMTCB', N'A', N'Quản lý lưu lượng đường truyền là chức năng của cấp', N'Presentation', N'Network', N'Data link', N'Physical', N'C', N'TH123   ', N'1e6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (91, N'MMTCB', N'A', N'Hoạt động của protocol Stop and Wait', N'Chờ một khoảng thời gian time-out rồi gửi tiếp frame kế', N'Chờ 1 khoảng thời gian time-out rồi gửi lại frame trước', N'Chờ nhận được ACK của frame trước mới gửi tiếp frame kế', N'Không chờ mà gửi liên tiếp các frame kế nhau', N'C', N'TH123   ', N'1f6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (92, N'MMTCB', N'A', N'Protocol nào tạo frame bằng phương pháp chèn kí tự', N'ADCCP', N'HDLC', N'SDLC', N'PPP', N'D', N'TH123   ', N'206d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (93, N'MMTCB', N'A', N'Phương pháp nào được dủng trong việc phát hiện lỗi', N'Timer', N'Ack', N'Checksum', N'Tất cả đều đúng', N'C', N'TH123   ', N'216d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (94, N'MMTCB', N'A', N'Kiểm soát lưu lượng (flow control) có nghĩa là', N'Thay đổi thứ tự truyền frame', N'Điều tiết tốc độ truyền frame', N'Thay đổi thời gian chờ time-out', N'Điều chỉnh kích thước frame', N'B', N'TH123   ', N'226d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (95, N'MMTCB', N'A', N'Khả năng nhận biết tình trạng đường truyền ( carrier sence) là', N'Xác định đường truyền tốt hay xấu', N'Có kết nối được hay không', N'Nhận biết có xung đột hay không', N'Đường truyền đang rảnh hay bận', N'C', N'TH123   ', N'236d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (96, N'MMTCB', N'A', N'Mạng nào không có khả năng nhận biết tình trạng đường truyền (carrier sence)', N'ALOHA', N'CSMA', N'CSMA/CD', N'Tất cả đều đúng ', N'A', N'TH123   ', N'246d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (97, N'MMTCB', N'A', N'Mạng nào có khả năng nhận biết xung đột (collision)', N'ALOHA', N'CSMA', N'CSMA/CD', N'Tất cả đều đúng', N'D', N'TH123   ', N'256d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (98, N'MMTCB', N'A', N'Chuẩn mạng nào có khả năng pkhát hiện xung đột (collision) trong khi truyền', N'1-persistent CSMA', N'p-persistent CSMA', N'Non-persistent CSMA', N'CSMA/CD', N'D', N'TH123   ', N'266d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (99, N'MMTCB', N'A', N'Loại mạng cục bộ nào dùng chuẩn CSMA/CD', N'Token-ring', N'Token-bus', N'Ethernet', N'ArcNet', N'C', N'TH123   ', N'276d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (100, N'MMTCB', N'A', N'Mạng Ethernet được IEEE đưa vào chuẩn', N'IEEE 802.2', N'IEEE 802.3', N'IEEE 802.4', N'IEEE 802.5', N'B', N'TH123   ', N'286d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (101, N'MMTCB', N'A', N'Chuẩn nào không dùng trong mạng cục bộ (LAN )', N'IEEE 802.3', N'IEEE 802.4', N'IEEE 802.5', N'IEEE 802.6', N'D', N'TH123   ', N'296d2a26-8f14-ec11-a931-b07d64b3996b')
GO
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (102, N'MMTCB', N'A', N'Loại mạng nào dùng 1 máy tính làm Monitor để bảo trì mạng', N'Ethernet', N'Token-ring', N'Token-bus', N'Tất cả đều sai', N'B', N'TH123   ', N'2a6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (103, N'MMTCB', N'A', N'Loại mạng nào không có độ ưu tiên', N'Ethernet', N'Token-ring', N'Token-bus', N'Tất cả đều sai', N'D', N'TH123   ', N'2b6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (104, N'MMTCB', N'A', N'Loại mạng nào dùng 2 loại frame khác nhau trên đường truyền', N'Token-ring', N'Token-bus', N'Ethernet', N'Tất cả đều sai', N'A', N'TH123   ', N'2c6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (105, N'MMTCB', N'A', N'Vùng dữ liệu trong mạng Ethernet chứa tối đa', N'185 bytes', N'1500 bytes', N'8182 bytes', N'Không giới hạn', N'B', N'TH123   ', N'2d6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (106, N'MMTCB', N'A', N'Chọn câu sai:" Cầu nối (bridge) có thể kết nối các mạng có...."', N'Chiều dài frame khác nhau', N'Cấu trúc frame khác nhau', N'Tốc độ truyền khác nhau', N'Chuẩn khác nhau', N'A', N'TH123   ', N'2e6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (107, N'MMTCB', N'A', N'Mạng nào có tốc độ truyền lớn hơn 100Mbps', N'Fast Ethernet', N'Gigabit Ethernet', N'Ethernet', N'Tất cả đều đúng', N'B', N'TH123   ', N'2f6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (108, N'MMTCB', N'A', N'Mạng Ethernet sử dụng được loại cáp', N'Cáp quang', N'Xoắn đôi', N'Đồng trục', N'Tất cả đều đúgn', N'D', N'TH123   ', N'306d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (109, N'MMTCB', N'A', N'Khoảng cách đường truyền tối đa mạng FDDI có thể đạt', N'1Km', N'10Km', N'100Km', N'1000Km', N'C', N'TH123   ', N'316d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (110, N'MMTCB', N'A', N'Cấp network truyền nhận theo kiểu end-to-end vì nó quản lý dữ liệu', N'Giữa 2 đầu subnet', N'Giữa 2 máy tính trong mạng', N'Giữa 2 thiết bị trên đường truyền', N'Giữa 2 đầu đường truyền', N'A', N'TH123   ', N'326d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (111, N'MMTCB', N'A', N'Kiểu mạch ảo(virtual circuit) được dùng trong loại dịch vụ mạng', N'Có kết nối', N'Không kết nối', N'Truyền 1 chiều', N'Truyền 2 chiều', N'A', N'TH123   ', N'336d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (112, N'MMTCB', N'A', N'Kiểu datagram trong cấp network', N'Chỉ tìm đường 1 lần khi tạo kết nối', N'Phải tìm đường riêng cho từng packet', N'THông tin có sẵn trong packet, không cần tìm đường', N'Thông tin có sẵn trong router , không cần tìm đường', N'B', N'TH123   ', N'346d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (113, N'MMTCB', N'A', N'Kiểm soát tắc nghẽn (congestion) là nhiệm vụ của cấp', N'Physical', N'Transport', N'Data link', N'Network', N'D', N'TH123   ', N'356d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (114, N'MMTCB', N'A', N'Nguyên nhân dẫn đến tắt nghẻn (congestion) trên mạng', N'Tốc độ xử lý của router chậm', N'Buffers trong router nhỏ', N'Router có nhiều đường vào nhưng ít đường ra', N'Tất cả đều đúng', N'D', N'TH123   ', N'366d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (115, N'MMTCB', N'A', N'Cấp appliation trong mô hình TCP/IP tương đương với cấp nào trong mô hình OSI', N'Session', N'Application', N'Presentation', N'Tất cả đều đúng', N'D', N'TH123   ', N'376d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (116, N'MMTCB', N'A', N'Cấp nào trong mô hình mạng OSI tương đương với cấp Internet trong mô hình TCP/IP ', N'Network', N'Transport', N'Physical', N'Data link', N'A', N'TH123   ', N'386d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (117, N'MMTCB', N'A', N'Chất lượng dịch vụ mạng không được đánh giá trên chỉ tiêu nào?', N'Thời gian thiết lập kết nối ngắn', N'Tỉ lệ sai sót rất nhỏ', N'Tốc độ đường truyền cao', N'Khả năng phục hồi khi có sự cố', N'A', N'TH123   ', N'396d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (118, N'MMTCB', N'A', N'Kỹ thuật Multiplexing được dùng khi', N'Có nhiều kênh truyền hơn đường truyền', N'Có nhiều đường truyền hơn kênh truyền', N'Truyền dữ liệu số trên mạng điện thoại', N'Truyền dữ liệu tương tự trên mạng điện thọai', N'A', N'TH123   ', N'3a6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (119, N'MMTCB', N'A', N'Dịch vụ truyền Email sử dụng protocol nào?', N'HTTP', N'NNTP', N'SMTP', N'FTP', N'C', N'TH123   ', N'3b6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (120, N'MMTCB', N'A', N'Địa chỉ IP lớp B nằm trong phạm vi nào', N'192.0.0.0 - 223.0.0.0', N'127.0.0.0 - 191.0.0.0', N'128.0.0.0 - 191.0.0.0 ', N'1.0.0.0 - 126.0.0.0', N'C', N'TH123   ', N'3c6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (121, N'MMTCB', N'A', N'Subnet Mask nào sau đây chỉ cho tối đa 2 địa chỉ host', N'255.255.255.252', N'255.255.255.254', N'255.255.255.248', N'255.255.255.240', N'A', N'TH123   ', N'3d6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (122, N'MMTCB', N'A', N'Thành phần nào không thuộc socket', N'Port', N'Địa chỉ IP', N'Địa chỉ cấp MAC', N'Protocol cấp Transport', N'C', N'TH123   ', N'3e6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (123, N'MMTCB', N'A', N'Mục đích của Subnet Mask trong địa chỉ IP là', N'Xác định host của địa chỉ IP', N'Xác định vùng network của địa chỉ IP', N'Lấy các bit trong vùng subnet làm địa chỉ host', N'Lấy các bit trong vùng địa chỉ host làm subnet', N'A', N'TH123   ', N'3f6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (124, N'MMTCB', N'A', N'Bước đầu tiên cần thực hiện để truyền dữ liệu theo ALOHA là', N'Chờ 1 thời gian ngẫu nhiên', N'Gửi tín hiệu tạo kết nối', N'Kiểm tra tình trạng đường truyền', N'Lập tức truyền dữ liệu', N'D', N'TH123   ', N'406d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (125, N'MMTCB', N'A', N'Cầu nối trong suốt hoạt động trong cấp nào', N'Data link', N'Physical', N'Network', N'Transport', N'A', N'TH123   ', N'416d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (126, N'MMTCB', N'A', N'Tốc độ của đường truyền T1 là:', N'2048 Mbps', N'1544 Mbps', N'155 Mbps', N'56 Kbps', N'B', N'TH123   ', N'426d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (127, N'MMTCB', N'A', N'Khi một dịch vụ trả lời ACK cho biết dữ liệu đã nhận được, đó là', N'Dịch vụ có xác nhận', N'Dịch vụ không xác nhận', N'Dịch vụ có kết nối', N'Dịch vụ không kết nối', N'A', N'TH123   ', N'436d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (128, N'MMTCB', N'A', N'Loại frame nào được sử dụng trong mạng Token-ring', N'Monitor', N'Token', N'Data', N'Token và Data', N'D', N'TH123   ', N'446d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (129, N'MMTCB', N'A', N'Thuật ngữ OSI là viết tắt bởi', N'Organization for Standard Institude', N'Organization for Standard Internet', N'Open Standard Institude', N'Open System Interconnection', N'D', N'TH123   ', N'456d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (130, N'MMTCB', N'A', N'Trong mạng Token-ting, khi 1 máy nhận được Token', N'Nó phải truyền cho máy kế trong vòng', N'Nó được quyền truyền dữ liệu', N'Nó được quyền giữ lại Token', N'Tất cả đều sai', N'B', N'TH123   ', N'466d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (131, N'MMTCB', N'A', N'Trong mạng cục bộ, để xác định 1 máy trong mạng ta dùng địa chỉ', N'MAC', N'Socket', N'Domain', N'Port', N'A', N'TH123   ', N'476d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (132, N'MMTCB', N'A', N'Thứ tự các cấp trong mô hình OSI', N'Application,Session,Transport,Physical', N'Application, Transport, Network, Physical', N'Application, Presentation,Session,Network,Transport,Data link,Physical', N'Application,Presentation,Session,Transport,Network,Data link,Physical', N'D', N'TH123   ', N'486d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (133, N'MMTCB', N'A', N'Cấp vật lý (physical) không quản lý', N'Mức điện áp', N'Địa chỉ vật lý', N'Mạch giao tiếp vật lý', N'Truyền các bit dữ liêu', N'B', N'TH123   ', N'496d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (134, N'MMTCB', N'A', N'TCP sử dụng loại dịch vụ', N'Có kết nối, độ tin cậy cao', N'Có kết nối, độ tin cậy thấp', N'Không kết nối, độ tin cậy cao', N'Không kết nối, độ tin cậy thấp', N'A', N'TH123   ', N'4a6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (135, N'MMTCB', N'A', N'Địa chỉ IP bao gồm', N'Địa chỉ Network và địa chỉ host', N'Địa chỉ physical và địa chỉ logical', N'Địa chỉ cấp MAC và và địa chỉ LLC', N'Địa chỉ hardware và địa chỉ software', N'A', N'TH123   ', N'4b6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (136, N'MMTCB', N'A', N'Chức năng cấp mạng (network) là', N'Mã hóa và định dạng dữ liệu', N'Tìm đường và kiểm soát tắc nghẽn', N'Truy cập môi trường mạng', N'Kiểm soát lỗi và kiểm soát lưu lượng', N'B', N'TH123   ', N'4c6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (137, N'MMTCB', N'A', N'Mạng CSMA/CD làm gì', N'Truyền Token trên mạng hình sao', N'Truyền Token trên mạng dạng Bus', N'Chia packet ra thành từng frame nhỏ và truỵền đi trên mạng', N'Truy cập đường truyền và truyền lại dữ liệu nếu xảy ra đụng độ', N'D', N'TH123   ', N'4d6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (138, N'MMTCB', N'A', N'Tiền thân của mạng Internet là', N'Intranet', N'Ethernet', N'Arpanet', N'Token-bus', N'C', N'TH123   ', N'4e6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (139, N'MMTCB', N'A', N'Khi 1 cầu nối ( bridge) nhận được 1 framechưa biết thông tin về địa chỉ máy nhận, nó sẽ', N'Xóa bỏ frame này', N'Gửi trả lại máy gốc', N'Gửi đến mọi ngõ ra còn lại', N'Giảm thời gian sống của frame đi 1 đơn vị và gửi đến mọi ngõ ra còn lại', N'C', N'TH123   ', N'4f6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (140, N'MMTCB', N'A', N'Chức năng của cấp Network là', N'Tìm đường', N'Mã hóa dữ liệu', N'Tạo địa chỉ vật lý', N'Kiểm soát lưu lượng', N'A', N'TH123   ', N'506d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (141, N'MMTCB', N'B', N'Sự khác nhau giữa địa chỉ cấp Data link và Network là', N'Địa chỉ cấp Data link có kích thước nhỏ hơn địa chỉ cấp Network', N'Địa chỉ cấp Data link là đia chỉ Physic, địa chỉ cấp Network là địa chỉ Logic', N'Địa chỉ cấp Data Link là địa chỉ Logic, địa chỉ câp Network là địa chỉ Physic', N'Địa chỉ Data link cấu hình theo mạng, địa chỉ cấp Network xác định theo IEEE', N'B', N'TH123   ', N'516d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (142, N'MMTCB', N'B', N'Kỹ thuật nào không sử dụng được trong việc kiểm soát lưu lượng(flow control)', N'Ack', N'Buffer', N'Windowing', N'Multiplexing', N'D', N'TH123   ', N'526d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (143, N'MMTCB', N'B', N'Cấp cao nhất trong mô hình mạng OSI là', N'Transport', N'Physical', N'Network', N'Application', N'D', N'TH123   ', N'536d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (144, N'MMTCB', N'B', N'Tại sao mạng máy tình dùng mô hình phân cấp', N'Để mọi người sử dụng cùng 1 ứng dụng mạng', N'Để phân biệt giữa chuẩn mạng và ứng dụng mạng', N'Giảm độ phức tạp trong việc thiết kế và cài đặt', N'Các cấp khác không cần sửa đổi khi thay đổi 1 cấp mạng', N'D', N'TH123   ', N'546d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (145, N'MMTCB', N'B', N'Router làm gì để giảm tăc nghẽn (congestion)', N'Nén dữ liệu', N'Lọc bớt dữ liệu theo địa chỉ vật lý', N'Lọc bớt dữ liệu theo địa chỉ logic', N'Cấm truyền dữ liệu broadcasr', N'D', N'TH123   ', N'556d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (146, N'MMTCB', N'B', N'Byte đầu của 1 IP có giá trị 222, địa chỉ này thuộc lớp địa chỉ nào', N'Lớp A', N'Lớp B', N'Lớp C', N'Lớp D', N'C', N'TH123   ', N'566d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (147, N'MMTCB', N'B', N'Chọn câu đúng đối với switch của mạng LAN', N'Là 1 cầu nối tốc độ cao', N'Nhận data từ 1 cổng và xuất ra mọi cổng còn lại', N'Nhận data từ 1 cổng và xuất ra  cổng đích tùy theo địa chỉ cấp IP', N'Nhận data từ 1 cổng và xuất ra 1 cổng đích tùy theo địa chỉ cấp MAC', N'D', N'TH123   ', N'576d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (148, N'MMTCB', N'B', N'Thuật ngữ nào cho biết loại mạng chỉ truyền được  chiều tại 1 thời điểm', N'Half duplex', N'Full duplex', N'Simplex', N'Monoplex', N'A', N'TH123   ', N'586d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (149, N'MMTCB', N'B', N'Protocol nghĩa là', N'Tập các chuẩn truyền dữ liệu', N'Tập các cấp mạng trong mô hình OSI', N'Tập các chức năng của từng cấp trong mạng', N'Tập các qui tắc và cấu trúc dữ liệu để truyền thông giữa các cấp mạng', N'D', N'TH123   ', N'596d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (150, N'MMTCB', N'B', N'Truyền dữ liệu theo kiểu có kết nối không cần thực hiện việc', N'Hủy kết nối', N'Tạo kết nối', N'Truyền dữ liệu', N'Tìm đường cho từng gói tin', N'D', N'TH123   ', N'5a6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (151, N'MMTCB', N'B', N'Byte đầu của địa chỉ IP lớp E nằm trong phạm vi', N'128 - 191', N'192 - 232 ', N'224 - 239 ', N'240 - 247', N'D', N'TH123   ', N'5b6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (152, N'MMTCB', N'B', N'Khi truyền đi chuỗi "VIET NAM" nhưng nhận được chuỗi"MAN TEIV ". Cần phải hiệu chỉnh các protocol trong cấp nào để truyền chính xác', N'Session', N'Transport', N'Application', N'Presentation', N'B', N'TH123   ', N'5c6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (153, N'MMTCB', N'B', N'Tên cáp UTP dùng torng mạng Fast Ethernet là', N'100BaseF', N'100Base2', N'100BaseT', N'100Base5', N'C', N'TH123   ', N'5d6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (154, N'MMTCB', N'B', N'Tốc độ truyền của mạng Ethernet là', N'1 Mbps', N'10 Mbps', N'100 Mbps', N'1000 Mbps', N'B', N'TH123   ', N'5e6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (155, N'MMTCB', N'B', N'Dịch vụ mạng thường được phân chia thành', N'Dịch vụ không kết nối và có kết nối', N'Dich vụ có xác nhận và không xác nhận', N'Dịch vụ có độ tin cậy cao và có độ tin cậy thấp', N'Tất cả đều đúng', N'D', N'TH123   ', N'5f6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (156, N'MMTCB', N'B', N'Đơn vị truyền dữ liệu trong cấp Network gọi là', N'Bit', N'Frame', N'Packet', N'Segment', N'C', N'TH123   ', N'606d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (157, N'MMTCB', N'B', N'Protocol nào trong mạng TCP/IP chuyển đổi địa chỉ vật lý thành địa chỉ IP', N'IP', N'ARP', N'ICMP', N'RARP', N'D', N'TH123   ', N'616d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (158, N'MMTCB', N'B', N'Đầu nới AUI dùng cho loại cáp nào?', N'Đồng trục', N'Xoắn đôi', N'Cáp quang', N'Tất cả đều đúng', N'A', N'TH123   ', N'626d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (159, N'MMTCB', N'B', N'Subnet mask chuẩn của địa chỉ IP lớp B là', N'255.0.0.0', N'255.255.0.0', N'255.255.255.0', N'255.255.255.255', N'B', N'TH123   ', N'636d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (160, N'MMTCB', N'B', N'Lý do nào khiến người ta chọn protocol TCP hơn là UDP', N'Không ACK', N'Dễ sử dụng', N'Độ tin cậy', N'Không kết nối', N'C', N'TH123   ', N'646d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (161, N'MMTCB', N'B', N'Nhược điểm của dịch vụ có kết nối so với không kết nối', N'Độ tin cậy', N'Thứ tự nhận dữ liệu không đúng', N'Đường truyền không thay đổi', N'Đường truyền thay đổi liên tục', N'C', N'TH123   ', N'656d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (162, N'MMTCB', N'B', N'Cấp Data link không thực hiện chức năng nào?', N'Kiểm soát lỗi', N'Địa chỉ vật lý', N'Kiểm soát lưu lượng', N'Thiết lập kết nối', N'D', N'TH123   ', N'666d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (163, N'MMTCB', N'B', N'Cầu nối (bridge)dựa vào thông tin nào để truyền tiếp hoặc hủy bỏ 1 frame', N'Điạ chỉ nguồn', N'Địa chỉ đích', N'Địa chỉ mạng', N'Tất cả đều đúng', N'C', N'TH123   ', N'676d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (164, N'MMTCB', N'B', N'Chuẩn nào sử dụng trong cấp presentation?', N'UTP và STP', N'SMTP và HTTP', N'ASCII và EBCDIC', N'TCP và UDP', N'C', N'TH123   ', N'686d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (165, N'MMTCB', N'B', N'Đơn vị truyền dữ liệu giữa các cấp trong mạng theo thứ tự', N'bit,frame,packet,data', N'bit,packet,frame,data', N'data,frame,packet,bit', N'data,bit,packet,frame', N'A', N'TH123   ', N'696d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (166, N'MMTCB', N'B', N'Mạng Ethernet do cơ quan nào phát minh', N'ANSI', N'ISO', N'IEEE', N'XEROX', N'D', N'TH123   ', N'6a6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (167, N'MMTCB', N'B', N'Chiều dài loại cáp nào tối đa 100 m? ', N'10Base2', N'10Base5', N'10BaseT', N'10BaseF', N'C', N'TH123   ', N'6b6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (168, N'MMTCB', N'B', N'Địa chỉ IP 100.150.200.250 có nghĩa là', N'Địa chỉ network 100, địa chỉ host 150.200.250', N'Địa chỉ network 100.150, địa chỉ host 200.250', N'Địa chỉ network 100.150.200, địa chỉ host 250', N'Tất cả đều sai', N'D', N'TH123   ', N'6c6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (169, N'MMTCB', N'B', N'Switching hun khác hub thông thường ở chỗ nó làm', N'Giảm collision trên mạng', N'Tăng collision trên mạng', N'Giảm congestion trên mạng', N'Tăng congestion trên mạng', N'A', N'TH123   ', N'6d6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (170, N'MMTCB', N'B', N'Loại cáp nào chỉ truyền dữ liệu 1 chiều', N'Cáp quang', N'Xoắn đôi', N'Đồng trục', N'Tất cả đều đúng', N'A', N'TH123   ', N'6e6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (171, N'MMTCB', N'B', N'Thiết bị Modem dùng để', N'Tách và ghép tín hiệu', N'Nén và gải nén tín hiệu', N'Mã hóa và giải mã tín hiệu', N'Điều chế và giải điều chế tín hiệu', N'D', N'TH123   ', N'6f6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (172, N'MMTCB', N'B', N'Việc cấp phát kênh truyền áp dụng cho loại mạng', N'Peer to peer', N'Point to point', N'Broadcast', N'Multiple Access', N'C', N'TH123   ', N'706d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (173, N'MMTCB', N'B', N'Mạng nào dùng phương pháp mã hóa Manchester Encoding', N'Ethernet', N'Token-ring', N'Token-bus', N'Tất cả đều đúng ', N'D', N'TH123   ', N'716d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (174, N'MMTCB', N'B', N'Phương pháp tìm đường có tính đến thời gian trễ', N'Tìm đường theo chiều sâu', N'Tìm đường theo chiều rộng', N'Tìm đường theo vector khoảng cách', N'Tìm đường theo trạng thái đường truyền', N'D', N'TH123   ', N'726d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (175, N'MMTCB', N'B', N'Chuẩn mạng nào khi có dữ liệu không truyền ngay mà chờ 1 thời gian ngẫu nhiên?', N'1-presistent CSMA', N'p-presistent CSMA', N'Non-presistent CSMA', N'CSMA/CD', N'C', N'TH123   ', N'736d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (176, N'MMTCB', N'B', N'Phương pháp chèn bit (bit stuffing) được dùng để', N'Phân biệt đầu và cuối frame', N'Bổ sung cho đủ kích thước frame tối thiểu', N'Phân cách nhiều bit 0 bằng bit 1', N'Biến đổi dạng dữ liệu 8 bit ra 16 bit', N'A', N'TH123   ', N'746d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (177, N'MMTCB', N'B', N'Để chống nhiễu trên đường truyền tốt nhất, nên dùng loại cáp:', N'Xoắn đôi', N'Đồng trục', N'Cáp quang', N'Mạng không dây', N'C', N'TH123   ', N'756d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (178, N'MMTCB', N'B', N'Phần mềm gửi/nhận thư điện tử thuộc cấp nào trong mô hình OSI', N'Data link', N'Network', N'Application', N'Presentation', N'C', N'TH123   ', N'766d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (179, N'MMTCB', N'B', N'Chức năng của thiết bị Hub trong mạng LAN', N'Mã hóa tín hiệu', N'Triệt tiêu tín hiệu', N'Phân chia tín hiệu', N'Điều chế tín hiếu', N'C', N'TH123   ', N'776d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (180, N'MMTCB', N'B', N'Switch là thiết bị mạng làm việc tương tự như', N'Hub', N'Repeater', N'Router', N'Bridge', N'D', N'TH123   ', N'786d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (181, N'MMTCB', N'C', N'Thiết bị nào làm việc trong cấp Network', N'Bridge', N'Repeater', N'Router', N'Gateway', N'C', N'TH123   ', N'796d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (182, N'MMTCB', N'C', N'Thiết bị nào cần có bộ nhớ làm buffer', N'Hub', N'Switch', N'Repeater', N'Router', N'D', N'TH123   ', N'7a6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (183, N'MMTCB', N'C', N'Luật 5-4-3 cho phép tối đa', N'5 segment trong 1 mạng', N'5 repeater trong 1 mạng', N'5 máy tính trong 1 mạng', N'5 máy tính trong 1 segment', N'A', N'TH123   ', N'7b6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (184, N'MMTCB', N'C', N'Thiết bị nào có thể thêm vào mạng LAN mà không sợ vi phạm luật 5-4-3', N'Router', N'Repeater', N'Máy tính', N'Tất cả đều đúng', N'A', N'TH123   ', N'7c6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (185, N'MMTCB', N'C', N'Thêm thiết bị nào vào mạng có thể qui phạm luật 5-4-3', N'Router', N'Repeater', N'Bridge', N'Tất cả đều đúng', N'B', N'TH123   ', N'7d6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (186, N'MMTCB', N'C', N'Mạng nào cóxảy ra xung đột (collision) trên đường truyền', N'Ethernet', N'Token-ring', N'Token-bus', N'Tất cả đều sai', N'A', N'TH123   ', N'7e6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (187, N'MMTCB', N'C', N'Từ "Broad" trong tên cáp 10Broad36 viết tắt bởi', N'Broadcast', N'Broadbase', N'Broadband', N'Broadway', N'C', N'TH123   ', N'7f6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (188, N'MMTCB', N'C', N'Protocol nào sử dụng trong cấp Network', N'IP', N'TCP', N'UDP', N'FTP', N'A', N'TH123   ', N'806d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (189, N'MMTCB', N'C', N'Protocol nào torng cấp Transport cung cấp dịch vụ không kết nối', N'IP', N'TCP', N'UDP', N'FTP', N'C', N'TH123   ', N'816d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (190, N'MMTCB', N'C', N'Protocol nào trong cấp Transport dùng kiểu dịch vụ có kết nối?', N'IP', N'TCP', N'UDP', N'FTP', N'B', N'TH123   ', N'826d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (191, N'MMTCB', N'C', N'Địa chỉ IP được chia làm mấy lớp', N'2', N'3', N'4', N'5', N'D', N'TH123   ', N'836d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (192, N'MMTCB', N'C', N'Chức năng nào không phải của cấp Network', N'Tìm đường', N'Địa chỉ logic', N'Kiểm soát tắc nghẽn', N'Chất lượng dịch vụ', N'B', N'TH123   ', N'846d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (193, N'MMTCB', N'C', N'Phương pháp chèn kí tự dùng để', N'Phân cách các frame', N'Phân biệt dữ liệu và ký tự điều khiển', N'Nhận diện đầu cuối frame', N'Bổ sung cho đủ kich thước frame tối thiểu', N'B', N'TH123   ', N'856d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (194, N'MMTCB', N'C', N'Kỹ thuật truyền nào mã hóa trực tiếp dữ liệu ra đường truyền không cần sóng mang', N'Broadcast', N'Digital', N'Baseband', N'Broadband', N'C', N'TH123   ', N'866d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (195, N'MMTCB', N'C', N'Sóng viba sử dụng băng tần', N'SHF', N'LF và MF', N'UHF và VHF', N'Tất cả đều đúng', N'D', N'TH123   ', N'876d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (196, N'MMTCB', N'C', N'Sóng viba bị ảnh hưởng bời', N'Trời mưa', N'Sấm chớp', N'Giông bão', N'Ánh sáng mặt trời', N'A', N'TH123   ', N'886d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (197, N'MMTCB', N'C', N'Đường dây trung kế trong mạng điện thoại sử dụng', N'Tín hiệu số', N'Kỹ thuật dồn kênh', N'Cáp quang, cáp đồng và viba', N'Tất cả đêu đúng', N'D', N'TH123   ', N'896d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (198, N'MMTCB', N'C', N'Cáp quang dùng công nghệ dồn kênh nào', N'TDM', N'FDM', N'WDM', N'CDMA', N'C', N'TH123   ', N'8a6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (199, N'MMTCB', N'C', N'Nhược điểm của phương pháp chèn ký tự', N'Giảm tốc độ đường truyền', N'Tăng phí tổn đường truyền', N'Mất đồng bộ frame', N'Không nhận diện được frame', N'B', N'TH123   ', N'8b6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (200, N'MMTCB', N'C', N'Mất đồng bộ frame xảy ra đối với phương pháp', N'Chèn bit', N'Đếm ký tự', N'Chèn ký tự', N'Tất cả đều đúng', N'B', N'TH123   ', N'8c6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (201, N'MMTCB', N'C', N'Mạng nào dùng công nghệ Token-bus', N'FDDI', N'CDDI', N'Fast Ethernet', N'100VG-AnyLAN', N'D', N'TH123   ', N'8d6d2a26-8f14-ec11-a931-b07d64b3996b')
GO
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (202, N'MMTCB', N'C', N'Thiết bị nào tự trao đổi thông tin lẫn nhau để quản lý mạng', N'Hub', N'Bridge', N'Router', N'Repeater', N'C', N'TH123   ', N'8e6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (203, N'MMTCB', N'C', N'Tần số sóng điện từ dùng trong mạng vô tuyến sắp theo thứ tự tăng dần', N'Radio,viba,hồng ngoại', N'Radio,hồng ngoại,viba', N'Hồng ngoại,viba,radio', N'Viba,radio,hồng ngoại', N'A', N'TH123   ', N'8f6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (204, N'MMTCB', N'C', N'Đường dây hạ kế (local loop) trong mạch điện thoại dùng tín hiệu', N'Digital', N'Analog', N'Manchester', N'T1 hoặc E1', N'B', N'TH123   ', N'906d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (205, N'MMTCB', N'C', N'Để tránh nhận trùng dữ liệu người ta dùng phương pháp', N'Đánh số thứ tự các frame', N'Quy định kích thước frame cố định', N'Chờ nhận ACK mới gửi frame kế tiếp', N'So sánh và loại bỏ các frame giống nhau', N'A', N'TH123   ', N'916d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (206, N'MMTCB', N'C', N'Cơ chế Timer dùng để', N'Đo thời gian chơ frame', N'Tránh tình trạng mất frame', N'Chọn thời điểm truyền frame', N'Kiểm soát thòi gian truyền frame', N'A', N'TH123   ', N'926d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (207, N'MMTCB', N'C', N'Cấp nào trong mô hình OSI quan tâm tới topology mạng', N'Transport', N'Network', N'Data link', N'Physical', N'B', N'TH123   ', N'936d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (208, N'MMTCB', N'C', N'Loại mạng nào sử dụng trên WAN', N'Ethernet và Token-bus', N'ISDN và Frame relay', N'Token-ring và FDDI', N'SDLC và HDLC', N'A', N'TH123   ', N'946d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (209, N'MMTCB', N'C', N'Repeater nhiều port là tên gọi của', N'Hub', N'Host', N'Bridge', N'Router', N'A', N'TH123   ', N'956d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (210, N'MMTCB', N'C', N'Đơn vị đo tốc độ đường truyền', N'bps(bit per second)', N'Bps(Byte per second)', N'mps(meter per second)', N'hertz (ccle per second)', N'A', N'TH123   ', N'966d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (211, N'MMTCB', N'C', N'Repeater dùng để', N'Lọc bớt dữ liệu trên mạng', N'Tăng tốc độ lưu thông trên mạng', N'Tăng thời gian trễ trên mạng', N'Mở rộng chiều dài đường truyền', N'D', N'TH123   ', N'976d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (212, N'MMTCB', N'C', N'Cáp đồng trục (coaxial)', N'Có 4 đôi dây', N'Không cần repeater', N'Truyền tín hiệu ánh sáng', N'Chống nhiễu tốt hơn UTP', N'D', N'TH123   ', N'986d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (213, N'MMTCB', N'C', N'Câp Data link ', N'Truyền dữ liệu cho các cấp khác trong mạng', N'Cung cấp dịch vụ cho chương trình ứng dụng', N'Nhận tín hiệu yếu,lọc,khuếch đại và phát lại trên mạng', N'Bảo đảm đường truyền dữ liệu tin cậy giữa 2 đầu đường truyền', N'D', N'TH123   ', N'996d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (214, N'MMTCB', N'C', N'Địa chỉ IP còn gọi là', N'Địa chĩ vật lý', N'Địa chỉ luận lý', N'Địa chỉ thập phân', N'Địa chỉ thập lục phân', N'B', N'TH123   ', N'9a6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (215, N'MMTCB', N'C', N'Cấp Presentation', N'Thiết lập, quản lý và kết thúc các ứng dụng', N'Hướng dẫn cách mô tả hình ảnh, âm thanh, tiếng nói', N'Cung cấp dịch vụ truyền dữ liệu từ nguồn đến đích', N'Hỗ trợ việc truyền thông trong các ứng dụng như web, mail...', N'C', N'TH123   ', N'9b6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (216, N'MMTCB', N'C', N'Tập các luật để định dạng và truyền dữ liệu gọi là', N'Qui luật (rule)', N'Nghi thức (protocol)', N'Tiêu chuẩn (standard)', N'Mô hình (model)', N'B', N'TH123   ', N'9c6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (217, N'MMTCB', N'C', N'Tại sao cần có tiêu chuẩn về mang', N'Định hướng phát triển phần cứng và phần mềm mới', N'LAN,MAN và WAN sử dụng các thiết bị khác nhau', N'Kết nối mạng giữa các quôc gia khác nhau', N'Tương thích về công nghệ để truyền thông được lẫn nhau', N'D', N'TH123   ', N'9d6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (218, N'MMTCB', N'C', N'Dữ liệu truyền trên mạng bằng', N'Mã ASCII', N'Số nhị phân', N'Không và một', N'Xung điện áp', N'D', N'TH123   ', N'9e6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (219, N'MMTCB', N'C', N'Mạng CSMA/CD', N'Kiểm tra để bảo đảm dữ liệu truyền đến đích', N'Kiểm tra đường truyền nếu rảnh mới truyền dữ liệu', N'Chờ 1 thời gian ngẫu nhiên rồi truyền  dữ liệu kế tiếp', N'Tất cả đều đúng', N'B', N'TH123   ', N'9f6d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (220, N'MMTCB', N'C', N'Địa chỉ MAC ', N'Gồm có 32 bit', N'Còn gọi là địa chỉ logic', N'Nằm trong cấp Network', N'Dùng để phân biệt các máy trong mạng', N'D', N'TH123   ', N'a06d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (223, N'MMTCB', N'B', N'isuydsuy', N'ksdyfus', N'sjflds', N'sdjfls', N'sidfuos', N'B', N'TH123   ', N'a16d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (224, N'LTW  ', N'A', N'kjck', N'kjdks', N'kdjfhsk', N'jdhf', N'kxjdfk', N'C', N'TH123   ', N'a26d2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (226, N'LTW  ', N'A', N'Thuộc tính HTML nào xác định một văn bản sẽ dùng thay thế cho hình ảnh, nếu hình ảnh không thể được hiển thị?', N'alt', N'Src', N'title', N'longdesc', N'A', N'TH123   ', N'bdb27156-2b5a-ec11-a94a-b07d64b3996b')
INSERT [dbo].[BODE] ([CAUHOI], [MAMH], [TRINHDO], [NOIDUNG], [A], [B], [C], [D], [DAP_AN], [MAGV], [rowguid]) VALUES (228, N'LTW  ', N'A', N'Địa chỉ URL của ứng dụng web được xác định bởi :', N'Thư mục ảo của ứng dụng', N'Thư mục vật lý của ứng dụng', N'Tên của Project', N'. Cả 3 câu đều sai', N'D', N'TH123   ', N'b5d7d817-125c-ec11-a94a-b07d64b3996b')
INSERT [dbo].[COSO] ([MACS], [TENCS], [DIACHI], [rowguid]) VALUES (N'CS1', N'CO SO 1 ', N'11 Nguyễn Đình Chiểu Phường Đakao Q1', N'a56c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[COSO] ([MACS], [TENCS], [DIACHI], [rowguid]) VALUES (N'CS2', N'CO SO 2', N'Số 9 Man Thiện , quận 9', N'a66c2a26-8f14-ec11-a931-b07d64b3996b')
SET IDENTITY_INSERT [dbo].[CT_BAITHI] ON 

INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 13, N'X    ', 7, N'33aca4b0-9961-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 16, N'A    ', 10, N'36aca4b0-9961-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 21, N'C    ', 2, N'37ce77dd-2f62-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 23, N'X    ', 7, N'3cce77dd-2f62-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 24, N'X    ', 4, N'39ce77dd-2f62-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 27, N'C    ', 3, N'38ce77dd-2f62-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 29, N'X    ', 9, N'3ece77dd-2f62-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 51, N'X    ', 8, N'3dce77dd-2f62-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 52, N'X    ', 10, N'3fce77dd-2f62-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 53, N'A    ', 1, N'36ce77dd-2f62-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 54, N'X    ', 6, N'3bce77dd-2f62-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 55, N'X    ', 5, N'3ace77dd-2f62-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 83, N'A    ', 1, N'2daca4b0-9961-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 87, N'X    ', 9, N'35aca4b0-9961-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 91, N'X    ', 5, N'31aca4b0-9961-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 106, N'A    ', 4, N'30aca4b0-9961-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 120, N'A    ', 3, N'2faca4b0-9961-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 133, N'X    ', 8, N'34aca4b0-9961-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 138, N'X    ', 6, N'32aca4b0-9961-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (1, 139, N'A    ', 2, N'2eaca4b0-9961-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (2, 148, N'B    ', 1, N'8b56879c-d362-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (2, 154, N'X    ', 6, N'9056879c-d362-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (2, 162, N'X    ', 8, N'9256879c-d362-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (2, 164, N'A    ', 3, N'8d56879c-d362-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (2, 166, N'X    ', 10, N'9456879c-d362-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (2, 168, N'X    ', 9, N'9356879c-d362-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (2, 169, N'X    ', 5, N'8f56879c-d362-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (2, 171, N'A    ', 4, N'8e56879c-d362-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (2, 172, N'X    ', 7, N'9156879c-d362-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (2, 173, N'A    ', 2, N'8c56879c-d362-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (3, 21, N'X    ', 1, N'993ddb03-8163-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (3, 23, N'X    ', 2, N'9a3ddb03-8163-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (3, 25, N'X    ', 10, N'a23ddb03-8163-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (3, 27, N'X    ', 7, N'9f3ddb03-8163-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (3, 28, N'X    ', 4, N'9c3ddb03-8163-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (3, 52, N'X    ', 9, N'a13ddb03-8163-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (3, 53, N'X    ', 6, N'9e3ddb03-8163-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (3, 54, N'X    ', 5, N'9d3ddb03-8163-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (3, 57, N'X    ', 3, N'9b3ddb03-8163-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (3, 59, N'X    ', 8, N'a03ddb03-8163-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (4, 21, N'D    ', 4, N'750bbfd9-9363-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (4, 23, N'B    ', 2, N'730bbfd9-9363-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (4, 26, N'X    ', 6, N'770bbfd9-9363-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (4, 27, N'X    ', 5, N'760bbfd9-9363-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (4, 28, N'X    ', 8, N'790bbfd9-9363-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (4, 50, N'X    ', 9, N'7a0bbfd9-9363-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (4, 51, N'A    ', 1, N'720bbfd9-9363-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (4, 52, N'C    ', 3, N'740bbfd9-9363-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (4, 54, N'X    ', 7, N'780bbfd9-9363-ec11-a94e-b07d64b3996b')
INSERT [dbo].[CT_BAITHI] ([IDBD], [CAUHOI], [DACHON], [STT], [rowguid]) VALUES (4, 58, N'X    ', 10, N'7b0bbfd9-9363-ec11-a94e-b07d64b3996b')
SET IDENTITY_INSERT [dbo].[CT_BAITHI] OFF
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [HOCVI], [MAKH], [rowguid]) VALUES (N'TH021   ', N'LE TRONG', N'DAT', N'9,3A, Q.BINH TAN', N'CNTT    ', N'b16c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [HOCVI], [MAKH], [rowguid]) VALUES (N'TH022   ', N'LE PHUOC', N'DAT', N'LONG AN', N'CNTT    ', N'46f5ea6a-c25b-ec11-a94a-b07d64b3996b')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [HOCVI], [MAKH], [rowguid]) VALUES (N'TH023   ', N'LUONG VI', N'PHU', N'TPHCM', N'CNTT    ', N'7739717a-c25b-ec11-a94a-b07d64b3996b')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [HOCVI], [MAKH], [rowguid]) VALUES (N'TH101   ', N'KIEU DAC', N'THIEN', N'AAA', N'CNTT    ', N'404e9ca7-c15b-ec11-a94a-b07d64b3996b')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [HOCVI], [MAKH], [rowguid]) VALUES (N'TH123   ', N'PHAN VAN ', N'HAI', N'15/72 LE VAN THO F8 GO VAP', N'CNTT    ', N'b26c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [HOCVI], [MAKH], [rowguid]) VALUES (N'th202   ', N'PHAM MINH', N'QUANG', N'BR-VT', N'VT      ', N'e58e5298-e25b-ec11-a94a-b07d64b3996b')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [HOCVI], [MAKH], [rowguid]) VALUES (N'TH234   ', N'DAO VAN ', N'TUYET', N'14/7 BUI DINH TUY TAN BINH', N'CNTT    ', N'b36c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HO], [TEN], [HOCVI], [MAKH], [rowguid]) VALUES (N'TH657   ', N'PHAN HONG', N'NGOC', N'TTTTT', N'VT      ', N'b46c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[GIAOVIEN_DANGKY] ([MAGV], [MAMH], [MALOP], [TRINHDO], [NGAYTHI], [LAN], [SOCAUTHI], [THOIGIAN], [rowguid]) VALUES (N'TH123   ', N'AVCB ', N'TH04    ', N'A', CAST(N'2021-12-23 00:00:00.000' AS DateTime), 1, 10, 15, N'dbf68eef-8063-ec11-a94e-b07d64b3996b')
INSERT [dbo].[GIAOVIEN_DANGKY] ([MAGV], [MAMH], [MALOP], [TRINHDO], [NGAYTHI], [LAN], [SOCAUTHI], [THOIGIAN], [rowguid]) VALUES (N'TH123   ', N'AVCB ', N'TH08    ', N'A', CAST(N'2021-12-23 00:00:00.000' AS DateTime), 1, 10, 15, N'bde12748-9363-ec11-a94e-b07d64b3996b')
INSERT [dbo].[GIAOVIEN_DANGKY] ([MAGV], [MAMH], [MALOP], [TRINHDO], [NGAYTHI], [LAN], [SOCAUTHI], [THOIGIAN], [rowguid]) VALUES (N'TH657   ', N'AVCB ', N'VT04    ', N'A', CAST(N'2021-12-21 00:00:00.000' AS DateTime), 1, 10, 15, N'66ca58b9-2e62-ec11-a94e-b07d64b3996b')
INSERT [dbo].[GIAOVIEN_DANGKY] ([MAGV], [MAMH], [MALOP], [TRINHDO], [NGAYTHI], [LAN], [SOCAUTHI], [THOIGIAN], [rowguid]) VALUES (N'TH123   ', N'MMTCB', N'TH05    ', N'A', CAST(N'2021-12-20 00:00:00.000' AS DateTime), 1, 10, 15, N'1dd961b9-4061-ec11-a94e-b07d64b3996b')
INSERT [dbo].[GIAOVIEN_DANGKY] ([MAGV], [MAMH], [MALOP], [TRINHDO], [NGAYTHI], [LAN], [SOCAUTHI], [THOIGIAN], [rowguid]) VALUES (N'TH123   ', N'MMTCB', N'TH05    ', N'B', CAST(N'2021-12-22 00:00:00.000' AS DateTime), 2, 10, 15, N'5fe05791-eb62-ec11-a94e-b07d64b3996b')
INSERT [dbo].[KHOA] ([MAKH], [TENKH], [MACS], [rowguid]) VALUES (N'CNTT    ', N'Công nghệ thông tin', N'CS1', N'af6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[KHOA] ([MAKH], [TENKH], [MACS], [rowguid]) VALUES (N'KT      ', N'KINH TE', N'CS1', N'7f20eff8-ad45-ec11-a941-b07d64b3996b')
INSERT [dbo].[KHOA] ([MAKH], [TENKH], [MACS], [rowguid]) VALUES (N'VT      ', N'Viễn thông', N'CS2', N'b06c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'AT1     ', N'An toàn 1', N'CNTT    ', N'0f0c6ddb-8922-ec11-a934-b07d64b3996b')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'KT1     ', N'KINH TE 1', N'KT      ', N'87216f13-ae45-ec11-a941-b07d64b3996b')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'KT2     ', N'KINH TE 2', N'KT      ', N'7340eee7-d85b-ec11-a94a-b07d64b3996b')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'KT3     ', N'KINH TE 3', N'KT      ', N'503dfa0d-d95b-ec11-a94a-b07d64b3996b')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'TH04    ', N'TIN HOC 2004', N'CNTT    ', N'b66c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'TH05    ', N'TIN HOC 2005', N'CNTT    ', N'b76c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'TH06    ', N'TIN HOC 2006', N'CNTT    ', N'b86c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'TH07    ', N'TIN HOC 2007', N'CNTT    ', N'b96c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'TH08    ', N'TIN HOC 2008', N'CNTT    ', N'ba6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'VT02    ', N'Viễn thông 2', N'VT      ', N'5cde2fc3-2d62-ec11-a94e-b07d64b3996b')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MAKH], [rowguid]) VALUES (N'VT04    ', N'DET MAY 2004', N'VT      ', N'b56c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [rowguid]) VALUES (N'AVCB ', N'ANH VAN CAN BAN', N'a76c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [rowguid]) VALUES (N'CSDL ', N'CO SO DU LIEU', N'a86c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [rowguid]) VALUES (N'CTDL ', N'CAU TRUC DU LIEU', N'a96c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [rowguid]) VALUES (N'HQT  ', N'HE QUAN TRI CSDL', N'aa6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [rowguid]) VALUES (N'KTTSL', N'KY THUAT TRUYEN SO LIEU', N'ab6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [rowguid]) VALUES (N'LTMCB', N'LAP TRINH MANG CO BAN', N'ac6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [rowguid]) VALUES (N'LTW  ', N'LAP TRINH TREN WINDOW', N'ad6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [rowguid]) VALUES (N'MMTCB', N'MANG MAY TINH CAN BAN', N'ae6c2a26-8f14-ec11-a931-b07d64b3996b')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [rowguid]) VALUES (N'QA   ', N'Quan ly du an phan mem', N'174e2916-ad45-ec11-a941-b07d64b3996b')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MALOP], [rowguid], [MATKHAU]) VALUES (N'001     ', N'LE VAN ', N'THANH', CAST(N'1985-03-06 00:00:00.000' AS DateTime), N'23/5 PHUNG KHAC KHOAN F3 Q3', N'TH04    ', N'bb6c2a26-8f14-ec11-a931-b07d64b3996b', N'123')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MALOP], [rowguid], [MATKHAU]) VALUES (N'003     ', N'CAO TUAN', N'KHA', CAST(N'1985-12-06 00:00:00.000' AS DateTime), N'12/5 LE QUANG DINH F5 GO VAP', N'TH04    ', N'bd6c2a26-8f14-ec11-a931-b07d64b3996b', N'123')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MALOP], [rowguid], [MATKHAU]) VALUES (N'004     ', N'HA THANH ', N'BINH', CAST(N'1984-03-24 00:00:00.000' AS DateTime), N'23/4 HOANG HOA THAM', N'TH04    ', N'be6c2a26-8f14-ec11-a931-b07d64b3996b', N'123')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MALOP], [rowguid], [MATKHAU]) VALUES (N'005     ', N'NGUYEN THUY ', N'VAN', CAST(N'1987-11-06 00:00:00.000' AS DateTime), N'7 HUYNH THUC KHANG', N'TH05    ', N'bf6c2a26-8f14-ec11-a931-b07d64b3996b', N'123')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MALOP], [rowguid], [MATKHAU]) VALUES (N'006     ', N'NGUYEN NGOC ', N'YEN', CAST(N'1980-11-23 00:00:00.000' AS DateTime), N'3/5 AN DUONG VUONG', N'TH05    ', N'c06c2a26-8f14-ec11-a931-b07d64b3996b', N'123')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MALOP], [rowguid], [MATKHAU]) VALUES (N'007     ', N'NGUYEN THUY ', N'DUNG', CAST(N'1988-05-23 00:00:00.000' AS DateTime), N'8 HUYNH VAN BANH f1 q binh thanh', N'TH05    ', N'c16c2a26-8f14-ec11-a931-b07d64b3996b', N'123')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MALOP], [rowguid], [MATKHAU]) VALUES (N'008     ', N'TRINH', N'PHONG', CAST(N'1985-12-10 00:00:00.000' AS DateTime), N'GGG', N'TH06    ', N'c26c2a26-8f14-ec11-a931-b07d64b3996b', N'123')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MALOP], [rowguid], [MATKHAU]) VALUES (N'009     ', N'TRAN THANH', N'HUNG', CAST(N'1985-03-28 00:00:00.000' AS DateTime), N'jhjhj', N'TH05    ', N'c36c2a26-8f14-ec11-a931-b07d64b3996b', N'123')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MALOP], [rowguid], [MATKHAU]) VALUES (N'010     ', N'SDFSD', N'SDFSDF', CAST(N'1985-03-26 00:00:00.000' AS DateTime), N'dfsd', N'TH05    ', N'dbafac8c-f94c-ec11-a944-b07d64b3996b', N'123')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MALOP], [rowguid], [MATKHAU]) VALUES (N'011     ', N'PHAN HONG', N'NGOC', CAST(N'1986-01-17 00:00:00.000' AS DateTime), N'PHAN VAN HAN BINH THANH', N'TH05    ', N'c56c2a26-8f14-ec11-a931-b07d64b3996b', N'123')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MALOP], [rowguid], [MATKHAU]) VALUES (N'021     ', N'LE PHUOC', N'DAT', CAST(N'2000-09-28 00:00:00.000' AS DateTime), N'THU THUA, LONG AN', N'VT04    ', N'51c108ca-df5b-ec11-a94a-b07d64b3996b', N'123')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MALOP], [rowguid], [MATKHAU]) VALUES (N'022     ', N'LE TRONG', N'DAT', CAST(N'2000-12-14 00:00:00.000' AS DateTime), N'BRVT', N'KT3     ', N'10f0f661-e05b-ec11-a94a-b07d64b3996b', N'123')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MALOP], [rowguid], [MATKHAU]) VALUES (N'025     ', N'LE TRONG', N'DAT', CAST(N'2000-05-21 00:00:00.000' AS DateTime), N'BR-VT', N'VT04    ', N'ee5cfc95-2d62-ec11-a94e-b07d64b3996b', N'123')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [NGAYSINH], [DIACHI], [MALOP], [rowguid], [MATKHAU]) VALUES (N'050     ', N'LE', N'MINH', CAST(N'2021-12-20 00:00:00.000' AS DateTime), N'ABC', N'TH08    ', N'e9a67f8a-9363-ec11-a94e-b07d64b3996b', N'123')
/****** Object:  Index [MSmerge_index_245575913]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_245575913] ON [dbo].[BANGDIEM]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_277576027]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_277576027] ON [dbo].[BODE]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_COSO]    Script Date: 12/23/2021 11:43:09 PM ******/
ALTER TABLE [dbo].[COSO] ADD  CONSTRAINT [UN_COSO] UNIQUE NONCLUSTERED 
(
	[TENCS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_309576141]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_309576141] ON [dbo].[COSO]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_341576255]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_341576255] ON [dbo].[CT_BAITHI]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_373576369]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_373576369] ON [dbo].[GIAOVIEN]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_405576483]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_405576483] ON [dbo].[GIAOVIEN_DANGKY]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_KHOA]    Script Date: 12/23/2021 11:43:09 PM ******/
ALTER TABLE [dbo].[KHOA] ADD  CONSTRAINT [UN_KHOA] UNIQUE NONCLUSTERED 
(
	[TENKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_437576597]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_437576597] ON [dbo].[KHOA]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_TENLOP]    Script Date: 12/23/2021 11:43:09 PM ******/
ALTER TABLE [dbo].[LOP] ADD  CONSTRAINT [UN_TENLOP] UNIQUE NONCLUSTERED 
(
	[TENLOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_469576711]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_469576711] ON [dbo].[LOP]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_TENMH]    Script Date: 12/23/2021 11:43:09 PM ******/
ALTER TABLE [dbo].[MONHOC] ADD  CONSTRAINT [UN_TENMH] UNIQUE NONCLUSTERED 
(
	[TENMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_MONHOC]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_MONHOC] ON [dbo].[MONHOC]
(
	[MAMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_501576825]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_501576825] ON [dbo].[MONHOC]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_533576939]    Script Date: 12/23/2021 11:43:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_533576939] ON [dbo].[SINHVIEN]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BANGDIEM]  WITH NOCHECK ADD  CONSTRAINT [FK_BANGDIEM_MONHOC] FOREIGN KEY([MAMH])
REFERENCES [dbo].[MONHOC] ([MAMH])
GO
ALTER TABLE [dbo].[BANGDIEM] CHECK CONSTRAINT [FK_BANGDIEM_MONHOC]
GO
ALTER TABLE [dbo].[BANGDIEM]  WITH NOCHECK ADD  CONSTRAINT [FK_BANGDIEM_SINHVIEN1] FOREIGN KEY([MASV])
REFERENCES [dbo].[SINHVIEN] ([MASV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BANGDIEM] CHECK CONSTRAINT [FK_BANGDIEM_SINHVIEN1]
GO
ALTER TABLE [dbo].[BODE]  WITH NOCHECK ADD  CONSTRAINT [FK_BODE_GIAOVIEN] FOREIGN KEY([MAGV])
REFERENCES [dbo].[GIAOVIEN] ([MAGV])
GO
ALTER TABLE [dbo].[BODE] CHECK CONSTRAINT [FK_BODE_GIAOVIEN]
GO
ALTER TABLE [dbo].[BODE]  WITH NOCHECK ADD  CONSTRAINT [FK_BODE_MONHOC] FOREIGN KEY([MAMH])
REFERENCES [dbo].[MONHOC] ([MAMH])
GO
ALTER TABLE [dbo].[BODE] CHECK CONSTRAINT [FK_BODE_MONHOC]
GO
ALTER TABLE [dbo].[CT_BAITHI]  WITH CHECK ADD  CONSTRAINT [FK_CT_BAITHI_BANGDIEM] FOREIGN KEY([IDBD])
REFERENCES [dbo].[BANGDIEM] ([IDBD])
GO
ALTER TABLE [dbo].[CT_BAITHI] CHECK CONSTRAINT [FK_CT_BAITHI_BANGDIEM]
GO
ALTER TABLE [dbo].[CT_BAITHI]  WITH CHECK ADD  CONSTRAINT [FK_CT_BAITHI_BODE] FOREIGN KEY([CAUHOI])
REFERENCES [dbo].[BODE] ([CAUHOI])
GO
ALTER TABLE [dbo].[CT_BAITHI] CHECK CONSTRAINT [FK_CT_BAITHI_BODE]
GO
ALTER TABLE [dbo].[GIAOVIEN]  WITH CHECK ADD  CONSTRAINT [FK_GIAOVIEN_KHOA] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KHOA] ([MAKH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GIAOVIEN] CHECK CONSTRAINT [FK_GIAOVIEN_KHOA]
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY]  WITH CHECK ADD  CONSTRAINT [FK_GIAOVIEN_DANGKY_GIAOVIEN1] FOREIGN KEY([MAGV])
REFERENCES [dbo].[GIAOVIEN] ([MAGV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY] CHECK CONSTRAINT [FK_GIAOVIEN_DANGKY_GIAOVIEN1]
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY]  WITH CHECK ADD  CONSTRAINT [FK_GIAOVIEN_DANGKY_LOP] FOREIGN KEY([MALOP])
REFERENCES [dbo].[LOP] ([MALOP])
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY] CHECK CONSTRAINT [FK_GIAOVIEN_DANGKY_LOP]
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY]  WITH CHECK ADD  CONSTRAINT [FK_GIAOVIEN_DANGKY_MONHOC1] FOREIGN KEY([MAMH])
REFERENCES [dbo].[MONHOC] ([MAMH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY] CHECK CONSTRAINT [FK_GIAOVIEN_DANGKY_MONHOC1]
GO
ALTER TABLE [dbo].[KHOA]  WITH CHECK ADD  CONSTRAINT [FK_KHOA_COSO] FOREIGN KEY([MACS])
REFERENCES [dbo].[COSO] ([MACS])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KHOA] CHECK CONSTRAINT [FK_KHOA_COSO]
GO
ALTER TABLE [dbo].[LOP]  WITH CHECK ADD  CONSTRAINT [FK_LOP_KHOA] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KHOA] ([MAKH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LOP] CHECK CONSTRAINT [FK_LOP_KHOA]
GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_SINHVIEN_LOP] FOREIGN KEY([MALOP])
REFERENCES [dbo].[LOP] ([MALOP])
GO
ALTER TABLE [dbo].[SINHVIEN] CHECK CONSTRAINT [FK_SINHVIEN_LOP]
GO
ALTER TABLE [dbo].[BANGDIEM]  WITH NOCHECK ADD  CONSTRAINT [CK_DIEM] CHECK  (([DIEM]>=(0) AND [DIEM]<=(10)))
GO
ALTER TABLE [dbo].[BANGDIEM] CHECK CONSTRAINT [CK_DIEM]
GO
ALTER TABLE [dbo].[BANGDIEM]  WITH NOCHECK ADD  CONSTRAINT [CK_LANTHI] CHECK  (([LAN]>=(1) AND [LAN]<=(2)))
GO
ALTER TABLE [dbo].[BANGDIEM] CHECK CONSTRAINT [CK_LANTHI]
GO
ALTER TABLE [dbo].[BODE]  WITH NOCHECK ADD  CONSTRAINT [CK_BODE] CHECK  (([TRINHDO]='A' OR [TRINHDO]='B' OR [TRINHDO]='C'))
GO
ALTER TABLE [dbo].[BODE] CHECK CONSTRAINT [CK_BODE]
GO
ALTER TABLE [dbo].[BODE]  WITH NOCHECK ADD  CONSTRAINT [CK_DAPAN] CHECK  (([DAP_AN]='D' OR ([DAP_AN]='C' OR ([DAP_AN]='B' OR [DAP_AN]='A'))))
GO
ALTER TABLE [dbo].[BODE] CHECK CONSTRAINT [CK_DAPAN]
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY]  WITH CHECK ADD  CONSTRAINT [CK_LAN] CHECK  (([LAN]>=(1) AND [LAN]<=(2)))
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY] CHECK CONSTRAINT [CK_LAN]
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY]  WITH CHECK ADD  CONSTRAINT [CK_SOCAUTHI] CHECK  (([SOCAUTHI]>=(10) AND [SOCAUTHI]<=(100)))
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY] CHECK CONSTRAINT [CK_SOCAUTHI]
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY]  WITH CHECK ADD  CONSTRAINT [CK_THOIGIAN] CHECK  (([THOIGIAN]>=(15) AND [THOIGIAN]<=(60)))
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY] CHECK CONSTRAINT [CK_THOIGIAN]
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY]  WITH CHECK ADD  CONSTRAINT [CK_TRINHDO] CHECK  (([TRINHDO]='C' OR ([TRINHDO]='B' OR [TRINHDO]='A')))
GO
ALTER TABLE [dbo].[GIAOVIEN_DANGKY] CHECK CONSTRAINT [CK_TRINHDO]
GO
/****** Object:  StoredProcedure [dbo].[SP_CHUANBITHI]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_CHUANBITHI] (@MAMH NCHAR(5), @TRINHDO NCHAR(1), @SOCAUTHI INT)
AS
BEGIN
	DECLARE @TRINHDO_THAP NCHAR(1), @DEM1 INT, @DEM2 INT, @DEM3 INT, @DEM4 INT, @ErorStr nvarchar(200)

	IF @TRINHDO = 'A'
	BEGIN
		SET @TRINHDO_THAP = 'B'
	END
	IF @TRINHDO = 'B'
	BEGIN
		SET @TRINHDO_THAP = 'C'
	END

	IF @TRINHDO = 'A' OR @TRINHDO = 'B' --  VI DUOI TRINH DO C KHONG CO TRINH DO NAO NUA NEN XET TRUONG HOP RIENG
	BEGIN
		SET @DEM1 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM dbo.KHOA)))
		IF @DEM1 >= @SOCAUTHI -- DU CAU THI
		BEGIN
			--RAISERROR('YES', 16, 1)
			RETURN
		END
		ELSE IF @DEM1 >= (@SOCAUTHI*0.7) -- BEN CS1 %CAU TDA >= 70%, LAY THEM CAU TDB
		BEGIN
			SET @DEM2 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO_THAP AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM dbo.KHOA)))
			IF @DEM2 >= (@SOCAUTHI - @DEM1) -- DU CAU THI
			BEGIN
				--RAISERROR('YES', 16, 1)
				RETURN
			END
			ELSE -- QUA BEN CS2 LAY THEM CAU TDA
			BEGIN
				SET @DEM3 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM dbo.KHOA)))
				IF @DEM3 >= (@SOCAUTHI - @DEM1 - @DEM2) -- DU CAU THI
				BEGIN
					--RAISERROR('YES', 16, 1)
					RETURN
				END
				ELSE -- SO CAU TDA BEN CS2 CHUA DU LAY THEM CAU TDB
				BEGIN
					SET @DEM4 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO_THAP AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM dbo.KHOA)))
					IF @DEM4 >= (@SOCAUTHI - @DEM1 - @DEM2 - @DEM3) -- DU CAU THI
					BEGIN
						--RAISERROR('YES', 16, 1)
						RETURN
					END
					ELSE -- KHONG DU CAU THI, BAO LOI
					BEGIN
						SET @ErorStr = N'Thiếu câu hỏi thi! Thiếu "'+ rtrim(convert(nvarchar(200),@SoCauThi - (@DEM1 + @DEM2 + @DEM3 + @DEM4))) +N'" câu hỏi, cần thêm câu hỏi vào trình độ hiện tại (hoặc thấp hơn 1 bậc)!' 
						RAISERROR(@ErorStr, 16, 1)
						RETURN
					END
				END
			END
		END
		ELSE -- BEN CS1 %CAU TDA < 70%, LAY THEM CAU TDA BEN CS2
		BEGIN
			SET @DEM2 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM dbo.KHOA)))
			IF @DEM2 >= (@SOCAUTHI - @DEM1) -- DU CAU THI
			BEGIN
				--RAISERROR('YES', 16, 1)
				RETURN
			END
			ELSE IF @DEM2 >= (@SOCAUTHI*0.7 - @DEM1) -- %CAU TDA (CS1 + CS2) >= 70%, LAY CAU TDB BEN CS1 THEM
			BEGIN
				SET @DEM3 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO_THAP AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM dbo.KHOA)))
				IF @DEM3 >= (@SOCAUTHI - @DEM1 - @DEM2) -- DU CAU THI
				BEGIN
					--RAISERROR('YES', 16, 1)
					RETURN
				END
				ELSE -- CAU TDB BEN CS1 CHUA DU, LAY THEM CAU TDB BEN CS2
				BEGIN
					SET @DEM4 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO_THAP AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM dbo.KHOA)))
					IF @DEM4 >= (@SOCAUTHI - @DEM1 - @DEM2 - @DEM3) -- DU CAU THI
					BEGIN
						--RAISERROR('YES', 16, 1)
						RETURN
					END
					ELSE -- KHONG DU CAU THI, BAO LOI
					BEGIN
						SET @ErorStr = N'Thiếu câu hỏi thi! Thiếu "'+ rtrim(convert(nvarchar(200),@SoCauThi - (@DEM1 + @DEM2 + @DEM3 + @DEM4))) +N'" câu hỏi, cần thêm câu hỏi vào trình độ hiện tại (hoặc thấp hơn 1 bậc)!' 
						RAISERROR(@ErorStr, 16, 1)
						RETURN
					END
				END
			END
			ELSE -- %CAU TDA (CS1 + CS2) < 70% => KHONG DU CAU THI, BAO LOI
			BEGIN
				SET @ErorStr = N'Thiếu câu hỏi thi! Thiếu "'+ rtrim(convert(nvarchar(200),FLOOR(@SoCauThi*0.7) - (@DEM1 + @DEM2))) +N'" câu hỏi cùng trình độ để đủ chỉ tiêu ít nhất 70 phần trăm câu hỏi cùng trình độ!' 
				RAISERROR(@ErorStr, 16, 1)
				RETURN
			END
		END
	END
	ELSE -- TRINH DO C
	BEGIN
		SET @DEM1 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM dbo.KHOA)))
		IF @DEM1 >= @SOCAUTHI -- DU CAU THI
		BEGIN
			--RAISERROR('YES', 16, 1)
			RETURN
		END
		ELSE  -- BEN CS1 CHUA DU CAU THI
		BEGIN
			SET @DEM2 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM dbo.KHOA)))
			IF @DEM2 >= @SOCAUTHI - @DEM1 -- BEN CS2 + CS1 DU CAU THI
			BEGIN
				--RAISERROR('YES', 16, 1)
				RETURN
			END
			ELSE -- KHONG DU CAU THI, BAO LOI
			BEGIN
				SET @ErorStr = N'Thiếu câu hỏi thi! Thiếu "'+ rtrim(convert(nvarchar(200),@SoCauThi - (@DEM1 + @DEM2))) +N'" câu hỏi cùng trình độ !' 
				RAISERROR(@ErorStr, 16, 1)
				RETURN
			END
		END
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DSDKThi]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DSDKThi]
	@NGAY1 DATETIME,
	@NGAY2 DATETIME
AS
BEGIN
	DECLARE @Table TABLE(MALOP NCHAR(8), MAMH NCHAR(5), MAGV NCHAR(8), SOCAUTHI INT, NGAYTHI DATETIME ,DATHI NCHAR(1))

	INSERT INTO @Table SELECT MALOP, MAMH, MAGV, SOCAUTHI, NGAYTHI ,[dbo].[FN_KTDaThi](GIAOVIEN_DANGKY.MAMH, GIAOVIEN_DANGKY.MALOP, LAN) AS DATHI
	FROM dbo.GIAOVIEN_DANGKY
	WHERE NGAYTHI BETWEEN @NGAY1 AND @NGAY2

	SELECT TENLOP, TENMH, HO + ' ' + TEN AS HOTEN, SOCAUTHI, NGAYTHI, DATHI
	FROM @Table JOIN dbo.LOP ON LOP.MALOP = [@Table].MALOP
	JOIN dbo.MONHOC ON MONHOC.MAMH = [@Table].MAMH
	JOIN dbo.GIAOVIEN ON GIAOVIEN.MAGV = [@Table].MAGV
	ORDER BY NGAYTHI
END




GO
/****** Object:  StoredProcedure [dbo].[SP_KTBangDiemNULL]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_KTBangDiemNULL]
	@MAMH NCHAR(5),
	@LAN SMALLINT,
	@MALOP NCHAR(8)
AS
BEGIN
	IF EXISTS(
		SELECT SINHVIEN.MASV, HO, TEN, DIEM
		FROM dbo.SINHVIEN JOIN dbo.BANGDIEM
		ON BANGDIEM.MASV = SINHVIEN.MASV
		WHERE BANGDIEM.MAMH = @MAMH AND BANGDIEM.LAN = @LAN AND SINHVIEN.MALOP = @MALOP
	)
	BEGIN
		RETURN 1
	END
	ELSE
		RAISERROR('Chưa có bảng điểm môn này!', 16, 1)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_KTDATHI]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_KTDATHI] (@MASV NCHAR(8), @MAMH NCHAR(5), @LAN INT)
AS
BEGIN
	IF EXISTS(SELECT * FROM dbo.BANGDIEM WHERE MAMH = @MAMH AND MASV = @MASV AND LAN = @LAN)
		RAISERROR ('Lỗi! Môn này đã thi!', 16, 1)
	ELSE
		RETURN 1
END


GO
/****** Object:  StoredProcedure [dbo].[SP_KTKetQuaNULL]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_KTKetQuaNULL]
	@MASV NCHAR(8),
	@MAMH NCHAR(5),
	@LAN SMALLINT
AS
BEGIN
	IF EXISTS (
		SELECT STT, BODE.CAUHOI, NOIDUNG, A, B, C, D, DAP_AN, DACHON 
		FROM dbo.CT_BAITHI JOIN dbo.BODE 
		ON BODE.CAUHOI = CT_BAITHI.CAUHOI 
		WHERE IDBD IN (SELECT IDBD FROM dbo.BANGDIEM WHERE MASV = @MASV AND MAMH = @MAMH AND LAN = @LAN)
	)
	BEGIN
		RETURN 1
	END
	ELSE
    BEGIN
    	RAISERROR('Chưa thi môn này!', 16, 1)
    END
END	

GO
/****** Object:  StoredProcedure [dbo].[SP_KTLapLichThi]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_KTLapLichThi]
	@MAMH NCHAR(5), 
	@MALOP NCHAR(8), 
	@LAN int,
	@NGAYTHI VARCHAR(10)
AS
BEGIN
	IF EXISTS(SELECT * FROM dbo.GIAOVIEN_DANGKY WHERE MAMH = @MAMH AND MALOP = @MALOP AND LAN = @LAN)
	BEGIN
		RAISERROR('Đã lập lịch thi cho môn này!', 16, 1)
		RETURN
	END
    
	--nếu như chưa đăng ký 
	--nếu là lần 2 thì kiểm tra nó có lớn hơn ngày thi lần 1 ko
	IF(@LAN = 2)
	BEGIN
		IF NOT EXISTS(
		SELECT * 
		FROM dbo.BANGDIEM 
		WHERE MAMH = @MAMH AND LAN = 1 AND MASV IN(SELECT MASV FROM SINHVIEN WHERE MALOP = @MALOP))
		BEGIN
			RAISERROR('Lần 1 chưa thi, không được đăng ký lần 2!', 16, 1)
			RETURN
		END

		IF NOT EXISTS(SELECT * FROM dbo.GIAOVIEN_DANGKY WHERE MAMH = @MAMH AND MALOP = @MALOP AND LAN = 1 AND NGAYTHI < Convert(datetime, @NGAYTHI))
		BEGIN
			RAISERROR('Ngày thi lần 2 phải lớn hơn ngày thi của lần 1!', 16, 1)
			RETURN
		END
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_KTLichThiDaThi]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_KTLichThiDaThi] (@MAMH NCHAR(5) ,@MALOP NCHAR(8), @LAN SMALLINT)
AS
BEGIN
	IF EXISTS(
		SELECT * 
		FROM dbo.BANGDIEM
		WHERE MAMH = @MAMH AND LAN = @LAN AND MASV IN(SELECT MASV FROM SINHVIEN WHERE MALOP = @MALOP))
	BEGIN
		RAISERROR('Sinh viên đã thi! Không được phép hiệu chỉnh!', 16, 1)
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_KTMaLop]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_KTMaLop]
	@MALOP NCHAR(8)
AS
BEGIN
	IF EXISTS(SELECT * FROM dbo.SINHVIEN WHERE MALOP = @MALOP)
	BEGIN
		RETURN 1
	END
	ELSE
    BEGIN
    	RAISERROR('Sinh viên không thuộc lớp này!', 16, 1)
    END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LayNgayThi]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LayNgayThi] (@MASV NCHAR(8), @MAMH NCHAR(5), @LAN INT)
AS
BEGIN
SELECT Convert(varchar, NGAYTHI) FROM dbo.BANGDIEM WHERE MASV = @MASV AND MAMH = @MAMH AND LAN = @LAN
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_PhucHoiSuaGV]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_PhucHoiSuaGV](@MaGV char(8), @OldHo varchar(40), @OldTen varchar(10), @OldHocVi varchar(50), @OldMaKH nchar(8))
as

begin
	declare @ErorStr nvarchar(200)

	--khoá chính ko đc sửa nên ko kiểm tra

	--khoá ngoại
	--mã khoa đc phép sửa, nên khi sửa thì có thể khoa đó hết giáo viên -> khoa đc xoá, vậy nên phải ktra mã khoa
	--nếu có người xoá mã khoa của giáo viên này thì ko thể sửa giáo viên này lại
	if not exists(SELECT MAKH FROM  dbo.KHOA WHERE MAKH = @OldMaKH)
		begin
			set @ErorStr = N'Phục hồi sửa thất bại! Mã khoa cũ "'+ rtrim(convert(nvarchar(200),@OldMaKH)) +N'" đã sửa lúc trước bây giờ không tồn tại nữa nên không thể sửa! Đã có người khác hiệu chỉnh!' 
			raiserror (@ErorStr,16,1)
			return
		end	

	update [dbo].[GIAOVIEN] set HO = @OldHo, TEN = @OldTen, HOCVI = @OldHocVi, MAKH = @OldMaKH
	where MAGV = @MaGV
end

GO
/****** Object:  StoredProcedure [dbo].[SP_PhucHoiSuaMH]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_PhucHoiSuaMH](@MaMH char(5), @NewTenMH nvarchar(50), @OldTenMH nvarchar(50))
as
begin
	declare @ErorStr nvarchar(200)

	--còn 1 trường hợp làm cho sp sửa lỗi đó là ai đó xoá mã cái môn học đã sửa, chỉ cần xét mã vì câu lệnh update chỉ cần mã
	if not exists(SELECT MAMH FROM  dbo.MONHOC WHERE MAMH = @MaMH)
		begin
			set @ErorStr = N'Phục hồi sửa thất bại! Mã môn học mới"'+ rtrim(convert(nvarchar(200),@MaMH)) +N'" đã sửa lúc trước không tồn tại nên không thể sửa! Đã có người khác hiệu chỉnh!' 
			raiserror (@ErorStr,16,1)
			return
		end	
	
	--nếu như tên môn học cũ và mới bằng nhau thì khỏi ktra trùng làm gì, còn nếu khác thì kiểm tra cái tên mh cũ có tồn tại chưa để còn sửa thành nó
   	if (@NewTenMH != @OldTenMH)
		if exists(SELECT TENMH FROM  dbo.MONHOC WHERE TENMH = @OldTenMH)
			begin
				set @ErorStr = N'Phục hồi sửa thất bại! Tên môn học cũ"'+ rtrim(convert(nvarchar(200),@OldTenMH)) +N'" đã sửa lúc trước đang tồn tại nên không thể sửa! Đã có người khác hiệu chỉnh!' 
				raiserror (@ErorStr,16,1)
				return
			end	
	
	update [dbo].[MONHOC] set TENMH = @OldTenMH where MAMH = @MaMH
end

GO
/****** Object:  StoredProcedure [dbo].[SP_PhucHoiSuaSV]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_PhucHoiSuaSV](@MaSV char(8), @OldHo nvarchar(50), @OldTen nvarchar(10), @OldNgaySinh char(10), @OldDiaChi nvarchar(500), @OldMaLop char(8))
as

begin
	declare @ErorStr nvarchar(200)

	--khoá chính ko đc sửa nên ko kiểm tra

	--khoá ngoại
	--mã lớp đc phép sửa, nên khi sửa thì có thể lớp đó hết sinh viên -> lớp đc xoá, vậy nên phải ktra mã lớp
	--nếu có người xoá mã khoa của giáo viên này thì ko thể sửa giáo viên này lại
	if not exists(SELECT MALOP FROM  dbo.LOP WHERE MALOP = @OldMaLop)
		begin
			set @ErorStr = N'Phục hồi sửa thất bại! Mã lớp cũ "'+ rtrim(convert(nvarchar(200),@OldMaLop)) +N'" đã sửa lúc trước bây giờ không tồn tại nữa nên không thể sửa! Đã có người khác hiệu chỉnh!' 
			raiserror (@ErorStr,16,1)
			return
		end	

	update [dbo].[SINHVIEN] set HO = @OldHo, TEN = @OldTen, NGAYSINH = @OldNgaySinh, DIACHI = @OldDiaChi, MALOP = @OldMaLop
	where MASV = @MaSV
end

GO
/****** Object:  StoredProcedure [dbo].[SP_PhucHoiThemGV]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_PhucHoiThemGV](@NewMaGV char(8))
as

begin
	declare @ErorStr nvarchar(200)

	--đã thêm thì giờ xoá, kiếm thấy mã giáo viên thì mới xoá đc
	if exists(SELECT MAGV FROM  dbo.GIAOVIEN WHERE MAGV = @NewMaGV)		
   			delete  dbo.GIAOVIEN where MAGV = @NewMaGV
	else
		begin
			set @ErorStr = N'Phục hồi thêm thất bại! Mã giáo viên "'+ rtrim(convert(nvarchar(200),@NewMaGV)) +N'" đã thêm bây giờ không tồn tại nên không thể xoá! Đã có người khác hiệu chỉnh!' 
			raiserror (@ErorStr,16,1)
		end	
end

GO
/****** Object:  StoredProcedure [dbo].[SP_PhucHoiThemMH]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_PhucHoiThemMH](@NewMaMH char(5))
as

begin
	declare @ErorStr nvarchar(200)

	--đã thêm thì giờ xoá, kiếm thấy mã môn học thì mới xoá đc
	if exists(SELECT MAMH FROM  dbo.MONHOC WHERE MAMH = @NewMaMH)		
   			delete  dbo.MONHOC where MAMH = @NewMaMH
	else
		begin
			set @ErorStr = N'Phục hồi thêm thất bại! Mã môn học "'+ rtrim(convert(nvarchar(200),@NewMaMH)) +N'" đã thêm bây giờ không tồn tại nên không thể xoá! Đã có người khác hiệu chỉnh!' 
			raiserror (@ErorStr,16,1)
		end	
end

GO
/****** Object:  StoredProcedure [dbo].[SP_PhucHoiThemSV]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_PhucHoiThemSV](@NewMaSV char(8))
as

begin
	declare @ErorStr nvarchar(200)

	--đã thêm thì giờ xoá, kiếm thấy mã sinh viên thì mới xoá đc
	if exists(SELECT MASV FROM  dbo.SINHVIEN WHERE MASV = @NewMaSV)		
   			delete  dbo.SINHVIEN where MASV = @NewMaSV
	else
		begin
			set @ErorStr = N'Phục hồi thêm thất bại! Mã sinh viên "'+ rtrim(convert(nvarchar(200),@NewMaSV)) +N'" đã thêm bây giờ không tồn tại nên không thể xoá! Đã có người khác hiệu chỉnh!' 
			raiserror (@ErorStr,16,1)
		end	
end

GO
/****** Object:  StoredProcedure [dbo].[SP_PhucHoiXoaGV]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_PhucHoiXoaGV](@MaGV char(8), @Ho varchar(40), @Ten varchar(10), @HocVi varchar(50), @MaKH nchar(8))
as

begin
	declare @ErorStr nvarchar(200)

	--nếu như định thêm lại nhưng mã giáo viên đã xoá đang có
	if exists(SELECT MAGV FROM  dbo.GIAOVIEN WHERE MAGV = @MaGV)
		begin
			set @ErorStr = N'Phục hồi xoá thất bại! Mã giáo viên "'+ rtrim(convert(nvarchar(200),@MaGV)) +N'" đã xoá đang tồn tại nên không thể thêm! Đã có người khác hiệu chỉnh!' 
			raiserror (@ErorStr,16,1)
			return
		end	
	--khoá ngoại
	--xoá giáo viên thì có thể khoa ko còn giáo viên -> khoa có thể bị xoá
	--nếu có người xoá mã khoa của giáo viên này thì ko thể thêm giáo viên này  lại
	if not exists(SELECT MAKH FROM  dbo.KHOA WHERE MAKH = @MaKH)
		begin
			set @ErorStr = N'Phục hồi xoá thất bại! Mã khoa "'+ rtrim(convert(nvarchar(200),@MaKH)) +N'" đã xoá lúc trước bây giờ không tồn tại nữa nên không thể thêm! Đã có người khác hiệu chỉnh!' 
			raiserror (@ErorStr,16,1)
			return
		end	
		
	insert into [dbo].[GIAOVIEN] (MAGV,HO, TEN,HOCVI,MAKH) 
	values (@MaGV ,  @Ho , @Ten , @HocVi , @MaKH)
end

GO
/****** Object:  StoredProcedure [dbo].[SP_PhucHoiXoaMH]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_PhucHoiXoaMH](@MaMH char(5), @TenMH nvarchar(50))
as

begin
	declare @ErorStr nvarchar(200)

	--ko có khoá ngoại nên ko ktra khoá ngoại
	--nếu như định thêm lại nhưng mã môn học đã xoá đang có
	if exists(SELECT MAMH FROM  dbo.MONHOC WHERE MAMH = @MaMH)
		begin
			set @ErorStr = N'Phục hồi xoá thất bại! Mã môn học "'+ rtrim(convert(nvarchar(200),@MaMH)) +N'" đã xoá đang tồn tại nên không thể thêm! Đã có người khác hiệu chỉnh!' 
			raiserror (@ErorStr,16,1)
			return
		end	
	--nếu như định thêm lại nhưng tên môn học đã xoá đang có		
   	if exists(SELECT TENMH FROM  dbo.MONHOC WHERE TENMH = @TenMH)
		begin
			set @ErorStr = N'Phục hồi xoá thất bại! Tên môn học "'+ rtrim(convert(nvarchar(200),@TenMH)) +N'" đã xoá đang tồn tại nên không thể thêm! Đã có người khác hiệu chỉnh!' 
			raiserror (@ErorStr,16,1)
			return
		end		
	
	insert into [dbo].[MONHOC] ( MAMH, TENMH ) values (@MaMH, @TenMH)
end

GO
/****** Object:  StoredProcedure [dbo].[SP_PhucHoiXoaSV]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_PhucHoiXoaSV](@MaSV char(8), @Ho nvarchar(50), @Ten nvarchar(10), @NgaySinh char(10), @DiaChi nvarchar(500), @MaLop char(8))
as

begin
	declare @ErorStr nvarchar(200)

	--nếu như định thêm lại nhưng mã sinh viên đã xoá đang có
	if exists(SELECT MASV FROM  dbo.SINHVIEN WHERE MASV = @MaSV)
		begin
			set @ErorStr = N'Phục hồi xoá thất bại! Mã sinh viên "'+ rtrim(convert(nvarchar(200),@MaSV)) +N'" đã xoá đang tồn tại nên không thể thêm! Đã có người khác hiệu chỉnh!' 
			raiserror (@ErorStr,16,1)
			return
		end	
	--khoá ngoại
	--xoá sinh viên thì có thể lớp ko còn sinh viên -> lớp có thể bị xoá
	--nếu có người xoá mã lớp của sinh viên này thì ko thể thêm sinh viên này  lại
	if not exists(SELECT MALOP FROM  dbo.LOP WHERE MALOP = @MaLop)
		begin
			set @ErorStr = N'Phục hồi xoá thất bại! Mã lớp "'+ rtrim(convert(nvarchar(200),@MaLop)) +N'" đã xoá lúc trước bây giờ không tồn tại nữa nên không thể thêm! Đã có người khác hiệu chỉnh!' 
			raiserror (@ErorStr,16,1)
			return
		end	
		
	insert into [dbo].[SINHVIEN] (MASV,HO, TEN,NGAYSINH,DIACHI,MALOP) 
	values (@MaSV ,  @Ho , @Ten , @NgaySinh , @DiaChi, @MaLop)
end

GO
/****** Object:  StoredProcedure [dbo].[SP_TaoTaiKhoan]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TaoTaiKhoan] 
  @LGNAME VARCHAR(50),
  @PASS VARCHAR(50),
  @USERNAME VARCHAR(50),
  @ROLE VARCHAR(50)
AS
BEGIN
  DECLARE @RET INT
  EXEC @RET= SP_ADDLOGIN @LGNAME, @PASS, 'TN_CSDLPT'                     

  IF (@RET =1)  -- LOGIN NAME BI TRUNG
     RAISERROR('Login name bị trùng', 16, 1)

  EXEC @RET= SP_GRANTDBACCESS @LGNAME, @USERNAME
  IF (@RET =1)  -- USER  NAME BI TRUNG
  BEGIN
       EXEC SP_DROPLOGIN @LGNAME
	   RAISERROR('User name bị trùng', 16, 1)
  END
  EXEC sp_addrolemember @ROLE, @USERNAME

  IF @ROLE= 'TRUONG'
	BEGIN
		EXEC sp_addsrvrolemember @LGNAME, 'sysadmin'
		EXEC sp_addsrvrolemember @LGNAME, 'SecurityAdmin'
		EXEC sp_addsrvrolemember @LGNAME, 'ProcessAdmin'
	END
  IF @ROLE= 'COSO'
	BEGIN
		EXEC sp_addsrvrolemember @LGNAME, 'sysadmin'
		EXEC sp_addsrvrolemember @LGNAME, 'SecurityAdmin'
		EXEC sp_addsrvrolemember @LGNAME, 'ProcessAdmin'
	END 
  IF @ROLE= 'GIANGVIEN'
	BEGIN  
		EXEC sp_addsrvrolemember @LGNAME, 'ProcessAdmin'
	END
	RETURN 0  -- THANH CONG
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THI]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_THI] (@MAMH CHAR(5), @TRINHDO CHAR(1), @SOCAUTHI SMALLINT)
AS
BEGIN
	DECLARE @TRINHDO_THAP NCHAR(1), @DEM1 INT, @DEM2 INT, @DEM3 INT, @DEM4 INT, @ErorStr nvarchar(200)

	CREATE TABLE #TAM (
		CAUHOI INT,
		MAMH CHAR(5),
		TRINHDO CHAR(1),
		NOIDUNG NVARCHAR(500),
		A NVARCHAR(100),
		B NVARCHAR(100),
		C NVARCHAR(100),
		D NVARCHAR(100),
		DAP_AN CHAR(1),
		MAGV CHAR(8)
	);

	IF @TRINHDO = 'A'
	BEGIN
		SET @TRINHDO_THAP = 'B'
	END
	IF @TRINHDO = 'B'
	BEGIN
		SET @TRINHDO_THAP = 'C'
	END

	IF @TRINHDO = 'A' OR @TRINHDO = 'B' --  VI DUOI TRINH DO C KHONG CO TRINH DO NAO NUA NEN XET TRUONG HOP RIENG
	BEGIN
		SET @DEM1 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM dbo.KHOA)))
		IF @DEM1 >= @SOCAUTHI -- DU CAU THI
		BEGIN
			--RAISERROR('YES', 16, 1)
			--DEM1 >= 100%
			INSERT INTO #TAM SELECT TOP (@SOCAUTHI) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM BODE  WHERE TRINHDO = @TRINHDO AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID()
		END
		ELSE IF @DEM1 >= FLOOR(@SOCAUTHI*0.7) -- BEN CS1 %CAU TDA >= 70%, LAY THEM CAU TDB
		BEGIN
			--LAY HET DEM1 ( 100% > DEM1 >= 70% )
			INSERT INTO #TAM SELECT TOP (@DEM1) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM dbo.BODE WHERE TRINHDO = @TRINHDO AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID()
			
			SET @DEM2 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO_THAP AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM dbo.KHOA)))
			IF @DEM2 >= (@SOCAUTHI - @DEM1) -- DU CAU THI
			BEGIN
				--RAISERROR('YES', 16, 1)
				--DA CO DEM1, DEM1+DEM2 >= 100%, LAY VUA DU DEM2
				INSERT INTO #TAM SELECT TOP (@SOCAUTHI - @DEM1) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM dbo.BODE WHERE TRINHDO = @TRINHDO_THAP AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID()
			END
			ELSE -- QUA BEN CS2 LAY THEM CAU TDA
			BEGIN
				--DA CO DEM1, LAY HET DEM2
				INSERT INTO #TAM SELECT TOP (@DEM2) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM dbo.BODE WHERE TRINHDO = @TRINHDO_THAP AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID()
				 
				SET @DEM3 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM dbo.KHOA)))
				IF @DEM3 >= (@SOCAUTHI - @DEM1 - @DEM2) -- DU CAU THI
				BEGIN
					--RAISERROR('YES', 16, 1)
					--DA CO DEM1, DEM2, LAY VUA DU DEM3
					INSERT INTO #TAM SELECT TOP (@SOCAUTHI - @DEM1 - @DEM2) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM dbo.BODE WHERE TRINHDO = @TRINHDO AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID()
				END
				ELSE -- SO CAU TDA BEN CS2 CHUA DU LAY THEM CAU TDB
				BEGIN
					--DA CO DEM1, DEM2, LAY HET DEM3
					INSERT INTO #TAM SELECT TOP (@DEM3) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM dbo.BODE WHERE TRINHDO = @TRINHDO AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID()

					SET @DEM4 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO_THAP AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM dbo.KHOA)))
					IF @DEM4 >= (@SOCAUTHI - @DEM1 - @DEM2 - @DEM3) -- DU CAU THI
					BEGIN
						--RAISERROR('YES', 16, 1)
						--DA CO DEM1, DEM2, DEM3, LAY VUA DU DEM4
						INSERT INTO #TAM SELECT TOP (@SOCAUTHI - @DEM1 - @DEM2 - @DEM3) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM dbo.BODE WHERE TRINHDO = @TRINHDO_THAP AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID()
					END
					ELSE -- KHONG DU CAU THI, BAO LOI
					BEGIN
						SET @ErorStr = N'Thiếu câu hỏi thi! Thiếu "'+ rtrim(convert(nvarchar(200),@SoCauThi - (@DEM1 + @DEM2 + @DEM3 + @DEM4))) +N'" câu hỏi, cần thêm câu hỏi vào trình độ hiện tại (hoặc thấp hơn 1 bậc)!' 
						RAISERROR(@ErorStr, 16, 1)
						RETURN
					END
				END
			END
		END
		ELSE -- BEN CS1 %CAU TDA < 70%, LAY THEM CAU TDA BEN CS2
		BEGIN
			--LAY HET DEM1
			INSERT INTO #TAM SELECT TOP (@DEM1) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM dbo.BODE WHERE TRINHDO = @TRINHDO AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID()

			SET @DEM2 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM dbo.KHOA)))
			IF @DEM2 >= (@SOCAUTHI - @DEM1) -- DU CAU THI
			BEGIN
				--RAISERROR('YES', 16, 1)
				--DA CO DEM1, LAY VUA DU DEM2
				INSERT INTO #TAM SELECT TOP (@SOCAUTHI - @DEM1) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM dbo.BODE WHERE TRINHDO = @TRINHDO AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID()
			END
			ELSE IF @DEM2 >= (FLOOR(@SOCAUTHI*0.7) - @DEM1) -- %CAU TDA (CS1 + CS2) >= 70%, LAY CAU TDB BEN CS1 THEM
			BEGIN
				--DA CO DEM1, LAY HET DEM2
				INSERT INTO #TAM SELECT TOP (@DEM2) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM dbo.BODE WHERE TRINHDO = @TRINHDO AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID()

				SET @DEM3 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO_THAP AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM dbo.KHOA)))
				IF @DEM3 >= (@SOCAUTHI - @DEM1 - @DEM2) -- DU CAU THI
				BEGIN
					--RAISERROR('YES', 16, 1)
					--DA CO DEM1, DEM2, LAY VUA DU DEM3
					INSERT INTO #TAM SELECT TOP (@SOCAUTHI - @DEM1 - @DEM2) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM dbo.BODE WHERE TRINHDO = @TRINHDO_THAP AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID()
				END
				ELSE -- CAU TDB BEN CS1 CHUA DU, LAY THEM CAU TDB BEN CS2
				BEGIN
					--DA CO DEM1, DEM2, LAY HET DEM3
					INSERT INTO #TAM SELECT TOP (@DEM3) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM dbo.BODE WHERE TRINHDO = @TRINHDO_THAP AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID()

					SET @DEM4 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO_THAP AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM dbo.KHOA)))
					IF @DEM4 >= (@SOCAUTHI - @DEM1 - @DEM2 - @DEM3) -- DU CAU THI
					BEGIN
						--RAISERROR('YES', 16, 1)
						--DA CO DEM1, DEM2, DEM3, LAY VUA DU DEM4
						INSERT INTO #TAM SELECT TOP (@SOCAUTHI - @DEM1 - @DEM2 - @DEM3) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM dbo.BODE WHERE TRINHDO = @TRINHDO_THAP AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID()
					END
					ELSE -- KHONG DU CAU THI, BAO LOI
					BEGIN
						SET @ErorStr = N'Thiếu câu hỏi thi! Thiếu "'+ rtrim(convert(nvarchar(200),@SoCauThi - (@DEM1 + @DEM2 + @DEM3 + @DEM4))) +N'" câu hỏi, cần thêm câu hỏi vào trình độ hiện tại (hoặc thấp hơn 1 bậc)!' 
						RAISERROR(@ErorStr, 16, 1)
						RETURN
					END
				END
			END
			ELSE -- %CAU TDA (CS1 + CS2) < 70% => KHONG DU CAU THI, BAO LOI
			BEGIN
				SET @ErorStr = N'Thiếu câu hỏi thi! Thiếu "'+ rtrim(convert(nvarchar(200),FLOOR(@SoCauThi*0.7) - (@DEM1 + @DEM2))) +N'" câu hỏi cùng trình độ để đủ chỉ tiêu ít nhất 70 phần trăm câu hỏi cùng trình độ!' 
				RAISERROR(@ErorStr, 16, 1)
				RETURN
			END
		END
	END
	ELSE -- TRINH DO C
	BEGIN
		SET @DEM1 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM dbo.KHOA)))
		IF @DEM1 >= @SOCAUTHI -- DU CAU THI
		BEGIN
			--RAISERROR('YES', 16, 1)
			--LAY VUA DU DEM1
			INSERT INTO #TAM SELECT TOP (@SOCAUTHI) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM dbo.BODE  WHERE TRINHDO = @TRINHDO AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID() 
		END
		ELSE  -- BEN CS1 CHUA DU CAU THI
		BEGIN
			--LAY HET DEM1
			INSERT INTO #TAM SELECT TOP (@DEM1) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM dbo.BODE  WHERE TRINHDO = @TRINHDO AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID() 

			SET @DEM2 = (SELECT COUNT(*) FROM dbo.BODE WHERE MAMH = @MAMH AND TRINHDO = @TRINHDO AND MAGV IN (SELECT MAGV FROM dbo.GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM dbo.KHOA)))
			IF @DEM2 >= @SOCAUTHI - @DEM1 -- BEN CS2 + CS1 DU CAU THI
			BEGIN
				--RAISERROR('YES', 16, 1)
				--DA CO DEM1, LAY VUA DU DEM2
				INSERT INTO #TAM SELECT TOP (@SOCAUTHI - @DEM1) CAUHOI, MAMH, TRINHDO, NOIDUNG, A, B, C, D, DAP_AN, MAGV FROM dbo.BODE  WHERE TRINHDO = @TRINHDO AND MAMH = @MAMH AND MAGV IN (SELECT MAGV FROM GIAOVIEN WHERE MAKH NOT IN (SELECT MAKH FROM KHOA)) ORDER BY NEWID() 
			END
			ELSE -- KHONG DU CAU THI, BAO LOI
			BEGIN
				SET @ErorStr = N'Thiếu câu hỏi thi! Thiếu "'+ rtrim(convert(nvarchar(200),@SoCauThi - (@DEM1 + @DEM2))) +N'" câu hỏi cùng trình độ !' 
				RAISERROR(@ErorStr, 16, 1)
				RETURN
			END
		END
	END

	SELECT * FROM #TAM ORDER BY NEWID() 
END

GO
/****** Object:  StoredProcedure [dbo].[SP_THONGTINDANGNHAP]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THONGTINDANGNHAP]
@TENLOGIN NVARCHAR (50)
AS
DECLARE @TENUSER NVARCHAR(50)
SELECT @TENUSER = NAME FROM sys.sysusers WHERE sid = SUSER_SID(@TENLOGIN)
 
 SELECT USERNAME = @TENUSER, 
  HOTEN = (SELECT HO + ' ' + TEN FROM dbo.GIAOVIEN  WHERE MAGV = @TENUSER),
   TENNHOM = NAME
   FROM sys.sysusers 
   WHERE UID = (SELECT GROUPUID 
                 FROM SYS.SYSMEMBERS 
                   WHERE MEMBERUID = (SELECT UID FROM sys.sysusers 
                                      WHERE NAME = @TENUSER))

GO
/****** Object:  StoredProcedure [dbo].[SP_TIMBD]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_TIMBD] (@MAMH CHAR(5), @MASV CHAR(8), @LAN SMALLINT, @NGAYTHI DATETIME)
AS
BEGIN
	SELECT IDBD FROM dbo.BANGDIEM WHERE MAMH = @MAMH AND MASV = @MASV AND LAN = @LAN AND NGAYTHI = @NGAYTHI
END

GO
/****** Object:  StoredProcedure [dbo].[SP_TimIDBangDiem]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[SP_TimIDBangDiem]
AS
BEGIN
	SELECT ISNULL(MAX(IDBD), 0) + 1 FROM BANGDIEM
END


GO
/****** Object:  StoredProcedure [dbo].[SP_TimMaBoDe]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_TimMaBoDe]
AS
BEGIN
	SELECT MAX(CAUHOI)+1 FROM dbo.BODE
END

GO
/****** Object:  StoredProcedure [dbo].[SP_TIMSV]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TIMSV] (@MASV CHAR(8),@MATKHAU varchar(20))
AS
BEGIN
SELECT MASV, HO, TEN, NGAYSINH, DIACHI, MALOP FROM dbo.SINHVIEN WHERE MASV = @MASV and MATKHAU = @MATKHAU
END 

GO
/****** Object:  StoredProcedure [dbo].[SP_TonTaiMaMH]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_TonTaiMaMH] (@MaMH char(5))
as
begin
	if not exists(SELECT MAMH FROM  dbo.MONHOC WHERE MAMH = @MaMH)
   		raiserror ('Mã môn học không tồn tại!',16,1)
end

GO
/****** Object:  StoredProcedure [dbo].[SP_TrungMaCauHoi]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_TrungMaCauHoi] (@MaCauHoi int)
as
begin
	if exists(SELECT CAUHOI FROM  dbo.BODE WHERE CAUHOI = @MaCauHoi)
   		raiserror ('Mã câu hỏi đã tồn tại!',16,1)
end

GO
/****** Object:  StoredProcedure [dbo].[SP_TrungMaGV]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_TrungMaGV]
	@MAGV CHAR(8)
AS
BEGIN
	IF EXISTS(SELECT MAGV FROM  dbo.GIAOVIEN WHERE MAGV = @MAGV)
   		RAISERROR ('Mã giáo viên đã tồn tại!',16,1)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_TrungMaKH]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_TrungMaKH]
	@MAKH CHAR(8)
AS
BEGIN
	IF EXISTS(SELECT MAKH FROM  dbo.KHOA WHERE MAKH = @MAKH)
	BEGIN
		RAISERROR ('Mã khoa đã tồn tại!',16,1)
		RETURN
	END
   	IF EXISTS(SELECT MAKH FROM  LINK1.TN_CSDLPT.dbo.KHOA WHERE MAKH = @MAKH)
	BEGIN
		RAISERROR ('Mã khoa đã tồn tại!',16,1)
		RETURN
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_TrungMaLop]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_TrungMaLop]
	@MALOP CHAR(8)
AS
BEGIN
	IF EXISTS(SELECT MALOP FROM  dbo.LOP WHERE MALOP = @MALOP)
	BEGIN
		RAISERROR ('Mã lớp đã tồn tại!',16,1)
		RETURN
	END
   	IF EXISTS(SELECT MALOP FROM  LINK1.TN_CSDLPT.dbo.LOP WHERE MALOP = @MALOP)
	BEGIN
		RAISERROR ('Mã lớp đã tồn tại!',16,1)
		RETURN
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_TrungMaMH]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_TrungMaMH](@MAMH char(5))
as

begin
	if exists(SELECT MAMH FROM  dbo.MONHOC WHERE MAMH =@MAMH)
   		raiserror ('Mã môn học đã tồn tại!',16,1)
end

GO
/****** Object:  StoredProcedure [dbo].[SP_TrungMaSV]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_TrungMaSV]
	@MASV CHAR(8)
AS
BEGIN
	IF EXISTS(SELECT MASV FROM  dbo.SINHVIEN WHERE MASV = @MASV)
   		BEGIN
			RAISERROR ('Mã sinh viên đã tồn tại!',16,1)
			RETURN 
		END 
	IF EXISTS(SELECT MASV FROM LINK1.TN_CSDLPT.dbo.SINHVIEN WHERE MASV = @MASV)
		BEGIN
			RAISERROR ('Mã sinh viên đã tồn tại!',16,1)
			RETURN 
		END
END


GO
/****** Object:  StoredProcedure [dbo].[SP_TrungTenKH]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_TrungTenKH]
	@TENKH NVARCHAR(50)
AS
BEGIN
	IF EXISTS(SELECT TENKH FROM  dbo.KHOA WHERE TENKH = @TENKH)
	BEGIN
		RAISERROR ('Tên khoa đã tồn tại!',16,1)
		RETURN
	END
   	IF EXISTS(SELECT TENKH FROM  LINK1.TN_CSDLPT.dbo.KHOA WHERE TENKH = @TENKH)
	BEGIN
		RAISERROR ('Tên khoa đã tồn tại!',16,1)
		RETURN
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_TrungTenLop]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_TrungTenLop]
	@TENLOP NVARCHAR(50)
AS
BEGIN
	IF EXISTS(SELECT TENLOP FROM  dbo.LOP WHERE TENLOP = @TENLOP)
	BEGIN
		RAISERROR ('Tên lớp đã tồn tại!',16,1)
		RETURN
	END
   	IF EXISTS(SELECT TENLOP FROM  LINK1.TN_CSDLPT.dbo.LOP WHERE TENLOP = @TENLOP)
	BEGIN
		RAISERROR ('Tên lớp đã tồn tại!',16,1)
		RETURN
	END	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_TrungTenMH]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_TrungTenMH](@TENMH nvarchar(50))
as

begin
	if exists(SELECT TENMH FROM  dbo.MONHOC WHERE TENMH = @TENMH)
   		raiserror ('Tên môn học đã tồn tại!',16,1)
end

GO
/****** Object:  StoredProcedure [dbo].[SP_XemBangDiem]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_XemBangDiem]
	@MAMH NCHAR(5),
	@LAN SMALLINT,
	@MALOP NCHAR(8)
AS
BEGIN
	
	SELECT SINHVIEN.MASV, HO, TEN, DIEM, dbo.FN_XuatDiemChu(DIEM) AS DIEMCHU

	FROM dbo.SINHVIEN JOIN dbo.BANGDIEM
	ON BANGDIEM.MASV = SINHVIEN.MASV
	WHERE BANGDIEM.MAMH = @MAMH AND BANGDIEM.LAN = @LAN AND SINHVIEN.MALOP = @MALOP
END

GO
/****** Object:  StoredProcedure [dbo].[SP_XemBangDiemV2]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_XemBangDiemV2] @MAMH NCHAR(5),
	@LAN SMALLINT,
	@MALOP NCHAR(8)
AS
BEGIN
	
	SELECT SINHVIEN.MASV, HO, TEN, DIEM, dbo.FN_XuatDiemChu(DIEM) AS DIEMCHU

	FROM dbo.SINHVIEN JOIN dbo.BANGDIEM
	ON BANGDIEM.MASV = SINHVIEN.MASV
	WHERE BANGDIEM.MAMH = @MAMH AND BANGDIEM.LAN = @LAN AND SINHVIEN.MALOP = @MALOP
END


GO
/****** Object:  StoredProcedure [dbo].[SP_XemKetQua]    Script Date: 12/23/2021 11:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_XemKetQua] @MASV NCHAR(8),
	@MAMH NCHAR(5),
	@LAN SMALLINT
AS
BEGIN
	SELECT STT, BODE.CAUHOI, NOIDUNG, A, B, C, D, DAP_AN, DACHON 
	FROM dbo.CT_BAITHI JOIN dbo.BODE 
	ON BODE.CAUHOI = CT_BAITHI.CAUHOI 
	WHERE IDBD IN (SELECT IDBD FROM dbo.BANGDIEM WHERE MASV = @MASV AND MAMH = @MAMH AND LAN = @LAN)
	ORDER BY STT
END	


GO
USE [master]
GO
ALTER DATABASE [TN_CSDLPT] SET  READ_WRITE 
GO
