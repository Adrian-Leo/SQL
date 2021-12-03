create database Lezen_Library


/*Create Schema*/
create schema Human
Go

create schema Object
Go
 
create schema Trans
Go


/*Create Table*/
--Table MemberInfo--
create table Human.MemberInfo(
ID_MemberInfo varchar(8) not null primary key,
			constraint pkID_MemberInfo
			check (ID_MemberInfo like ('[M][I][0-9][0-9][0-9][0-9]')),
Member_Birth date not null,
			constraint chkMember_Birth
			check(Member_Birth <= getdate()),
Member_Gender varchar(10) check (Member_Gender Like 'Male' or Member_Gender Like 'Female') NOT NULL,
Member_Telp varchar(15) not null,
			constraint chkMember_Telp
			check (Member_Telp like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%')),
Member_Address varchar(50) not null)


 select * from Human.MemberInfo

--Table Member--
create table Human.Member(
ID_Member varchar(8) not null primary key,
			constraint pkID_Member
			check (ID_Member like ('[M][0-9][0-9][0-9][0-9]')),
ID_MemberInfo varchar(8) foreign key references Human.MemberInfo (ID_MemberInfo),
			constraint chkID_MemberInfo
			check (ID_MemberInfo like ('[M][I][0-9][0-9][0-9][0-9]')),
Member_Name varchar(50) not null)


--Table EmployeeInfo--
create table Human.EmployeeInfo(
ID_Empinfo varchar(8) not null primary key,
			constraint pkID_Empinfo
			check (ID_Empinfo like ('[E][I][0-9][0-9][0-9][0-9]')),
Emp_Gender varchar(10) check (Emp_Gender Like 'Male' or Emp_Gender Like 'Female') NOT NULL,
Emp_Birth date not null,
			constraint chkEmp_Birth
			check(Emp_Birth <= getdate()),
Emp_Telp varchar(15) not null,
			constraint chkEmp_Telp
			check (Emp_Telp like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%')),
Emp_Add varchar(50) not null,
Emp_Status varchar(10) check (Emp_Status Like 'Active' or Emp_Status Like 'NON-Active') NOT NULL,
Emp_Position varchar(25) not null)


--Table Employee--
create table Human.Employee(
ID_Emp varchar(8) not null primary key,
			constraint pkID_Emp
			check (ID_Emp like ('[E][0-9][0-9][0-9][0-9]')),
ID_Empinfo varchar(8) Foreign Key references Human.EmployeeInfo(ID_EmpInfo),
			constraint chkID_Empinfo
			check (ID_Empinfo like ('[E][I][0-9][0-9][0-9][0-9]')),
Emp_Name varchar(50) not null)


--Table BookInfo--
create table Object.BookInfo(
ID_BookInfo varchar(10) not null primary key,
			constraint pkID_Bookinfo
			check (ID_Bookinfo like ('[B][I][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
Book_Writer varchar(50) not null,
Book_Publish varchar(50) not null,
Book_Year varchar(5) not null,
Book_Place varchar(50) not null,
Book_Stock int not null)


--Table Book--
create table Object.Book(
ID_Book varchar(10) not null primary key,
			constraint pkID_Book
			check (ID_Book like ('[B][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
ID_BookInfo varchar(10) Foreign Key references Object.BookInfo(ID_BookInfo),
			constraint chkID_Bookinfo
			check (ID_Bookinfo like ('[B][I][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
Book_Category varchar(50) not null,
Book_Title varchar(50)not null)


--Table LoanTransaction--
create table Trans.LoanTransaction(
ID_Loan varchar(8) not null primary key,
			constraint pkID_Loan
			check (ID_Loan like ('[L][0-9][0-9][0-9][0-9]')),
ID_Member varchar(8) Foreign Key references Human.Member(ID_Member),
			constraint chkID_Member
			check (ID_Member like ('[M][0-9][0-9][0-9][0-9]')),
ID_Emp varchar(8) Foreign Key references Human.Employee(ID_Emp),
			constraint chkID_Emp
			check (ID_Emp like ('[E][0-9][0-9][0-9][0-9]')),
ID_Book varchar(10) Foreign Key references Object.Book(ID_Book),
			constraint chkID_Book
			check (ID_Book like ('[B][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
ID_BookInfo varchar(10) Foreign Key references Object.BookInfo(ID_BookInfo),
			constraint chkID_Bookinfo
			check (ID_Bookinfo like ('[B][I][0][1-9][1-9][1-9][1-9][1-9][1-9]')),
Book_Title varchar(50) not null,
Quantity int not null,
Loan_Date Date default getdate(),
Due_Date Date)


--Table ReturnTransaction--
create table Trans.ReturnTransaction(
ID_Return varchar(8) not null primary key,
			constraint pkID_Return
			check (ID_Return like ('[R][0-9][0-9][0-9][0-9]')),
ID_Loan varchar(8) Foreign Key references Trans.LoanTransaction(ID_Loan),
			constraint chkID_Loan
			check (ID_Loan like ('[L][0-9][0-9][0-9][0-9]')),
ID_Member varchar(8),
ID_Emp varchar(8),
ID_Book varchar(10),
ID_BookInfo varchar(10),
Book_Title varchar(50) not null,
Quantity int not null,
Return_Date Date,
Return_Fine money,
Total_Fine money)


/*Input Data*/
Insert Into Human.MemberInfo values
('MI0234','1992/11/27','Female','087881236854','Jl.Anggrek no.12 Tangerang'),
('MI0235','1996/10/18','Female','087882579543','Jl.Melati no.56 Bogor'),
('MI0236','1998/06/03','Female','086459243102','Jl.Mawar no.19 Bekasi'),
('MI0237','1995/03/15','Male','089764326183','Jl.Kamboja no.44 Depok'),
('MI0238','1991/07/07','Male','087534274839','Jl.Tulip no.32 Serang'),
('MI0239','1997/04/08','Male','081345267892','Jl.Mangga no.34 Jakarta'),
('MI0240','1990/08/17','Male','0897823653216','Jl.Markisa no.09 Bandung'),
('MI0241','1994/01/01','Female','085673645286','Jl.Delima no.96 Sukabumi'),
('MI0242','1993/02/02','Female','081368725316','Jl.Rambutan no.86 Cilegon'),
('MI0243','1989/05/05','Male','087826354827','Jl.Belimbing no.45 Cianjur')

Insert Into Human.Member values
('M0234','MI0234','Nurul'),
('M0235','MI0235','Kezia'),
('M0236','MI0236','Syifa'),
('M0237','MI0237','Teguh'),
('M0238','MI0238','Supratman'),
('M0239','MI0239','Joko'),
('M0240','MI0240','Widodo'),
('M0241','MI0241','Angelia'),
('M0242','MI0242','Berta'),
('M0243','MI0243','Dono')

Insert Into Human.EmployeeInfo values
('EI0345','Male','1980/05/30','087243658465','Jl.Macan no.12 Jakarta Barat','Active','Manager'),
('EI0346','Male','1975/12/23','089342748293','Jl.Kelinci no.43 Cibinong','Active','Secretary'),
('EI0347','Female','1981/10/22','087245384651','Jl.Burung no.56 Ciledug','Active','Frontdesk'),
('EI0348','Female','1978/07/12','087243759401','Jl.Semut no.08 Depok','Active','Frontdesk'),
('EI0349','Male','1990/03/03','089543264573','Jl.Ayam no.11 Bogor','Active','Warehouse'),
('EI0350','Female','1989/06/25','081423789456','Jl.Monyet no.78 Bogor','Active','Warehouse'),
('EI0351','Male','1987/11/02','081725364738','Jl.Singa no.99 Bekasi','Active','Warehouse'),
('EI0352','Female','1990/08/17','081666778452','Jl.Gajah no.01 Bekasi','Active','Janitor'),
('EI0353','Male','1992/07/10','087999665433','Jl.Jerapah no.09 Tangerang','Active','Janitor'),
('EI0354','Female','1994/01/01','089666554321','Jl.Rusa no.12 Tangerang','Active','Janitor')

Insert Into Human.Employee values
('E0123','EI0345','Aldi'),
('E0124','EI0346','Rojali'),
('E0125','EI0347','Fatma'),
('E0126','EI0348','Wati'),
('E0127','EI0349','Irfan'),
('E0128','EI0350','Tuti'),
('E0129','EI0351','Bambang'),
('E0130','EI0352','Dini'),
('E0131','EI0353','Ezra'),
('E0132','EI0354','Ratih')

Insert Into Object.BookInfo values
('BI0876453','Larry King','Gramedia','2009','Depok','3'),
('BI0898712','Wulan Ayodya','Kompas','2008','Jakarta','3'),
('BI0812345','Dr. Ali Syariati','Cakrawangsa','2003','Bekasi','3'),
('BI0855334','Louise Cummings','Pustaka Pelajar','2000','Surabaya','4'),
('BI0889765','Betha Sidik','Grasindo','2011','Bandung','3'),
('BI0811245','Sal Mugiyanto','Wedatama Widya Sastra','2002','Bogor','4'),
('BI0876987','Lusiana Wijaya','fBumi Aksara','2005','Malang','3'),
('BI0856443','Ketut Surya Diarta','Serambi','2012','Yogyakarta','3'),
('BI0891278','Nyoman S. Pendit','Gramedia','2013','Jawa Barat','4'),
('BI0866779','Zainal Abidin','Pustaka Setia','2015','Madura','3'),
('BI0833559','Ahmad Tafsir','Tiara Wacana','2014','Karawang','4'),
('BI0822659','Surajiyo','Bumi Aksara','2016','Jawa Tengah','3'),
('BI0878432','Hasan Basri','Pustaka Setia','2017','Jakarta','4'),
('BI0814924','Prof. Dr. Bimo Walgito','Andi Yogyakarta','2007','Palembang','4'),
('BI0899116','Dr. Syaifuddin Azwar, MA','Pustaka Pelajar','2006','Pandeglang','3')

Insert Into Object.Book values
('B0612345','BI0876453','General','Kewirausahaan'),
('B0678965','BI0876453','Religion','The Encyclopaedia of Islam'),
('B0646376','BI0812345','Social','Revolusi Belum Selesai'),
('B0653764','BI0855334','Language','Bahasa Indonesia Kreatif'),
('B0686436','BI0889765','Science','Belajar Sains'),
('B0655987','BI0811245','Technology','Pengantar Teknologi Informasi'),
('B0656356','BI0876987','Art','Tradisi Dan Inovasi'),
('B0657235','BI0856443','Literature','Teknik Apresiasi Sastra'),
('B0658649','BI0891278','History','A Short History Of Indonesia'),
('B0659234','BI0866779','Geography','Metode Penelitian Geografi'),
('B0668676','BI0833559','Recreation','Pelangi Pariwisata Bali'),
('B0661378','BI0822659','Children','Lagu Anak-Anak'),
('B0662143','BI0878432','Philosophy','Filsafat Manusia'),
('B0663987','BI0814924','Pshychology','Teori-Teori Psikologi Sosial'),
('B0664456','BI0899116','Recipe','Resep Makanan Bola-Bola Ubi')

Insert Into Trans.LoanTransaction values
('L0834','M0239','E0125','B0612345','BI0876453','Kewirausahaan','1','2017/11/14','2017/11/21'),
('L0835','M0234','E0125','B0653764','BI0898712','Bahasa Indonesia Kreatif','1','2017/11/16','2017/11/23'),
('L0836','M0236','E0125','B0668676','BI0812345','Pelangi Pariwisata Bali','2','2017/11/20','2017/11/27'),
('L0837','M0242','E0126','B0664456','BI0855334','Resep Makanan Bola-Bola Ubi','3','2017/11/30','2017/12/07'),
('L0838','M0240','E0126','B0659234','BI0889765','Metode Penelitian Geografi','1','2017/11/28','2017/12/05'),
('L0839','M0235','E0126','B0661378','BI0811245','Lagu Anak-Anak','2','2017/11/17','2017/11/24'),
('L0840','M0243','E0125','B0657235','BI0876987','Teknik Apresiasi Sastra','3','2017/11/23','2017/11/30'),
('L0841','M0241','E0125','B0646376','BI0856443','Revolusi Belum Selesai','3','2017/11/23','2017/11/30'),
('L0842','M0237','E0125','B0655987','BI0891278','Pengantar Teknologi Informasi','1','2017/11/25','2017/12/02'),
('L0843','M0238','E0126','B0678965','BI0866779','The Encyclopaedia of Islam','2','2017/11/15','2017/11/22')

Insert Into Trans.ReturnTransaction values
('R0910','L0834','M0239','E0125','B0612345','BI0876453','Kewirausahaan','1','2017/11/21','0',''),
('R0911','L0835','M0234','E0125','B0653764','BI0898712','Bahasa Indonesia Kreatif','1','2017/11/23','0',''),
('R0912','L0836','M0236','E0125','B0668676','BI0812345','Pelangi Pariwisata Bali','2','2017/11/29','2000',''),
('R0913','L0837','M0242','E0126','B0664456','BI0855334','Resep Makanan Bola-Bola Ubi','3','2017/12/08','1000',''),
('R0914','L0838','M0240','E0126','B0659234','BI0889765','Metode Penelitian Geografi','1','2017/12/10','5000',''),
('R0915','L0839','M0235','E0126','B0661378','BI0811245','Lagu Anak-Anak','2','2017/11/28','4000',''),
('R0916','L0840','M0243','E0125','B0657235','BI0876987','Teknik Apresiasi Sastra','3','2017/12/01','1000',''),
('R0917','L0841','M0241','E0125','B0646376','BI0856443','Revolusi Belum Selesai','3','2017/11/30','0',''),
('R0918','L0842','M0237','E0125','B0655987','BI0891278','Pengantar Teknologi Informasi','1','2017/12/02','0',''),
('R0919','L0843','M0238','E0126','B0678965','BI0866779','The Encyclopaedia of Islam','2','2017/11/25','3000','')



/*show table*/
select * from Human.MemberInfo
select * from Human.Member
select * from Human.EmployeeInfo
select * from Human.Employee
select * from Object.BookInfo
select * from Object.Book
select * from Trans.LoanTransaction
select * from Trans.ReturnTransaction



/*Create Procedure*/
--MemberInfo--
/*Procedure_Insert_MemberInfo*/
create procedure InsertMemberInfo
		@ID_MemberInfo varchar(8),
		@Member_Birth date,
		@Member_Gender varchar(10),
		@Member_Telp varchar(15),
		@Member_Address varchar(50)

as
	begin
		insert into Human.MemberInfo values
		(@ID_MemberInfo,@Member_Birth,@Member_Gender,@Member_Telp,@Member_Address)
	end

Exec InsertMemberInfo @ID_MemberInfo='MI0244',@Member_Birth='1998/02/19',@Member_Gender='Female',@Member_Telp='082532787651',@Member_Address='Jl.apa ya'
select * from Human.MemberInfo


/*Procedure_Update_MemberInfo*/
create procedure UpdateMemberInfo
		@ID_MemberInfo varchar(8),
		@Member_Birth date,
		@Member_Gender varchar(10),
		@Member_Telp varchar(15),
	 	@Member_Address varchar(50)
as 
	begin
		update Human.MemberInfo set
		Member_Birth=@Member_Birth,Member_Gender=@Member_Gender,Member_Telp=@Member_Telp,Member_Address=@Member_Address
		where ID_MemberInfo=@ID_MemberInfo
	end

Exec UpdateMemberInfo @ID_MemberInfo='MI0244',@Member_Birth='1998/02/19',@Member_Gender='Female',@Member_Telp='082532787651',@Member_Address='Jl.apa hayo'
select * from Human.MemberInfo


/*Procedure_Delete_MemberInfo*/
create procedure DeleteMemberInfo
@ID_MemberInfo varchar(8)
as
Delete from Human.MemberInfo where @ID_MemberInfo=ID_MemberInfo

exec DeleteMemberInfo @ID_MemberInfo='MI0244'
select * from Human.MemberInfo


--Member--
/*Procedure_Insert_Member*/
create procedure InsertMember
		@ID_Member varchar(8),
		@ID_MemberInfo varchar(8),
		@Member_Name varchar(50)		
as
	begin
		insert into Human.Member values
		(@ID_Member,@ID_MemberInfo,@Member_Name)
	end

exec InsertMember @ID_Member='M0244',@ID_MemberInfo='MI0240',@Member_Name='Wati'
select * from Human.Member


/*Procedure_Update_Member*/
create procedure UpdateMember
		@ID_Member varchar(8),
		@ID_MemberInfo varchar(8),
		@Member_Name varchar(50)		
as
	begin
		update Human.Member set
		ID_MemberInfo=@ID_MemberInfo,Member_Name=@Member_Name 
		where ID_Member=@ID_Member
	end

exec UpdateMember @ID_Member='M0244',@ID_MemberInfo='MI0240',@Member_Name='Sari'
select * from Human.Member


/*Procedure_Delete_Member*/
create procedure DeleteMember
@ID_Member char(8)
as
Delete from Human.Member where ID_Member=@ID_Member

exec DeleteMember @ID_Member='M0244'
select * from Human.Member


--EmployeeInfo--
/*Procedure_Insert_EmployeeInfo*/
create procedure InsertEmployeeInfo
		@ID_EmpInfo varchar(8),
		@Emp_Gender varchar(10),
		@Emp_Birth date,
		@Emp_Telp varchar(15),
		@Emp_Add varchar(50),
		@Emp_Status varchar(10),
		@Emp_Position varchar(25)
as
	begin
		insert into Human.EmployeeInfo values
		(@ID_EmpInfo,@Emp_Gender,@Emp_Birth,@Emp_Telp,@Emp_Add,@Emp_Status,@Emp_Position)
	end

exec InsertEmployeeInfo @ID_EmpInfo='EI0355',@Emp_Gender='Female',@Emp_Birth='1970/12/01',@Emp_Telp='081725364899',
     @Emp_Add='Jl.Kudanil no.10 Depok',@Emp_Status='Active',@Emp_Position='Frontdesk'
select * from Human.EmployeeInfo


/*Procedure_Update_EmployeeInfo*/
create procedure UpdateEmployeeInfo
		@ID_EmpInfo varchar(8),
		@Emp_Gender varchar(10),
		@Emp_Birth date,
		@Emp_Telp varchar(15),
		@Emp_Add varchar(50),
		@Emp_Status varchar(10),
		@Emp_Position varchar(25)
as
	begin
		update Human.EmployeeInfo set
		ID_EmpInfo=@ID_EmpInfo,Emp_Gender=@Emp_Gender,Emp_Birth=@Emp_Birth,Emp_Telp=@Emp_Telp,Emp_Add=@Emp_Add,Emp_Status=@Emp_Status,
		Emp_Position=@Emp_Position WHERE ID_EmpInfo=@ID_EmpInfo
	end

exec UpdateEmployeeInfo @ID_EmpInfo='EI0355',@Emp_Gender='Female',@Emp_Birth='1970/12/01',@Emp_Telp='081725364899',
     @Emp_Add='Jl.Kudanil no.10 Depok',@Emp_Status='Non-Active',@Emp_Position='Frontdesk'
select * from Human.EmployeeInfo


/*Procedure_Delete_EmployeeInfo*/
create procedure DeleteEmployeeInfo
@ID_EmpInfo varchar(8)
as
Delete from Human.EmployeeInfo where ID_EmpInfo=@ID_EmpInfo

exec DeleteEmployeeInfo @ID_EmpInfo='EI0355'
select * from Human.EmployeeInfo


--Employee--
/*Procedure_Insert_Employee*/
create procedure InsertEmployee
		@ID_Emp varchar(8),
		@ID_EmpInfo varchar(8),
		@Emp_Name varchar(50)
as
	begin
		insert into Human.Employee values
		(@ID_Emp,@ID_EmpInfo,@Emp_Name)
	end

exec InsertEmployee @ID_Emp='E0133',@ID_EmpInfo='EI0354',@Emp_Name='Darius'
select * from Human.Employee
		

/*Procedure_Update_Employee*/
create procedure UpdateEmployee
		@ID_Emp varchar(8),
		@ID_EmpInfo varchar(8),
		@Emp_Name varchar(50)
as
	begin
		update Human.Employee set
		ID_EmpInfo=@ID_EmpInfo,Emp_Name=@Emp_Name where ID_Emp=@ID_Emp
	end

exec UpdateEmployee @ID_Emp='E0133',@ID_EmpInfo='EI0354',@Emp_Name='Dara'
select * from Human.Employee


/*Procedure_Delete_Employee*/
create procedure DeleteEmployee
@ID_Emp varchar(8)
as
Delete from Human.Employee where ID_Emp=@ID_Emp

exec DeleteEmployee @ID_Emp='E0133'
select * from Human.Employee


--BookInfo--
/*Procedure_Insert_BookInfo*/
create procedure InsertBookInfo
		@ID_BookInfo varchar(10),
		@Book_Writer varchar(50),
		@Book_Publish varchar(50),
		@Book_Year varchar(5),
		@Book_Place varchar(50),
		@Book_Stock varchar(5)
as
	begin
		insert into Object.BookInfo values
		(@ID_BookInfo,@Book_Writer,@Book_Publish,@Book_Year,@Book_Place,@Book_Stock)
	end

exec InsertBookInfo @ID_BookInfo='BI0812443',@Book_Writer='Deva Mahendra',@Book_Publish='Gunung Agung',@Book_Year='2010',@Book_Place='Surabaya',
     @Book_Stock='3'
select * from Object.BookInfo


/*Procedure_Update_BookInfo*/
create procedure UpdateBookInfo
		@ID_BookInfo varchar(10),
		@Book_Writer varchar(50),
		@Book_Publish varchar(50),
		@Book_Year varchar(5),
		@Book_Place varchar(50),
		@Book_Stock varchar(5)
as
	begin
		update Object.BookInfo set
		Book_Writer=@Book_Writer,Book_Publish=@Book_Writer,Book_Year=@Book_Year,Book_Place=@Book_Place where ID_BookInfo=@ID_BookInfo
	end

exec UpdateBookInfo @ID_BookInfo='BI0812443',@Book_Writer='Deva Mahendra',@Book_Publish='Gunung Agung',@Book_Year='2012',@Book_Place='Padang',
     @Book_Stock='3'
select * from Object.BookInfo


/*Procedure_Delete_BookInfo*/
create procedure DeleteBookInfo
@ID_BookInfo varchar(10)
as
Delete from Object.BookInfo where @ID_BookInfo=ID_BookInfo

exec DeleteBookInfo @ID_BookInfo='BI0812443'
select * from Object.BookInfo


--Book--
/*Procedure_Insert_Book*/
create procedure InsertBook
		@ID_Book varchar(10),
		@ID_BookInfo varchar(10),
		@Book_Category varchar(50),
		@Book_Title varchar(50)
as
	begin
		insert into Object.Book values
		(@ID_Book,@ID_BookInfo,@Book_Category,@Book_Title)
	end

exec InsertBook @ID_Book='B0612346',@ID_BookInfo='BI0889765',@Book_Category='Science',@Book_Title='Belajar Tentang Alam'
select * from Object.Book


/*Procedure_Update_Book*/
create procedure UpdateBook
		@ID_Book varchar(10),
		@ID_BookInfo varchar(10),
		@Book_Category varchar(50),
		@Book_Title varchar(50)
as
	begin
		update Object.Book set
		ID_BookInfo=@ID_BookInfo,Book_Category=@Book_Category,Book_Title=@Book_Title where ID_Book=@ID_Book
	end

exec UpdateBook @ID_Book='B1234568',@ID_BookInfo='BI0889765',@Book_Category='Geography',@Book_Title='Gempa Tektonik dan Vulkanik'
select * from Object.Book


/*Procedure_Delete_Book*/
create procedure DeleteBook
@ID_Book varchar(10)
as
Delete from Object.Book where ID_Book=@ID_Book

exec DeleteBook @ID_Book='B1234568'


/*Procedure Insert Loan Transaction*/
create procedure Insert_LoanTransaction
	@ID_Loan varchar(8),
	@ID_Member varchar(8),
	@ID_Emp varchar(8),
	@ID_Book varchar(10),
	@ID_BookInfo varchar(10),
	@Book_Title varchar(50),
	@Quantity int,
	@Loan_Date date,
	@Due_Date date
as
begin
	insert into Trans.LoanTransaction values
	(@ID_Loan,@ID_Member,@ID_Emp,@ID_Book,@ID_BookInfo,@Book_Title,@Quantity,@Loan_Date,@Due_Date)
end

Exec Insert_LoanTransaction 'L0844','M0239','E0130','B0657235','BI0856443','Teknik Apresiasi Sastra',2,'2017/11/14','2017/11/21'
select * from Object.BookInfo
select * from Trans.LoanTransaction


/*Procedure Insert Return Transaction*/
create procedure Insert_ReturnTransaction
	@ID_Return varchar(8),
	@ID_Loan varchar(8),
	@ID_Member varchar(8),
	@ID_Emp varchar(8),
	@ID_Book varchar(10),
	@ID_BookInfo varchar(10),
	@Book_Title varchar(50),
	@Quantity int,
	@Return_Date Date,
	@Return_Fine money,
	@Total_Fine money
as
begin
	insert into Trans.ReturnTransaction values
	(@ID_Return,@ID_Loan,@ID_Member,@ID_Emp,@ID_Book,@ID_BookInfo,@Book_Title,@Quantity,@Return_Date,@Return_Fine,@Total_Fine)
end

exec Insert_ReturnTransaction 'R0920','L0844','M0239','E0130','B0657235','BI0856443','Teknik Apresiasi Sastra','2','2017/11/21','2000',''
select * from Object.Book
select * from Object.BookInfo
select * from Trans.LoanTransaction
select * from Trans.ReturnTransaction



/*Make Trigger*/
--MemberInfo--
/*Trigger_Insert_MemberInfo*/
CREATE TRIGGER TR_InsertMemberInfo
On Human.MemberInfo for Insert
AS
BEGIN
		Declare @ID_MemberInfo varchar(8)
		Declare @Member_Birth date
		Declare @Member_Gender varchar (10)
		Declare @Member_Telp varchar(15)
		Declare @Member_Address varchar(50)
select @ID_MemberInfo=ID_MemberInfo,@Member_Birth=Member_Birth,@Member_Gender=Member_Gender,@Member_Telp=Member_Telp,
       @Member_Address=Member_Address from inserted

print '===The Data Has Been Inserted==='
print 'ID MemberInfo        : '+@ID_MemberInfo
print 'Birth                : '+cast(@Member_Birth as nvarchar)
print 'Gender               : '+@Member_Gender
print 'Telp                 : '+@Member_Telp
print 'Address              : '+@Member_Address
END


/*Trigger_Update_MemberInfo*/
CREATE TRIGGER TR_UpdateMemberInfo
On Human.MemberInfo for Update
AS
BEGIN
		Declare @ID_MemberInfo varchar(8)
		Declare @Member_Birth date
		Declare @Member_Gender varchar (10)
		Declare @Member_Telp varchar(15)
		Declare @Member_Address varchar(50)
select @ID_MemberInfo=ID_MemberInfo,@Member_Birth=Member_Birth,@Member_Gender=Member_Gender,@Member_Telp=Member_Telp,
       @Member_Address=Member_Address from inserted

print '===The Data Has Been Updated==='
print 'ID MemberInfo          : '+@ID_MemberInfo
print 'Birth                  : '+cast(@Member_Birth as nvarchar)
print 'Gender                 : '+@Member_Gender
print 'Telp                   : '+@Member_Telp
print 'Address                : '+@Member_Address
END


/*Trigger_Delete_MemberInfo*/
CREATE TRIGGER TR_DeleteMemberInfo
On Human.MemberInfo for Delete
AS
BEGIN
		Declare @ID_MemberInfo varchar(8)
		Declare @Member_Birth date
		Declare @Member_Gender varchar (10)
		Declare @Member_Telp varchar(15)
		Declare @Member_Address varchar(50)
select @ID_MemberInfo=ID_MemberInfo,@Member_Birth=Member_Birth,@Member_Gender=Member_Gender,@Member_Telp=Member_Telp,
       @Member_Address=Member_Address from deleted

print '===The Data Has Been Deleted==='
print 'ID MemberInfo   : '+@ID_MemberInfo
print 'Birth           : '+cast(@Member_Birth as nvarchar)
print 'Gender          : '+@Member_Gender
print 'Telp            : '+@Member_Telp
print 'Address         : '+@Member_Address
END


--Member--
/*Trigger_Insert_Member*/
CREATE TRIGGER TR_InsertMember
On Human.Member for Insert
AS
BEGIN
		Declare @ID_Member varchar(8)
		Declare @ID_MemberInfo varchar(8)
		Declare @Member_Name varchar(50)

select @ID_Member=ID_Member,@ID_MemberInfo=ID_MemberInfo,@Member_Name=Member_Name from inserted

Print '===The Data Has Been Inserted==='
Print 'ID Member            : '+@ID_Member
Print 'ID MemberInfo        : '+@ID_MemberInfo
Print 'Name                 : '+@Member_Name
END


/*Trigger_Update_Member*/
CREATE TRIGGER TR_UpdateMember
On Human.Member for Update
AS
BEGIN
		Declare @ID_Member varchar(8)
		Declare @ID_MemberInfo varchar(8)
		Declare @Member_Name varchar (50)
select @ID_Member=ID_Member,@ID_MemberInfo=ID_MemberInfo,@Member_Name=Member_Name from inserted

print '===The Data Has Been Updated==='
print 'ID Member            : '+@ID_Member
print 'ID_MemberInfo        : '+@ID_MemberInfo
print 'Member_Name          : '+@Member_Name
END


/*Trigger_Delete_Member*/
CREATE TRIGGER TR_DeleteMember
On Human.Member for Delete
AS
BEGIN
		Declare @ID_Member varchar(8)
		Declare @ID_MemberInfo varchar(8)
		Declare @Member_Name varchar(50)

select @ID_Member=ID_Member,@ID_MemberInfo=ID_MemberInfo,@Member_Name=Member_Name from deleted

Print '===The Data Has Been Deleted==='
Print 'ID Member            : '+@ID_Member
Print 'ID MemberInfo        : '+@ID_MemberInfo
Print 'Name                 : '+@Member_Name
END


--EmployeeInfo--
/*Trigger_Insert_EmployeeInfo*/
CREATE TRIGGER TR_InsertEmployeeInfo
On Human.EmployeeInfo for Insert
AS
BEGIN
		Declare @ID_EmpInfo varchar(8)
		Declare @Emp_Gender varchar(10)
		Declare @Emp_Birth date
		Declare @Emp_Telp varchar(15)
		Declare @Emp_Add varchar(50)
		Declare @Emp_Status varchar(10)
		Declare @Emp_Position varchar(25)

select @ID_EmpInfo=ID_EmpInfo,@Emp_Gender=Emp_Gender,@Emp_Telp=Emp_Telp,@Emp_Add=Emp_Add,@Emp_Status=Emp_Status,@Emp_Position=Emp_Position from inserted

Print '===The Data Has Been Inserted==='
Print 'ID EmpInfo       : '+@ID_EmpInfo
Print 'Gender           : '+@Emp_Gender
Print 'Birth            : '+cast(@Emp_Birth as nvarchar)
Print 'Telp             : '+@Emp_Telp
Print 'Add              : '+@Emp_Add
Print 'Status           : '+@Emp_Status
Print 'Position         : '+@Emp_Position
END


/*Trigger_Update_EmployeeInfo*/
CREATE TRIGGER TR_UpdateEmployeeInfo
On Human.EmployeeInfo for Update
AS
BEGIN
		Declare @ID_EmpInfo varchar(8)
		Declare @Emp_Gender varchar(10)
		Declare @Emp_Birth date
		Declare @Emp_Telp varchar(15)
		Declare @Emp_Add varchar(50)
		Declare @Emp_Status varchar(10)
		Declare @Emp_Position varchar(25)

select @ID_EmpInfo=ID_EmpInfo,@Emp_Gender=Emp_Gender,@Emp_Birth=Emp_Birth,@Emp_Telp=Emp_Telp,@Emp_Add=Emp_Add,@Emp_Status=Emp_Status,@Emp_Position=Emp_Position from inserted

Print '===The Data Has Been Updated==='
Print 'ID EmpInfo       : '+@ID_EmpInfo
Print 'Gender           : '+@Emp_Gender
Print 'Birth            : '+cast(@Emp_Birth as nvarchar)
Print 'Telp             : '+@Emp_Telp
Print 'Add              : '+@Emp_Add
Print 'Status           : '+@Emp_Status
Print 'Position         : '+@Emp_Position
END


/*Trigger_Delete_EmployeeInfo*/
CREATE TRIGGER TR_DeleteEmployeeInfo
On Human.EmployeeInfo for Delete
AS
BEGIN
		Declare @ID_EmpInfo varchar(8)
		Declare @Emp_Gender varchar(10)
		Declare @Emp_Birth date
		Declare @Emp_Telp varchar(15)
		Declare @Emp_Add varchar(50)
		Declare @Emp_Status varchar(10)
		Declare @Emp_Position varchar(25)

select @ID_EmpInfo=ID_EmpInfo,@Emp_Gender=Emp_Gender,@Emp_Birth=Emp_Birth,@Emp_Telp=Emp_Telp,@Emp_Add=Emp_Add,@Emp_Status=Emp_Status,@Emp_Position=Emp_Position from deleted

Print '===The Data Has Been Deleted==='
Print 'ID EmpInfo      : '+@ID_EmpInfo
Print 'Gender          : '+@Emp_Gender
Print 'Birth           : '+cast(@Emp_Birth as nvarchar)
Print 'Telp            : '+@Emp_Telp
Print 'Add             : '+@Emp_Add
Print 'Status          : '+@Emp_Status
Print 'Position        : '+@Emp_Position
END


--Employee--
/*Trigger_Insert_Employee*/
CREATE TRIGGER TR_InsertEmployee
On Human.Employee for Insert
AS
BEGIN
		Declare @ID_Emp varchar(8)
		Declare @ID_EmpInfo varchar(8)
		Declare @Emp_Name varchar(50)

select @ID_Emp=ID_Emp,@ID_EmpInfo=ID_EmpInfo,@Emp_Name=Emp_Name from inserted

Print '===The Data Has Been Inserted==='
Print 'ID Emp           : '+@ID_Emp
Print 'ID EmpInfo       : '+@ID_EmpInfo
Print 'Name             : '+@Emp_Name
END

/*Trigger_Update_Employee*/
CREATE TRIGGER TR_UpdateEmployee
On Human.Employee for Update
AS
BEGIN
		Declare @ID_Emp varchar(8)
		Declare @ID_EmpInfo varchar(8)
		Declare @Emp_Name varchar(50)
select @ID_Emp=ID_Emp,@ID_EmpInfo=ID_Empinfo,@Emp_Name=Emp_Name from inserted

print '===The Data Has Been Updated==='
print 'ID Emp          : '+@ID_Emp
print 'ID EmpInfo      : '+@ID_EmpInfo
print 'Name            : '+@Emp_Name
END


/*Trigger_Delete_Employee*/
CREATE TRIGGER TR_DeleteEmployee
On Human.Employee for Delete
AS
BEGIN
		Declare @ID_Emp varchar(8)
		Declare @ID_EmpInfo varchar(8)
		Declare @Emp_Name varchar(50)

select @ID_Emp=ID_Emp,@ID_EmpInfo=ID_EmpInfo,@Emp_Name=Emp_Name from Deleted

Print '===The Data Has Been Deleted==='
Print 'ID Emp        : '+@ID_Emp
Print 'ID EmpInfo    : '+@ID_EmpInfo
Print 'Name          : '+@Emp_Name
END 


--BookInfo--
/*Trigger_Insert_BookInfo*/
CREATE TRIGGER TR_InsertBookInfo
On Object.BookInfo for Insert
AS
BEGIN
		Declare @ID_Bookinfo varchar(10)
		Declare @Book_Writer varchar(50)
		Declare @Book_Publish varchar(50)
		Declare @Book_Year varchar(5)
		Declare @Book_Place varchar(50)
		Declare @Book_Stock varchar(5)

select @ID_BookInfo=ID_BookInfo,@Book_Writer=Book_Writer,@Book_Publish=@Book_Publish,@Book_Year=Book_Year,@Book_Place=Book_Place,@Book_Stock=Book_Stock from inserted

Print '===The Data Has Been Inserted==='
Print 'ID BookInfo        : '+@ID_BookInfo
Print 'Writer             : '+@Book_Writer
Print 'Publish            : '+@Book_Publish
Print 'Year               : '+@Book_Year
Print 'Place              : '+@Book_Place
Print 'Stock              : '+@Book_Stock
END


/*Trigger_Update_BookInfo*/
CREATE TRIGGER TR_UpdateBookInfo
On Object.BookInfo
after insert, Update
AS
BEGIN
		Declare @ID_Bookinfo varchar(10)
		Declare @Book_Writer varchar(50)
		Declare @Book_Publish varchar(50)
		Declare @Book_Year varchar(5)
		Declare @Book_Place varchar(50)
		Declare @Book_Stock varchar(5)

select @ID_BookInfo=ID_BookInfo,@Book_Writer=Book_Writer,@Book_Publish=@Book_Publish,@Book_Year=Book_Year,@Book_Place=Book_Place,@Book_Stock=Book_Stock from inserted

Print '===The Data Has Been Updated==='
Print 'ID BookInfo      : '+@ID_BookInfo
Print 'Writer           : '+@Book_Writer
Print 'Publish          : '+@Book_Publish
Print 'Year             : '+@Book_Year
Print 'Place            : '+@Book_Place
Print 'Stock            : '+@Book_Stock
END


/*Trigger_Delete_BookInfo*/
CREATE TRIGGER TR_DeleteBookInfo
On Object.BookInfo for Delete
AS
BEGIN
		Declare @ID_Bookinfo varchar(10)
		Declare @Book_Writer varchar(50)
		Declare @Book_Publish varchar(50)
		Declare @Book_Year varchar(5)
		Declare @Book_Place varchar(50)
		Declare @Book_Stock varchar(5)

select @ID_BookInfo=ID_BookInfo,@Book_Writer=Book_Writer,@Book_Publish=@Book_Publish,@Book_Year=Book_Year,@Book_Place=Book_Place,@Book_Stock=Book_Stock from deleted

Print '===The Data Has Been Deleted==='
Print 'ID BookInfo        : '+@ID_BookInfo
Print 'Writer             : '+@Book_Writer
Print 'Publish            : '+@Book_Publish
Print 'Year               : '+@Book_Year
Print 'Place              : '+@Book_Place
Print 'Stock              : '+@Book_Stock
END


--Book--
/*Trigger_Insert_Book*/
CREATE TRIGGER TR_InsertBook
On Object.Book for Insert
AS
BEGIN
		Declare @ID_Book varchar(10)
		Declare @ID_BookInfo varchar(10)
		Declare @Book_Category varchar(50)
		Declare @Book_Title varchar(50)

select @ID_Book=ID_Book,@ID_BookInfo=ID_BookInfo,@Book_Category=Book_Category,@Book_Title=Book_Title from inserted

Print '===The Data Has Been Inserted==='
Print 'ID Book            : '+@ID_Book
Print 'ID BookInfo        : '+@ID_BookInfo
Print 'Book Category      : '+@Book_Category
Print 'Book Title         : '+@Book_Title
END


/*Trigger_Update_Book*/
CREATE TRIGGER TR_UpdateBook
On Object.Book for Update
AS
BEGIN
		Declare @ID_Book varchar(10)
		Declare @ID_BookInfo varchar(10)
		Declare @Book_Category varchar (50)
		Declare @Book_Title varchar(50)
select @ID_Book=ID_Book,@ID_BookInfo=ID_BookInfo,@Book_Category=Book_Category,@Book_Title=Book_Title from inserted

print '===The Data Has Been Updated==='
print 'ID Book           : '+@ID_Book
print 'ID BookInfo       : '+@ID_BookInfo
print 'Book Category     : '+@Book_Category
print 'Book Title        : '+@Book_Title
END


/*Trigger_Delete_Book*/
CREATE TRIGGER TR_DeleteBook
On Object.Book for Delete
AS
BEGIN
		Declare @ID_Book varchar(10)
		Declare @ID_BookInfo varchar(10)
		Declare @Book_Category varchar(50)
		Declare @Book_Title varchar(50)

select @ID_Book=ID_Book,@ID_BookInfo=ID_BookInfo,@Book_Category=Book_Category,@Book_Title=Book_Title from Deleted

Print '===The Data Has Been Deleted==='
Print 'ID Book             : '+@ID_Book
Print 'ID BookInfo         : '+@ID_BookInfo
Print 'Book Category       : '+@Book_Category
Print 'Book Title          : '+@Book_Title
END



--LoanTransaction--
/*Trigger_Insert_LoanTransaction*/
create trigger Insert_LoanTransaction on Trans.LoanTransaction
after insert
as
begin
update Object.BookInfo set Object.BookInfo.Book_Stock = Object.BookInfo.Book_Stock - INSERTED.Quantity from INSERTED WHERE Object.BookInfo.ID_BookInfo = INSERTED.ID_BookInfo
print 'Loan Data has successfully added to the table.'  
print 'Book Stock in the Object.BookInfo has successfully updated.'
print 'Modificated : '+ CONVERT(VARCHAR , GETDATE())
print 'Host Name : '+Host_Name()
end


--Return Transaction--
/*Trigger_Insert_ReturnTransaction*/
create trigger Insert_ReturnTransaction
on Trans.ReturnTransaction
for insert
as
begin
	declare @ID_Return varchar(8)
	declare @ID_Loan varchar(8)
	declare @ID_Member varchar(8)
	declare @ID_Emp varchar(8)
	declare @ID_Book varchar(10)
	declare @ID_BookInfo varchar(10)
	declare @Book_Title varchar(50)
	declare @Quantity int
	declare @Return_Date Date
	declare @Return_Fine money
	declare @Total_Fine money

update Object.BookInfo set Object.BookInfo.Book_Stock = Object.BookInfo.Book_Stock + INSERTED.Quantity from INSERTED WHERE Object.BookInfo.ID_BookInfo = INSERTED.ID_BookInfo

select @ID_Return=ID_Return,@ID_Loan=ID_Loan,@ID_Member=ID_Member,@ID_Emp=ID_Emp,@ID_Book=ID_Book,@ID_BookInfo=ID_BookInfo,@Book_Title=Book_Title,@Quantity=Quantity,@Return_Date=Return_Date,@Return_Fine=Return_Fine,@Total_Fine=Total_Fine from inserted

update Trans.ReturnTransaction set Total_Fine=@Quantity*@Return_Fine
where ID_Return=@ID_Return

print 'Return Data has successfully added to the table'  
print 'Book Stock in the Object.BookInfo has successfully updated.'
print 'Dimodifikasi : '+ CONVERT(VARCHAR , GETDATE())
print 'Nama Host : '+Host_Name()
end


/*Procedure view*/
create procedure view_transaction
@id char(20)
as
SELECT Human.Member.Member_Name, Human.Employee.Emp_Name, Trans.LoanTransaction.Book_Title, Trans.LoanTransaction.Loan_Date, Trans.LoanTransaction.Due_Date, Trans.ReturnTransaction.Return_Date, 
       Trans.LoanTransaction.Quantity, Trans.ReturnTransaction.Return_Fine, Trans.ReturnTransaction.Total_Fine
FROM   Human.Member INNER JOIN
       Trans.LoanTransaction ON Human.Member.ID_Member = Trans.LoanTransaction.ID_Member INNER JOIN
       Human.Employee ON Trans.LoanTransaction.ID_Emp = Human.Employee.ID_Emp INNER JOIN
       Trans.ReturnTransaction ON Trans.LoanTransaction.ID_Loan = Trans.ReturnTransaction.ID_Loan
Where Trans.LoanTransaction.Loan_Date = @id


create procedure view_transaction
@id1 char(20)
as
SELECT Human.Member.Member_Name, Human.Employee.Emp_Name, Trans.LoanTransaction.Book_Title, Trans.LoanTransaction.Loan_Date, Trans.LoanTransaction.Due_Date, Trans.ReturnTransaction.Return_Date, 
       Trans.LoanTransaction.Quantity, Trans.ReturnTransaction.Return_Fine, Trans.ReturnTransaction.Total_Fine
FROM   Human.Member INNER JOIN
       Trans.LoanTransaction ON Human.Member.ID_Member = Trans.LoanTransaction.ID_Member INNER JOIN
       Human.Employee ON Trans.LoanTransaction.ID_Emp = Human.Employee.ID_Emp INNER JOIN
       Trans.ReturnTransaction ON Trans.LoanTransaction.ID_Loan = Trans.ReturnTransaction.ID_Loan
Where Trans.ReturnTransaction.Total_Fine = @id1



/*Report*/
exec view_transaction'2017/11/17'
exec view_transaction'2017/11/14'
select * from Trans.LoanTransaction 

exec view_transaction'4000'
SELECT * from Trans.ReturnTransaction