----------------------------------------------------------------------------------------------------------------------

-- **** 모든 테이블 drop하기 ****
drop table aphoto;
drop table areainfo;
drop table areatype;
drop table disease;
drop table favorite;
drop table grade;
drop table member;
drop table review;
drop table userlocation;
drop table userdisease;
drop table rphoto;
drop table seasontype;

----------------------------------------------------------------------------------------------------------------------





-- ( 계정 생성 ) system 계정 생성
CREATE USER sj identified by hello;
grant create session to sj;
grant create table to sj;
alter user sj default tablespace users quota unlimited on users;

----------------------------------------------------------------------------------------------------------------------

-- ( ## 테이블 생성 )
-- 회원정보테이블
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



-- ( 데이터 삽입 )
-- 회원정보테이블
INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'jang','장수진','12345','jang@increpas.com','010-1234-5677',sysdate,'F','Y','B','RH+','92/11/02','010-1234-5678'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'chan','오혜찬','12345','chan@increpas.com','010-1111-1111',sysdate,'M','Y','A','RH+','93/01/02','010-1111-1118'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'wook','유병욱','12345','wook@increpas.com','010-2222-2222',sysdate,'M','Y','O','RH+','92/08/02','010-2222-2228'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'joseph','윤요셉','12345','joseph@increpas.com','010-3333-3333',sysdate,'M','Y','O','RH+','88/07/02','010-3333-3338'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'jiwoo','이지우','12345','jiwoo@increpas.com','010-4444-4444',sysdate,'M','Y','A','RH+','95/05/12','010-4444-4448'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'jjang','장성환','12345','jjang@increpas.com','010-5555-5555',sysdate,'M','Y','AB','RH+','97/05/12','010-5555-5558'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'sun','권영선','12345','sun@increpas.com','010-6666-6666',sysdate,'F','Y','B','RH+','99/05/12','010-6666-6668'
);


INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'joo','김주영','12345','joo@increpas.com','010-7777-7777',sysdate,'F','Y','B','RH+','97/05/12','010-7777-7778'
);


INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'hong','홍길동','12345','hong@increpas.com','010-8888-8888',sysdate,'M','Y','AB','RH-','90/06/12','010-8888-8880'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'tess','테스형','12345','tess@increpas.com','010-9999-9999',sysdate,'M','Y','AB','RH-','30/06/12','010-9999-9990'
);


-- ( 테이블 컬럼 수정 )
-- 멤버 테이블 컬럼 정보 수정
ALTER TABLE MEMBER DROP CONSTRAINT MB_BLOOD1_CK;
ALTER TABLE MEMBER DROP CONSTRAINT MB_BLOOD2_CK;
ALTER TABLE MEMBER ADD CONSTRAINT MB_BLOOD1_CK CHECK (blood1 IN ('A','B','O','AB','¸ð¸§'));
ALTER TABLE MEMBER ADD CONSTRAINT MB_BLOOD2_CK CHECK (blood2 IN ('RH+','RH-','¸ð¸§'));

ALTER TABLE MEMBER DROP CONSTRAINT MB_SOS_NN;

ALTER TABLE MEMBER ADD rel VARCHAR2(5 CHAR);

ALTER TABLE MEMBER ADD addmsg VARCHAR2(50 CHAR) DEFAULT '없음';


----------------------------------------------------------------------------------------------------------------------

