----------------------------------------------------------------------------------------------------------------------

-- �ش� ���� �����ص� �� (�̹� ��������)
-- ( ���� ���� ) system ���� ����
CREATE USER sj identified by hello;
grant create session to sj;
grant create table to sj;
alter user sj default tablespace users quota unlimited on users;


----------------------------------------------------------------------------------------------------------------------

-- **** ��� ���̺� drop�ϱ� (�������) ****
drop table rphoto;
drop table aphoto;
drop table favorite;
drop table grade;
drop table review;
drop table areainfo;
drop table seasontype;
drop table areatype;
drop table userdisease;
drop table disease;
drop table member;




----------------------------------------------------------------------------------------------------------------------

-- ( ## ���̺� ���� )
-- ȸ���������̺�
create table member(
    mno NUMBER(10)
        CONSTRAINT MB_MNO_PK PRIMARY KEY,
    id VARCHAR2(30 CHAR)
        CONSTRAINT MB_ID_UK UNIQUE
        CONSTRAINT MB_ID_NN NOT NULL,
    mname VARCHAR2(30 CHAR)
        CONSTRAINT MB_MNAME_NN NOT NULL,
    pw VARCHAR2(20 CHAR)
        CONSTRAINT MB_PW_NN NOT NULL,
    mail VARCHAR2(50 CHAR)
        CONSTRAINT MB_MAIL_UK UNIQUE
        CONSTRAINT MB_MAIL_NN NOT NULL,
    tel VARCHAR2(13)
        CONSTRAINT MB_TEL_UK UNIQUE
        CONSTRAINT MB_TEL_NN NOT NULL,
    joindate DATE DEFAULT sysdate
        CONSTRAINT MB_JDATE_NN NOT NULL,
    gen CHAR(1)
        CONSTRAINT MB_GEN_NN NOT NULL
        CONSTRAINT MB_GEN_CK CHECK (gen IN ('M','F')),
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT MB_ISSHOW_NN NOT NULL
        CONSTRAINT MB_ISSHOW_CK CHECK (isshow IN ('Y', 'N')),
    blood1 VARCHAR2(3 CHAR) 
        CONSTRAINT MB_BLOOD1_NN NOT NULL
        CONSTRAINT MB_BLOOD1_CK CHECK (blood1 IN ('A','B','AB','O')),
    blood2 VARCHAR2(3 CHAR) 
        CONSTRAINT MB_BLOOD2_NN NOT NULL
        CONSTRAINT MB_BLOOD2_CK CHECK (blood2 IN ('RH+','RH-')),
    birth DATE 
        CONSTRAINT MB_BIRTH_NN NOT NULL,
    sos VARCHAR2(13 CHAR)
        CONSTRAINT MB_SOS_NN NOT NULL
);



-- ( ������ ���� )
-- ȸ���������̺�
INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'jang','�����','12345','jang@increpas.com','010-1234-5677',sysdate,'F','Y','B','RH+','92/11/02','010-1234-5678'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'chan','������','12345','chan@increpas.com','010-1111-1111',sysdate,'M','Y','A','RH+','93/01/02','010-1111-1118'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'wook','������','12345','wook@increpas.com','010-2222-2222',sysdate,'M','Y','O','RH+','92/08/02','010-2222-2228'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'joseph','�����','12345','joseph@increpas.com','010-3333-3333',sysdate,'M','Y','O','RH+','88/07/02','010-3333-3338'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'jiwoo','������','12345','jiwoo@increpas.com','010-4444-4444',sysdate,'M','Y','A','RH+','95/05/12','010-4444-4448'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'jjang','�强ȯ','12345','jjang@increpas.com','010-5555-5555',sysdate,'M','Y','AB','RH+','97/05/12','010-5555-5558'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'sun','�ǿ���','12345','sun@increpas.com','010-6666-6666',sysdate,'F','Y','B','RH+','99/05/12','010-6666-6668'
);


INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'joo','���ֿ�','12345','joo@increpas.com','010-7777-7777',sysdate,'F','Y','B','RH+','97/05/12','010-7777-7778'
);


INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'hong','ȫ�浿','12345','hong@increpas.com','010-8888-8888',sysdate,'M','Y','AB','RH-','90/06/12','010-8888-8880'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'tess','�׽���','12345','tess@increpas.com','010-9999-9999',sysdate,'M','Y','AB','RH-','30/06/12','010-9999-9990'
);


-- ( ���̺� �÷� ���� )
-- ��� ���̺� �÷� ���� ����
ALTER TABLE MEMBER DROP CONSTRAINT MB_BLOOD1_CK;
ALTER TABLE MEMBER DROP CONSTRAINT MB_BLOOD2_CK;
ALTER TABLE MEMBER ADD CONSTRAINT MB_BLOOD1_CK CHECK (blood1 IN ('A','B','O','AB','��������'));
ALTER TABLE MEMBER ADD CONSTRAINT MB_BLOOD2_CK CHECK (blood2 IN ('RH+','RH-','��������'));

ALTER TABLE MEMBER DROP CONSTRAINT MB_SOS_NN;

ALTER TABLE MEMBER ADD rel VARCHAR2(5 CHAR);

ALTER TABLE MEMBER ADD addmsg VARCHAR2(50 CHAR) DEFAULT '����';


----------------------------------------------------------------------------------------------------------------------
-- ( ## ���̺� ���� )
--�����з����̺�
CREATE TABLE disease(
    dno NUMBER(10) 
        CONSTRAINT DISEASE_DNO_PK PRIMARY KEY,
    dname VARCHAR2(100)
        CONSTRAINT DISEASE_DNAME_NN NOT NULL
);

-- ( ������ ���� )
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'�ĵ���'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'����'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'���μ� ���� ���ı�'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'����'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'����'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'���'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'��ȭ�ҷ�'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'��Ȳ���'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'�ɱٰ����'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'�索��'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'����'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'ġ����'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'�˷�����'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'������'
);
----------------------------------------------------------------------------------------------------------------------

