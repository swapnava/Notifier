create database notifier;

use notifier;

create table users(
username varchar(50),
mobile varchar(12),
email varchar(50),
pass varchar(60)
);

create table notebook(
notebookname varchar(30),
notecount varchar(100),
email varchar(50),
id int primary key auto_increment
);

create table notes(
notename varchar(50),
startdate varchar(12),
enddate varchar(12),
nstatus varchar(10),
ntag varchar(10),
ndescription varchar(500),
notebookname varchar(30),
email varchar(50),
noteid int PRIMARY KEY AUTO_INCREMENT
);