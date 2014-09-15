/****** Object:  Table [dbo].[tFloor]    Script Date: 09/15/2014 09:23:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tFloor](
	[FloorId] [int] IDENTITY(1,1) NOT NULL,
	[FloorNum] [int] NULL,
	[HouseId] [int] NULL,
	[Unit] [int] NULL,
	[FlatinFloor] [int] NULL,
	[UrlMap] [varchar](200) NULL,
	[inFlat] [bit] NULL,
	[NewFlatinFloor] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


