USE [DemoDB]
GO
/****** Object:  Table [dbo].[LOOKUPRole]    Script Date: 6/2/2018 12:02:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOOKUPRole](
	[LOOKUPRoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NULL,
	[RoleDescription] [varchar](500) NULL,
	[RowCreatedSYSUserID] [int] NOT NULL,
	[RowCreatedDateTime] [datetime] NULL,
	[RowModifiedSYSUserID] [int] NOT NULL,
	[RowModifiedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LOOKUPRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSUser]    Script Date: 6/2/2018 12:02:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSUser](
	[SYSUserID] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [varchar](50) NOT NULL,
	[PasswordEncryptedText] [varchar](200) NOT NULL,
	[RowCreatedSYSUserID] [int] NOT NULL,
	[RowCreatedDateTime] [datetime] NULL,
	[RowModifiedSYSUserID] [int] NOT NULL,
	[RowMOdifiedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SYSUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSUserProfile]    Script Date: 6/2/2018 12:02:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSUserProfile](
	[SYSUserProfileID] [int] IDENTITY(1,1) NOT NULL,
	[SYSUserID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[RowCreatedSYSUserID] [int] NOT NULL,
	[RowCreatedDateTime] [datetime] NULL,
	[RowModifiedSYSUserID] [int] NOT NULL,
	[RowModifiedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SYSUserProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSUserRole]    Script Date: 6/2/2018 12:02:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSUserRole](
	[SYSUserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[SYSUserID] [int] NOT NULL,
	[LOOKUPRoleID] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[RowCreatedSYSUserID] [int] NOT NULL,
	[RowCreatedDateTime] [datetime] NULL,
	[RowModifiedSYSUserID] [int] NOT NULL,
	[RowModifiedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SYSUserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LOOKUPRole] ADD  DEFAULT ('') FOR [RoleName]
GO
ALTER TABLE [dbo].[LOOKUPRole] ADD  DEFAULT ('') FOR [RoleDescription]
GO
ALTER TABLE [dbo].[LOOKUPRole] ADD  DEFAULT (getdate()) FOR [RowCreatedDateTime]
GO
ALTER TABLE [dbo].[LOOKUPRole] ADD  DEFAULT (getdate()) FOR [RowModifiedDateTime]
GO
ALTER TABLE [dbo].[SYSUser] ADD  DEFAULT (getdate()) FOR [RowCreatedDateTime]
GO
ALTER TABLE [dbo].[SYSUser] ADD  DEFAULT (getdate()) FOR [RowMOdifiedDateTime]
GO
ALTER TABLE [dbo].[SYSUserProfile] ADD  DEFAULT (getdate()) FOR [RowCreatedDateTime]
GO
ALTER TABLE [dbo].[SYSUserProfile] ADD  DEFAULT (getdate()) FOR [RowModifiedDateTime]
GO
ALTER TABLE [dbo].[SYSUserRole] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SYSUserRole] ADD  DEFAULT (getdate()) FOR [RowCreatedDateTime]
GO
ALTER TABLE [dbo].[SYSUserRole] ADD  DEFAULT (getdate()) FOR [RowModifiedDateTime]
GO
ALTER TABLE [dbo].[SYSUserProfile]  WITH CHECK ADD FOREIGN KEY([SYSUserID])
REFERENCES [dbo].[SYSUser] ([SYSUserID])
GO
ALTER TABLE [dbo].[SYSUserRole]  WITH CHECK ADD FOREIGN KEY([LOOKUPRoleID])
REFERENCES [dbo].[LOOKUPRole] ([LOOKUPRoleID])
GO
ALTER TABLE [dbo].[SYSUserRole]  WITH CHECK ADD FOREIGN KEY([SYSUserID])
REFERENCES [dbo].[SYSUser] ([SYSUserID])
GO
