
-- tworzenie tabel external (musza istniec juz w hbase)

drop table if exists usershb;
CREATE EXTERNAL TABLE usershb (
id STRING,
forename STRING,
password STRING,
surname STRING)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ('hbase.columns.mapping' = ':key,users:forename,users:password,users:surname')
TBLPROPERTIES ('hbase.table.name' = 'users');

drop table if exists  movieshb;
CREATE EXTERNAL TABLE movieshb (
id INT,
title STRING,
genres STRING)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ('hbase.columns.mapping' = ':key#b,movies:title,movies:genres')
TBLPROPERTIES ('hbase.table.name' = 'movies');

drop table if exists  ratingshb;
CREATE EXTERNAL TABLE ratingshb (
id INT,
userId INT,
movieId INT,
rating DOUBLE)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ('hbase.columns.mapping' = ':key#b,ratings:userId#b,ratings:movieId#b,ratings:rating#b')
TBLPROPERTIES ('hbase.table.name' = 'ratings');

drop table if exists  tagshb;
CREATE EXTERNAL TABLE tagshb (
id INT,
userId INT,
movieId INT,
tag STRING)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ('hbase.columns.mapping' = ':key#b,tags:userId#b,tags:movieId#b,tags:tag')
TBLPROPERTIES ('hbase.table.name' = 'tags');


select * from movieshb limit 1;
select * from tagshb limit 1;
select * from ratingshb limit 1;

select avg(rating) from ratingshb;


-- tworzenie tabeli internal w hive (sama sie zalozy)
CREATE TABLE hive4hbase (
id STRING,
forename STRING,
password STRING,
surname STRING)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ('hbase.columns.mapping' = ':key,hive:forename,hive:password,hive:surname')
TBLPROPERTIES ('hbase.table.name' = 'hive');
