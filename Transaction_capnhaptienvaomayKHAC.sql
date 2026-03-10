

use QuanLiNganHang_HHY
go

SET XACT_ABORT ON
BEGIN TRY
	BEGIN TRAN
	INSERT INTO TransactionInfo(ID, transaction_value, transaction_date, ID_source_account, ID_target_account, ID_employee)
	VALUES ('TIHY069', 5000, '2024-04-23', 'AHY002', 'ADB27', 'EHY004')
	UPDATE [BINH].[QuanLiTaiKhoanNganHang_HDB].[dbo].[Account]
	SET balance = balance + 5000 WHERE ID = 'ADB27';
	UPDATE Account
	Set balance = balance - 5000 WHERE ID = 'AHY002';
	SELECT * FROM [BINH].[QuanLiTaiKhoanNganHang_HDB].[dbo].[Account]
	COMMIT TRAN
END TRY
BEGIN CATCH
	RAISERROR('Da xay ra loi hay thu lai!', 16, 1);
	ROLLBACK TRAN
END CATCH



select * from TransactionInfo

select * from Account