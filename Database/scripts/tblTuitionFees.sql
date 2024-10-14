USE [XYZ_University]
GO

/****** Object:  Table [dbo].[tblTuitionFees]    Script Date: 14/10/2024 16:22:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblTuitionFees](
	[TuitionFeeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[Amount] [money] NOT NULL,
	[DueDate] [smalldatetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[Creator_UserId] [int] NOT NULL,
 CONSTRAINT [PK_tblTuitionFees] PRIMARY KEY CLUSTERED 
(
	[TuitionFeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_tblTuitionFees] UNIQUE NONCLUSTERED 
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblTuitionFees] ADD  CONSTRAINT [DF_tblTuitionFees_Amount]  DEFAULT ((0.00)) FOR [Amount]
GO

ALTER TABLE [dbo].[tblTuitionFees] ADD  CONSTRAINT [DF_tblTuitionFees_DueDate]  DEFAULT (getdate()) FOR [DueDate]
GO

ALTER TABLE [dbo].[tblTuitionFees] ADD  CONSTRAINT [DF_tblTuitionFees_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[tblTuitionFees] ADD  CONSTRAINT [DF_tblTuitionFees_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[tblTuitionFees]  WITH CHECK ADD  CONSTRAINT [FK_tblTuitionFees_tblUsers] FOREIGN KEY([Creator_UserId])
REFERENCES [dbo].[tblUsers] ([UserId])
GO

ALTER TABLE [dbo].[tblTuitionFees] CHECK CONSTRAINT [FK_tblTuitionFees_tblUsers]
GO


