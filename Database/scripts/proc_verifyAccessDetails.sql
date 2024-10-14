USE [XYZ_University]
GO

/****** Object:  StoredProcedure [dbo].[proc_verifyAccessDetails]    Script Date: 14/10/2024 16:23:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[proc_verifyAccessDetails]
(
@APIUsername varchar(50)='',
@APIKey varchar(250) = '',
@AccessToken varchar(max) = ''
)
as
select * from tblAPIUsers where APIUsername = @APIUsername and APIKey = @APIKey and AccessToken = @AccessToken and IsActive = 1
GO


