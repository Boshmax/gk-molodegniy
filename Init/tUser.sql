/****** Object:  Table [dbo].[tUser]    Script Date: 09/15/2014 09:24:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[userid] [int] NULL,
	[houseid] [int] NULL,
	[flatStr] [int] NULL,
	[isDisable] [bit] NOT NULL,
	[Nev] [nchar](10) NULL,
	[Flat] [int] NULL,
	[Fraction] [bit] NOT NULL,
	[Apartment] [bit] NULL,
	[NewFlat] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tUser] ADD  DEFAULT ((0)) FOR [isDisable]
GO

ALTER TABLE [dbo].[tUser] ADD  CONSTRAINT [DF_tUser_fraction]  DEFAULT ((0)) FOR [Fraction]
GO

ALTER TABLE [dbo].[tUser] ADD  DEFAULT ((0)) FOR [Apartment]
GO