-- ( ## 테이블 생성 )
-- 회원등급테이블
CREATE TABLE grade(
    grade VARCHAR2 (6 CHAR)
        CONSTRAINT GRADE_GRADE_CK CHECK (grade IN ('FAMILY', 'GOLD', 'VIP', 'VVIP')),
    low NUMBER,
    high NUMBER
);

-- ( 데이터 삽입 )
-- FAMILY, GOLD, VIP, VVIP
INSERT INTO 
    grade
VALUES(
    'FAMILY',0,15
);

INSERT INTO 
    grade
VALUES(
    'GOLD',15,30
);

INSERT INTO 
    grade
VALUES(
    'VIP',30,60
);

INSERT INTO 
    grade
VALUES(
    'VVIP',60,100
);


----------------------------------------------------------------------------------------------------------------------

-- ( ## 테이블 생성 )
--회원위치테이블
CREATE TABLE userlocation(
    uno NUMBER(10) 
        CONSTRAINT ULOC_UNO_PK PRIMARY KEY,
    mno NUMBER(10) 
        CONSTRAINT ULOC_MNO_FK REFERENCES member(mno),
    ux NUMBER(10),
    uy NUMBER(10),
    uloc VARCHAR2(50 CHAR),
    utime DATE DEFAULT sysdate
);


-- ( 데이터 삽입 )
INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1001,6,8,'제주 제주시 516로 2596',sysdate
);
INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1002,7,9,'제주 서귀포시 성산읍 성산리 1',sysdate
);
INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1003,19,39,'제주 서귀포시 대정읍 가파리 600',sysdate
);
INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1004,1,9,'제주 서귀포시 대정읍 가파리',sysdate
);
INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1005,17,9,'제주 제주시 동문로 16',sysdate
);
INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1006,7,90,'제주 제주시 한림읍 협재리 2497-1',sysdate
);
INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1007,87,90,'제주 제주시 조천읍 조함해안로 525',sysdate
);
INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1008,74,80,'제주 제주시 조천읍 북촌5길 6',sysdate
);
INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1009,4,88,'제주시 구좌읍 세평항로 26',sysdate
);
INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1010,39,20,'제주 서귀포시 안덕면 창천리 564',sysdate
);

----------------------------------------------------------------------------------------------------------------------
-- ( ## 테이블 생성 )
--질병분류테이블
CREATE TABLE disease(
    dno NUMBER(10) 
        CONSTRAINT DISEASE_DNO_PK PRIMARY KEY,
    dname VARCHAR2(100)
        CONSTRAINT DISEASE_DNAME_NN NOT NULL
);

-- ( 데이터 삽입 )
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'식도염'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'위염'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'과민성 대장 증후군'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'간염'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'감기'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'폐렴'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'소화불량'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'공황장애'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'심근경색증'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'당뇨병'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'빈혈'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'치수염'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'알레르기'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'뇌출혈'
);
----------------------------------------------------------------------------------------------------------------------