-- ( ## ���̺� ���� )
-- ȸ���������̺�
CREATE TABLE userdisease(
    mno NUMBER(10)
        CONSTRAINT UDISEASE_MNO_FK REFERENCES member(mno),
    dno NUMBER(10)
        CONSTRAINT UDISEASE_DNO_FK REFERENCES disease(dno)
);
-- ( ������ ���� )
INSERT INTO    userdisease 
VALUES( 1001,1 );
INSERT INTO     userdisease
VALUES(    1002,2 );
INSERT INTO     userdisease
VALUES(    1003,3 );
INSERT INTO     userdisease
VALUES(    1004,4 );
INSERT INTO    userdisease
VALUES(    1005,5 );
INSERT INTO    userdisease
VALUES(    1006,6 );
INSERT INTO     userdisease
VALUES(    1007,7 );
INSERT INTO     userdisease
VALUES(    1008,8 );
INSERT INTO    userdisease
VALUES(    1009,9 );
INSERT INTO     userdisease
VALUES(    1010,10 );

----------------------------------------------------------------------------------------------------------------------

-- ( ## ���̺� ���� )
-- ����������̺�
CREATE TABLE areatype(
      atno NUMBER(2)
        CONSTRAINT ATYPE_ATNO_PK PRIMARY KEY
        CONSTRAINT ATYPE_ATNO_CK CHECK (atno IN (10,20,30,40,50)),
      atname VARCHAR2(2 CHAR)
        CONSTRAINT ATYPE_ATNAME_NN NOT NULL
        CONSTRAINT AYTPE_ATNAME_CK CHECK (atname IN ('����','����','�Ĵ�','����','����'))
);
-- ( ������ ���� )
INSERT INTO    areatype
VALUES( 10,'����');
INSERT INTO    areatype
VALUES(    20,'����');
INSERT INTO    areatype
VALUES(    30,'�Ĵ�');
INSERT INTO    areatype
VALUES(    40,'����');
INSERT INTO    areatype
VALUES(    50,'����');

----------------------------------------------------------------------------------------------------------------------
-- ( ## ���̺� ���� )
-- ������� ���̺�
create table areainfo(
    ano NUMBER(10) 
        CONSTRAINT AINFO_ANO_PK PRIMARY KEY,
    aname VARCHAR2(30 CHAR)
        CONSTRAINT AINFO_ANAME_NN NOT NULL,
    aloc VARCHAR2(50 CHAR)
        CONSTRAINT AINFO_ALOC_NN NOT NULL,  
    atel  VARCHAR2(14 CHAR)
        CONSTRAINT AINFO_ATEL_UK UNIQUE,
    atno NUMBER(2)
        CONSTRAINT AINFO_ATNO_FK REFERENCES areatype(atno)
        CONSTRAINT AINFO_ATNO_NN NOT NULL,
    apno NUMBER(10)
        CONSTRAINT AINFO_APNO_UK UNIQUE
        CONSTRAINT AINFO_APNO_NN NOT NULL,
    abody VARCHAR2(100 CHAR) 
        CONSTRAINT AINFO_ABODY_NN NOT NULL,
    ahit NUMBER(10) DEFAULT 0
        CONSTRAINT AINFO_AHIT_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT AINFO_ISSHOW_NN NOT NULL,
    ax NUMBER(10) 
        CONSTRAINT AINFO_AX_NN NOT NULL,
    ay NUMBER(10)
        CONSTRAINT AINFO_AY_NN NOT NULL
);
-- ( ������ ���� )
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'��������','���� �������� ������ ����','064-782-2810',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '3������ ���� ��ä�� �ϸ� ǳ���� �� �� �ְ�, �ڿ� �ִ� ����� ������ Ǫ�� �ٴٰ� �ֽ��ϴ�.',
    0,'Y',10,18
);

INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'������','���� �������� ������ �ŷʸ� ��2-1',null,10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '10�� �� ��ǳ ���� ã�� ������. ���󿡼� ������ �����⸦ ������ �� �־��. ',
    58,'Y',1401,86
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'���ĵ�','���� �������� ������ ���ĸ�','064-794-7130',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '5���� �ִ� ���ĵ� û���� ������ �� ��������. û������ �ѽǳѽ�~',
    8,'Y',101,8
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�۾ǻ�','���� �������� ������ �۾ǰ����� 421-1','064-120',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '4���� ����� ���� �ĵ��� ���� ĥ �� ���� ���� �� �շ���! �ѷ��� �ҿ�ð��� 2�ð� ���� �˴ϴ�. ',
    10,'Y',11,80
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'������ȣ��','���� �������� õ������188���� 11','064-805-7600',20,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '������ ���ݿ� ���Ҹ� �̿��ϰ� �����ôٸ� �����մϴ�!',
    19,'Y',11,9
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'��ž������ȣ������','���ֽ� ��õ�� �����ؾȷ� 502','0507-1425-9307',20,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '�Դ��ؼ����� �ϸ��� ���� �ʹٸ� �̰�����~ ������������ �ִ� ��� ���� ű���嵵 ��� �����մϴ�.',
    4,'Y',1021,84
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�����ȣ��','���� �������� �߹�������72���� 114',null,20,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���� �ȿ��� �Ƹ��ٿ� ���Ǻ並 �� �� �ִ� ȣ��, ������ ��å�ϱ⵵ �ʹ� ���ƿ�. ',
    8,'Y',1401,48
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�����ž','���� �������� ������ ����� 270-8 2��','064-782-5050',30,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '����������� ���� ����� ���� �����ôٸ� ã�ƿ�����~ ���� ������ �帳�ϴ�!',
    80,'Y',141,7
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'��Ʒ� ��������','���� ���ֽ� ������� 23 1��','0507-1310-5917',30,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '����������, �Ѷ������, �ܱܲ�ġ��, �ԼҶ� ��� �Ⱦƿ�. ������ ����@_@',
    10,'Y',181,35
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�����Ѷ󱹼�','���� �������� õ������188���� 17','064-738-6392',30,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���ִ� �༮�鵵 ���� < ���� ��� ���� >, �޲ٹ̰� �� ���� ���� �ְ��� ����',
    17,'Y',1401,85
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'���;系��','���� ���ֽ� ������ 18','064-752-3312',40,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    'ģ���ϰ� �����ص帳�ϴ�. ',
    2,'Y',1031,845
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'��ġ���ǿ�','���� �������� õ������ 194(�߹���)','064-738-2811',40,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���� �� ġ������ ����ôٸ� �̰����� ������~',
    4,'Y',1201,82
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�ٳ����ǿ�','���� ���ֽ� �߾ӷ� 77 2��(�̵�1��)','064-721-0050',40,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '�ٳ����ǿ� ������ ������ �ּ��� ���ϰڽ��ϴ�.',
    7,'Y',11,49
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�����Ѷ󺴿� ���޽�','���� ���ֽ� ���ɷ� 65 �Ѷ󺴿�','064-740-5158',50,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '24�ð� ��մϴ�. ',
    47,'Y',131,479
);      
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�������Ƿ�� ���޽�','���� �������� ��ȫ�� 1530','064-730-3001',50,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���� ��ġ�� ���ص帮�ڽ��ϴ�. ',
    8,'Y',108,490
);      
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'���ִ��б����� ���޽�','���� ���ֽ� �ƶ�13�� 15','064-717-1900',50,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���ִ��б� �ֺ� ���޽��Դϴ�. ',
    48,'Y',100,433
);      

