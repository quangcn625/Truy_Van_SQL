
/*1. Thống kê khách hàng trong 1 trụ sở*/
create procedure CountCustomerHeadquarter
as
	begin
		select Headquarter.ID, Headquarter.name_headquarter, count(Customer.ID) as number_of_customer
		from Headquarter
			inner join Customer on Headquarter.ID = Customer.ID_headquarter
		group by  Headquarter.ID, Headquarter.name_headquarter
	end

CountCustomerHeadquarter

/*2. Thống kê số tài khoản của 1 trụ sở*/
create procedure CountAccountHeadquarter
as
	begin
		select Headquarter.ID, Headquarter.name_headquarter, count(Account.ID) as number_of_account
		from Headquarter
			inner join Customer on Headquarter.ID = Customer.ID_headquarter
			inner join Account on Customer.ID = Account.ID_customer
		group by Headquarter.ID, Headquarter.name_headquarter
	end

CountAccountHeadquarter

/*3. Thống kê số nhân viên của 1 trụ sở*/
create procedure CountEmployeeHeadquarter
as
	begin
		select Headquarter.ID, Headquarter.name_headquarter, count(Employee.ID) as number_of_Employee
		from Headquarter
			inner join Employee on Headquarter.ID = Employee.ID_headquarter
		group by Headquarter.ID, Headquarter.name_headquarter
	end

CountEmployeeHeadquarter

/*4. Thống kê số tài khoản chỉ có 1 loại thẻ*/
create procedure CountCardOnlyOneCustomer
as
	begin
		select Headquarter.ID, Headquarter.name_headquarter, count(Card.ID) as number_of_account_only_one_card
		from Headquarter
			inner join Customer on Headquarter.ID = Customer.ID_headquarter
			inner join Account on Customer.ID = Account.ID_customer
			inner join Card on Account.ID = Card.ID_account
			where Account.ID in (select Account.ID from Account
										inner join  Card on Card.ID_account = Account.ID
										group by Account.ID having COUNT(*) = 1)
		group by Headquarter.ID, Headquarter.name_headquarter
	end

 CountCardOnlyOneCustomer

 /*5. Thống kê mỗi khách hàng xem có bao nhiêu tài khoản*/
 create procedure CountAccountEachCustomer
 as
	begin 
		select Customer.ID, Customer.name_customer, count(Account.ID) as number_of_account
		from Customer
			inner join Account on Customer.ID = Account.ID_customer
		group by Customer.ID, Customer.name_customer
	end

CountAccountEachCustomer