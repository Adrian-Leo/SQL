create database bank

/*schema*/

create schema human 
go

create schema transaksi 
go

/*TABEL BANK*/

--Tabel Pendaftaran Nasabah--
create table human.PENDAFTARAN_NASABAH(
	ID_NASABAH varchar(15) not null primary key,
		constraint pkID_NASABAH
		check (ID_NASABAH like ('[N][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	ID_PEG varchar(15) not null,
		constraint fkID_PEG
		check (ID_PEG like ('[C][0-9][0-9][0-9]')),
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
		check (NO_TELP like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%')),--13dgt--
	WALI varchar (50) not null, 
	TANGGAL_DAFTAR date not null, 
		constraint chkTANGGAL_DAFTAR
		check (TANGGAL_DAFTAR <= getdate()),
	PEKERJAAN varchar (50) not null 
)
select * from human.PENDAFTARAN_NASABAH
	--TABEL PEGAWAI--
create table human.PEGAWAI(
	ID_PEG varchar(15) not null primary key,
		constraint pkID_PEG
		check (ID_PEG like ('[C][0-9][0-9][0-9]') or ID_PEG like ('[T][0-9][0-9][0-9]')), 
	NAMA_PEG varchar (50),
	POSISI varchar (10) not null,
		check (POSISI like 'TELLER' or POSISI like 'CS'),
	PEG_STATUS varchar (20) not null, 
		check (PEG_STATUS like 'AKTIF' or PEG_STATUS like 'NON-AKTIF'),
	TEMPAT_LAHIR varchar (20) not null,
	TANGGAL_LAHIR_PEG date not null, 
		constraint chkTANGGAL_LAHIR_PEG
		check (TANGGAL_LAHIR_PEG <= getdate ()),
	GENDER varchar (10) not null, 
		check (GENDER like 'Male' or GENDER like 'Female'),
	EMAIL varchar (50) not null, 
	NO_TELP_PEG varchar (20) not null,
		Constraint chkNO_TELP_PEG
		check (NO_TELP_PEG like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')), --11dgt--
)
select * from human.PEGAWAI
--TABEL NASABAH--
create table human.NASABAH(
	NO_REK varchar (10) not null primary key, 
		constraint pkNO_REK
		check (NO_REK like ('[7][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	ID_NASABAH varchar(15) not null,
		constraint fkID_NASABAH
		check (ID_NASABAH like ('[N][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	SALDO varchar (15) not null,
)
select * from human.NASABAH
--TABEL TARIK--
create table transaksi.TARIK (
	NO_TARIK varchar (15) not null primary key ,
		constraint  pkNO_TARIK
		check (NO_TARIK like ('[T][R][K][0-9][0-9][0-9]')),--3dgt--
	NO_REK varchar (10) not null, 
		constraint fkNO_REK
		check (NO_REK like ('[7][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	JUMLAH_TARIK varchar(15)  not null, 
	TANGGAL_TARIK date not null,
		constraint chkTANGGAL_TARIK
		check (TANGGAL_TARIK <= getdate()),
	ID_PEG varchar(15) not null ,
		constraint FkID_PEG
		check (ID_PEG like ('[T][0-9][0-9][0-9]')), 
)
select * from transaksi.TARIK
--TABEL SETOR--
create table transaksi.SETOR(
	NO_SETOR varchar (15) primary key not null,
		constraint  pkNO_SETOR
		check (NO_SETOR like ('[S][T][R][0-9][0-9][0-9]')),--3dgt--
	NO_REK varchar (10) not null, 
		constraint chkNO_REK
		check (NO_REK like ('[7][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	JUMLAH_SETOR varchar(15) not null, 
	TANGGAL_SETOR date not null,
		constraint chkTANGGAL_SETOR
		check (TANGGAL_SETOR <= getdate()),
	ID_PEG varchar(15) not null ,
		constraint chkID_PEG
		check (ID_PEG like ('[T][0-9][0-9][0-9]'))

)
select * from transaksi.SETOR
--TABEL PEMINJAMAN--
create table transaksi.PEMINJAMAN(
	NO_PINJAM varchar (15) primary key not null,
		constraint  pkNO_PINJAM
		check (NO_PINJAM like ('[P][J][M][0-9][0-9][0-9]')),--3dgt--
	NO_REK varchar (10) not null, 
		constraint chksNO_REK
		check (NO_REK like ('[7][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),--10dgt--
	JUMLAH_PINJAM varchar(15) not null, 
	TANGGAL_PINJAM date not null,
		constraint chkTANGGAL_PINJAM
		check (TANGGAL_PINJAM <= getdate()),
	ID_PEG varchar(15) not null ,
		constraint chksID_PEG
		check (ID_PEG like ('[T][0-9][0-9][0-9]')), 
)
select * from transaksi.PEMINJAMAN
--TABEL PENGEMBALIAN PINJAMAN--
create table transaksi.PENGEMBALIAN_PINJAMAN (
	NO_PENGEMBALIAN varchar (15) primary key not null, 
		constraint pkNO_PENGEMBALIAN
		check (NO_PENGEMBALIAN like ('[P][G][M][0-9][0-9][0-9]')),--10dgt--
	NO_PINJAM varchar (15) not null,
		constraint  chkNO_PINJAM
		check (NO_PINJAM like ('[P][J][M][0-9][0-9][0-9]')),--3dgt--
	TANGGAL_PENGEMBALIAN date not null, 
		constraint chkTANGGAL_PENGEMBALIAN 
		check (TANGGAL_PENGEMBALIAN <= getdate ()),
	BIAYA_TERLAMBAT varchar(15) not null 
)	
select * from transaksi.PENGEMBALIAN_PINJAMAN

/*INPUT DATA*/

	insert into human.PENDAFTARAN_NASABAH values
	('N0000000001','C001','RAMADIAN A','ramadianard@gmail.com','2001-09-12','JAKARTA','MALE','81345728910','SUCIPTO','2016-09-12','HRD'),
	('N0000000002','C002','M FIRZAN','firzan.a@gmail.com','2001-08-09','DEPOK','MALE','85784239871','BAMBANG','2017-08-09','SUPERVISOR'),
	('N0000000003','C003','ADRIAN LEO','adrianleo@yahoo.com','2001-01-01','TANGERANG SELATAN','MALE','87246758192','SAM','2008-06-12','CTO'),
	('N0000000004','C001','JOKO YUNIARTO','jokoyun@gmail.com','2001-08-09','BEKASI','MALE','87785492019','YUDI','2011-01-01','PNS')

	insert into human.PEGAWAI values
	('C001','CECEP SURECEP','CS','AKTIF','SURABAYA','1997-09-12','MALE','cecepsurecep@gmail.com','81954902912'),
	('C002','KIRANA','CS','AKTIF','JAKARTA','1996-05-06','FEMALE','kirana@gmail.com','87765748921'),
	('C003','FREDDY','CS','AKTIF','BANDUNG','1995-09-06','MALE','sugiono@gmail.com','85892817812'),
	('T001','SETIADI','TELLER','AKTIF','BOGOR','1996-08-02','MALE','setiaman@gmail.com','89538729102'),
	('T002','ALAM','TELLER','AKTIF','DENPASAR','1997-09-01','MALE','budi@gmail.com','81384957821'),
	('T003','VANA','TELLER','AKTIF','JAKARTA','2001-10-16','FEMALE','savana@gmail.com','81928492810')

	insert into human.NASABAH values
	('7000000004','N0000000002',' 50000000'),
	('7000000200','N0000000003',' 550000000'),
	('7000000301','N0000000001',' 75000000'),
	('7000000421','N0000000004',' 45000000')

	insert into transaksi.TARIK values
	('TRK004','7000000200',' 5000000','2019-09-08','T002'),
	('TRK003','7000000004',' 150000','2019-01-02','T001'),
	('TRK002','7000000421',' 200000','2019-10-21','T001'),
	('TRK001','7000000301',' 100000','2019-11-28','T003')

	insert into transaksi.SETOR values
	('STR003','7000000421',' 2000000','2019-10-08','T003'),
	('STR004','7000000200',' 10000000','2019-8-17','T002'),
	('STR002','7000000301',' 500000','2019-07-11','T001'),
	('STR001','7000000004',' 1000000','2019-03-12','T002')

	insert into transaksi.PEMINJAMAN values
	('PJM001','7000000301',' 3000000','2018-09-14','T003'),
	('PJM002','7000000004',' 1500000', '2018-08-27','T001')
	
	insert into transaksi.PENGEMBALIAN_PINJAMAN values
	('PGM001','PJM002','2019-02-15',' 300000'),
	('PGM002','PJM001','2019-01-24',' 150000')

/*SHOW TABLES*/

use bank
select * from human.PENDAFTARAN_NASABAH
select * from human.PEGAWAI
select * from human.NASABAH
select * from transaksi.TARIK
select * from transaksi.SETOR
select * from transaksi.PEMINJAMAN
select * from transaksi.PENGEMBALIAN_PINJAMAN

/*Create Procedure*/
--PENDAFTARAN_NASABAH--
/*Procedure_Insert_PENDAFTARAN_NASABAH*/

create procedure InsertPENDAFTARAN_NASABAH
		@ID_NASABAH varchar(15),
		@ID_PEG varchar (15),
		@NAMA_NASABAH varchar(50),
		@EMAIL varchar(50),
		@TANGGAL_LAHIR date,
		@TEMPAT_LAHIR varchar(20),
		@GENDER varchar (10),
		@NO_TELP varchar (20),
		@WALI varchar (50),
		@TANGGAL_DAFTAR date,
		@PEKERJAAN varchar(50)

as
	begin
		insert into Human.PENDAFTARAN_NASABAH values
		(@ID_NASABAH,@ID_PEG,@NAMA_NASABAH,@EMAIL,@TANGGAL_LAHIR,@TEMPAT_LAHIR,
		 @GENDER ,@NO_TELP ,@WALI,@TANGGAL_DAFTAR,@PEKERJAAN)
	end

Exec InsertPENDAFTARAN_NASABAH @ID_NASABAH='N0000000001',@ID_PEG='C001',
@NAMA_NASABAH='RAMADIAN A',@EMAIL='ramadianard@gmail.com',@TANGGAL_LAHIR='2001-09-12',@TEMPAT_LAHIR='JAKARTA',
@GENDER='MALE',@NO_TELP='81345728910',@WALI='SUCIPTO',@TANGGAL_DAFTAR='2016-09-12',@PEKERJAAN='HRD'

select * from human.PENDAFTARAN_NASABAH

/*Procedure_Update_PENDAFTARAN_NASABAH*/

create procedure UpdatePENDAFTARAN_NASABAH
		@ID_NASABAH varchar(15),
		@ID_PEG varchar (15),
		@NAMA_NASABAH varchar(50),
		@EMAIL varchar(50),
		@TANGGAL_LAHIR date,
		@TEMPAT_LAHIR varchar(20),
		@GENDER varchar (10),
		@NO_TELP varchar (20),
		@WALI varchar (50),
		@TANGGAL_DAFTAR date,
		@PEKERJAAN varchar(50)

as
	begin
		update human.PENDAFTARAN_NASABAH set 
		ID_NASABAH=@ID_NASABAH,ID_PEG=@ID_PEG ,NAMA_NASABAH=@NAMA_NASABAH ,EMAIL=@EMAIL ,TANGGAL_LAHIR=@TANGGAL_LAHIR ,
		GENDER=@GENDER  ,NO_TELP=@NO_TELP  ,WALI=@WALI,
		TANGGAL_DAFTAR=@TANGGAL_DAFTAR, PEKERJAAN=@PEKERJAAN where ID_NASABAH=@ID_NASABAH
	end

Exec UpdatePENDAFTARAN_NASABAH @ID_NASABAH='N0000000001',@ID_PEG='C001',
@NAMA_NASABAH='RAMADIAN A',@EMAIL='ramadianard@gmail.com',@TANGGAL_LAHIR='2001-09-12',@TEMPAT_LAHIR='JAKARTA',
@GENDER='MALE',@NO_TELP='81345728910',@WALI='SUKRIMAN',@TANGGAL_DAFTAR='2016-09-12',@PEKERJAAN='HRD'

select * from human.PENDAFTARAN_NASABAH

/*Procedure_Delete_PENDAFTARAN_NASABAH*/
create procedure DeletePENDAFTARAN_NASABAH
@ID_NASABAH varchar(15)
as
Delete from Human.PENDAFTARAN_NASABAH where @ID_NASABAH=ID_NASABAH

exec DeletePENDAFTARAN_NASABAH @ID_NASABAH='N0000000001'
select * from Human.PENDAFTARAN_NASABAH

--PROCEDURE INSERT PEGAWAI --
create procedure InsertPEGAWAI
		@ID_PEG varchar(15),
		@NAMA_PEG varchar(50),
		@POSISI varchar(10),
		@PEG_STATUS varchar(20),
		@TEMPAT_LAHIR varchar(20),
		@TANGGAL_LAHIR_PEG date,
		@GENDER varchar(10),
		@EMAIL varchar(50),
		@NO_TELP_PEG varchar(20)

as
	begin
		insert into Human.PEGAWAI values
		(@ID_PEG,@NAMA_PEG,@POSISI,@PEG_STATUS,@TEMPAT_LAHIR,@TANGGAL_LAHIR_PEG,@GENDER,@EMAIL,@NO_TELP_PEG)
	END
Exec InsertPEGAWAI @ID_PEG='C001',@NAMA_PEG='CECEP SURECEP',@POSISI='CS',@PEG_STATUS='AKTIF',
@TEMPAT_LAHIR='SURABAYA',@TANGGAL_LAHIR_PEG='1997-09-12',@GENDER='MALE',@EMAIL='cecepsurecep@gmail.com',
@NO_TELP_PEG='81954902912'

--PROCEDURE UPDATE PEGAWAI--
create procedure UpdatePEGAWAI
		@ID_PEG varchar(15),
		@NAMA_PEG varchar(50),
		@POSISI varchar(10),
		@PEG_STATUS varchar(20),
		@TEMPAT_LAHIR varchar(20),
		@TANGGAL_LAHIR_PEG date,
		@GENDER varchar(10),
		@EMAIL varchar(50),
		@NO_TELP_PEG varchar(20)
as
	begin
	update Human.PEGAWAI set
	ID_PEG=@ID_PEG,NAMA_PEG=@NAMA_PEG,POSISI=@POSISI,PEG_STATUS=@PEG_STATUS,
	TEMPAT_LAHIR=@TEMPAT_LAHIR,@TANGGAL_LAHIR_PEG=@TANGGAL_LAHIR_PEG,GENDER=@GENDER,
	EMAIL=@EMAIL,@NO_TELP_PEG=@NO_TELP_PEG where ID_PEG=@ID_PEG
end
exec UpdatePEGAWAI @ID_PEG='C001',@NAMA_PEG='CECEP SURECEP',@POSISI='CS',@PEG_STATUS='AKTIF',
@TEMPAT_LAHIR='SURABAYA',@TANGGAL_LAHIR_PEG='1997/09/12',@GENDER='MALE',@EMAIL='cecepsurecep@gmail.com',
@NO_TELP_PEG='81954902912'

select * from Human.PEGAWAI

--PROCEDURE DELETE PEGAWAI--
create procedure DeletePEGAWAI
	@ID_PEG varchar(15)
as
	begin
	Delete from Human.PEGAWAI where ID_PEG=@ID_PEG
	end
exec DeletePEGAWAI @ID_PEG='C001'

--CREATE PROCEDURE INSERT NASABAH--
create procedure InsertNASABAH
		@NO_REK varchar(15),
		@ID_NASABAH varchar(15),
		@SALDO varchar(15)
as
	begin
	insert into Human.NASABAH values
	(@NO_REK,@ID_NASABAH,@SALDO)
	END
exec InsertNASABAH '7000000001','N0000000001','Rp 500.000.000'

--UPDATE NASABAH--
create procedure UpdateNASABAH
		@NO_REK varchar(15),
		@ID_NASABAH varchar(15),
		@SALDO varchar(15)
		
as
	begin
	update Human.NASABAH set
	NO_REK=@NO_REK,ID_NASABAH=@ID_NASABAH, SALDO=@SALDO
	end
	
exec updateNASABAH @SALDO='Rp 1.000.000.000'
--DELETE NASABAH--
create procedure DeleteNASABAH
		@NO_REK varchar(15),
		@ID_NASABAH varchar(15),
		@SALDO varchar(15)
as
	begin
	Delete from human.NASABAH where NO_REK=@NO_REK
	end

	exec DeleteNASABAH @NO_REK='70000000001',@ID_NASABAH='N0000000001',@SALDO='Rp 0'

--CREATE PROCEDURE TARIK--
create procedure InsertTARIK
		@NO_TARIK varchar (15),
		@NO_REK varchar (15), 
		@JUMLAH_TARIK varchar (15), 
		@TANGGAL_TARIK date,
		@ID_PEG varchar(15)
as
	begin
	insert into transaksi.TARIK values
	(@NO_TARIK,@NO_REK,@JUMLAH_TARIK,@TANGGAL_TARIK,@ID_PEG)
	end
exec insertTARIK 'TRK004','7000000200','Rp 5.000.000','2019-09-08','T002'
--UPDATE PROCEDURE TARIK--
create procedure UpdateTARIK
		@NO_TARIK varchar (15),
		@NO_REK varchar (15), 
		@JUMLAH_TARIK varchar (15), 
		@TANGGAL_TARIK date,
		@ID_PEG varchar(15)
as
	begin
	update transaksi.TARIK set
	NO_TARIK=@NO_TARIK,NO_REK=@NO_REK,JUMLAH_TARIK=@JUMLAH_TARIK,
	TANGGAL_TARIK=@TANGGAL_TARIK,ID_PEG=@ID_PEG
	END
exec UpdateTARIK 'TRK010','7000000200','Rp 6.000.000','2019-09-11','T002'

-- PROCEDURE SETOR--
create procedure InsertSETOR
		@NO_SETOR varchar(15),
		@NO_REK varchar(10), 
		@JUMLAH_SETOR varchar (15), 
		@TANGGAL_SETOR date,
		@ID_PEG varchar(15)
as
	begin
	insert into transaksi.SETOR values
	(@NO_SETOR,@NO_REK,@JUMLAH_SETOR,@TANGGAL_SETOR,@ID_PEG)
	END
	
exec InsertSETOR 'STR005','7000000421','Rp 10.000.000','2019-10-08','T003'

select * from human.NASABAH
select * from transaksi.SETOR

--UPDATE SETOR--
create procedure UpdateSETOR
		@NO_SETOR varchar(15),
		@NO_REK varchar(10), 
		@JUMLAH_SETOR varchar (15), 
		@TANGGAL_SETOR date,
		@ID_PEG varchar(15)
as
	begin
	update transaksi.SETOR set
	NO_SETOR=@NO_SETOR,NO_REK=@NO_REK,JUMLAH_SETOR=@JUMLAH_SETOR,
	TANGGAL_SETOR=@TANGGAL_SETOR,ID_PEG=@ID_PEG
	END
exec UpdateSETOR 'ST010','70000000003','Rp 50.000.000','2019-10-10','T001'

--CREATE PROCEDURE PEMINJAMAN
create procedure InsertPEMINJAMAN
	@NO_PINJAM varchar (15),
	@NO_REK varchar (10),
	@JUMLAH_PINJAM varchar(15), 
	@TANGGAL_PINJAM date,
	@ID_PEG varchar(15)
as
	begin
	insert into transaksi.PEMINJAMAN values
	(@NO_PINJAM,@NO_REK,@JUMLAH_PINJAM,@TANGGAL_PINJAM,@ID_PEG)
	end
exec InsertPEMINJAMAN 'PJM001','7000000301','Rp 3.000.000','2018-09-14','T003'

--UPDATE PEMINJAMAN--
create procedure UpdatePeminjaman
	@NO_PINJAM varchar (15),
	@NO_REK varchar (10),
	@JUMLAH_PINJAM varchar(15), 
	@TANGGAL_PINJAM date,
	@ID_PEG varchar(15)
as
	begin
	update transaksi.PEMINJAMAN set
	NO_PINJAM=@NO_PINJAM,NO_REK=@NO_REK,JUMLAH_PINJAM=@JUMLAH_PINJAM,
	TANGGAL_PINJAM=@TANGGAL_PINJAM,ID_PEG=@ID_PEG
	END
exec UpdatePeminjaman 'PJM010','70000000301','Rp 10.000.000','2018-09-16','T003'

/*Make Trigger*/
/*Trigger_Insert_PendaftaranNasabah*/
CREATE TRIGGER TR_InsertPENDAFTARAN_NASABAH
On human.PENDAFTARAN_NASABAH for Insert
AS
BEGIN
		Declare @ID_NASABAH varchar(15)
		Declare @ID_PEG varchar (15)
		Declare @NAMA_NASABAH varchar(50)
		Declare @EMAIL varchar(50)
		Declare @TANGGAL_LAHIR date
		Declare @TEMPAT_LAHIR varchar(20)
		Declare @GENDER varchar (10)
		Declare @NO_TELP varchar (20)
		Declare @WALI varchar (50)
		Declare @TANGGAL_DAFTAR date
		Declare @PEKERJAAN varchar(50)

select @ID_NASABAH=ID_NASABAH,@ID_PEG=ID_PEG,@NAMA_NASABAH=NAMA_NASABAH,@EMAIL=EMAIL,@TANGGAL_LAHIR=TANGGAL_LAHIR,
	   @TEMPAT_LAHIR=TEMPAT_LAHIR,@GENDER=GENDER,
       @NO_TELP=NO_TELP,@WALI=WALI,@TANGGAL_DAFTAR=TANGGAL_DAFTAR,
	   @PEKERJAAN=PEKERJAAN from inserted

print '===The Data Has Been Inserted==='
print 'ID_NASABAH			: '+@ID_NASABAH
print 'ID_PEG				: '+@ID_PEG
print 'NAMA_NASABAH			: '+@NAMA_NASABAH
print 'EMAIL				: '+@EMAIL
print 'TANGGAL_LAHIR        : '+cast (@TANGGAL_LAHIR as nvarchar)
print 'TEMPAT_LAHIR			: '+@TEMPAT_LAHIR
print 'GENDER               : '+@GENDER
print 'NO_TELP              : '+@NO_TELP
print 'WALI					: '+@WALI
print 'TANGGAL_DAFTAR		: '+cast (@TANGGAL_DAFTAR as nvarchar)
print 'PEKERJAAN			: '+@PEKERJAAN
END


/*Trigger_Update_Pendaftaran_Nasabah*/
CREATE TRIGGER TR_UpdatePENDAFTARAN_NASABAH
On Human.PENDAFTARAN_NASABAH for Update
AS
BEGIN
		Declare @ID_NASABAH varchar(15)
		Declare @ID_PEG varchar (15)
		Declare @NAMA_NASABAH varchar(50)
		Declare @EMAIL varchar(50)
		Declare @TANGGAL_LAHIR date
		Declare @TEMPAT_LAHIR varchar(20)
		Declare @GENDER varchar (10)
		Declare @NO_TELP varchar (20)
		Declare @WALI varchar (50)
		Declare @TANGGAL_DAFTAR date
		Declare @PEKERJAAN varchar(50)

select @ID_NASABAH=ID_NASABAH,@ID_PEG=ID_PEG,@NAMA_NASABAH=NAMA_NASABAH,@EMAIL=EMAIL,@TANGGAL_LAHIR=TANGGAL_LAHIR,
	   @TEMPAT_LAHIR=TEMPAT_LAHIR,@GENDER=GENDER,
       @NO_TELP=NO_TELP,@WALI=WALI,@TANGGAL_DAFTAR=TANGGAL_DAFTAR,
	   @PEKERJAAN=PEKERJAAN from inserted

print '===The Data Has Been Updated==='
print 'ID_NASABAH			: '+@ID_NASABAH
print 'ID_PEG				: '+@ID_PEG
print 'NAMA_NASABAH			: '+@NAMA_NASABAH
print 'EMAIL				: '+@EMAIL
print 'TANGGAL_LAHIR        : '+cast (@TANGGAL_LAHIR as nvarchar)
print 'TEMPAT_LAHIR			: '+@TEMPAT_LAHIR
print 'GENDER               : '+@GENDER
print 'NO_TELP              : '+@NO_TELP
print 'WALI					: '+@WALI
print 'TANGGAL_DAFTAR		: '+cast (@TANGGAL_DAFTAR as nvarchar)
print 'PEKERJAAN			: '+@PEKERJAAN
END


/*Trigger_Delete_PENDAFTARAN_NASABAH*/
CREATE TRIGGER TR_DeletePENDAFTARAN_NASABAH
On Human.PENDAFTARAN_NASABAH for Delete
AS
BEGIN
		Declare @ID_NASABAH varchar(15)
		Declare @ID_PEG varchar (15)
		Declare @NAMA_NASABAH varchar(50)
		Declare @EMAIL varchar(50)
		Declare @TANGGAL_LAHIR date
		Declare @TEMPAT_LAHIR varchar(20)
		Declare @GENDER varchar (10)
		Declare @NO_TELP varchar (20)
		Declare @WALI varchar (50)
		Declare @TANGGAL_DAFTAR date
		Declare @PEKERJAAN varchar(50)

select @ID_NASABAH=ID_NASABAH,@ID_PEG=ID_PEG,@NAMA_NASABAH=NAMA_NASABAH,@EMAIL=EMAIL,@TANGGAL_LAHIR=TANGGAL_LAHIR,
	   @TEMPAT_LAHIR=TEMPAT_LAHIR,@GENDER=GENDER,
       @NO_TELP=NO_TELP,@WALI=WALI,@TANGGAL_DAFTAR=TANGGAL_DAFTAR,
	   @PEKERJAAN=PEKERJAAN from deleted

print '===The Data Has Been Deleted==='
print 'ID_NASABAH			: '+@ID_NASABAH
print 'ID_PEG				: '+@ID_PEG
print 'NAMA_NASABAH			: '+@NAMA_NASABAH
print 'EMAIL				: '+@EMAIL
print 'TANGGAL_LAHIR        : '+cast (@TANGGAL_LAHIR as nvarchar)
print 'TEMPAT_LAHIR			: '+@TEMPAT_LAHIR
print 'GENDER               : '+@GENDER
print 'NO_TELP              : '+@NO_TELP
print 'WALI					: '+@WALI
print 'TANGGAL_DAFTAR		: '+cast (@TANGGAL_DAFTAR as nvarchar)
print 'PEKERJAAN			: '+@PEKERJAAN
END

/*TABEL PEGAWAI*/
--INSERT PEGAWAI--

create trigger TR_InsertPEGAWAI
on Human.PEGAWAI for insert 
AS
BEGIN 
		Declare @ID_PEG varchar(15)
		Declare @NAMA_PEG varchar(50)
		Declare @POSISI varchar(10)
		Declare @PEG_STATUS varchar(20)
		Declare @TEMPAT_LAHIR varchar(20)
		Declare @TANGGAL_LAHIR_PEG date
		Declare @GENDER varchar(10)
		Declare @EMAIL varchar(50)
		Declare @NO_TELP_PEG varchar(20)
	
	select @ID_PEG=ID_PEG, @NAMA_PEG=NAMA_PEG, @POSISI=POSISI, 
	@PEG_STATUS=PEG_STATUS, @TEMPAT_LAHIR=TEMPAT_LAHIR, @TANGGAL_LAHIR_PEG=TANGGAL_LAHIR_PEG, 
	@GENDER=GENDER, @EMAIL=EMAIL, @NO_TELP_PEG=NO_TELP_PEG from inserted
	
print '===The Data Has Been INSERTED==='
print 'ID_PEG				: '+@ID_PEG
print 'NAMA_PEG				: '+@NAMA_PEG
print 'POSISI				: '+@POSISI	
print 'PEG_STATUS			: '+@PEG_STATUS
print 'TEMPAT_LAHIR			: '+@TEMPAT_LAHIR
print 'TANGGAL_LAHIR_PEG    : '+cast (@TANGGAL_LAHIR_PEG as nvarchar)
print 'GENDER				: '+@GENDER
print 'EMAIL				: '+@EMAIL
print 'NO_TELP_PEG			: '+@NO_TELP_PEG	
	
END

--UPDATE PEGAWAI--
create trigger TR_UpdatePEGAWAI
on human.PEGAWAI for update 
AS
BEGIN 
		Declare @ID_PEG varchar(15)
		Declare @NAMA_PEG varchar(50)
		Declare @POSISI varchar(10)
		Declare @PEG_STATUS varchar(20)
		Declare @TEMPAT_LAHIR varchar(20)
		Declare @TANGGAL_LAHIR_PEG date
		Declare @GENDER varchar(10)
		Declare @EMAIL varchar(50)
		Declare @NO_TELP_PEG varchar(20)
	
	select @ID_PEG=ID_PEG, @NAMA_PEG=NAMA_PEG, @POSISI=POSISI, 
	@PEG_STATUS=PEG_STATUS, @TEMPAT_LAHIR=TEMPAT_LAHIR, @TANGGAL_LAHIR_PEG=TANGGAL_LAHIR_PEG, 
	@GENDER=GENDER, @EMAIL=EMAIL, @NO_TELP_PEG=NO_TELP_PEG from inserted 
	
print '===The Data Has Been Updated==='
print 'ID_PEG				: '+@ID_PEG
print 'NAMA_PEG				: '+@NAMA_PEG
print 'POSISI				: '+@POSISI	
print 'PEG_STATUS			: '+@PEG_STATUS
print 'TEMPAT_LAHIR			: '+@TEMPAT_LAHIR
print 'TANGGAL_LAHIR_PEG    : '+cast (@TANGGAL_LAHIR_PEG as nvarchar)
print 'GENDER				: '+@GENDER
print 'EMAIL				: '+@EMAIL
print 'NO_TELP_PEG			: '+@NO_TELP_PEG			

END
--DELETE PEGAWAI--
create trigger TR_DeletePEGAWAI
on human.PEGAWAI for delete 
AS
	BEGIN 
		Declare @ID_PEG varchar(15)
		Declare @NAMA_PEG varchar(50)
		Declare @POSISI varchar(10)
		Declare @PEG_STATUS varchar(20)
		Declare @TEMPAT_LAHIR varchar(20)
		Declare @TANGGAL_LAHIR_PEG date
		Declare @GENDER varchar(10)
		Declare @EMAIL varchar(50)
		Declare @NO_TELP_PEG varchar(20)
		
	select @ID_PEG=ID_PEG, @NAMA_PEG=NAMA_PEG, @POSISI=POSISI, 
	@PEG_STATUS=PEG_STATUS, @TEMPAT_LAHIR=TEMPAT_LAHIR, @TANGGAL_LAHIR_PEG=TANGGAL_LAHIR_PEG, 
	@GENDER=GENDER, @EMAIL=EMAIL, @NO_TELP_PEG=NO_TELP_PEG from deleted
	
print '===The Data Has Been DELETED==='
print 'ID_PEG				: '+@ID_PEG
print 'NAMA_PEG				: '+@NAMA_PEG
print 'POSISI				: '+@POSISI	
print 'PEG_STATUS			: '+@PEG_STATUS
print 'TEMPAT_LAHIR			: '+@TEMPAT_LAHIR
print 'TANGGAL_LAHIR_PEG    : '+cast (@TANGGAL_LAHIR_PEG as nvarchar)
print 'GENDER				: '+@GENDER
print 'EMAIL				: '+@EMAIL
print 'NO_TELP_PEG			: '+@NO_TELP_PEG	
		
END

/*TABEL NASABAH*/
--INSERT NASABAH--
create trigger TR_InsertNASABAH
on human.NASABAH for insert 
AS
	BEGIN
		declare @NO_REK varchar (10)
		declare @ID_NASABAH varchar (15) 
		declare @SALDO varchar (15)
	
select @NO_REK=NO_REK, @ID_NASABAH=ID_NASABAH,@SALDO=SALDO from inserted

print '===The Data Has Been INSERTED==='
print 'NO_REK			: '+@NO_REK
print 'ID_NASABAH		: '+@ID_NASABAH
print 'SALDO			: '+@SALDO
		
	END

--UPDATE NASABAH--
create trigger TR_UpdateNASABAH
on human.NASABAH for update 
AS 
	BEGIN
		declare @NO_REK varchar (10)
		declare @ID_NASABAH varchar (15) 
		declare @SALDO varchar (15)
select @NO_REK=NO_REK, @ID_NASABAH=ID_NASABAH,@SALDO=SALDO from inserted

print '===The Data Has Been UPDATED==='
print 'NO_REK			: '+@NO_REK
print 'ID_NASABAH		: '+@ID_NASABAH
print 'SALDO			: '+@SALDO
	
	END

--DELETE NASABAH--
create trigger TR_DeleteNASABAH
on human.NASABAH for delete 
AS 
	BEGIN
		declare @NO_REK varchar (10)
		declare @ID_NASABAH varchar (15)
		declare @SALDO varchar (15)
select @NO_REK=NO_REK, @ID_NASABAH=ID_NASABAH,@SALDO=SALDO from deleted

print '===The Data Has Been DELETED==='
print 'NO_REK			: '+@NO_REK
print 'ID_NASABAH		: '+@ID_NASABAH
print 'SALDO			: '+@SALDO
	END

/*TRIGGER TARIK*/
--INSERT TARIK--
create trigger TR_InsertTARIK
on transaksi.TARIK for insert
AS
	BEGIN
	declare @NO_TARIK varchar(15)
	declare @NO_REK varchar(10)
	declare @JUMLAH_TARIK varchar(15)
	declare @TANGGAL_TARIK date
	declare @ID_PEG varchar (15)

	Select @NO_TARIK=NO_TARIK, @NO_REK=NO_REK, 
	@JUMLAH_TARIK=JUMLAH_TARIK, @TANGGAL_TARIK=TANGGAL_TARIK,
	@ID_PEG=ID_PEG from inserted 
	

print '===The Data Has Been INSERTED==='
print 'NO_TARIK				: '+@NO_TARIK
print 'NO_REK				: '+@NO_REK	
print 'JUMLAH_TARIK			: '+@JUMLAH_TARIK	
print 'TANGGAL_TARIK		: '+cast (@TANGGAL_TARIK as nvarchar)
print 'ID_PEG				: '+@ID_PEG
	END

--UPDATE TARIK--
create trigger TR_UpdateTARIK
on transaksi.TARIK for update
AS
	BEGIN
	declare @NO_TARIK varchar(15)
	declare @NO_REK varchar(10)
	declare @JUMLAH_TARIK varchar(15)
	declare @TANGGAL_TARIK date
	declare @ID_PEG varchar (15)

	Select @NO_TARIK=NO_TARIK, @NO_REK=NO_REK, 
	@JUMLAH_TARIK=JUMLAH_TARIK, @TANGGAL_TARIK=TANGGAL_TARIK,
	@ID_PEG=ID_PEG from inserted 
	
print '===The Data Has Been UPDATED==='
print 'NO_TARIK				: '+@NO_TARIK
print 'NO_REK				: '+@NO_REK	
print 'JUMLAH_TARIK			: '+@JUMLAH_TARIK	
print 'TANGGAL_TARIK		: '+cast (@TANGGAL_TARIK as nvarchar)
print 'ID_PEG				: '+@ID_PEG
	END

--DELETE TARIK--
create trigger TR_DeleteTARIK
on transaksi.TARIK for delete
AS
	BEGIN
	declare @NO_TARIK varchar(15)
	declare @NO_REK varchar(10)
	declare @JUMLAH_TARIK varchar(15)
	declare @TANGGAL_TARIK date
	declare @ID_PEG varchar (15)

	Select @NO_TARIK=NO_TARIK, @NO_REK=NO_REK, 
	@JUMLAH_TARIK=JUMLAH_TARIK, @TANGGAL_TARIK=TANGGAL_TARIK,
	@ID_PEG=ID_PEG from deleted
	

	print '===The Data Has Been DELETED==='
print 'NO_TARIK				: '+@NO_TARIK
print 'NO_REK				: '+@NO_REK	
print 'JUMLAH_TARIK			: '+@JUMLAH_TARIK	
print 'TANGGAL_TARIK		: '+cast (@TANGGAL_TARIK as nvarchar)
print 'ID_PEG				: '+@ID_PEG
	END

/*TRIGGER SETOR*/
--INSERT SETOR--

SELECT * FROM human.NASABAH
SELECT * FROM transaksi.SETOR

insert into transaksi.SETOR VALUES
('STR006','7000000200', '12345','2019-12-12','T002')
create trigger TR_InsertSETORr
on transaksi.SETOR for insert
AS
	BEGIN
	declare @NO_SETOR varchar (15)
	declare @NO_REK varchar(10)
	declare @JUMLAH_SETOR varchar (15)
	declare @TANGGAL_SETOR date
	declare @ID_PEG varchar (15)
	
	update human.NASABAH set human.NASABAH.SALDO = human.NASABAH.SALDO + inserted.JUMLAH_SETOR from inserted where human.NASABAH.NO_REK = inserted.NO_REK

	Select 
	@NO_SETOR=NO_SETOR, @NO_REK=NO_REK, @JUMLAH_SETOR=JUMLAH_SETOR, @TANGGAL_SETOR=TANGGAL_SETOR,@ID_PEG=ID_PEG from inserted
	

print '===The Data Has Been INSERTED==='
print 'NO_SETOR				: '+@NO_SETOR
print 'NO_REK				: '+@NO_REK	
print 'JUMLAH_SETOR			: '+@JUMLAH_SETOR	
print 'TANGGAL_SETOR		: '+cast (@TANGGAL_SETOR as nvarchar)
print 'ID_PEG				: '+@ID_PEG
	END

--INSERT UPDATE--
create trigger TR_UpdateSETOR
on transaksi.SETOR for update
AS
	BEGIN
	declare @NO_SETOR varchar (15)
	declare @NO_REK varchar(10)
	declare @JUMLAH_SETOR varchar (15)
	declare @TANGGAL_SETOR date
	declare @ID_PEG varchar (15)

	Select @NO_SETOR=NO_SETOR, @NO_REK=NO_REK, 
	@JUMLAH_SETOR=JUMLAH_SETOR, @TANGGAL_SETOR=TANGGAL_SETOR,
	@ID_PEG=ID_PEG from inserted
		
print '===The Data Has Been UPDATED==='
print 'NO_SETOR				: '+@NO_SETOR
print 'NO_REK				: '+@NO_REK	
print 'JUMLAH_SETOR			: '+@JUMLAH_SETOR	
print 'TANGGAL_SETOR		: '+cast (@TANGGAL_SETOR as nvarchar)
print 'ID_PEG				: '+@ID_PEG
	END

--INSERT DELETE--
create trigger TR_DeleteSETOR
on transaksi.SETOR for delete
AS
	BEGIN
	declare @NO_SETOR varchar (15)
	declare @NO_REK varchar(10)
	declare @JUMLAH_SETOR varchar (15)
	declare @TANGGAL_SETOR date
	declare @ID_PEG varchar (15)

	Select @NO_SETOR=NO_SETOR, @NO_REK=NO_REK, 
	@JUMLAH_SETOR=JUMLAH_SETOR, @TANGGAL_SETOR=TANGGAL_SETOR,
	@ID_PEG=ID_PEG from deleted
	
print '===The Data Has Been DELETED==='
print 'NO_SETOR				: '+@NO_SETOR
print 'NO_REK				: '+@NO_REK	
print 'JUMLAH_SETOR			: '+@JUMLAH_SETOR	
print 'TANGGAL_SETOR		: '+cast (@TANGGAL_SETOR as nvarchar)
print 'ID_PEG				: '+@ID_PEG
	END

/*TRIGGER PEMINJAMAN*/
--INSERT PEMINJAMAN--
create trigger TR_InsertPEMINJAMAN
on transaksi.PEMINJAMAN for insert
AS
	BEGIN
	declare @NO_PINJAM varchar (15)
	declare @NO_REK varchar(10)
	declare @JUMLAH_PINJAM varchar (15)
	declare @TANGGAL_PINJAM date
	declare @ID_PEG varchar (15)

	Select @NO_PINJAM=NO_PINJAM, @NO_REK=NO_REK, 
	@JUMLAH_PINJAM=JUMLAH_PINJAM, @TANGGAL_PINJAM=TANGGAL_PINJAM,
	@ID_PEG=ID_PEG from inserted
	

print '===The Data Has Been INSERTED==='
print 'NO_PINJAM				: '+@NO_PINJAM
print 'NO_REK					: '+@NO_REK	
print 'JUMLAH_PINJAM			: '+@JUMLAH_PINJAM	
print 'TANGGAL_PINJAM			: '+cast (@TANGGAL_PINJAM as nvarchar)
print 'ID_PEG					: '+@ID_PEG
	END

--UPDATE PEMINJAMAN--
create trigger TR_UpdatePEMINJAMAN
on transaksi.PEMINJAMAN for update
AS
	BEGIN
	declare @NO_PINJAM varchar (15)
	declare @NO_REK varchar(10)
	declare @JUMLAH_PINJAM varchar (15)
	declare @TANGGAL_PINJAM date
	declare @ID_PEG varchar (15)

	Select @NO_PINJAM=NO_PINJAM, @NO_REK=NO_REK, 
	@JUMLAH_PINJAM=JUMLAH_PINJAM, @TANGGAL_PINJAM=TANGGAL_PINJAM,
	@ID_PEG=ID_PEG from inserted
	

print '===The Data Has Been UPDATED==='
print 'NO_PINJAM				: '+@NO_PINJAM
print 'NO_REK					: '+@NO_REK	
print 'JUMLAH_PINJAM			: '+@JUMLAH_PINJAM	
print 'TANGGAL_PINJAM			: '+cast (@TANGGAL_PINJAM as nvarchar)
print 'ID_PEG					: '+@ID_PEG
	END

--DELETE PEMINJAMAN--
create trigger TR_DeletePEMINJAMAN
on transaksi.PEMINJAMAN for delete
AS
	BEGIN
	declare @NO_PINJAM varchar (15)
	declare @NO_REK varchar(10)
	declare @JUMLAH_PINJAM varchar (15)
	declare @TANGGAL_PINJAM date
	declare @ID_PEG varchar (15)

	Select @NO_PINJAM=NO_PINJAM, @NO_REK=NO_REK, 
	@JUMLAH_PINJAM=JUMLAH_PINJAM, @TANGGAL_PINJAM=TANGGAL_PINJAM,
	@ID_PEG=ID_PEG from deleted	
	

print '===The Data Has Been DELETED==='
print 'NO_PINJAM				: '+@NO_PINJAM
print 'NO_REK					: '+@NO_REK	
print 'JUMLAH_PINJAM			: '+@JUMLAH_PINJAM	
print 'TANGGAL_PINJAM			: '+cast (@TANGGAL_PINJAM as nvarchar)
print 'ID_PEG					: '+@ID_PEG
	END


/*TRIGGER PENGEMBALIAN*/
--INSERT PENGEMBALIAN--
create trigger TR_InsertPENGEMBALIAN_PINJAMAN
on transaksi.PENGEMBALIAN_PINJAMAN for insert
AS
	BEGIN
	declare @NO_PENGEMBALIAN varchar (15)
	declare @NO_PINJAM varchar(15)
	declare @TANGGAL_PENGEMBALIAN date
	declare @BIAYA_TERLAMBAT varchar (15)

	Select @NO_PENGEMBALIAN=NO_PENGEMBALIAN, @NO_PINJAM=NO_PINJAM, 
	@TANGGAL_PENGEMBALIAN=TANGGAL_PENGEMBALIAN,
	@BIAYA_TERLAMBAT=BIAYA_TERLAMBAT from inserted
	
print '===The Data Has Been INSERTED==='
print 'NO_PENGEMBALIAN				: '+@NO_PENGEMBALIAN
print 'NO_PINJAM					: '+@NO_PINJAM
print 'TANGGAL_PENGEMBALIAN			: '+cast (@TANGGAL_PENGEMBALIAN as nvarchar)
print 'BIAYA_TERLAMBAT				: '+@BIAYA_TERLAMBAT
	END

--UPDATE PENGEMBALIAN--
create trigger TR_UpdatePENGEMBALIAN_PINJAMAN
on transaksi.PENGEMBALIAN_PINJAMAN for update
AS
	BEGIN
	declare @NO_PENGEMBALIAN varchar (15)
	declare @NO_PINJAM varchar(15)
	declare @TANGGAL_PENGEMBALIAN date
	declare @BIAYA_TERLAMBAT varchar (15)

	Select @NO_PENGEMBALIAN=NO_PENGEMBALIAN, @NO_PINJAM=NO_PINJAM, 
	@TANGGAL_PENGEMBALIAN=TANGGAL_PENGEMBALIAN,
	@BIAYA_TERLAMBAT=BIAYA_TERLAMBAT from inserted
	

print '===The Data Has Been UPDATED==='
print 'NO_PENGEMBALIAN				: '+@NO_PENGEMBALIAN
print 'NO_PINJAM					: '+@NO_PINJAM
print 'TANGGAL_PENGEMBALIAN			: '+cast (@TANGGAL_PENGEMBALIAN as nvarchar)
print 'BIAYA_TERLAMBAT				: '+@BIAYA_TERLAMBAT
	END

--DELETED PENGEMBALIAN--
create trigger TR_DeletePENGEMBALIAN_PINJAMAN
on transaksi.PENGEMBALIAN_PINJAMAN for delete
AS
	BEGIN
	declare @NO_PENGEMBALIAN varchar (15)
	declare @NO_PINJAM varchar(15)
	declare @TANGGAL_PENGEMBALIAN date
	declare @BIAYA_TERLAMBAT varchar (15)

	Select @NO_PENGEMBALIAN=NO_PENGEMBALIAN, @NO_PINJAM=NO_PINJAM, 
	@TANGGAL_PENGEMBALIAN=TANGGAL_PENGEMBALIAN,
	@BIAYA_TERLAMBAT=BIAYA_TERLAMBAT from deleted
	

print '===The Data Has Been DELETED==='
print 'NO_PENGEMBALIAN				: '+@NO_PENGEMBALIAN
print 'NO_PINJAM					: '+@NO_PINJAM
print 'TANGGAL_PENGEMBALIAN			: '+cast (@TANGGAL_PENGEMBALIAN as nvarchar)
print 'BIAYA_TERLAMBAT				: '+@BIAYA_TERLAMBAT
	END

/*update human.NASABAH set human.NASABAH.SALDO = human.NASABAH.SALDO + inserted.jumlah.setor from inserted where transaksi.SETOR.JUMLAH_SETOR = inserted.SALDO*/