----------------------------------------------------------------------------------------------------------------------
-- ( ## ���̺� ���� )
-- ��һ������̺� ( �⺻Ű pno �߰�, ���� ��ҿ� ���� �������� ���� �� ù��° ������ ������ subpno �߰� )
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
-- ( aphoto ������ ���� )

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 1, 1, '��������1.jpg', '��������1.jpg', 4357, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 1, 2, '��������2.jpg', '��������2.jpg', 5444, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 1, 3, '��������3.jpg', '��������3.jpg', 200*100, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 1, 4, '��������4.jpg', '��������4.jpg', 200*100, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 1, 5, '��������5.jpg', '��������5.jpg', 200*100, '/img/area/', 10)
;
select * from aphoto;
INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 2, 1, '������1.jpg', '������1.jpg', 5581, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 2, 2, '������2.jpg', '������2.jpg', 4758, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 3, 1, '���ĵ�1.jpg', '���ĵ�1.jpg', 5647, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 3, 2, '���ĵ�2.jpg', '���ĵ�2.jpg', 4651, '/img/area/', 10)
;


INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 3, 3, '���ĵ�3.jpg', '���ĵ�3.jpg', 200*100, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 3, 4, '���ĵ�4.jpg', '���ĵ�4.jpg', 200*100, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 3, 5, '���ĵ�5.jpg', '���ĵ�5.jpg', 200*100, '/img/area/', 10)
;


INSERT INTO 
    aphoto
