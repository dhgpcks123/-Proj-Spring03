CREATE table favorite(
    fno NUMBER Constraint FAVOR_FNO_PK primary key
                    Constraint FAVOR_FNO_NN not null, 
    mno NUMBER constraint FAVOR_MNO_FK REFERENCES member(mno)
                CONSTRAINT FAVOR_MNO_NN not null, 
    ano NUMBER constraint FAVOR_ANO_FK references areainfo(ano)
                CONSTRAINT FAVOR_ANO_NN not null,
    atno NUMBER
);
