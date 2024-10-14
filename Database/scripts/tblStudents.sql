USE [XYZ_University]
GO

/****** Object:  Table [dbo].[tblStudents]    Script Date: 14/10/2024 16:21:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblStudents](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[RegistrationNo] [varchar](50) NOT NULL,
	[FullName] [varchar](250) NOT NULL,
	[NationalId] [int] NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[Creator_UserId] [int] NOT NULL,
	[FeeBalance]  AS ([dbo].[fn_getStudentTuitionFeeBalance]([StudentId])),
 CONSTRAINT [PK_tblStudents] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_tblStudents] UNIQUE NONCLUSTERED 
(
	[RegistrationNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_tblStudents_1] UNIQUE NONCLUSTERED 
(
	[NationalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblStudents] ADD  CONSTRAINT [DF_tblStudents_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[tblStudents]  WITH CHECK ADD  CONSTRAINT [FK_tblStudents_tblCourses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[tblCourses] ([CourseId])
GO

ALTER TABLE [dbo].[tblStudents] CHECK CONSTRAINT [FK_tblStudents_tblCourses]
GO

ALTER TABLE [dbo].[tblStudents]  WITH CHECK ADD  CONSTRAINT [FK_tblStudents_tblUsers] FOREIGN KEY([Creator_UserId])
REFERENCES [dbo].[tblUsers] ([UserId])
GO

ALTER TABLE [dbo].[tblStudents] CHECK CONSTRAINT [FK_tblStudents_tblUsers]
GO


