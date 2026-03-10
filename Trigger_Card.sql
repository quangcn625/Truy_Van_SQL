
create trigger card_after on Card
after insert, update
as
	declare @id varchar(50), @id_card_type varchar(50), @id_account varchar(50)
	set @id = (select ID from inserted)
	set @id_card_type = (select ID_card_type from inserted)
	set @id_account = (select ID_account from inserted)
	if(@@ROWCOUNT = 0)
		print N'Bảng không có dữ liệu'
	if(@id like 'CHY%' and @id_card_type like 'CT%' and @id_account like 'AHY%')
		begin
			print N'Cập nhập thông tin thành công'
		end
	else
		begin
			print N'Cập nhập thông tin thất bại'
			raiserror(N'Lỗi nhập ID không bắt đầu bằng CHY/ ID đã tồn tại/ Chọn sai loại thẻ hoặc chọn sai tài khoản', 16, 1)
			rollback tran
		end