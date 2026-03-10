

use QuanLiNganHang_HHY

set xact_abort on
begin try
	begin tran
		insert into  [BINH].[QuanLiTaiKhoanNganHang_HDB].[dbo].[Customer] ([ID], [name_customer], [date_of_birth], [address], [identify_number], [phone_number], [ID_headquarter])
		values ('CDB022', N'Lê Gia Quang', '2003-11-23', N'Hà Nội', '12345', '0826892396', 'HDB')
		insert into [BINH].[QuanLiTaiKhoanNganHang_HDB].[dbo].[Account] ([ID], [balance], [start_date], [ID_customer])
		values ('ADB025', 20000000, '2024-04-22', 'CDB022')
		insert into [BINH].[QuanLiTaiKhoanNganHang_HDB].[dbo].[Card] ([ID], [expire_date], [ID_card_type], [ID_account])
		values ('CDB026', '2040-01-01', 'CT002', 'ADB025')
		commit
end try
begin catch
	raiserror('Hãy kiểm tra lại syntax', 16, 1)
	rollback
end catch

