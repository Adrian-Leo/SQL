create database BANK

/*Create Schema*/

create schema human
go

create schema object 
go

create schema transaksi
go

/*CREATE_TABLE */
-- TABEL PENDAFTARAN NASABAH --
create table human.PendaftaranNasabah(
ID_NASABAH varchar(20) not null primary key,
	constraint pkID_NASABAH 
	check (ID_NASABAH like ('[N][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10--

ID_PEG varchar(8) not null,
	constraint fkID_PEG
	check (ID_PEG like ('[P][G][0-9][0-9][0-9][0-9]')),
		
NAMA_NASABAH varchar(50) not null,
	
EMAIL varchar(50) not null,

TANGGAL_LAHIR nvarchar(10) not null, 
	constraint chkTANGGAL_LAHIR
	check (member_birth <= getdate ()),

GENDER varchar(10) check (GENDER like 'Male' or GENDER like 'Female')NOT NULL,

NO_TELP varchar(15) not null, 
	constraint chkNO_TELP 
	check (NO_TELP like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),

WALI varchar(50) not null

select * from human.PendaftaranNasabah
)



--TABEL PEGAWAI--
create table human.Pegawai 
ID_PEG varchar(8) not null primary key,
	constraint pkID_PEG
	check (ID_PEG like ('[P][G][0-9][0-9][0-9][0-9]')),

NAMA_PEG nvarchar(50) not null,

POSISI varchar(10) not null,
	constraint chkPOSISI
	check (POSISI like 'TELLER' or POSISI like 'CS') not null,

STA_TUS varchar(15)
	constraint chkSTA_TUS
	check (STA_TUS like 'AKTIF' or STA_TUS like 'TDK AKTIF')
)

--


insert into TABEL_PENDAFTARAN__NASABAH
('N0000000001','C001','L001','IWAN','iwanbopeng@gmail.com','19/02/2011','M','0811111111111','bambang'),
('N0000000002','C002','L002','SAIPUL','saipul11@gmail.com','10/11/2010','M','0811111111112','kufron'),
('N0000000003','C003','L003','BUDI','budikeren@gmail.com','09/04/2001','M','0811111111113','alam'),


/*Create Procedure*/
--PENDAFTARAN NASABAH--
/*Procedure_Insert_PENDAFTARAN_NASABAH*/
create procedure InsertTABEL_PENDAFTARAN_NASABAH
		@ID_NASABAH nvarchar(50),
		@ID_PEG nvarchar(50),
		@KODE_LOKASI nvarchar(50),
		@NAMA_NASABAH nvarchar(50),
		@EMAIL nvarchar(50)
		@TANGGAL_LAHIR date,
		@GENDER nvarchar(50),
		@NO_TELP int,
		@WALI nchar(10),
		@TANGGAL_DAFTAR date,

	as
	begin
		insert into TABEL_PENDAFTARAN__NASABAH values
		@ID_NASABAH,@ID_PEG,@KODE_LOKASI,@NAMA_NASABAH,@EMAIL,@TANGGAL_LAHIR,@GENDER,@NO_TELP,@WALI,@TANGGAL_DAFTAR,)
	end

Exec InsertTABEL_PENDAFTARAN__NASABAH @ID_NASABAH='N0000000001',@ID_PEG='PG00001',@KODE_LOKASI='KL000001',@NAMA_NASABAH='FIRZAN ANANTA ',@EMAIL='firzan@ymail.com',@TANGGAL_LAHIR='01-01-01',@GENDER='Male',@NO_TELP='081280495945',@WALI='HARYANTO',@TANGGAL_DAFTAR='10-10-10'
Select * from TABEL_PENDAFTARAN__NASABAH		


/*Procedure_Update_MemberInfo*/
create procedure UpdateTABEL_PENDAFTARAN_NASABAH
		@ID_NASABAH nvarchar(50),
		@ID_PEG nvarchar(50),
		@KODE_LOKASI nvarchar(50),
		@NAMA_NASABAH nvarchar(50),
		@EMAIL nvarchar(50)
		@TANGGAL_LAHIR date,
		@GENDER nvarchar(50),
		@NO_TELP int,
		@WALI nchar(10),
		@TANGGAL_DAFTAR date,
as 
	begin
		update TABEL_PENDAFTARAN__NASABAH set
			ID_NASABAH=@ID_NASABAH,ID_PEG=@ID_PEG,KODE_LOKASI=@KODE_LOKASI,NAMA_NASABAH=@NAMA_NASABAH,EMAIL=@EMAIL,TANGGAL_LAHIR=@TANGGAL_LAHIR,GENDER=@GENDER,NO_TELP=@NO_TELP,WALI=@WALI,TANGGAL_DAFTAR=@TANGGAL_DAFTAR,)
	
		where ID_MemberInfo=@ID_MemberInfo
	end

Exec UpdateMemberInfo @ID_MemberInfo='MI0244',@Member_Birth='1998/02/19',@Member_Gender='Female',@Member_Telp='082532787651',@Member_Address='Jl.apa hayo'
select * from Human.MemberInfo