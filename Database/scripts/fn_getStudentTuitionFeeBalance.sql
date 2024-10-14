USE [XYZ_University]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_getStudentTuitionFeeBalance]    Script Date: 14/10/2024 16:23:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[fn_getStudentTuitionFeeBalance]
(
@StudentId int = 0
)
returns money
as
begin
declare @feesDue money = 0.00, @feesPaid money = 0.00
select @feesDue = Amount from tbltuitionFees Where IsActive = 1
set @feesDue = isnull(@feesDue, 0.00)

select @feesPaid = PaymentAmount from tblTuitionFeepayments where StudentId = @StudentId
set @feesPaid = isnull(@feesPaid, 0.00)

return @feesDue - @feesPaid
end
GO