-- ( ## 테이블 생성 )
-- 회원질병테이블
CREATE TABLE userdisease(
    mno NUMBER(10)
        CONSTRAINT UDISEASE_MNO_FK REFERENCES member(mno),
    dno NUMBER(10)
        CONSTRAINT UDISEASE_DNO_FK REFERENCES disease(dno)
);
-- ( 데이터 삽입 )
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

-- ( ## 테이블 생성 )
-- 장소유형테이블
CREATE TABLE areatype(
      atno NUMBER(2)
        CONSTRAINT ATYPE_ATNO_PK PRIMARY KEY
        CONSTRAINT ATYPE_ATNO_CK CHECK (atno IN (10,20,30,40,50)),
      atname VARCHAR2(2 CHAR)
        CONSTRAINT ATYPE_ATNAME_NN NOT NULL
        CONSTRAINT AYTPE_ATNAME_CK CHECK (atname IN ('관광','숙박','식당','병원','응급'))
);
-- ( 데이터 삽입 )
INSERT INTO    areatype
VALUES(    10,'관광');
INSERT INTO    areatype
VALUES(    20,'숙박');
INSERT INTO    areatype
VALUES(    30,'식당');
INSERT INTO    areatype
VALUES(    40,'병원');
INSERT INTO    areatype
VALUES(    50,'응급');

----------------------------------------------------------------------------------------------------------------------
-- ( ## 테이블 생성 )
-- 장소정보 테이블
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
-- ( 데이터 삽입 )
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'섭지코지','제주 서귀포시 성산읍 고성리','064-782-2810',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '3월말에 가면 유채꽃 일몰 풍경을 볼 수 있고, 뒤에 있는 계단을 오르면 푸른 바다가 있습니다.',
    0,'Y',10,18
);

INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'사라오름','제주 서귀포시 남원읍 신례리 산2-1',null,10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '10월 말 단풍 시즌에 찾아 오세요. 정상에서 웅장한 분위기를 느껴볼 수 있어요. ',
    58,'Y',1401,86
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'가파도','제주 서귀포시 대정읍 가파리','064-794-7130',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '5월에 있는 가파도 청보리 축제에 꼭 가보세요. 청보리가 넘실넘실~',
    8,'Y',101,8
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'송악산','제주 서귀포시 대정읍 송악관광로 421-1','064-120',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '4월초 비오기 전날 파도가 세게 칠 때 가면 속이 뻥 뚫려요! 둘레길 소요시간은 2시간 정도 됩니다. ',
    10,'Y',11,80
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'제이힐호텔','제주 서귀포시 천제연로188번길 11','064-805-7600',20,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '저렴한 가격에 숙소를 이용하고 싶으시다면 강추합니다!',
    19,'Y',11,9
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'유탑유블레스호텔제주','제주시 조천읍 조함해안로 502','0507-1425-9307',20,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '함덕해수욕장 일몰을 보고 싶다면 이곳으로~ 운전면허증이 있는 경우 전동 킥보드도 사용 가능합니다.',
    4,'Y',1021,84
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'더쇼어호텔','제주 서귀포시 중문관광로72번길 114',null,20,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '숙소 안에서 아름다운 오션뷰를 볼 수 있는 호텔, 가볍게 산책하기도 너무 좋아요. ',
    8,'Y',1401,48
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'성산옥탑','제주 서귀포시 성산읍 일출로 270-8 2층','064-782-5050',30,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '성산일출봉을 닮은 돈까스를 보고 싶으시다면 찾아오세요~ 맛도 덤으로 드립니다!',
    80,'Y',141,7
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'담아래 서귀포점','제주 제주시 수목원길 23 1층','0507-1310-5917',30,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '간장딱새우밥, 한라버섯밥, 꿀꿀김치밥, 뿔소라 톳밥 팔아요. 숨겨진 맛집@_@',
    10,'Y',181,35
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'제주한라국수','제주 서귀포시 천제연로188번길 17','064-738-6392',30,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '맛있는 녀석들도 먹은 < 제주 고기 국수 >, 쭈꾸미가 들어간 빨간 열밥 최고의 조합',
    17,'Y',1401,85
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'닥터양내과','제주 제주시 관덕로 18','064-752-3312',40,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '친절하게 응대해드립니다. ',
    2,'Y',1031,845
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'선치과의원','제주 서귀포시 천제연로 194(중문동)','064-738-2811',40,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '여행 중 치통으로 힘드시다면 이곳으로 오세요~',
    4,'Y',1201,82
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'다나한의원','제주 제주시 중앙로 77 2층(이도1동)','064-721-0050',40,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '다나한의원 가족을 돌보듯 최선을 다하겠습니다.',
    7,'Y',11,49
);  
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'제주한라병원 응급실','제주 제주시 도령로 65 한라병원','064-740-5158',50,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '24시간 운영합니다. ',
    47,'Y',131,479
);      
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'서귀포의료원 응급실','제주 서귀포시 동홍동 1530','064-730-3001',50,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '빠른 조치를 취해드리겠습니다. ',
    8,'Y',108,490
);      
INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'제주대학교병원 응급실','제주 제주시 아란13길 15','064-717-1900',50,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '제주대학교 주변 응급실입니다. ',
    48,'Y',100,433
);      

