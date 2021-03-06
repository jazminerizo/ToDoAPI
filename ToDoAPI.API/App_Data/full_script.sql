/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TodoItems]') AND type in (N'U'))
ALTER TABLE [dbo].[TodoItems] DROP CONSTRAINT IF EXISTS [FK_TodoItems_Categories]
GO
/****** Object:  Table [dbo].[TodoItems]    Script Date: 4/9/2022 9:10:13 PM ******/
DROP TABLE IF EXISTS [dbo].[TodoItems]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/9/2022 9:10:13 PM ******/
DROP TABLE IF EXISTS [dbo].[Categories]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/9/2022 9:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TodoItems]    Script Date: 4/9/2022 9:10:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TodoItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TodoItems](
	[TodoId] [int] IDENTITY(1,1) NOT NULL,
	[Action] [nvarchar](max) NOT NULL,
	[Done] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_TodoItems] PRIMARY KEY CLUSTERED 
(
	[TodoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (1, N'Orange Bearded Dragon', N'Orange')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (2, N'Red Bearded Dragon', N'Red thing')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (3, N'Test Item', N'Test D.')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (4, N'jaz', N'')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (5, N'Enclosure', N'An area that is sealed off with an artificial or natural barrier/ home for dragon.')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (6, N'Supplies', N'Supplies needed for feeders, enclosures, and bearded dragon care.')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[TodoItems] ON 

INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (4, N'Buy Dragon', 1, 1)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (5, N'Buy Dragon', 1, 1)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (6, N'Purchase Enclosure', 0, 5)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (7, N'Purchase Enclosure', 0, 5)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (8, N'Purchase Enclosure', 0, 5)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (9, N'Purchase Enclosure', 0, 5)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (10, N'Purchase Enclosure', 0, 5)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (11, N'Purchase Enclosure', 0, 5)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (12, N'Purchase Enclosure', 0, 3)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (13, N'Purchase Enclosure', 0, 3)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (14, N'do stuff', 0, 4)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (15, N'do more stuff', 0, 3)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (16, N'do more stuff', 0, 3)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (17, N'do more stuff', 0, 3)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (18, N'do stuff', 0, 2)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (19, N'Purchase Enclosure', 0, 2)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (20, N'do stuff', 0, 2)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (21, N'do more stuff', 0, 4)
SET IDENTITY_INSERT [dbo].[TodoItems] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TodoItems_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[TodoItems]'))
ALTER TABLE [dbo].[TodoItems]  WITH CHECK ADD  CONSTRAINT [FK_TodoItems_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TodoItems_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[TodoItems]'))
ALTER TABLE [dbo].[TodoItems] CHECK CONSTRAINT [FK_TodoItems_Categories]
GO