VALUES(
    (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 4, 1, '�۾ǻ�1.jpg','�۾ǻ�1.jpg',5029,'/img/area/',10
);


INSERT INTO 
    aphoto
VALUES(
   (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 4, 2,'�۾ǻ�2.jpg','�۾ǻ�2.jpg',5369,'/img/area/',10
);

INSERT INTO 
    aphoto
VALUES(
   (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 4, 3,'�۾ǻ�3.jpg','�۾ǻ�3.jpg',200*100,'/img/area/',10
);

INSERT INTO 
    aphoto
VALUES(
   (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 4, 4,'�۾ǻ�4.jpg','�۾ǻ�4.jpg',200*100,'/img/area/',10
);

INSERT INTO 
    aphoto
VALUES(
   (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 4, 5,'�۾ǻ�5.jpg','�۾ǻ�5.jpg',200*100,'/img/area/',10
);
INSERT INTO 
    aphoto
VALUES(
    (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 5,1,'������ȣ��1.jpg','������ȣ��1.jpg',63,'/img/area/',20
);


INSERT INTO 
    aphoto
VALUES(
    (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 6,1,'������.jpg','������.jpg',511,'/img/area/',20
);


INSERT INTO 
    aphoto
VALUES(
    (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 7,1,'�����.jpg','�����.jpg',149,'/img/area/',20
);

INSERT INTO 
    aphoto
VALUES(
    (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 7,1,'�����2.jpg','�����2.jpg',149,'/img/area/',20
);

INSERT INTO 
    aphoto
VALUES(
    (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 8,1,'�����ž.jpg','�����ž.jpg',99,'/img/area/',30
);

INSERT INTO 
    aphoto
VALUES(
    (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 8,2,'�����ž2.jpg','�����ž2.jpg',99,'/img/area/',30
);

INSERT INTO 
    aphoto
VALUES(
    (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 9,1,'��Ʒ�.jpg','��Ʒ�.jpg',91,'/img/area/',30
);


INSERT INTO 
    aphoto
VALUES(
    (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 9,2,'��Ʒ�2.jpg','��Ʒ�2.jpg',91,'/img/area/',30
);
INSERT INTO 
    aphoto
VALUES(
    (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 10,1,'�Ѷ󱹼�1.jpg','�Ѷ󱹼�1.jpg',4377,'/img/area/',30
);

INSERT INTO 
    aphoto
VALUES(
    (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 10,2,'�Ѷ󱹼�2.jpg','�Ѷ󱹼�2.jpg',65,'/img/area/',30
);



INSERT INTO 
    aphoto
VALUES(
   (SELECT NVL(MAX(pno)+1,10001) FROM aphoto),  11,1,'���;系��.jpg','���;系��.jpg',200 * 100,'/img/area/',40
);



INSERT INTO 
    aphoto
VALUES(
   (SELECT NVL(MAX(pno)+1,10001) FROM aphoto),  12,1,'��ġ��.jpg','��ġ��.jpg',200 * 100,'/img/area/',40
);

INSERT INTO 
    aphoto
VALUES(
   (SELECT NVL(MAX(pno)+1,10001) FROM aphoto),  12,1,'��ġ��2.jpg','��ġ��2.jpg',200 * 100,'/img/area/',40
);

INSERT INTO 
    aphoto
VALUES(
    (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 13,1,'�ٳ����ǿ�.jpg','�ٳ����ǿ�.jpg',200 * 100,'/img/area/',40
);



INSERT INTO 
    aphoto
VALUES(
   (SELECT NVL(MAX(pno)+1,10001) FROM aphoto),  14,1,'�����Ѷ󺴿�.jpg','�����Ѷ󺴿�.jpg',200 * 100,'/img/area/',50
);


INSERT INTO 
    aphoto
VALUES(
   (SELECT NVL(MAX(pno)+1,10001) FROM aphoto),  15,1,'�������Ƿ�����޽�.jpg','�������Ƿ�����޽�.jpg',200 * 100,'/img/area/',50
);


INSERT INTO 
    aphoto
VALUES(
    (SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 16,1,'���ִ��б��������޽�.jpg','���ִ��б��������޽�.jpg',200 * 100,'/img/area/',50
);

----------------------------------------------------------------------------------------------------------------------
--( ������ ���� )
--�Ҽ��� �Է��� ���� NUMBER(10) -> NUMBER�� �����Ѵ�


ALTER TABLE areainfo
MODIFY ay NUMBER;

ALTER TABLE areainfo
MODIFY ax NUMBER;

-- ������ ǥ���ϱ� ���� ��ǥ�� x, y�� �����Ѵ�
UPDATE AREAINFO
SET ax= 33.42437961506556, ay=126.93110026765497
WHERE ano=1;

UPDATE AREAINFO
SET ax=33.375636521547264, ay= 126.5685862198309
WHERE ano=2;

UPDATE AREAINFO
SET ax=33.1727671789905 , ay= 126.27293207589577
WHERE ano=3;

UPDATE AREAINFO
SET ax=33.199804357744014, ay=126.29243666800144
WHERE ano=4;

UPDATE AREAINFO
SET ax=33.25077289501184, ay=126.42469343452574
WHERE ano=5;

UPDATE AREAINFO
SET ax=33.54252580986714, ay=126.66618655416492
WHERE ano=6;

UPDATE AREAINFO
SET ax=33.24462498540053, ay=126.40604683881358
WHERE ano=7;

UPDATE AREAINFO
SET ax=33.46164828897533, ay=126.9346003676563
WHERE ano=8;

UPDATE AREAINFO
SET ax=33.23574587023389, ay=126.36351258114277
WHERE ano=9;

UPDATE AREAINFO
SET ax=33.250525250847936, ay=126.42445768114317
WHERE ano=10;

UPDATE AREAINFO
SET ax=33.51307971275873, ay=126.52142654066962
WHERE ano=11;

UPDATE AREAINFO
SET ax=33.251745497098426, ay=126.42565332716656
WHERE ano=12;

UPDATE AREAINFO
SET ax=33.518037668945176, ay=126.52284210749815
WHERE ano=13;

UPDATE AREAINFO
SET ax=33.49019207658534, ay=126.48501679464566
WHERE ano=14;

UPDATE AREAINFO
SET ax=33.255174417839335, ay=126.56479441182559
WHERE ano=15;

UPDATE AREAINFO
SET ax=33.46714133094259, ay=126.5457129811507
WHERE ano=16;

commit;
----------------------------------------------------------------------------------------------------------------------
-- ( ## ���̺� ���� )
-- �����������̺�

create table review (
    rno NUMBER(10) -- �۹�ȣ
        CONSTRAINT REVIEW_RNO_PK PRIMARY KEY,
    mno NUMBER(10) -- ȸ����ȣ
        CONSTRAINT REVIEW_MNO_FK REFERENCES member(mno)
        CONSTRAINT REVIEW_MNO_NN NOT NULL,
    rtitle VARCHAR2(50 CHAR)
        CONSTRAINT REVIEW_TITLE_NN NOT NULL,   -- �� ����
    rbody VARCHAR2(500 CHAR)
        CONSTRAINT REVIEW_BODY_NN NOT NULL, -- �� ����
    rpno NUMBER(10)
        CONSTRAINT REVIEW_RPNO_UK UNIQUE
        CONSTRAINT REVIEW_RPNO_NN NOT NULL, -- ���ε� ����
    rdate DATE  DEFAULT sysdate
        CONSTRAINT REVIEW_RDATE_NN NOT NULL,
    rgrade NUMBER
        CONSTRAINT REVIEW_GRADE_NN NOT NULL
        CONSTRAINT REVIEW_GRADE_CK CHECK ( rgrade IN (0,  1 ,  2 ,  3 ,  4 , 5)), -- ��� ����
    rhit NUMBER(10) DEFAULT 0
        CONSTRAINT REVIEW_HIT_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT REVIEW_ISSHOW_NN NOT NULL,
    rx NUMBER
        CONSTRAINT REVIEW_RX_NN NOT NULL,
    ry NUMBER
        CONSTRAINT REVIEW_RY_NN NOT NULL
);



-- ( ������ ���� )

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1002,'��� ���� �ٳ�Ծ��~','������ �ƴ϶� ���� ���ƿ�. �׷��� �ʹ� �Ƹ��ٿ��� ���� �͵� �ؾ���ϴ�.',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2020/10/31',5,50,'Y',33.375636521547264,126.5685862198309
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1003,'û������ ���� �ֳ׿�','û����, ��ä��, �ĵ��� ��ȭ �ְ�!!',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2020/10/31',5,30,'Y' , 33.1727671789905 ,  126.27293207589577
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1007,'�����ȣ�� �ٳ�Ծ��~','��� ���� ������ �� ��γ׿�.. �׷��� ���� �߾��� �Ǿ� �ູ�մϴ�. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2020/08/01',4,20,'Y', 33.24462498540053, 126.40604683881358
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1009,'�λ����� ��Ʒ� ��������','�񸰰��� �Ⱦ��ϴµ� ���������� �����߳׿�. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2019/05/01',5,65,'Y', 33.23574587023389, 126.36351258114277
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1010,'TV�� ���� ������ ���ٴ�','���� ���ƿ��� �濡 �������� ����, �Ǹ԰� �ͳ׿� ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2018/07/01',5,34,'Y' , 33.250525250847936, 126.42445768114317
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1001,'���� �� ġ�� �ı�','������ ���µ� ġ�ư� �ʹ� ���ļ� ġ�� �ٳ�Ծ��. 
    ���п� ���� ��������� ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2017/07/01',3,25,'Y', 33.251745497098426, 126.42565332716656
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1002,'���ǿ��� �ٳ�Խ��ϴ�. ','������ ��ģ���ؼ� �������� ���� ���� �ʽ��ϴ�. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2018/06/11',3,15,'Y' , 33.518037668945176, 126.52284210749815
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1004,'�״� ��Ƴ���� ','�㿡 ���ϰ� ü�ϴ� �ٶ��� 
    ���� ���� ���ϴٰ� ���޽��� �ٳ�Խ��ϴ�. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2019/11/11',4,53,'Y', 33.255174417839335, 126.56479441182559
);
----------------------------------------------------------------------------------------------------------------------
-- ( ���� �߰� ���� )
INSERT INTO review
VALUES(
    9, 1004, '��Ʒ� ��', '�����̶� ���ֵ� ��� �迡 �԰� �Դµ� �� ������. ������ ������. �����ؾ��ؼ� ���ִ� �� ���̴µ� �� �������� ���� �� ����;;',
    9, sysdate, 4, 15, 'Y', 33.23574587023389,126.36351258114277
);

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'jang' ),
    'JEJU~ �Ѷ󱹽�', '���� � ���ٰ� ���� �԰� �; �ٳ�Դµ�
    ŷ �� ������ �� �±� �Ե鵵 �� �ٳ�ͺ�����. 3���̼� �� �׸� ���Ѽ� �������� ����
    �ٵ� �谡 ���� �����ٴ� �� �Ԥ�����',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 5, 0, 'Y', 33.250525250847936, 126.42445768114317
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'chan' ),
    '�� �� ������', '��ħ�� �� ���ļ� ����� �� ã�ٰ� �ٳ�� �׳����� ������',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 3, 0, 'Y', 33.51307971275873, 126.52142654066962
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'wook' ),
    '���� ������', '�� �ٸ��� ���� �� ��ġ 4���ִٰ� ���� ũ��� �ؾߵȴٴ� �� �ƴ�?
    �� ��μ� �λ��ϰ� ���ͼ� �տ� ġ�� �� �ֱ淡 ���µ� �� ���� ����ġ���ϰ� �� ��',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 4, 0, 'Y', 33.251745497098426, 126.42565332716656
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'joseph' ),
    '�� ������ �ٳ�Ծ��', '���� ����Ծ����.. ȿ���� �� �𸣰ھ�� �Ф�',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 2, 0, 'Y', 33.518037668945176, 126.52284210749815
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'jiwoo' ),
    '��...', '��� ���� ��������.. ���޽� �Ƿ��Դµ� �ǻ���̶� ��ȣ����� ģ���� ������',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 4, 0, 'Y', 33.49019207658534, 126.48501679464566
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'jjang' ),
    '��ǳ�� ���� �� ����...', '�ƴ� �Ѷ�� ����Ϸ� ���ٰ� ���� �ٳ�Դµ� ��¾��
    �Ѷ�굵 ������ �۾ǻ� ����',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 4, 0, 'Y', 33.199804357744014, 126.29243666800144
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'sun' ),
    '���뿡 �̷�����?', '���뿡�� �������� ������ ��� ������ �Ϸ����',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 3, 0, 'Y', 33.46714133094259, 126.5457129811507
    )
;
INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'sun' ),
    '������������', '�������� �����ϴ� �׷��� ����Ʈ �� �ٳ�Դµ� �� �׳� ����������',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 3, 0, 'Y', 33.42437961506556, 126.93110026765497
    )
;
INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'sun' ),
    '��ž', '�� ���� ���ϴ�~~ ��ž�䰡 �����ϴٴ��� ���� �� �ͼ� �׳� �ǳ��� �־����Ф�',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 3, 0, 'Y', 33.46164828897533, 126.9346003676563
    )
;
INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'sun' ),
    '��ž������', '�� ���� ���ϴ�~~ ���ݴ�� ����',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 3, 0, 'Y', 33.54252580986714, 126.66618655416492
    )
;
INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'chan' ),
    '�߹� ������ ȣ��', '�ֺ��� ������ ���Ƽ� ���ƿ�~ ���������� �;���',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 4, 0, 'Y', 33.25077289501184, 126.42469343452574
    )
;

----------------------------------------------------------------------------------------------------------------------
-- ( ## ���̺� ���� )
-- ����������̺� + isshow, pno �߰�
CREATE TABLE rphoto(
    pno NUMBER(10)
        CONSTRAINT RPHOTO_PNO_PK PRIMARY KEY,
    rpno NUMBER(10)
        CONSTRAINT RPHOTO_RPNO_FK REFERENCES review(rpno)
        CONSTRAINT RPHOTO_RPNO_NN NOT NULL,
    rponame VARCHAR2(100 CHAR) DEFAULT 'noimage.jpg'
        CONSTRAINT RPHOTO_ONAME_NN NOT NULL,
    rpsname VARCHAR2(100 CHAR) DEFAULT 'noimage.jpg'
        CONSTRAINT RPHOTO_SNAME_NN NOT NULL,
    rpsize NUMBER(10) DEFAULT 200*100
        CONSTRAINT RPHOTO_SIZE_NN NOT NULL,
    rpdir VARCHAR2(100 CHAR) DEFAULT '/img/area'
        CONSTRAINT RPHOTO_DIR_NN NOT NULL,
    rtno NUMBER(10)
        CONSTRAINT RPHOTO_RTNO_FK REFERENCES areatype(atno)
        CONSTRAINT RPHOTO_RTNO_NN NOT NULL
        CONSTRAINT RPHOTO_RTNO_CK CHECK (rtno IN (10,20,30,40,50)),
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT RPHOTO_ISSHOW_NN NOT NULL
        CONSTRAINT RPHOTO_ISSHOW_CK CHECK (isshow IN ('Y','N'))
);
---20/12/29 update ( ���õ� �������� ���� ) 
-- (������ ����)

INSERT INTO
    rphoto
VALUES(
    10001,1,'������1.jpg','������1.jpg',200*100,'/img/area/',10,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10002,1,'������2.jpg','������2.jpg',200*100,'/img/area/',10,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10003, 2,'���ĵ�1.jpg','���ĵ�1.jpg',200*100,'/img/area/',10,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10004,2,'���ĵ�2.jpg','���ĵ�2.jpg',200*100,'/img/area/',10,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10005, 3,'�����.jpg','�����.jpg',200*100,'/img/area/',20,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10006,3,'�����2.jpg','�����2.jpg',200*100,'/img/area/',20,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10007,4,'��Ʒ�.jpg','��Ʒ�.jpg',200*100,'/img/area/',30,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10008,4,'��Ʒ�2.jpg','��Ʒ�2.jpg',200*100,'/img/area/',30,'Y'
);
INSERT INTO
    rphoto
VALUES(
    10009, 4,'��Ʒ�3.jpg','��Ʒ�3.jpg',200*100,'/img/area/',30,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10010, 4,'��Ʒ�4.jpg','��Ʒ�4.jpg',200*100,'/img/area/',30,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10011,5,'�Ѷ󱹼�1.jpg','�Ѷ󱹼�1.jpg',200*100,'/img/area/',30,'Y'
);
INSERT INTO
    rphoto
VALUES(
    10012,5,'�Ѷ󱹼�2.jpg','�Ѷ󱹼�2.jpg',200*100,'/img/area/',30,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10013,6,'��ġ��.jpg','��ġ��.jpg',200*100,'/img/area/',40,'Y'
);
INSERT INTO
    rphoto
VALUES(
    10014,6,'��ġ��2.jpg','��ġ��2.jpg',200*100,'/img/area/',40,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10015,7,'�ٳ����ǿ�.jpg','�ٳ����ǿ�.jpg',200*100,'/img/area/',40,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10016,7,'�ٳ����ǿ�2.jpg','�ٳ����ǿ�2.jpg',200*100,'/img/area/',40,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10017,8,'�������Ƿ�����޽�.jpg','�������Ƿ�����޽�.jpg',200*100,'/img/area/',50,'Y'
);
INSERT INTO
    rphoto
VALUES(
    10018,8,'�������Ƿ�����޽�2.jpg','�������Ƿ�����޽�2.jpg',200*100,'/img/area/',50,'Y'
);
commit;

----------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------
-- ( ## ���̺� ���� )
-- ���ϱ� ���� ���̺� ����
CREATE table favorite(
    fno NUMBER Constraint FAVOR_FNO_PK primary key
                    Constraint FAVOR_FNO_NN not null, 
    mno NUMBER constraint FAVOR_MNO_FK REFERENCES member(mno)
                CONSTRAINT FAVOR_MNO_NN not null, 
    ano NUMBER constraint FAVOR_ANO_FK references areainfo(ano)
                CONSTRAINT FAVOR_ANO_NN not null
);
-- ( ������ �߰� )
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

----------------------------------------------------------------------------------------------------------------------
-- ( ## ���̺� ���� )
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



---------------------------------------------------------------------------------


--( ## �߰��� ���� ���, ���� ���� 20/12/29 ## )
-- 1. �ٶ��� ����
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�ٶ�������','���� ���ֽ� ������ ��ȭ�� ��6','064-710-3314',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '5�� ���� ���� ö���� ��â~ �ʹ� �Ƹ��ٿ���!',
    12,'Y',33.47766056240119,126.82149939633217,200
);


INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 17, 1, '�ٶ���1.jpg', '�ٶ���1.jpg', 4512, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 17, 2, '�ٶ���2.jpg', '�ٶ���2.jpg', 4446, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 17, 3, '�ٶ���3.jpg', '�ٶ���3.jpg', 10489, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 17, 4, '�ٶ���4.jpg', '�ٶ���4.jpg', 1117, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 17, 5, '�ٶ���5.jpg', '�ٶ���5.jpg', 8109, '/img/area/', 10)
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'chan' ),
    '�ٶ��� ������ �ְ�', '�Ʒ��� �ٸ� ������ ũ�� �ٸ��� ����. ������ �� ������ �������� �˰� ����',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 4, 10, 'Y', 33.47766056240119,126.82149939633217
    )
;


INSERT INTO
    rphoto
VALUES(
    (SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),21,'�ٶ���1.jpg','�ٶ���1.jpg',4512,'/img/area/',10,'Y'
);


INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),21,'�ٶ���2.jpg', '�ٶ���2.jpg', 4446,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),21,'�ٶ���3.jpg', '�ٶ���3.jpg', 10489,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),21, '�ٶ���4.jpg', '�ٶ���4.jpg', 1117,'/img/area/',10,'Y')
;
INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),21, '�ٶ���5.jpg', '�ٶ���5.jpg', 8109,'/img/area/',10,'Y')
;


