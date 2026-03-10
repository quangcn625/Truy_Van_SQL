
create trigger customer_afer on Customer
after insert, update
as
	declare @id varchar(50), @id_headquarter varchar(50)
	set @id = (select ID from inserted)
	set @id_headquarter = (select id_headquarter from inserted)
	if(@@ROWCOUNT = 0)
		print N'Bảng không có dữ liệu'
	if(@id like 'CHY%' and @id_headquarter like 'HHY')
		begin
			print N'Cập nhập thông tin thành công'
		end
	else
		begin
			print N'Cập nhập thông tin thất bại'
			raiserror(N'Lỗi nhập ID không bắt đầu bằng CHY/ ID đã tồn tại/ Chọn sai trụ sở không phải là Hưng Yên', 16, 1)
			rollback tran
		end