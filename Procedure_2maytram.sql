

CREATE PROCEDURE [dbo].[TransferMoney_SON]
    @SourceAccountID VARCHAR(20),
    @TargetAccountID VARCHAR(20),
    @TransactionValue INT,
    @EmployeeID VARCHAR(20)
AS
BEGIN
	SET XACT_ABORT ON
    BEGIN TRANSACTION;
	IF not exists (SELECT ID FROM [SON].[QuanLiNganHang_HVP].dbo.Account WHERE ID =  @TargetAccountID )
	BEGIN
		RAISERROR (N'Tài khoản đích không tồn tại',16,1)
		ROLLBACK TRAN
	END

    DECLARE @TransactionID VARCHAR(20),@TotalRecord int;
	SET @TotalRecord = (select Count(*) from TransactionInfo);
    SET @TransactionID = 'TIHY' + 	RIGHT(REPLICATE('0', 3) + CONVERT(VARCHAR, @TotalRecord + 1), 3);

    INSERT INTO TransactionInfo (ID, transaction_date, transaction_value, ID_source_account, ID_target_account, ID_employee)
    VALUES (@TransactionID,FORMAT(GETDATE(),'yyyy-MM-dd'), @TransactionValue, @SourceAccountID, @TargetAccountID, @EmployeeID);

    UPDATE Account
    SET balance = balance - @TransactionValue
    WHERE ID = @SourceAccountID;

    UPDATE [SON].[QuanLiNganHang_HVP].dbo.Account
    SET balance = balance + @TransactionValue
    WHERE ID = @TargetAccountID;

    COMMIT TRANSACTION;
END;


--bây chạy kiểu này
EXEC TransferMoney_SON 'AHY002', 'AVP004', 1000, 'EHY001';