-- 2. ���ҿ�

INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'���ҿ�','����Ư����ġ�� �������� ǥ���� ������ 2350-104','010-7362-2345',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '����� ���� ��ö ���� �����ϴ� ���ҿ�~ ���� ��Ȳ�� �������� ������ ������ �� �ν�Ÿ�׷� Ȯ��!!!!!',
    17,'Y',33.413518672101084, 126.75246990595858,500
);



INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 18, 1, '���ҿ�1.jpg', '���ҿ�1.jpg', 4512, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 18, 2, '���ҿ�2.jpg', '���ҿ�2.jpg', 4446, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 18, 3, '���ҿ�3.jpg', '���ҿ�3.jpg', 10489, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 18, 4, '���ҿ�4.jpg', '���ҿ�4.jpg', 1117, '/img/area/', 10)
;


INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'jang' ),
    '���ҿ�', '������ �ߵǰ� �־ ���� �߾� �װ� ���׿�',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    '2016/06/02', 4, 10, 'Y', 33.413518672101084, 126.75246990595858
    )
;


INSERT INTO
    rphoto
VALUES(
    (SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),22,'���ҿ�1.jpg','���ҿ�1.jpg',4512,'/img/area/',10,'Y'
);


INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),22,'���ҿ�2.jpg', '���ҿ�2.jpg', 4446,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),22,'���ҿ�3.jpg', '���ҿ�3.jpg', 10489,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),22, '���ҿ�4.jpg', '���ҿ�4.jpg', 1117,'/img/area/',10,'Y')
;

