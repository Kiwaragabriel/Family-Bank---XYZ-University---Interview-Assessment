USE [XYZ_University]
GO

/****** Object:  Table [dbo].[tblTuitionFeePayments]    Script Date: 14/10/2024 16:21:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblTuitionFeePayments](
	[TuitionFeePaymentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[TransactionNo] [varchar](150) NOT NULL,
	[PaymentDate] [smalldatetime] NOT NULL,
	[PaymentAmount] [money] NOT NULL,
	[PaymentMethod] [varchar](50) NOT NULL,
	[PaidBy] [varchar](150) NOT NULL,
	[Remarks] [varchar](250) NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_tblTuitionFeePayments] PRIMARY KEY CLUSTERED 
(
	[TuitionFeePaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_tblTuitionFeePayments] UNIQUE NONCLUSTERED 
(
	[TransactionNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblTuitionFeePayments] ADD  CONSTRAINT [DF_tblTuitionFeePayments_PaymentAmount]  DEFAULT ((0.00)) FOR [PaymentAmount]
GO

ALTER TABLE [dbo].[tblTuitionFeePayments] ADD  CONSTRAINT [DF_tblTuitionFeePayments_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[tblTuitionFeePayments]  WITH CHECK ADD  CONSTRAINT [FK_tblTuitionFeePayments_tblStudents] FOREIGN KEY([StudentId])
REFERENCES [dbo].[tblStudents] ([StudentId])
GO

ALTER TABLE [dbo].[tblTuitionFeePayments] CHECK CONSTRAINT [FK_tblTuitionFeePayments_tblStudents]
GO


