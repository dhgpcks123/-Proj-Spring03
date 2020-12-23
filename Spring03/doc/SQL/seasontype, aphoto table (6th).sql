-- ������ ��õ�� ������ ������ �� �ִ� SEASONTYPE ���� (����Ʈ �� : ���� ����)

CREATE TABLE seasontype(
    stno NUMBER(3) 
        CONSTRAINT SEASON_STNO_PK PRIMARY KEY
        CONSTRAINT SEASON_STNO_CK CHECK ( stno IN (100,200,300,400,500)),
    stname VARCHAR2(12)
        CONSTRAINT SEASON_STNAME_NN NOT NULL
        CONSTRAINT SEASON_STNAME_CK CHECK ( stname IN ('��','����','����','�ܿ�','��������')) 
);
INSERT INTO
    seasontype
VALUES(
    100,'��'
);
INSERT INTO
    seasontype
VALUES(
    200,'����'
);

INSERT INTO
    seasontype
VALUES(
    300,'����'
);

INSERT INTO
    seasontype
VALUES(
    400,'�ܿ�'
);


INSERT INTO
    seasontype
VALUES(
    500,'��������'
);

-- areainfo ���̺��� ���� ���а� stno ����
ALTER TABLE areainfo 
ADD stno NUMBER(3) DEFAULT 500
    CONSTRAINT AINFO_STNO_FK REFERENCES seasontype(stno)
;

update 
    areainfo
set
    stno = 100
where
    ano=1
;

update 
    areainfo
set
    stno = 300
where
    ano=2
;

update 
    areainfo
set
    stno = 100
where
    ano=3
;

update 
    areainfo
set
    stno = 100
where
    ano=4
;


commit;



-- ��һ��� ���̺� 
-- �⺻Ű pno �߰�, ���� ��ҿ� ���� �������� ���� �� ù��° ������ ������ subpno �߰�

DROP TABLE  aphoto;
CREATE TABLE aphoto(
    pno NUMBER(10)
        CONSTRAINT APHOTO_PNO_PK PRIMARY KEY,    
    apno NUMBER(10)
        CONSTRAINT APHOTO_APNO_FK REFERENCES areainfo(apno)
        CONSTRAINT APHOTO_APNO_NN NOT NULL,
    subpno NUMBER(2) DEFAULT 1
        CONSTRAINT APHOTO_SUBPNO_NN NOT NULL,
    aponame VARCHAR2(100 CHAR) DEFAULT 'noimage.jpg'
        CONSTRAINT APHOTO_APONAME_NN NOT NULL,
    apsname VARCHAR2(100 CHAR)  DEFAULT 'noimage.jpg'
        CONSTRAINT APHOTO_APSNAME_NN NOT NULL,
    apsize NUMBER(10)  DEFAULT (200 * 100)
        CONSTRAINT APHOTO_APSIZE_NN NOT NULL,
    apdir VARCHAR2(100) DEFAULT '/img/area/'
        CONSTRAINT APHOTO_APDIR_NN NOT NULL,
    atno NUMBER(10) 
        CONSTRAINT APHOTO_ATNO_FK REFERENCES areatype(atno)
        CONSTRAINT APHOTO_ATNO_NN NOT NULL
        CONSTRAINT APHOTO_ATNO_CK CHECK (atno IN (10,20,30,40,50))
);     




