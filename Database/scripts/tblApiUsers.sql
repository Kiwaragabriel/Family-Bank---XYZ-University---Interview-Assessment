USE [XYZ_University]
GO

/****** Object:  Table [dbo].[tblAPIUsers]    Script Date: 14/10/2024 16:18:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAPIUsers](
	[APIUserId] [int] IDENTITY(1,1) NOT NULL,
	[APIUsername] [varchar](150) NOT NULL,
	[APIKey] [varchar](150) NOT NULL,
	[AccessToken] [varchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[Creator_UserId] [int] NOT NULL,
 CONSTRAINT [PK_tblAPIUsers] PRIMARY KEY CLUSTERED 
(
	[APIUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_tblAPIUsers] UNIQUE NONCLUSTERED 
(
	[APIUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblAPIUsers] ADD  CONSTRAINT [DF_tblAPIUsers_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[tblAPIUsers] ADD  CONSTRAINT [DF_tblAPIUsers_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[tblAPIUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblAPIUsers_tblUsers] FOREIGN KEY([Creator_UserId])
REFERENCES [dbo].[tblUsers] ([UserId])
GO

ALTER TABLE [dbo].[tblAPIUsers] CHECK CONSTRAINT [FK_tblAPIUsers_tblUsers]
GO


