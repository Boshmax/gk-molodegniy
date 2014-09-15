/****** Object:  Table [dbo].[tHouse]    Script Date: 09/15/2014 09:24:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tHouse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[house] [int] NULL,
	[unit] [int] NULL,
	[floors] [int] NULL,
	[flatinfloor] [int] NULL
) ON [PRIMARY]

GO


insert [tHouse](house, unit, floors,flatinfloor)
select 1,	1,	20,	12
union all
select 2,	3,	25,	9
union all
select 3,	3,	25,	9