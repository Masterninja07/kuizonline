
--CREATE TABLE
create table kelas(
idkelas varchar(3) primary key not null, 
namakelas varchar(20));

create table pelajar(
idpelajar varchar(4) primary key not null,
namapelajar varchar(30),
idkelas varchar(3),
password varchar(8));

create table guru(
idguru varchar(3) primary key not null, 
namaguru varchar(30),
password varchar(8));

create table soalan(
idsoalan varchar(3) primary key not null,
namasoalan varchar(100),
pilihana varchar(100),
pilihanb varchar(100),
pilihanc varchar(100),
jawapan varchar(1),
idguru varchar(3));

create table kuiz(
idpelajar varchar(4) not null,
idsoalan varchar(4) not null,
tarikh varchar(10),
pilih varchar(1),
peratus int,
primary key(idpelajar, idsoalan));

--DELETE DATA JADUAL
DELETE FROM guru;
DELETE FROM kelas;
DELETE FROM kuiz;
DELETE FROM pelajar;
DELETE FROM soalan;

--INDEXING
ALTER TABLE `pelajar` ADD INDEX(`idkelas`);
ALTER TABLE `soalan` ADD INDEX(`idguru`);

--MAKE RELATIONSHIP
ALTER TABLE `kuiz` ADD CONSTRAINT `kuiz_pelajar` FOREIGN KEY (`idpelajar`) REFERENCES `pelajar`(`idpelajar`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `kuiz` ADD CONSTRAINT `kuiz_soalan` FOREIGN KEY (`idsoalan`) REFERENCES `soalan`(`idsoalan`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `pelajar` ADD CONSTRAINT `pelajar_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas`(`idkelas`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `soalan` ADD CONSTRAINT `soalan_guru` FOREIGN KEY (`idguru`) REFERENCES `guru`(`idguru`) ON DELETE CASCADE ON UPDATE CASCADE;