----------------------------------------------------------------------------------------------------------------------
-- ( ## 테이블 생성 )
-- 장소사진테이블 ( 기본키 pno 추가, 같은 장소에 대해 여러개의 사진 중 첫번째 사진만 보여줄 subpno 추가 )
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
   
-- ( 데이터 삽입 )
INSERT INTO aphoto
VALUES(1, 4, 1, 'test02.jpg', '송악산3.jpg', 20000, '/img/area/', 10);
INSERT INTO aphoto
VALUES(2, 5, 1, 'test20.jpg', '제이힐.jpg', 20000, '/img/area/', 20);
INSERT INTO aphoto
VALUES(3, 6, 1, 'test19.jpg', '사진.jpg', 20000, '/img/area/', 20);
INSERT INTO aphoto
VALUES(4, 7, 1, 'test18.jpg', '사진2.jpg', 20000, '/img/area/', 20);
INSERT INTO aphoto
VALUES(5, 8, 1, 'test17.jpg', '사진3.jpg', 20000, '/img/area/', 30);
INSERT INTO aphoto
VALUES(6, 9, 1, 'test16.jpg', '사진1.jpg', 20000, '/img/area/', 30);
INSERT INTO aphoto
VALUES(7, 9, 1, 'test17.jpg', '사진1.jpg', 20000, '/img/area/', 30);
INSERT INTO aphoto
VALUES(8, 9, 1, 'test18.jpg', '사진1.jpg', 20000, '/img/area/', 30);
INSERT INTO aphoto
VALUES(9, 9, 1, 'test19.jpg', '사진1.jpg', 20000, '/img/area/', 30);

INSERT INTO aphoto
VALUES(10, 11, 1, 'test01.jpg', '사진2.jpg', 20000, '/img/area/', 40);
INSERT INTO aphoto
VALUES(11, 12, 1, 'test02.jpg', '사진3.jpg', 20000, '/img/area/', 40);
INSERT INTO aphoto
VALUES(12, 12, 1, 'test07.jpg', '사진3.jpg', 20000, '/img/area/', 40);
INSERT INTO aphoto
VALUES(13, 13, 1, 'test03.jpg', '사진4.jpg', 20000, '/img/area/', 40);
INSERT INTO aphoto
VALUES(14, 14, 1, 'test04.jpg', '사진53.jpg', 20000, '/img/area/', 50);
INSERT INTO aphoto
VALUES(15, 15, 1, 'test05.jpg', '사진6.jpg', 20000, '/img/area/', 50);
INSERT INTO aphoto
VALUES(16, 15, 1, 'test06.jpg', '사진7.jpg', 20000, '/img/area/', 50);
INSERT INTO aphoto
VALUES(17, 15, 1, 'test07.jpg', '사진8.jpg', 20000, '/img/area/', 50);

INSERT INTO 
aphoto
VALUES(
18, 1, 1, 'test01.jpg','섭지코지1.jpg',200 * 100,'/img/area/',10);
INSERT INTO 
aphoto
VALUES(
19, 1, 1, 'test02.jpg','섭지코지2.jpg',200 * 100,'/img/area/',10);
INSERT INTO 
aphoto
VALUES(
20, 2, 1, 'test03.jpg','사라오름1.jpg',200 * 100,'/img/area/',10);
INSERT INTO 
aphoto
VALUES(
21, 2, 1, 'test04.jpg','사라오름2.jpg',200 * 100,'/img/area/',10);
INSERT INTO 
aphoto
VALUES(
22, 3, 1, 'test05.jpg','가파도1.jpg',200 * 100,'/img/area/',10);
INSERT INTO 
aphoto
VALUES(
23, 3, 1, 'test06.jpg','가파도4.jpg',200 * 100,'/img/area/',10);
INSERT INTO 
aphoto
VALUES(
24, 4, 1, 'test07.jpg','송악산1.jpg',200 * 100,'/img/area/',10);
INSERT INTO 
aphoto
VALUES(
25, 4, 1, 'test08.jpg','송악산2.jpg',200 * 100,'/img/area/',10);
INSERT INTO 
aphoto
VALUES(
26, 5, 1, 'test09.jpg','제이힐호텔.jpg',200 * 100,'/img/area/',20);
INSERT INTO 
aphoto
VALUES(
27, 6, 1, 'test10.jpg','유탑유블레스호텔.jpg',200 * 100,'/img/area/',20);
INSERT INTO 
aphoto
VALUES(
28, 7, 1, 'test11.jpg','더쇼어호텔.jpg',200 * 100,'/img/area/',20);
INSERT INTO 
aphoto
VALUES(
29, 8, 1, 'test12.jpg','성산옥탑.jpg',200 * 100,'/img/area/', 30);
INSERT INTO 
aphoto
VALUES(
30, 9, 1, 'test13.jpg','담아래 서귀포점.jpg',200 * 100,'/img/area/', 30);
INSERT INTO 
aphoto
VALUES(
31, 10, 1, 'test14.jpg','제주한라국수1.jpg',200 * 100,'/img/area/', 30);
INSERT INTO 
aphoto
VALUES(
32, 10, 1, 'test15.jpg','제주한라국수2.jpg',200 * 100,'/img/area/', 30);
INSERT INTO 
aphoto
VALUES(
33, 11, 1, 'test16.jpg','닥터양내과.jpg',200 * 100,'/img/area/',40);
INSERT INTO 
aphoto
VALUES(
34, 12, 1, 'test17.jpg','선치과의원.jpg',200 * 100,'/img/area/', 40);
INSERT INTO 
aphoto
VALUES(
35, 13, 1, 'test18.jpg','다나한의원.jpg',200 * 100,'/img/area/', 40);
INSERT INTO 
aphoto
VALUES(
36, 14, 1, 'test19.jpg','제주한라병원 응급실.jpg',200 * 100,'/img/area/', 50);
INSERT INTO 
aphoto
VALUES(
37, 15, 1, 'test20.jpg','서귀포의료원 응급실.jpg',200 * 100,'/img/area/', 50);
INSERT INTO 
aphoto
VALUES(
38, 16, 1, 'test01.jpg','제주대학교병원 응급실.jpg',200 * 100,'/img/area/', 50);

----------------------------------------------------------------------------------------------------------------------
--( 데이터 수정 )
--소수점 입력을 위해 NUMBER(10) -> NUMBER로 수정한다
ALTER TABLE userlocation
MODIFY uy NUMBER;

ALTER TABLE userlocation
MODIFY ux NUMBER;


ALTER TABLE areainfo
MODIFY ay NUMBER;

ALTER TABLE areainfo
MODIFY ax NUMBER;

-- 지도에 표시하기 위해 좌표값 x, y를 수정한다
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
SET ax=33.47555396363046, ay= 126.41899092409558
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


----------------------------------------------------------------------------------------------------------------------
-- ( ## 테이블 생성 )
-- 리뷰정보테이블

create table review (
    rno NUMBER(10) -- 글번호
        CONSTRAINT REVIEW_RNO_PK PRIMARY KEY,
    mno NUMBER(10) -- 회원번호
        CONSTRAINT REVIEW_MNO_FK REFERENCES member(mno)
        CONSTRAINT REVIEW_MNO_NN NOT NULL,
    rtitle VARCHAR2(50 CHAR)
        CONSTRAINT REVIEW_TITLE_NN NOT NULL,   -- 글 제목
    rbody VARCHAR2(500 CHAR)
        CONSTRAINT REVIEW_BODY_NN NOT NULL, -- 글 내용
    rpno NUMBER(10)
        CONSTRAINT REVIEW_RPNO_UK UNIQUE
        CONSTRAINT REVIEW_RPNO_NN NOT NULL, -- 업로드 사진
    rdate DATE  DEFAULT sysdate
        CONSTRAINT REVIEW_RDATE_NN NOT NULL,
    rgrade NUMBER
        CONSTRAINT REVIEW_GRADE_NN NOT NULL
        CONSTRAINT REVIEW_GRADE_CK CHECK ( rgrade IN (0, 0.5 , 1 , 1.5 , 2 , 2.5 , 3 , 3.5 , 4 , 4.5 , 5)), -- 장소 평점
    rhit NUMBER(10) DEFAULT 0
        CONSTRAINT REVIEW_HIT_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT REVIEW_ISSHOW_NN NOT NULL,
    rx NUMBER
        CONSTRAINT REVIEW_RX_NN NOT NULL,
    ry NUMBER
        CONSTRAINT REVIEW_RY_NN NOT NULL
);

-- ( 데이터 삽입 )
INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1002,'사라 오름 다녀왔어요~','오름이 아니라 사라산 같아요. 그러나 너무 아름다워서 힘든 것도 잊었답니다.',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2020/10/31',5,50,'Y',33.375636521547264,126.5685862198309
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1003,'청보리가 춤을 주네요','청보리, 유채꽃, 파도의 조화 최고!!',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2020/10/31',5,30,'Y' , 33.1727671789905 ,  126.27293207589577
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1007,'더쇼어호텔 다녀왔어요~','뷰는 정말 좋은데 좀 비싸네요.. 그래도 좋은 추억이 되어 행복합니다. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2020/08/01',4,20,'Y', 33.24462498540053, 126.40604683881358
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1009,'인생맛집 담아래 서귀포점','비린것을 싫어하는데 간장딱새우밥 흡입했네요. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2019/05/01',5,65,'Y', 33.23574587023389, 126.36351258114277
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1010,'TV에 나온 맛집을 가다니','집에 돌아오는 길에 생각나는 열밥, 또먹고 싶네요 ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2018/07/01',4.5,34,'Y' , 33.250525250847936, 126.42445768114317
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1001,'여행 중 치과 후기','여행을 갔는데 치아가 너무 아파서 치과 다녀왔어요. 
    덕분에 이젠 나아졌어요 ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2017/07/01',3.5,25,'Y', 33.251745497098426, 126.42565332716656
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1002,'한의원을 다녀왔습니다. ','직원이 불친절해서 다음에는 가고 싶지 않습니다. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2018/06/11',3,15,'Y' , 33.518037668945176, 126.52284210749815
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1004,'죽다 살아났어요 ','밤에 급하게 체하는 바람에 
    잠을 자지 못하다가 응급실을 다녀왔습니다. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2019/11/11',4,53,'Y', 33.255174417839335, 126.56479441182559
);


----------------------------------------------------------------------------------------------------------------------
-- ( ## 테이블 생성 )
-- 리뷰사진테이블 + isshow, pno 추가
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
    rpdir VARCHAR2(100 CHAR) DEFAULT '/img/review'
        CONSTRAINT RPHOTO_DIR_NN NOT NULL,
    rtno NUMBER(10)
        CONSTRAINT RPHOTO_RTNO_FK REFERENCES areatype(atno)
        CONSTRAINT RPHOTO_RTNO_NN NOT NULL
        CONSTRAINT RPHOTO_RTNO_CK CHECK (rtno IN (10,20,30,40,50)),
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT RPHOTO_ISSHOW_NN NOT NULL
        CONSTRAINT RPHOTO_ISSHOW_CK CHECK (isshow IN ('Y','N'))
);

-- (데이터 삽입)
INSERT INTO
    rphoto
VALUES(
    10001,1,'noimage.jpg','사라오름1.jpg',200*100,'/img/review/',10,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10002,1,'test01.jpg','사라오름3.jpg',200*100,'/img/review/',10,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10003, 2,'test02.jpg','가파도3.jpg',200*100,'/img/review/',10,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10004,2,'test03.jpg','가파도4.jpg',200*100,'/img/review/',10,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10005, 3,'test04.jpg','더쇼어호텔.jpg',200*100,'/img/review/',20,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10006,3,'test10.jpg','더쇼어호텔.jpg',200*100,'/img/review/',20,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10007,4,'test05.jpg','담아래서귀포점2.jpg',200*100,'/img/review/',30,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10008,4,'test11.jpg','담아래서귀포점2.jpg',200*100,'/img/review/',30,'Y'
);
INSERT INTO
    rphoto
VALUES(
    10009, 4,'test12.jpg','담아래서귀포점2.jpg',200*100,'/img/review/',30,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10010, 4,'test13.jpg','담아래서귀포점2.jpg',200*100,'/img/review/',30,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10011,5,'test06.jpg','한라국수2.jpg',200*100,'/img/review/',30,'Y'
);
INSERT INTO
    rphoto
VALUES(
    10012,5,'test12.jpg','한라국수2.jpg',200*100,'/img/review/',30,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10013,6,'test07.jpg','치과후기.jpg',200*100,'/img/review/',40,'Y'
);
INSERT INTO
    rphoto
VALUES(
    10014,6,'test13.jpg','치과후기.jpg',200*100,'/img/review/',40,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10015,7,'test08.jpg','한의원.jpg',200*100,'/img/review/',40,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10016,7,'test14.jpg','한의원.jpg',200*100,'/img/review/',40,'Y'
);

INSERT INTO
    rphoto
VALUES(
    10017,8,'test09.jpg','noimage.jpg',200*100,'/img/review/',50,'Y'
);
INSERT INTO
    rphoto
VALUES(
    10018,8,'test15.jpg','noimage.jpg',200*100,'/img/review/',50,'Y'
);

----------------------------------------------------------------------------------------------------------------------

-- ( 사진 업데이트 )
--APHOTO 사진 업데이트

UPDATE aphoto
SET aponame='test01.jpg'
WHERE apsname='섭지코지1.jpg';

UPDATE aphoto
SET aponame='test02.jpg'
WHERE apsname='섭지코지2.jpg';

UPDATE aphoto
SET aponame='test03.jpg'
WHERE apsname='사라오름1.jpg';

UPDATE aphoto
SET aponame='test04.jpg'
WHERE apsname='사라오름2.jpg';

UPDATE aphoto
SET aponame='test05.jpg'
WHERE apsname='가파도1.jpg';

UPDATE aphoto
SET aponame='test06.jpg'
WHERE apsname='가파도4.jpg';

UPDATE aphoto
SET aponame='test07.jpg'
WHERE apsname='송악산1.jpg';

UPDATE aphoto
SET aponame='test08.jpg'
WHERE apsname='송악산2.jpg';

UPDATE aphoto
SET aponame='test09.jpg'
WHERE apsname='제이힐호텔.jpg';


UPDATE aphoto
SET aponame='test10.jpg'
WHERE apsname='유탑유블레스호텔.jpg';

UPDATE aphoto
SET aponame='test11.jpg'
WHERE apsname='더쇼어호텔.jpg';

UPDATE aphoto
SET aponame='test12.jpg'
WHERE apsname='성산옥탑.jpg';

UPDATE aphoto
SET aponame='test13.jpg'
WHERE apsname='담아래 서귀포점.jpg';

UPDATE aphoto
SET aponame='test14.jpg'
WHERE apsname='제주한라국수1.jpg';

UPDATE aphoto
SET aponame='test15.jpg'
WHERE apsname='제주한라국수2.jpg';

UPDATE aphoto
SET aponame='test16.jpg'
WHERE apsname='닥터양내과.jpg';

UPDATE aphoto
SET aponame='test17.jpg'
WHERE apsname='선치과의원.jpg';

UPDATE aphoto
SET aponame='test18.jpg'
WHERE apsname='다나한의원.jpg';

UPDATE aphoto
SET aponame='test19.jpg'
WHERE apsname='제주한라병원 응급실.jpg';

UPDATE aphoto
SET aponame='test20.jpg'
WHERE apsname='서귀포의료원 응급실.jpg';

UPDATE aphoto
SET aponame='test01.jpg'
WHERE apsname='제주대학교병원 응급실.jpg';

----------------------------------------------------------------------------------------------------------------------
-- (사진 추가 삽입)
INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(4, 'test02.jpg', '송악산3.jpg', 20000, '/img/area/','10', 10001)
;

INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(5, 'test20.jpg', '제이힐.jpg', 20000, '/img/area/','20', 10002)
;

INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(6, 'test19.jpg', '사진.jpg', 20000, '/img/area/','20', 10003)
;

INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(7, 'test18.jpg', '사진2.jpg', 20000, '/img/area/','20', 10004)
;

INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(8, 'test17.jpg', '사진3.jpg', 20000, '/img/area/','30', 10005)
;

INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(9, 'test16.jpg', '사진1.jpg', 20000, '/img/area/','30', 10006)
;
INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(9, 'test17.jpg', '사진1.jpg', 20000, '/img/area/','30', 10007)
;
INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(9, 'test18.jpg', '사진1.jpg', 20000, '/img/area/','30', 10008)
;
INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(9, 'test19.jpg', '사진1.jpg', 20000, '/img/area/','30', 10009)
;
INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(11, 'test01.jpg', '사진2.jpg', 20000, '/img/area/','40', 10010)
;
INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(12, 'test02.jpg', '사진3.jpg', 20000, '/img/area/','40', 10011)
;
INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(12, 'test07.jpg', '사진3.jpg', 20000, '/img/area/','40', 10012)
;
INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(13, 'test03.jpg', '사진4.jpg', 20000, '/img/area/','40', 10013)
;
INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(14, 'test04.jpg', '사진53.jpg', 20000, '/img/area/','50', 10014)
;
INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(15, 'test05.jpg', '사진6.jpg', 20000, '/img/area/','50', 10015)
;
INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(15, 'test06.jpg', '사진7.jpg', 20000, '/img/area/','50', 10016)
;
INSERT INTO aphoto(apno, aponame, apsname, apsize, apdir, atno, pno)
VALUES(15, 'test07.jpg', '사진8.jpg', 20000, '/img/area/','50', 10017)
;

----------------------------------------------------------------------------------------------------------------------
-- ( 리뷰 추가 삽입 )
INSERT INTO review
VALUES(
    9, 1004, '담아래 굿', '가족이랑 제주도 놀러간 김에 먹고 왔는데 맛 좋더라. 가성비도 괜찮고. 운전해야해서 소주는 안 마셨는데 차 없었으면 집에 안 들어갔다;;',
    9, sysdate, 4, 15, 'Y', 33.23574587023389,126.36351258114277
);

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'jang' ),
    'JEJU~ 한라국슈', '제주 놀러 갔다가 국수 먹고 싶어서 다녀왔는데
    킹 갓 가성비 맛 굿굿 님들도 꼭 다녀와보세요. 3명이서 두 그릇 시켜서 배터지게 먹음
    근데 배가 빨리 꺼진다는 게 함ㅋ정ㅋ',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 5, 0, 'Y', 33.250525250847936, 126.42445768114317
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'chan' ),
    '집 앞 내과임', '아침에 배 아파서 가까운 곳 찾다가 다녀옴 그냥저냥 내과임',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 3, 0, 'Y', 33.51307971275873, 126.52142654066962
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'wook' ),
    '여기 잘해줌', '아 다른데 가서 이 충치 4개있다고 무슨 크라운 해야된다는 거 아님?
    개 비싸서 인사하고 나와서 앞에 치과 또 있길래 갔는데 한 개만 레진치료하고 옴 ㅋ',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 4, 0, 'Y', 33.251745497098426, 126.42565332716656
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'joseph' ),
    '약 지으러 다녀왔어요', '보약 지어먹었어요.. 효과는 잘 모르겠어요 ㅠㅠ',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 2, 0, 'Y', 33.518037668945176, 126.52284210749815
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'jiwoo' ),
    '으...', '사고 나서 죽을뻔함.. 응급실 실려왔는데 의사쌤이랑 간호사쌤이 친절히 대해줌',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 4, 0, 'Y', 33.49019207658534, 126.48501679464566
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'jjang' ),
    '단풍이 지는 이 가을...', '아니 한라산 등반하러 갔다가 여기 다녀왔는데 개쩐다
    한라산도 좋지만 송악산 개쩜',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 4, 0, 'Y', 33.199804357744014, 126.29243666800144
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'sun' ),
    '제대에 이런곳이?', '제대에도 병원있음 응급한 경우 있으면 일루오셈',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 3, 0, 'Y', 33.46714133094259, 126.5457129811507
    )
