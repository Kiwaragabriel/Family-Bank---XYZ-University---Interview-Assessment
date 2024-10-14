USE [XYZ_University]
GO

/****** Object:  Table [dbo].[tblFaculties]    Script Date: 14/10/2024 16:21:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblFaculties](
	[FacultyId] [int] IDENTITY(1,1) NOT NULL,
	[FacultyName] [varchar](150) NULL,
	[CreatedOn] [smalldatetime] NULL,
	[Creator_UserId] [int] NULL,
 CONSTRAINT [PK_tblFaculties] PRIMARY KEY CLUSTERED 
(
	[FacultyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_tblFaculties] UNIQUE NONCLUSTERED 
(
	[FacultyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblFaculties] ADD  CONSTRAINT [DF_tblFaculties_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[tblFaculties]  WITH CHECK ADD  CONSTRAINT [FK_tblFaculties_tblUsers] FOREIGN KEY([Creator_UserId])
REFERENCES [dbo].[tblUsers] ([UserId])
GO

ALTER TABLE [dbo].[tblFaculties] CHECK CONSTRAINT [FK_tblFaculties_tblUsers]
GO