-- 3. ���� �ؼ�����
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'���� �ؼ�����','���� ���ֽ� �Ѹ��� ���縮 2497-1','064-728-3981',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���� ���� �� ������ ���� ����ü',
    20,'Y',33.39443623044322, 126.238920408833 ,500
);


INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 19, 1, '����1.jpg', '����1.jpg', 4512, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 19, 2, '����2.jpg', '����2.jpg', 4446, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 19, 3, '����3.jpg', '����3.jpg', 10489, '/img/area/', 10)
;



INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'wook' ),
    '�ѵ��� ���̻��µ�', '�����̳׿� ���� Ǫ��',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 4, 10, 'Y', 33.39443623044322, 126.238920408833
    )
;

INSERT INTO
    rphoto
VALUES(
    (SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),23,'����1.jpg','����1.jpg',4512,'/img/area/',10,'Y'
);


INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),23,'����2.jpg', '����2.jpg', 4446,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),23,'����3.jpg', '����3.jpg', 10489,'/img/area/',10,'Y')
;

-- 4. ������Ʈ �߹���
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'������Ʈ �߹���','���� �������� ������ 172-5 ������Ʈ','064-739-3939',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���� ���� �� ���� �ֻ����� �ھձ��� ���ϴ�. ',
    36,'Y',33.23844303158662, 126.43946795662461 ,200
);

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 20, 1, '������Ʈ1.jpg', '������Ʈ1.jpg', 4512, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 20, 2, '������Ʈ2.jpg', '������Ʈ2.jpg', 4446, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 20, 3, '������Ʈ3.jpg', '������Ʈ3.jpg', 10489, '/img/area/', 10)
;



INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'joseph' ),
    '��~ �ĵ� ���� ĥ �� Ÿ�� ��Ʈ������ Ȯ Ǯ����', '��� �ֻ����� ������ ������',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    '18/08/13', 5, 10, 'Y', 33.23844303158662, 126.43946795662461
    )
;



INSERT INTO
    rphoto
VALUES(
    (SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),24,'������Ʈ1.jpg','������Ʈ1.jpg',4512,'/img/area/',10,'Y'
);


INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),24,'������Ʈ2.jpg', '������Ʈ2.jpg', 4446,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),24,'������Ʈ3.jpg', '������Ʈ3.jpg', 10489,'/img/area/',10,'Y')
;

-- 5. ��������
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'��������','���� ���ֽ� �ֿ��� ������ ��59-8',null,10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '�ϸ� ��� ��������',
    25,'Y',33.3661939343892, 126.35776781301949 ,300
);

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 21, 1, '����1.jpg', '����1.jpg', 4512, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 21, 2, '����2.jpg', '����2.jpg', 4446, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 21, 3, '����3.jpg', '����3.jpg', 10489, '/img/area/', 10)
;



INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'jang' ),
    '���ֵ� �������� ��� ��� ��濩��~', '������ �� ������!!',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    '18/10/31', 4, 20, 'Y', 33.3661939343892, 126.35776781301949 
    )
;


INSERT INTO
    rphoto