;
INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'sun' ),
    '섭지섭지코지', '섭지코지 유명하다 그래서 데이트 겸 다녀왔는데 뭐 그냥 관광지더라',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 3, 0, 'Y', 33.42437961506556, 126.93110026765497
    )
;
INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'sun' ),
    '옥탑', '잘 묵고 갑니다~~ 옥탑뷰가 유명하다던데 저는 비 와서 그냥 실내에 있었어요ㅠㅠ',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 3, 0, 'Y', 33.46164828897533, 126.9346003676563
    )
;
INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'sun' ),
    '유탑유블레스', '잘 묵고 갑니다~~ 가격대비 무난',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 3, 0, 'Y', 33.54252580986714, 126.66618655416492
    )
;
INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'chan' ),
    'jh호텔', '공항이랑 가까워서 좋네요~ 다음에도 묵을 의향 잇음',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 4, 0, 'Y', 33.47555396363046, 126.41899092409558
    )
;

----------------------------------------------------------------------------------------------------------------------
-- ( ## 테이블 생성 )
-- 찜하기 관련 테이블 생성
CREATE table favorite(
    fno NUMBER Constraint FAVOR_FNO_PK primary key
                    Constraint FAVOR_FNO_NN not null, 
    mno NUMBER constraint FAVOR_MNO_FK REFERENCES member(mno)
                CONSTRAINT FAVOR_MNO_NN not null, 
    ano NUMBER constraint FAVOR_ANO_FK references areainfo(ano)
                CONSTRAINT FAVOR_ANO_NN not null
);
-- ( 데이터 추가 )
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
-- ( ## 테이블 생성 )
-- 여행지 추천시 계절을 구분할 수 있는 SEASONTYPE 생성 (디폴트 값 : 계절 무관)

CREATE TABLE seasontype(
    stno NUMBER(3) 
        CONSTRAINT SEASON_STNO_PK PRIMARY KEY
        CONSTRAINT SEASON_STNO_CK CHECK ( stno IN (100,200,300,400,500)),
    stname VARCHAR2(12)
        CONSTRAINT SEASON_STNAME_NN NOT NULL
        CONSTRAINT SEASON_STNAME_CK CHECK ( stname IN ('봄','여름','가을','겨울','계절무관')) 
);

INSERT INTO
    seasontype
VALUES(
    100,'봄'
);
INSERT INTO
    seasontype
VALUES(
    200,'여름'
);

INSERT INTO
    seasontype
VALUES(
    300,'가을'
);

INSERT INTO
    seasontype
VALUES(
    400,'겨울'
);


INSERT INTO
    seasontype
VALUES(
    500,'계절무관'
);

-- areainfo 테이블에서 계절 구분값 stno 생성
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