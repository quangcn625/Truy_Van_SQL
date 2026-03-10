
set xact_abort on
begin try
	begin tran
		delete from [SON].[QuanLiNganHang_HVP].[dbo].[Employee]
		where [ID] = 'EVP014';
		insert into [SON].[QuanLiNganHang_HVP].[dbo].[Employee] ([ID], [name_employee], [date_of_birth], [address], [phone_number], [ID_headquarter])
		values ('EVP014', 'Bui Truong Son', '2003-05-11', 'Vinh Phuc', '123456789', 'HVP');
		update [SON].[QuanLiNganHang_HVP].[dbo].[Employee]
		set name_employee = N'son'
		where [ID] = 'EVP006'
		select * from [SON].[QuanLiNganHang_HVP].[dbo].[Employee];
		commit
end try
begin catch
	raiserror('Hãy kiểm tra lại syntax', 16, 1);
	rollback
end catch




