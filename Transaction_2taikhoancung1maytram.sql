
CREATE TRIGGER [dbo].[transaction_after] ON [dbo].[TransactionInfo]
AFTER INSERT,UPDATE
AS 
	DECLARE @id varchar(50), @id_source_account varchar(50), @id_target_account varchar(50),@tien_ck varchar(50),@nhan_vien varchar(50), @balance INT;
	SET @id = (SELECT ID from inserted)
	SET @id_source_account =(SELECT ID_source_account FROM inserted)
	SET @id_target_account =(SELECT ID_target_account FROM inserted)
	SET @tien_ck =(SELECT transaction_value FROM inserted)
	SET @nhan_vien=(SELECT ID_employee FROM inserted)
	IF(@@ROWCOUNT = 0 )
		BEGIN
				Print N'Table này Không có dữ liệu'
				Return
		END
	SET @balance = (SELECT Balance FROM Account WHERE ID = @id_source_account);
	IF not exists (SELECT ID FROM Account WHERE ID = @id_target_account)
		BEGIN
			RAISERROR (N'Tài khoản đích không tồn tại',16,1)
			ROLLBACK TRAN
		END
	ELSE 
		BEGIN
		IF(@id like 'TIHY%' AND @id_source_account like 'AHY%' AND @nhan_vien like 'EHY%' AND @balance > @tien_ck )
			BEGIN TRY
				BEGIN TRAN CK
				UPDATE Account SET Balance = Balance - @tien_ck WHERE ID = @id_source_account;
				UPDATE Account SET Balance = Balance + @tien_ck WHERE ID = @id_target_account;
				COMMIT TRAN CK
				PRINT N'CẬP NHẬT THÀNH CÔNG'
			END TRY
			BEGIN CATCH
				PRINT N'CHUYỂN KHOẢN KHÔNG THÀNH CÔNG'
				ROLLBACK TRAN
			END CATCH
		ELSE 
			BEGIN
				PRINT N'Sai tên ID trụ sở/ Account chuyển khoản không thuộc trụ sở Hưng Yên/ Sai ID nhân viên/ Không đủ tiền';
				ROLLBACK TRAN
			END
		END