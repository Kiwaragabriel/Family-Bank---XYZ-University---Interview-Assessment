USE [XYZ_University]
GO

/****** Object:  Table [dbo].[tblCourses]    Script Date: 14/10/2024 16:20:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCourses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[FacultyId] [int] NOT NULL,
	[CourseName] [varchar](250) NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[Creator_UserId] [int] NOT NULL,
 CONSTRAINT [PK_tblCourses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_tblCourses] UNIQUE NONCLUSTERED 
(
	[CourseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblCourses] ADD  CONSTRAINT [DF_tblCourses_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[tblCourses]  WITH CHECK ADD  CONSTRAINT [FK_tblCourses_tblFaculties] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[tblFaculties] ([FacultyId])
GO

ALTER TABLE [dbo].[tblCourses] CHECK CONSTRAINT [FK_tblCourses_tblFaculties]
GO

ALTER TABLE [dbo].[tblCourses]  WITH CHECK ADD  CONSTRAINT [FK_tblCourses_tblUsers] FOREIGN KEY([Creator_UserId])
REFERENCES [dbo].[tblUsers] ([UserId])
GO

ALTER TABLE [dbo].[tblCourses] CHECK CONSTRAINT [FK_tblCourses_tblUsers]
GO


