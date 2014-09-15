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
insert tFloor(FloorNum, HouseId, Unit, FlatinFloor, UrlMap, inFlat, NewFlatinFloor)
1, 1, 1, 0, NULL, 0, NULL
1, 2, 1, 0, NULL, 0, 0
1, 2, 2, 0, NULL, 0, 0
1, 2, 3, 0, NULL, 0, 0
2, 1, 1, 8, 'http://s4.uploads.ru/GYzCB.png', 1, NULL
3, 1, 1, 8, 'http://s4.uploads.ru/GYzCB.png', 1, NULL
4, 1, 1, 12, 'http://s4.uploads.ru/6haKT.png', 1, NULL
5, 1, 1, 12, 'http://s4.uploads.ru/6haKT.png', 1, NULL
6, 1, 1, 12, 'http://s4.uploads.ru/6haKT.png', 1, NULL
7, 1, 1, 12, 'http://s4.uploads.ru/6haKT.png', 1, NULL
8, 1, 1, 12, 'http://s4.uploads.ru/6haKT.png', 1, NULL
9, 1, 1, 12, 'http://s4.uploads.ru/6haKT.png', 1, NULL
10, 1, 1, 12, 'http://s5.uploads.ru/E9DA7.png', 1, NULL
11, 1, 1, 12, 'http://s5.uploads.ru/E9DA7.png', 1, NULL
12, 1, 1, 12, 'http://s5.uploads.ru/E9DA7.png', 1, NULL
13, 1, 1, 12, 'http://s5.uploads.ru/E9DA7.png', 1, NULL
14, 1, 1, 12, 'http://s5.uploads.ru/JjBpX.png', 1, NULL
15, 1, 1, 12, 'http://s5.uploads.ru/JjBpX.png', 1, NULL
16, 1, 1, 12, 'http://s5.uploads.ru/JjBpX.png', 1, NULL
17, 1, 1, 12, 'http://s5.uploads.ru/JjBpX.png', 1, NULL
18, 1, 1, 12, 'http://s4.uploads.ru/x27rn.png', 1, NULL
19, 1, 1, 12, 'http://s4.uploads.ru/x27rn.png', 1, NULL
20, 1, 1, 12, 'http://s4.uploads.ru/x27rn.png', 1, NULL
2, 2, 1, 9, 'http://s3.uploads.ru/sUBER.png', 1, 11
3, 2, 1, 9, 'http://s3.uploads.ru/kftCI.png', 1, 11
4, 2, 1, 9, 'http://s3.uploads.ru/kftCI.png', 1, 11
5, 2, 1, 9, 'http://s3.uploads.ru/kftCI.png', 1, 11
6, 2, 1, 9, 'http://s3.uploads.ru/kftCI.png', 1, 11
7, 2, 1, 9, 'http://s3.uploads.ru/kftCI.png', 1, 11
8, 2, 1, 9, 'http://s3.uploads.ru/kftCI.png', 1, 11
9, 2, 1, 9, 'http://s3.uploads.ru/kftCI.png', 1, 10
10, 2, 1, 9, 'http://s2.uploads.ru/g2NFy.png', 1, 9
11, 2, 1, 9, 'http://s2.uploads.ru/g2NFy.png', 1, 9
12, 2, 1, 9, 'http://s2.uploads.ru/g2NFy.png', 1, 9
13, 2, 1, 9, 'http://s3.uploads.ru/RwYuc.png', 1, 9
14, 2, 1, 9, 'http://s3.uploads.ru/RwYuc.png', 1, 9
15, 2, 1, 9, 'http://s3.uploads.ru/RwYuc.png', 1, 9
16, 2, 1, 9, 'http://s3.uploads.ru/RwYuc.png', 1, 9
17, 2, 1, 9, 'http://s3.uploads.ru/RwYuc.png', 1, 9
18, 2, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, 9
19, 2, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, 9
20, 2, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, 9
21, 2, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, 9
22, 2, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, 9
23, 2, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, 9
24, 2, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, 9
25, 2, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, 9
2, 2, 2, 9, 'http://s2.uploads.ru/spfAX.png', 1, 9
3, 2, 2, 9, 'http://s3.uploads.ru/WGbS8.png', 1, 9
4, 2, 2, 9, 'http://s3.uploads.ru/WGbS8.png', 1, 9
5, 2, 2, 9, 'http://s3.uploads.ru/WGbS8.png', 1, 9
6, 2, 2, 9, 'http://s3.uploads.ru/WGbS8.png', 1, 9
7, 2, 2, 9, 'http://s3.uploads.ru/WGbS8.png', 1, 9
8, 2, 2, 9, 'http://s3.uploads.ru/WGbS8.png', 1, 9
9, 2, 2, 9, 'http://s3.uploads.ru/WGbS8.png', 1, 9
10, 2, 2, 9, 'http://s3.uploads.ru/oIGvw.png', 1, 9
11, 2, 2, 9, 'http://s3.uploads.ru/oIGvw.png', 1, 9
12, 2, 2, 9, 'http://s3.uploads.ru/oIGvw.png', 1, 9
13, 2, 2, 9, 'http://s3.uploads.ru/34ka0.png', 1, 9
14, 2, 2, 9, 'http://s3.uploads.ru/34ka0.png', 1, 9
15, 2, 2, 9, 'http://s3.uploads.ru/34ka0.png', 1, 9
16, 2, 2, 9, 'http://s3.uploads.ru/34ka0.png', 1, 9
17, 2, 2, 9, 'http://s3.uploads.ru/34ka0.png', 1, 9
18, 2, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, 9
19, 2, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, 9
20, 2, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, 9
21, 2, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, 9
22, 2, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, 9
23, 2, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, 9
24, 2, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, 9
25, 2, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, 9
2, 2, 3, 9, 'http://s2.uploads.ru/kOoQr.png', 1, 10
3, 2, 3, 9, 'http://s2.uploads.ru/6Nw75.png', 1, 10
4, 2, 3, 9, 'http://s3.uploads.ru/lvrIG.png', 1, 10
5, 2, 3, 9, 'http://s2.uploads.ru/DClWh.png', 1, 10
6, 2, 3, 9, 'http://s2.uploads.ru/DClWh.png', 1, 10
7, 2, 3, 9, 'http://s2.uploads.ru/DClWh.png', 1, 10
8, 2, 3, 9, 'http://s2.uploads.ru/DClWh.png', 1, 9
9, 2, 3, 9, 'http://s2.uploads.ru/DClWh.png', 1, 9
10, 2, 3, 9, 'http://s2.uploads.ru/q7Pe2.png', 1, 9
11, 2, 3, 9, 'http://s3.uploads.ru/lxbcV.png', 1, 9
12, 2, 3, 9, 'http://s3.uploads.ru/rmbBO.png', 1, 9
13, 2, 3, 9, 'http://s2.uploads.ru/cnQK2.png', 1, 9
14, 2, 3, 9, 'http://s2.uploads.ru/cnQK2.png', 1, 9
15, 2, 3, 9, 'http://s2.uploads.ru/cnQK2.png', 1, 9
16, 2, 3, 9, 'http://s2.uploads.ru/cnQK2.png', 1, 9
17, 2, 3, 9, 'http://s2.uploads.ru/cnQK2.png', 1, 9
18, 2, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, 9
19, 2, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, 9
20, 2, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, 9
21, 2, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, 9
22, 2, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, 9
23, 2, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, 9
24, 2, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, 9
25, 2, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, 9
1, 3, 1, 0, NULL, 0, NULL
1, 3, 2, 0, NULL, 0, NULL
1, 3, 3, 0, NULL, 0, NULL
2, 3, 1, 9, 'http://s3.uploads.ru/sUBER.png', 1, NULL
3, 3, 1, 9, 'http://s3.uploads.ru/kftCI.png', 1, NULL
4, 3, 1, 9, 'http://s3.uploads.ru/kftCI.png', 1, NULL
5, 3, 1, 9, 'http://s3.uploads.ru/kftCI.png', 1, NULL
6, 3, 1, 9, 'http://s3.uploads.ru/kftCI.png', 1, NULL
7, 3, 1, 9, 'http://s3.uploads.ru/kftCI.png', 1, NULL
8, 3, 1, 9, 'http://s3.uploads.ru/kftCI.png', 1, NULL
9, 3, 1, 9, 'http://s3.uploads.ru/kftCI.png', 1, NULL
10, 3, 1, 9, 'http://s2.uploads.ru/g2NFy.png', 1, NULL
11, 3, 1, 9, 'http://s2.uploads.ru/g2NFy.png', 1, NULL
12, 3, 1, 9, 'http://s2.uploads.ru/g2NFy.png', 1, NULL
13, 3, 1, 9, 'http://s3.uploads.ru/RwYuc.png', 1, NULL
14, 3, 1, 9, 'http://s3.uploads.ru/RwYuc.png', 1, NULL
15, 3, 1, 9, 'http://s3.uploads.ru/RwYuc.png', 1, NULL
16, 3, 1, 9, 'http://s3.uploads.ru/RwYuc.png', 1, NULL
17, 3, 1, 9, 'http://s3.uploads.ru/RwYuc.png', 1, NULL
18, 3, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, NULL
19, 3, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, NULL
20, 3, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, NULL
21, 3, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, NULL
22, 3, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, NULL
23, 3, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, NULL
24, 3, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, NULL
25, 3, 1, 9, 'http://s2.uploads.ru/5eS47.png', 1, NULL
2, 3, 2, 9, 'http://s2.uploads.ru/spfAX.png', 1, NULL
3, 3, 2, 9, 'http://s3.uploads.ru/WGbS8.png', 1, NULL
4, 3, 2, 9, 'http://s3.uploads.ru/WGbS8.png', 1, NULL
5, 3, 2, 9, 'http://s3.uploads.ru/WGbS8.png', 1, NULL
6, 3, 2, 9, 'http://s3.uploads.ru/WGbS8.png', 1, NULL
7, 3, 2, 9, 'http://s3.uploads.ru/WGbS8.png', 1, NULL
8, 3, 2, 9, 'http://s3.uploads.ru/WGbS8.png', 1, NULL
9, 3, 2, 9, 'http://s3.uploads.ru/WGbS8.png', 1, NULL
10, 3, 2, 9, 'http://s3.uploads.ru/oIGvw.png', 1, NULL
11, 3, 2, 9, 'http://s3.uploads.ru/oIGvw.png', 1, NULL
12, 3, 2, 9, 'http://s3.uploads.ru/oIGvw.png', 1, NULL
13, 3, 2, 9, 'http://s3.uploads.ru/34ka0.png', 1, NULL
14, 3, 2, 9, 'http://s3.uploads.ru/34ka0.png', 1, NULL
15, 3, 2, 9, 'http://s3.uploads.ru/34ka0.png', 1, NULL
16, 3, 2, 9, 'http://s3.uploads.ru/34ka0.png', 1, NULL
17, 3, 2, 9, 'http://s3.uploads.ru/34ka0.png', 1, NULL
18, 3, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, NULL
19, 3, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, NULL
20, 3, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, NULL
21, 3, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, NULL
22, 3, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, NULL
23, 3, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, NULL
24, 3, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, NULL
25, 3, 2, 9, 'http://s2.uploads.ru/JzVC4.png', 1, NULL
2, 3, 3, 9, 'http://s2.uploads.ru/kOoQr.png', 1, NULL
3, 3, 3, 9, 'http://s2.uploads.ru/6Nw75.png', 1, NULL
4, 3, 3, 9, 'http://s3.uploads.ru/lvrIG.png', 1, NULL
5, 3, 3, 9, 'http://s2.uploads.ru/DClWh.png', 1, NULL
6, 3, 3, 9, 'http://s2.uploads.ru/DClWh.png', 1, NULL
7, 3, 3, 9, 'http://s2.uploads.ru/DClWh.png', 1, NULL
8, 3, 3, 9, 'http://s2.uploads.ru/DClWh.png', 1, NULL
9, 3, 3, 9, 'http://s2.uploads.ru/DClWh.png', 1, NULL
10, 3, 3, 9, 'http://s2.uploads.ru/q7Pe2.png', 1, NULL
11, 3, 3, 9, 'http://s3.uploads.ru/lxbcV.png', 1, NULL
12, 3, 3, 9, 'http://s3.uploads.ru/rmbBO.png', 1, NULL
13, 3, 3, 9, 'http://s2.uploads.ru/cnQK2.png', 1, NULL
14, 3, 3, 9, 'http://s2.uploads.ru/cnQK2.png', 1, NULL
15, 3, 3, 9, 'http://s2.uploads.ru/cnQK2.png', 1, NULL
16, 3, 3, 9, 'http://s2.uploads.ru/cnQK2.png', 1, NULL
17, 3, 3, 9, 'http://s2.uploads.ru/cnQK2.png', 1, NULL
18, 3, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, NULL
19, 3, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, NULL
20, 3, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, NULL
21, 3, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, NULL
22, 3, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, NULL
23, 3, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, NULL
24, 3, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, NULL
25, 3, 3, 9, 'http://s3.uploads.ru/u67hU.png', 1, NULL

