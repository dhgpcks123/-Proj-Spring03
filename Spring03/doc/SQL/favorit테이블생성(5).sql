CREATE table favorite(
    fno NUMBER Constraint FAVOR_FNO_PK primary key
                    Constraint FAVOR_FNO_NN not null, 
    mno NUMBER constraint FAVOR_MNO_FK REFERENCES member(mno)
                CONSTRAINT FAVOR_MNO_NN not null, 
    ano NUMBER constraint FAVOR_ANO_FK references areainfo(ano)
                CONSTRAINT FAVOR_ANO_NN not null
);

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