VALUES(
    (SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),25, '����1.jpg', '����1.jpg',4512,'/img/area/',10,'Y'
);


INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),25,'����2.jpg', '����2.jpg', 4446,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),25,'����3.jpg', '����3.jpg', 10489,'/img/area/',10,'Y')
;

-- 6. �Ʋ��ٶ�������
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�Ʋ��ٶ�������','����Ư����ġ�� ���ֽ� ������ ��ȭ�� 2593-1','064-740-6000',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���� ��� Ǯ�� �Ѱ���~',
    26,'Y',33.474563844166084,126.83137127811256 ,300
);


INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 22, 1, '�Ʋ��ٶ���1.jpg', '�Ʋ��ٶ���1.jpg', 4512, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 22, 2, '�Ʋ��ٶ���2.jpg', '�Ʋ��ٶ���2.jpg', 4446, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 22, 3, '�Ʋ��ٶ���3.jpg', '�Ʋ��ٶ���3.jpg', 10489, '/img/area/', 10)
;



INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'chan' ),
    '�Ʋ��ٶ���', '������ �ٶ����������� ���� �Ƹ��ٿ� �䰡~',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    '18/11/17', 3, 25, 'Y', 33.474563844166084,126.83137127811256 
    )
;


INSERT INTO
    rphoto
VALUES(
    (SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),26, '�Ʋ��ٶ���1.jpg', '�Ʋ��ٶ���1.jpg',4512,'/img/area/',10,'Y'
);


INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),26,'�Ʋ��ٶ���2.jpg', '�Ʋ��ٶ���2.jpg', 4446,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),26,'�Ʋ��ٶ���3.jpg', '�Ʋ��ٶ���3.jpg', 10489,'/img/area/',10,'Y')
;


-- 7. �Դ��ؼ�����
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�Դ��ؼ�����','���� ���ֽ� ��õ�� �����ؾȷ� 525','064-728-3989',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���� ���� ���� �ٴ�',
    80,'Y',33.543191566613494, 126.66930304036917 ,500
);


INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 23, 1, '�Դ�1.jpg', '�Դ�1.jpg', 4512, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 23, 2, '�Դ�2.jpg', '�Դ�2.jpg', 4446, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 23, 3, '�Դ�3.jpg', '�Դ�3.jpg', 10489, '/img/area/', 10)
;



INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'wook' ),
    '�Դ�', '�ֺ� ����� ��ä���� �Ǵ� 3~4���� ���� �Ƹ����, �ٴٴ� ������ �Ƹ���׿�. �ٴ� �տ� �ִ� ī�䵵 ����! �� ������',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    '15/03/30', 5, 65, 'Y', 33.543191566613494, 126.66930304036917
    )
;


INSERT INTO
    rphoto
VALUES(
    (SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),27, '�Դ�1.jpg', '�Դ�1.jpg',4512,'/img/area/',10,'Y'
);


INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),27,'�Դ�2.jpg', '�Դ�2.jpg', 4446,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),27,'�Դ�3.jpg', '�Դ�3.jpg', 10489,'/img/area/',10,'Y')
;



-- ���ֵ���ȭ����
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'���ֵ���ȭ����','����Ư����ġ�� ���ֽ� ��õ�� ������ 2023','064-710-7731',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���ֵ� ����ȭ�� ���� �����̼� �� ���~',
    80,'Y', 33.448461093309135, 126.6595100789778 ,500
);


INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 24, 1, '���ֵ���ȭ1.jpg', '���ֵ���ȭ1.jpg', 4512, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 24, 2, '���ֵ���ȭ2.jpg', '���ֵ���ȭ2.jpg', 4446, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 24, 3, '���ֵ���ȭ3.jpg', '���ֵ���ȭ3.jpg', 10489, '/img/area/', 10)
;



INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'joseph' ),
    '���ֵ���ȭ', '���ֵ��� ���� �� ������ ���! ���縦 �˰� �Ǿ� ����� �ð�!',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    '16/12/30', 4, 45, 'Y', 33.448461093309135, 126.6595100789778
    )
;

INSERT INTO
    rphoto
VALUES(
    (SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),28, '���ֵ���ȭ1.jpg', '���ֵ���ȭ1.jpg',4512,'/img/area/',10,'Y'
);


INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),28,'���ֵ���ȭ2.jpg', '���ֵ���ȭ2.jpg', 4446,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),28,'���ֵ���ȭ3.jpg', '���ֵ���ȭ3.jpg', 10489,'/img/area/',10,'Y')
;



-- 8. ��������
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'��������','���� �������� �����ڷ� 137',null,10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '������ �� ��װ� ��� ���� �ξ�~',
    86,'Y', 33.30030765167381, 126.5813365581649  ,200
);


INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 25, 1, '��������1.jpg', '��������1.jpg', 4512, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 25, 2, '��������2.jpg', '��������2.jpg', 4446, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 25, 3, '��������3.jpg', '��������3.jpg', 10489, '/img/area/', 10)
;



INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'joseph' ),
    '�������� �ٳ�Ծ�䤻��', '������ �� �ϰ� �ͳ׿�',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    '17/07/30', 5, 45, 'Y', 33.30030765167381, 126.5813365581649
    )
;


INSERT INTO
    rphoto
VALUES(
    (SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),29, '��������1.jpg', '��������1.jpg',4512,'/img/area/',10,'Y'
);


INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),29,'��������2.jpg', '��������2.jpg', 4446,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),29,'��������3.jpg', '��������3.jpg', 10489,'/img/area/',10,'Y')
;

-- 9. �޾ָ� ��������
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�޾ָ�','����Ư����ġ�� �������� ������ �ŷʵ��� 256','064-732-2114',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '�ܿ￣ ����� ������ ���� ������~',
    66,'Y', 33.309886252351156, 126.63531971906211 ,400
);


INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 26, 1, '�޾ָ�1.jpg', '�޾ָ�1.jpg', 4512, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 26, 2, '�޾ָ�2.jpg', '�޾ָ�2.jpg', 4446, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 26, 3, '�޾ָ�3.jpg', '�޾ָ�3.jpg', 10489, '/img/area/', 10)
;



INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'joseph' ),
    '�޾ָ� �ʹ� ���Ҿ��', '�ɵ� ���ڰ� ������ ������ ó���� �ʹ� ��Ѱ� �ƴѰ� ������ ü���Ŀ��� ���� �޶������ ��õ�����',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    '17/11/27', 4, 40, 'Y', 33.309886252351156, 126.63531971906211 
    )
;

INSERT INTO
    rphoto
