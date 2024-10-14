USE [XYZ_University]
GO

/****** Object:  StoredProcedure [dbo].[proc_addTuitionFeePayment]    Script Date: 14/10/2024 16:22:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[proc_addTuitionFeePayment]
(
@RegistrationNo varchar(150) = '',
@TransactionNo varchar(200) = '',
@PaymentDate smalldatetime,
@PaymentAmount money = 0.00,
@PaymentMethod varchar(100) = '',
@PaidBy varchar(150) = '',
@Remarks varchar(250) = ''
)
as
declare @StudentId int = 0
--check for duplicate trxn
if exists(select tuitionfeepaymentid from tbltuitionfeepayments where transactionno=@TransactionNo)
throw 50000,'Duplicate Transaction Error - trxn with the passed transaction no exists',1

--check if student exists
if not exists(select StudentId from tblStudents where RegistrationNo=@RegistrationNo)
throw 50000,'Invalid Student Details - Registration No. not found',1
else
select @StudentId = StudentId from tblStudents where RegistrationNo=@RegistrationNo

--add payment
insert into tblTuitionFeepayments(StudentId,TransactionNo,PaymentDate,PaymentAmount,PaymentMethod,PaidBy,Remarks)
select @StudentId, @TransactionNo, @PaymentDate, @PaymentAmount, @PaymentMethod, @PaidBy, @Remarks

--return inserted record
select * from tblTuitionFeepayments where TuitionFeePaymentId = IDENT_CURRENT('tblTuitionFeepayments')
GO


