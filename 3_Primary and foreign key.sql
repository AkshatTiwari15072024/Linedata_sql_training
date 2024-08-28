--primary key and foreign key

create table primarykeytable(ID int NOT NULL Primary Key,
gender int not null)

create table foreignkeytable(GenderID  int not null primary key, number int)

drop table primarykeytable, foreignkeytable

alter table primarykeytable add constraint primarykey_gender_FR
foreign key (gender) references foreignkeytable(GenderID)