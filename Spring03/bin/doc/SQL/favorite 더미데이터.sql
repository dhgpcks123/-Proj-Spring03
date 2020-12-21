
insert into 
    favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 1
);

insert into 
    favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 2
);

insert into 
    favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 3
);

insert into 
    favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 4
);

insert into 
    favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 5
);

insert into 
    favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 6
);

insert into 
    favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 7
);

insert into 
    favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 8
);

insert into 
    favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 9
);

insert into 
    favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 10
);
commit;