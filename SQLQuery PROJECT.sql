create database bank

/*schema*/

create schema human 
go

create schema transaksi 
go

/*TABEL BANK*/

--Tabel Pendaftatan Nasabah--
create table human.PENDAFTARAN_NASABAH(
	ID_NASABAH varchar(15) not null primary key,
		constraint pkID_NASABAH
		check (ID_NASABAH like ('[N][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	ID_PEG varchar(15) not null,
		constraint fkID_PEG
		check (ID_PEG like ('[C][0-9][0-9][0-9][0-9]')),
	NAMA_NASABAH varchar (50) not null,
	EMAIL varchar (50) not null,
	TANGGAL_LAHIR date not null,
		constraint chkTANGGAL_LAHIR
		check (TANGGAL_LAHIR <= getdate()),
	TEMPAT_LAHIR varchar (20) not null,
	GENDER varchar (10) not null, 
		check (GENDER like 'Male' or GENDER like 'Female'),
	NO_TELP varchar (20) not null,
		constraint chkNO_TELP
		check (NO_TELP like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%')),--13dgt--
	WALI varchar (50) not null,
	PEKERJAAN varchar (50) not null, 
	TANGGAL_DAFTAR date not null, 
		constraint chkTANGGAL_DAFTAR
		check (TANGGAL_DAFTAR <= getdate()),
)
select * from human.PENDAFTARAN_NASABAH
	--TABEL PEGAWAI--
create table human.PEGAWAI(
	ID_PEG varchar(15) not null primary key,
		constraint pkID_PEG
		check (ID_PEG like ('[C][0-9][0-9][0-9][0-9]') or ID_PEG like ('[T][0-9][0-9][0-9][0-9]')), 
	NAMA_PEG varchar (50),
	POSISI varchar (10) not null,
		check (POSISI like 'TELLER' or POSISI like 'CS'),
	PEG_STATUS varchar (20) not null, 
		check (PEG_STATUS like 'AKTIF' or PEG_STATUS like 'NON-AKTIF'),
	TEMPAT_LAHIR varchar (20) not null,
	TANGGAL_LAHIR date not null, 
		constraint chkTANGGAL_LAHIR
		check (TANGGAL_LAHIR <= getdate ()),
	GENDER varchar (10) not null, 
		check (GENDER like 'Male' or GENDER like 'Female'),
	EMAIL varchar (50) not null, 
	NO_TELP varchar (20) not null,
		Constraint chkNO_TELP
		check (NO_TELP like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')), --13dgt--
)
select * from human.PEGAWAI
--TABEL NASABAH--
create table human.NASABAH(
	NO_REK varchar (10) not null primary key, 
		constraint pkNO_REK
		check (NO_REK like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	ID_NASABAH varchar(20) not null,
		constraint fkID_NASABAH
		check (ID_NASABAH like ('[N][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	SALDO money (10,2) not null,
)
select * from human.NASABAH
--TABEL TARIK--
create table transaksi.TARIK (
	NO_TARIK varchar (15) not null primary key ,
		constraint  pkNO_TARIK
		check (NO_TARIK like ('[T][R][K][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	NO_REK varchar (10) not null, 
		constraint fkNO_REK
		check (NO_REK like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	SALDO money (10,2) not null,
	JUMLAH_TARIK money (10,2) not null, 
	TANGGAL_TARIK date not null,
		constraint chkTANGGAL_LAHIR
		check (TANGGAL_LAHIR <= getdate()),
	ID_PEG varchar(15) not null ,
		constraint FkID_PEG
		check (ID_PEG like ('[T][0-9][0-9][0-9][0-9]')), 
)
select * from transaksi.TARIK
--TABEL SETOR--
create table transaksi.SETOR(
	NO_SETOR varchar (15) primary key not null,
		constraint  pkNO_SETOR
		check (NO_SETOR like ('[S][T][R][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	NO_REK varchar (10) not null, 
		constraint fkNO_REK
		check (NO_REK like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	JUMLAH_SETOR money (10,2) not null, 
	TANGGAL_SETOR date not null,
		constraint chkTANGGAL_LAHIR
		check (TANGGAL_LAHIR <= getdate()),
	ID_PEG varchar(15) not null ,
		constraint FkID_PEG
		check (ID_PEG like ('[T][0-9][0-9][0-9][0-9]')), 

)
select * from transaksi.SETOR
--TABEL PEMINJAMAN--
create table transaksi.PEMINJAMAN(
	NO_PINJAM varchar (15) primary key not null,
		constraint  pkNO_PINJAM
		check (NO_PINJAM like ('[P][J][M][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	NO_REK varchar (10) not null, 
		constraint fkNO_REK
		check (NO_REK like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	JUMLAH_PINJAM money not null, 
	TANGGAL_PINJAM date not null,
		constraint chkTANGGAL_LAHIR
		check (TANGGAL_LAHIR <= getdate()),
	ID_PEG varchar(15) not null ,
		constraint FkID_PEG
		check (ID_PEG like ('[T][0-9][0-9][0-9][0-9]')), 
)
select * from transaksi.p
--TABEL PENGEMBALIAN PINJAMAN--
create table transaksi.PENGEMBALIAN_PINJAMAN (
	NO_PENGEMBALIAN varchar (15) primary key not null, 
		constraint pkNO_PENGEMBALIAN
		check (NO_PENGEMBALIAN like ('[P][G][M][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	NO_PEMINJAMAN varchar (15) not null,
		constraint  fkNO_SETOR
		check (NO_PINJAM like ('[P][J][M][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	ID_NASABAH varchar(15) not null,
		constraint fkID_NASABAH
		check (ID_NASABAH like ('[N][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	TANGGAL_PENGEMBALIAN date not null, 
		constraint chkTANGGAL_PENGEMBALIAN 
		check (TANGGAL_PENGEMBALIAN <= getdate ()),
	BIAYA_TERLAMBAT money not null 
)	

/*INPUT DATA*/

	insert into human.PendaftaranNasabah values

	insert into human.PendaftaranNasabah values

	insert into transaksi.TARIK values
	
	insert into transaksi.SETOR values

	insert into transaksi.PEMINJAMAN values
	
	insert into transaksi.PENGEMBALIAN_PINJAMAN values

/*SHOW TABLES*/
select * from human.PendaftaranNasabah
select * from human.NASABAH
select * from human.PEGAWAI
select * from transaksi.TARIK
select * from transaksi.SETOR
select * from transaksi.PEMINJAMAN
select * from transaksi.PENGEMBALIAN_PINJAMAN

/*Create Procedure*/
--PENDAFTARAN_NASABAH--
/*Procedure_Insert_PENDAFTARAN_NASABAH*/


/*LANJUTIN */


create procedure InsertPENDAFTARAN_NASABAH
		@ID_NASABAH varchar(15),
		@ID_PEG varchar (15),
		@NAMA_NASABAH varchar(50),
		@EMAIL varchar(50),
		@TANGGAL_LAHIR date,
		@GENDER varchar (10),
		@NO_TELP varchar (20),
		@WALI varchar (50),
		@TANGGAL_DAFTAR date,

as
	begin
		insert into Human.PendaftaranNasabah values
		(@ID_NASABAH ,@ID_PEG ,@NAMA_NASABAH ,@EMAIL ,@TANGGAL_LAHIR ,
		@GENDER  ,@NO_TELP  ,@WALI  ,
		@TANGGAL_DAFTAR)
	end

Exec InsertPENDAFTARAN_NASABAH @ID_MemberInfo='MI0244',@Member_Birth='1998/02/19',@Member_Gender='Female',@Member_Telp='082532787651',@Member_Address='Jl.apa ya'
select * from human.PendaftaranNasabah /*benerin*/

/*Procedure_Update_PENDAFTARAN_NASABAH*/

create procedure InsertPENDAFTARAN_NASABAH
		@ID_NASABAH varchar(15),
		@ID_PEG varchar (15),
		@NAMA_NASABAH varchar(50),
		@EMAIL varchar(50),
		@TANGGAL_LAHIR date,
		@GENDER varchar (10),
		@NO_TELP varchar (20),
		@WALI varchar (50),
		@TANGGAL_DAFTAR date,

as
	begin
		update human.PendaftaranNasabah set 
		insert into Human.PendaftaranNasabah values
		ID_NASABAH=@ID_NASABAH ,ID_PEG=@ID_PEG ,NAMA_NASABAH=@NAMA_NASABAH ,EMAIL=@EMAIL ,TANGGAL_LAHIR=@TANGGAL_LAHIR ,
		GENDER=@GENDER  ,NO_TELP=@NO_TELP  ,WALI=@WALI  ,
		TANGGAL_DAFTAR=@TANGGAL_DAFTAR
	end

Exec InsertPENDAFTARAN_NASABAH @ID_MemberInfo='MI0244',@Member_Birth='1998/02/19',@Member_Gender='Female',@Member_Telp='082532787651',@Member_Address='Jl.apa ya'
select * from human.PendaftaranNasabah/*benerin*/

/*Procedure_Delete_MemberInfo*/
create procedure DeletePENDAFTARAN_NASABAH
@ID_NASABAH varchar(15),
as
Delete from Human.PendaftaranNasabah where@ID_NASABAH=ID_NASABAH

exec DeleteMemberInfo @ID_MemberInfo='MI0244'/*benerin*/
select * from Human.PendaftaranNasabah


/*BENERIN LANJUTIN*/
/*Make Trigger*/
--MemberInfo--
/*Trigger_Insert_MemberInfo*/
CREATE TRIGGER TR_InsertID_NASABAH
On human. for Insert
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