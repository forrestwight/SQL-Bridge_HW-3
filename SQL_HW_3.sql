-- SQL Bridge Homework #3 --
-- Forrest Wight --

create database access;
use access;
-- Drop tables to start fresh --
drop table Users;
drop table Rooms;
drop table User_Rooms;

-- Create tables 'users', 'rooms', 'user_rooms' --
create table Users (
	User_ID int primary key,
    User_Name varchar(40) NOT NULL UNIQUE,
    Group_ID int
);
create table Rooms (
	Room_ID int primary key,
    Room varchar(40)
);
create table User_Rooms (
	Group_ID int NOT NULL references users(deptid),
    Group_Name varchar(40) NOT NULL,
    Room_ID int references rooms(roomid)
);

-- Insert data into 'users' table --
insert into Users values(1, 'Modesto', 1);
insert into Users values(2, 'Ayine', 1);
insert into Users values(3, 'Christopher', 2);
insert into Users values(4, 'Cheong Woo', 2);
insert into Users values(5, 'Saulat', 3);
insert into Users values(6, 'Heidi', NULL);

-- Insert data into 'rooms' table --
insert into Rooms values(1, '101');
insert into Rooms values(2, '102');
insert into Rooms values(3, 'Auditorium A');
insert into Rooms values(4, 'Auditorium B');

-- Insert data into 'user_rooms' table --
insert into User_Rooms values(1, 'I. T.', 1);
insert into User_Rooms values(1, 'I. T.', 2);
insert into User_Rooms values(2, 'Sales', 2);
insert into User_Rooms values(2, 'Sales', 4);
insert into User_Rooms values(3, 'Administration', NULL);
insert into User_Rooms values(4, 'Operations', NULL);

-- Confirming all data transferred to tables --
select * from Users;
select * from Rooms;
select * from User_Rooms;

-- Question #1 --
-- Show all groups, and the users in each group 

select ur.Group_Name, u.User_Name
from User_Rooms ur
	left join Users u on ur.Group_ID = u.Group_ID;

-- Question #2 --
-- Show all rooms, and the groups assigned to each room --
select r.Room, ur.Group_Name
from Rooms r
	left join User_Rooms ur on ur.Room_ID = r.Room_ID;

-- Question #3 --
-- List users, groups they belong to, and rooms they are assigned -- 
-- Sorted alphabetically by user, then group, then room --
select u.User_Name, ur.Group_Name, r.Room
from Users u
	left join User_Rooms ur on ur.Group_ID = u.Group_ID
    left join Rooms r on ur.Room_ID = r.Room_ID
order by u.User_Name, ur.Group_Name, r.Room;