INSERT INTO aphoto
VALUES(1, 4, 1, 'test02.jpg', '�۾ǻ�3.jpg', 20000, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES(2, 5, 1, 'test20.jpg', '������.jpg', 20000, '/img/area/', 20)
;

INSERT INTO aphoto
VALUES(3, 6, 1, 'test19.jpg', '����.jpg', 20000, '/img/area/', 20)
;

INSERT INTO aphoto
VALUES(4, 7, 1, 'test18.jpg', '����2.jpg', 20000, '/img/area/', 20)
;

INSERT INTO aphoto
VALUES(5, 8, 1, 'test17.jpg', '����3.jpg', 20000, '/img/area/', 30)
;

INSERT INTO aphoto
VALUES(6, 9, 1, 'test16.jpg', '����1.jpg', 20000, '/img/area/', 30)
;
INSERT INTO aphoto
VALUES(7, 9, 1, 'test17.jpg', '����1.jpg', 20000, '/img/area/', 30)
;
INSERT INTO aphoto
VALUES(8, 9, 1, 'test18.jpg', '����1.jpg', 20000, '/img/area/', 30)
;
INSERT INTO aphoto
VALUES(9, 9, 1, 'test19.jpg', '����1.jpg', 20000, '/img/area/', 30)
;

INSERT INTO aphoto
VALUES(10, 11, 1, 'test01.jpg', '����2.jpg', 20000, '/img/area/', 40)
;
INSERT INTO aphoto
VALUES(11, 12, 1, 'test02.jpg', '����3.jpg', 20000, '/img/area/', 40)
;
INSERT INTO aphoto
VALUES(12, 12, 1, 'test07.jpg', '����3.jpg', 20000, '/img/area/', 40)
;
INSERT INTO aphoto
VALUES(13, 13, 1, 'test03.jpg', '����4.jpg', 20000, '/img/area/', 40)
;
INSERT INTO aphoto
VALUES(14, 14, 1, 'test04.jpg', '����53.jpg', 20000, '/img/area/', 50)
;
INSERT INTO aphoto
VALUES(15, 15, 1, 'test05.jpg', '����6.jpg', 20000, '/img/area/', 50)
;
INSERT INTO aphoto
VALUES(16, 15, 1, 'test06.jpg', '����7.jpg', 20000, '/img/area/', 50)
;
INSERT INTO aphoto
VALUES(17, 15, 1, 'test07.jpg', '����8.jpg', 20000, '/img/area/', 50)
;

INSERT INTO 
aphoto
VALUES(
18, 1, 1, 'test01.jpg','��������1.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
aphoto
VALUES(
19, 1, 1, 'test02.jpg','��������2.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
aphoto
VALUES(
20, 2, 1, 'test03.jpg','������1.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
aphoto
VALUES(
21, 2, 1, 'test04.jpg','������2.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
aphoto
VALUES(
22, 3, 1, 'test05.jpg','���ĵ�1.jpg',200 * 100,'/img/area/',10
);


INSERT INTO 
aphoto
VALUES(
23, 3, 1, 'test06.jpg','���ĵ�4.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
aphoto
VALUES(
24, 4, 1, 'test07.jpg','�۾ǻ�1.jpg',200 * 100,'/img/area/',10
);


INSERT INTO 
aphoto
VALUES(
25, 4, 1, 'test08.jpg','�۾ǻ�2.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
aphoto
VALUES(
26, 5, 1, 'test09.jpg','������ȣ��.jpg',200 * 100,'/img/area/',20
);


INSERT INTO 
aphoto
VALUES(
27, 6, 1, 'test10.jpg','��ž������ȣ��.jpg',200 * 100,'/img/area/',20
);


INSERT INTO 
aphoto
VALUES(
28, 7, 1, 'test11.jpg','�����ȣ��.jpg',200 * 100,'/img/area/',20
);


INSERT INTO 
aphoto
VALUES(
29, 8, 1, 'test12.jpg','�����ž.jpg',200 * 100,'/img/area/', 30
);

INSERT INTO 
aphoto
VALUES(
30, 9, 1, 'test13.jpg','��Ʒ� ��������.jpg',200 * 100,'/img/area/', 30
);
INSERT INTO 
aphoto
VALUES(
31, 10, 1, 'test14.jpg','�����Ѷ󱹼�1.jpg',200 * 100,'/img/area/', 30
);

INSERT INTO 
aphoto
VALUES(
32, 10, 1, 'test15.jpg','�����Ѷ󱹼�2.jpg',200 * 100,'/img/area/', 30
);



INSERT INTO 
aphoto
VALUES(
33, 11, 1, 'test16.jpg','���;系��.jpg',200 * 100,'/img/area/',40
);



INSERT INTO 
aphoto
VALUES(
34, 12, 1, 'test17.jpg','��ġ���ǿ�.jpg',200 * 100,'/img/area/', 40
);



INSERT INTO 
aphoto
VALUES(
35, 13, 1, 'test18.jpg','�ٳ����ǿ�.jpg',200 * 100,'/img/area/', 40
);



INSERT INTO 
aphoto
VALUES(
36, 14, 1, 'test19.jpg','�����Ѷ󺴿� ���޽�.jpg',200 * 100,'/img/area/', 50
);


INSERT INTO 
aphoto
VALUES(
37, 15, 1, 'test20.jpg','�������Ƿ�� ���޽�.jpg',200 * 100,'/img/area/', 50
);


INSERT INTO 
aphoto
VALUES(
38, 16, 1, 'test01.jpg','���ִ��б����� ���޽�.jpg',200 * 100,'/img/area/', 50
);

commit;
SELECT * FROM aphoto;


