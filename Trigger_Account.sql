
create trigger account_after on Account
after insert, update
as
	declare @id varchar(50), @id_customer varchar(50)
	set @id = (select ID from inserted)
	set @id_customer = (select ID_customer from inserted)
	if(@@ROWCOUNT = 0)
		print N'Bảng không có dữ liệu'
	if(@id like 'AHY%' and @id_customer like 'CHY%')
		begin
			print N'Cập nhập thông tin thành công'
		end
	else
		begin
			print N'Cập nhập thông tin thất bại'
			raiserror(N'Lỗi nhập ID không bắt đầu bằng AHY/ Nhân viên không thuộc trụ sở này', 16, 1)
			rollback tran
		end