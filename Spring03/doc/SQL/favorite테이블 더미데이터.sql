insert into favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 1 ,
    (select atno from areainfo where ano = 1)
);
insert into favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 2 ,
    (select atno from areainfo where ano = 2)
);
insert into favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 3 ,
    (select atno from areainfo where ano = 3)
);
insert into favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 4 ,
    (select atno from areainfo where ano = 4)
);
insert into favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 5 ,
    (select atno from areainfo where ano = 5)
);
insert into favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 6 ,
    (select atno from areainfo where ano = 6)
);
insert into favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 7 ,
    (select atno from areainfo where ano = 7)
);
insert into favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 8 ,
    (select atno from areainfo where ano = 8)
);
insert into favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 9 ,
    (select atno from areainfo where ano = 9)
);
insert into favorite
values(
    (select nvl(max(fno)+1, 1) from favorite),
    1010, 10 ,
    (select atno from areainfo where ano = 10)
);

commit;