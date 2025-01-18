create table material(
id integer  not null constraint material_p primary key,
name text not null

);
create table paloch_volh(
    id_vol integer not null constraint paloch_volh_pk references volh  on update cascade on delete cascade ,
    id_material integer not null constraint paloch_volh_p references material on update cascade  on delete cascade ,
    name text   not null,
    lenght integer not null
);
create table  faculty(
    id integer not null constraint faculty_p primary key,
    name text  not null
);create table volh(
    id integer not null constraint volh_p primary key,
    prozv text  not null,
    id_faculty integer not null constraint volh_pk references faculty on update cascade on delete cascade
);


INSERT INTO faculty VALUES
    (1,'Пуффендуй'),
    (2,'грифендор'),
    (3,'слизерин'),
    (4,'когтевран');
INSERT INTO volh VALUES
    (13,'лорд воля',1),
    (14,'лорд валя',1),
    (1,'Ханна Аббот',1),
    (2,'Сьюзен Боунс',1),
    (3,'Седрик Диггори',1),
    (4,'Ро́нальд Би́лиус',2),
    (5,'Гермио́на Джин',2),
    (6,'Джине́вра Мо́лли',2),
    (7,'Драко Люциус',3),
    (8,'Ви́нсент Крэбб',3),
    (9,'Гре́гори Гойл',3),
    (10,'Полу́мна',4),
    (11,'Чжо́ Чанг',4),
    (12,'е́рри Бут',4)
INSERT INTO material VALUES
    (1,'акация'),
    (2,'английский дуб'),
    (3,'боярышник'),
    (4,'бузина'),
    (5,'бук'),
    (6,'орешник'),
     (7,'клён')
    ;
INSERT INTO paloch_volh VALUES
    (1,5,'фестрал',38),
    (10,1,'дол',20),
    (11,4,'герм',15),
    (8,4,'грюм',25),
    (5,2,'флёр',16),
    (3,3,'седрик',35),
    (12,5,'фестрал и 100%',35),
    (13,5,'фестрал',36),
    (9,6,'lom',15),
    (6,6,'kol',30),
    (7,6,'dol',12),
    (14,5,'фестрал',36),
    (14,5,'фестрал',36),
(2,3,'lord',40);




delete from paloch_volh where id_vol in (select id from volh where id_faculty in(select id from faculty where faculty.name = 'Пуффендуй'));
delete from  paloch_volh where lenght in(select min(lenght) from paloch_volh);
update  paloch_volh set lenght= lenght + 2 where id_vol in (select id from volh where id_faculty in(select id from faculty where faculty.name = 'грифендор'));


select * from paloch_volh where lenght >10;
select * from paloch_volh where lenght >10 order by  name asc;
select * from  volh where prozv like 'лорд%';
select * from  paloch_volh where paloch_volh.name like '%и 100%';
select distinct name from paloch_volh;
select prozv from   volh  left join paloch_volh pv on volh.id = pv.id_vol
where pv.id_vol is null;
select material.name from  material inner join paloch_volh pv on material.id = pv.id_material
where lenght in (select max(lenght)from  paloch_volh);

select v.prozv as прозвеще, f.name,paloch_volh.name,m.name from paloch_volh inner join material m on m.id = paloch_volh.id_material
                                inner join volh v on paloch_volh.id_vol = v.id  inner join faculty f on v.id_faculty = f.id;
select  avg(lenght) from    paloch_volh  inner join material m on m.id = paloch_volh.id_material
where m.name = 'орешник';
select   material.name, pv.name from material left  join paloch_volh pv on material.id = pv.id_material;


delete from paloch_volh where id_vol in (select id from volh where id_faculty in(select id from faculty where faculty.name = 'Пуффендуй'));
delete from  paloch_volh where lenght in(select min(lenght) from paloch_volh);
update  paloch_volh set lenght= lenght + 2 where id_vol in (select id from volh where id_faculty in(select id from faculty where faculty.name = 'грифендор'));