VALUES(
    (SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),30, '�޾ָ�1.jpg', '�޾ָ�1.jpg',4512,'/img/area/',10,'Y'
);


INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),30,'�޾ָ�2.jpg', '�޾ָ�2.jpg', 4446,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),30,'�޾ָ�3.jpg', '�޾ָ�3.jpg', 10489,'/img/area/',10,'Y')
;



-- 10. �޴޹̱����ֹ� 
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�޴޹̱� ���ֹ�','�������� ������ �Ϸʷ� 361-20',null,10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '�ܿ￡ ���� ���� ���� ü���� ��� �� �ֽ��ϴ�. ',
    36,'Y', 33.27918799392964, 126.62022605857189 ,400
);


INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 27, 1, '�޴޹̱����ֹ�1.jpg', '�޴޹̱����ֹ�1.jpg', 4512, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 27, 2, '�޴޹̱����ֹ�2.jpg', '�޴޹̱����ֹ�2.jpg', 4446, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 27, 3, '�޴޹̱����ֹ�3.jpg', '�޴޹̱����ֹ�3.jpg', 10489, '/img/area/', 10)
;



INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'jang' ),
    '�޴޹̱����ֹ� �ʹ� ���Ҿ��', '�ɵ� ���ڰ� ������ ������ ó���� �ʹ� ��Ѱ� �ƴѰ� ������ ü���Ŀ��� ���� �޶������ ��õ�����',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    '17/12/20', 3, 45, 'Y', 33.27918799392964, 126.62022605857189 
    )
;

INSERT INTO
    rphoto
VALUES(
    (SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),31, '�޴޹̱����ֹ�1.jpg', '�޴޹̱����ֹ�1.jpg',4512,'/img/area/',10,'Y'
);


INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),31,'�޴޹̱����ֹ�2.jpg', '�޴޹̱����ֹ�2.jpg', 4446,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),31,'�޴޹̱����ֹ�3.jpg', '�޴޹̱����ֹ�3.jpg', 10489,'/img/area/',10,'Y')
;


--11. ���� ���� �����
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'���� ���� �����','���� �������� ������ ���̸� 927','064-764-4473',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���� ����� ǳ���� ���� ���� �� �ֽ��ϴ�~ ',
    36,'Y', 33.274942155704345, 126.67802489819697 ,400
);


INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 28, 1, '���ֵ�������1.jpg', '���ֵ�������1.jpg', 4512, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 28, 2, '���ֵ�������2.jpg', '���ֵ�������2.jpg', 4446, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 28, 3, '���ֵ�������3.jpg', '���ֵ�������3.jpg', 10489, '/img/area/', 10)
;



INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'jang' ),
    '����!!', '�Ʊ��ڱ��ϰ� ������~ �����鵵 ���ڰ� �� �����Ǿ��־��',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    '17/12/20', 5, 45, 'Y', 33.274942155704345, 126.67802489819697 
    )
;

select * from review;
INSERT INTO
    rphoto
VALUES(
    (SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),32, '���ֵ�������1.jpg', '���ֵ�������1.jpg',4512,'/img/area/',10,'Y'
);


INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),32,'���ֵ�������2.jpg', '���ֵ�������2.jpg', 4446,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),32,'���ֵ�������3.jpg', '���ֵ�������3.jpg', 10489,'/img/area/',10,'Y')
;

-- 12. �Ѷ�����
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�Ѷ�����','���� ���ֽ� ������� 72','064-710-7575',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���� �����Դϴ�~ ū ���װ����̶� �����ϸ� �˴ϴ�. ',
    36,'Y', 33.4315535357795, 126.59772424860601 ,500
);


INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 29, 1, '�Ѷ�����1.jpg', '�Ѷ�����1.jpg', 4512, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 29, 2, '�Ѷ�����2.jpg', '�Ѷ�����2.jpg', 4446, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 29, 3, '�Ѷ�����3.jpg', '�Ѷ�����3.jpg', 10489, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 29, 4, '�Ѷ�����4.jpg', '�Ѷ�����4.jpg', 10489, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 29, 5, '�Ѷ�����5.jpg', '�Ѷ�����5.jpg', 10489, '/img/area/', 10)
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'chan' ),
    '������ ���ɳ��� ��ö�� �� �ٳ�Դµ�', '�׶����� ������ ���ϱ� ������ �׷��� �����մϴ�~',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    '19/06/01', 4, 45, 'Y', 33.4315535357795, 126.59772424860601 
    )
;

INSERT INTO
    rphoto
VALUES(
    (SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),33, '�Ѷ�����1.jpg', '�Ѷ�����1.jpg',4512,'/img/area/',10,'Y'
);


INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),33,'�Ѷ�����2.jpg', '�Ѷ�����2.jpg', 4446,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),33,'�Ѷ�����3.jpg', '�Ѷ�����3.jpg', 10489,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),33,'�Ѷ�����4.jpg', '�Ѷ�����4.jpg', 10489,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),33,'�Ѷ�����5.jpg', '�Ѷ�����5.jpg', 10489,'/img/area/',10,'Y')
;


-- ���̿� ����
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'���̿� ����','����Ư����ġ�� ���ֽ� ��õ�� ����5�� 6','064-752-1507',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '��̿� ������ �Բ� �� �� �ִ� ��ġ ���� ��ȸ',
    36,'Y', 33.54801648757042, 126.6925909892653 ,200
);


INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 30, 1, '����1.jpg', '����1.jpg', 4512, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 30, 2, '����2.jpg', '����2.jpg', 4446, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 30, 3, '����3.jpg', '����3.jpg', 10489, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 30, 4, '����4.jpg', '����4.jpg', 10489, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES((SELECT NVL(MAX(pno)+1,10001) FROM aphoto), 30, 5, '����5.jpg', '����5.jpg', 10489, '/img/area/', 10)
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'wook' ),
    '���������� ���� ���� ���� ��ȭ�� ������ �ǳ׿�','���ϰ� ��ڽ��ϴ�',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    '19/06/01', 5, 45, 'Y', 33.54801648757042, 126.6925909892653
    )
;

INSERT INTO
    rphoto
VALUES(
    (SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),34, '����1.jpg', '����1.jpg',4512,'/img/area/',10,'Y'
);


INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),34,'����2.jpg', '����2.jpg', 4446,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),34,'����3.jpg', '����3.jpg', 10489,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),34,'����4.jpg', '����4.jpg', 10489,'/img/area/',10,'Y')
;

INSERT INTO rphoto
VALUES((SELECT (MAX(NVL(pno+1, 10001))) FROM rphoto ),34,'����5.jpg', '����5.jpg', 10489,'/img/area/',10,'Y')
;


commit;
