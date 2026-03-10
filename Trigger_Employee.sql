
use QuanLiNganHang_HHY

create trigger employee_after on Employee
after insert, update
as
	declare @id varchar(50), @id_headquarter varchar(50)
	set @id = (select id from inserted)
	set @id_headquarter = (select ID_headquarter from inserted)
	if(@@ROWCOUNT = 0)
		print N'Bảng này không có dữ liệu'
	if(@id like 'EHY%' and @id_headquarter like 'HHY')
		begin
			print N'Cập nhập thông tin thành công'
		end
	else
		begin
			print N'Cập nhập thông tin thất bại'
			raiserror(N'Lỗi nhập ID không bắt đầu bằng EHY/ ID đã tồn tại trong bảng/ Chọn sai trụ sở Hưng Yên', 16, 1)
			rollback tran
		end