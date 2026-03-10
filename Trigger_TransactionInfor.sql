
create trigger transactioninfor_after on TransactionInfo
after insert, update
as
	declare @id varchar(50), @id_source_account varchar(50), @id_target_account varchar(50), @id_employee varchar(50)
	set @id = (select ID from inserted)
	set @id_source_account = (select ID_source_account from inserted)
	set @id_target_account = (select ID_target_account from inserted)
	set @id_employee = (select ID_employee from inserted)
	if(@@ROWCOUNT = 0)
		print N'Bảng không có dữ liệu'
	if(@id like 'TIHY%' and @id_source_account like 'AHY%' and @id_target_account like 'AHY%' and @id_employee like 'EHY%')
		begin
			print N'Cập nhập thông tin thành công'
		end
	else
		begin
			print N'Cập nhập thông tin thất bại'
			raiserror(N'Lỗi nhập ID không bắt đầu bằng TIHY/ Nhân viên không thuộc trụ sở này/ Tài khoản nguồn không thuộc trụ sở này/ Tài khoản đích không đúng định dạng', 16, 1)
			rollback tran
		end