-- system 계정 (sj > 원하는 계정으로 변경)
CREATE USER sj identified by hello;
grant create session to sj;
grant create table to sj;
alter user sj default tablespace users quota unlimited on users;


-- 사용자 계정 sj 
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

SELECT * FROM member;

-- 회원등급테이블
CREATE TABLE grade(
    grade VARCHAR2 (6 CHAR)
        CONSTRAINT GRADE_GRADE_CK CHECK (grade IN ('FAMILY', 'GOLD', 'VIP', 'VVIP')),
    low NUMBER,
    high NUMBER
);


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

SELECT * FROM grade;

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

SELECT  * FROM userlocation;


--질병분류테이블
CREATE TABLE disease(
    dno NUMBER(10) 
        CONSTRAINT DISEASE_DNO_PK PRIMARY KEY,
    dname VARCHAR2(100)
        CONSTRAINT DISEASE_DNAME_NN NOT NULL
);

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

SELECT * FROM disease;

-- 회원질병테이블
CREATE TABLE userdisease(
    mno NUMBER(10)
        CONSTRAINT UDISEASE_MNO_FK REFERENCES member(mno),
    dno NUMBER(10)
        CONSTRAINT UDISEASE_DNO_FK REFERENCES disease(dno)
);

INSERT INTO 
    userdisease
VALUES(
    1001,1
);

INSERT INTO 
    userdisease
VALUES(
    1002,2
);

INSERT INTO 
    userdisease
VALUES(
    1003,3
);

INSERT INTO 
    userdisease
VALUES(
    1004,4
);

INSERT INTO 
    userdisease
VALUES(
    1005,5
);

INSERT INTO 
    userdisease
VALUES(
    1006,6
);


INSERT INTO 
    userdisease
VALUES(
    1007,7
);

INSERT INTO 
    userdisease
VALUES(
    1008,8
);

INSERT INTO 
    userdisease
VALUES(
    1009,9
);

INSERT INTO 
    userdisease
VALUES(
    1010,10
);

SELECT * FROM userdisease;




-- 장소유형테이블
CREATE TABLE areatype(
      atno NUMBER(2)
        CONSTRAINT ATYPE_ATNO_PK PRIMARY KEY
        CONSTRAINT ATYPE_ATNO_CK CHECK (atno IN (10,20,30,40,50)),
      atname VARCHAR2(2 CHAR)
        CONSTRAINT ATYPE_ATNAME_NN NOT NULL
        CONSTRAINT AYTPE_ATNAME_CK CHECK (atname IN ('관광','숙박','식당','병원','응급'))
);

INSERT INTO
    areatype
VALUES(
    10,'관광'
);


INSERT INTO
    areatype
VALUES(
    20,'숙박'
);
INSERT INTO
    areatype
VALUES(
    30,'식당'
);
INSERT INTO
    areatype
VALUES(
    40,'병원'
);
INSERT INTO
    areatype
VALUES(
    50,'응급'
);



SELECT * FROM AREATYPE;
-- 장소정보테이블
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

SELECT * FROM areainfo;


-- 장소사진테이블
CREATE TABLE aphoto(
    apno NUMBER(10)
        CONSTRAINT APHOTO_APNO_FK REFERENCES areainfo(apno)
        CONSTRAINT APHOTO_APNO_NN NOT NULL,
    aponame VARCHAR2(100 CHAR)  DEFAULT 'noimage.jpg'
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
   

INSERT INTO 
    aphoto
VALUES(
    1,'noimage.jpg','섭지코지1.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
    aphoto
VALUES(
    1,'noimage.jpg','섭지코지2.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
    aphoto
VALUES(
    2,'noimage.jpg','사라오름1.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
    aphoto
VALUES(
    2,'noimage.jpg','사라오름2.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
    aphoto
VALUES(
    3,'noimage.jpg','가파도1.jpg',200 * 100,'/img/area/',10
);


INSERT INTO 
    aphoto
VALUES(
    3,'noimage.jpg','가파도4.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
    aphoto
VALUES(
    4,'noimage.jpg','송악산1.jpg',200 * 100,'/img/area/',10
);


INSERT INTO 
    aphoto
VALUES(
    4,'noimage.jpg','송악산2.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
    aphoto
VALUES(
    5,'noimage.jpg','제이힐호텔.jpg',200 * 100,'/img/area/',20
);


INSERT INTO 
    aphoto
VALUES(
    6,'noimage.jpg','유탑유블레스호텔.jpg',200 * 100,'/img/area/',20
);


INSERT INTO 
    aphoto
VALUES(
    7,'noimage.jpg','더쇼어호텔.jpg',200 * 100,'/img/area/',20
);


INSERT INTO 
    aphoto
VALUES(
    8,'noimage.jpg','성산옥탑.jpg',200 * 100,'/img/area/',30
);

INSERT INTO 
    aphoto
VALUES(
    9,'noimage.jpg','담아래 서귀포점.jpg',200 * 100,'/img/area/',30
);
INSERT INTO 
    aphoto
VALUES(
    10,'noimage.jpg','제주한라국수1.jpg',200 * 100,'/img/area/',30
);

INSERT INTO 
    aphoto
VALUES(
    10,'noimage.jpg','제주한라국수2.jpg',200 * 100,'/img/area/',30
);



INSERT INTO 
    aphoto
VALUES(
    11,'noimage.jpg','닥터양내과.jpg',200 * 100,'/img/area/',40
);



INSERT INTO 
    aphoto
VALUES(
    12,'noimage.jpg','선치과의원.jpg',200 * 100,'/img/area/',40
);



INSERT INTO 
    aphoto
VALUES(
    13,'noimage.jpg','다나한의원.jpg',200 * 100,'/img/area/',40
);



INSERT INTO 
    aphoto
VALUES(
    14,'noimage.jpg','제주한라병원 응급실.jpg',200 * 100,'/img/area/',50
);


INSERT INTO 
    aphoto
VALUES(
    15,'noimage.jpg','서귀포의료원 응급실.jpg',200 * 100,'/img/area/',50
);


INSERT INTO 
    aphoto
VALUES(
    16,'noimage.jpg','제주대학교병원 응급실.jpg',200 * 100,'/img/area/',50
);

SELECT * FROM aphoto;

-- 리뷰정보테이블

create table review (
    rno NUMBER(10) -- 글번호
        CONSTRAINT REVIEW_RNO_PK PRIMARY KEY,
    ano NUMBER(10) -- 장소번호
        CONSTRAINT REVIEW_ANO_FK REFERENCES areainfo(ano)
        CONSTRAINT REVIEW_ANO_NN NOT NULL,
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
        CONSTRAINT REVIEW_ISSHOW_NN NOT NULL
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),2,'사라 오름 다녀왔어요~','오름이 아니라 사라산 같아요. 그러나 너무 아름다워서 힘든 것도 잊었답니다.',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2020/10/31',5,50,'Y'
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),3,'청보리가 춤을 주네요','청보리, 유채꽃, 파도의 조화 최고!!',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2020/10/31',5,30,'Y'
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),7,'더쇼어호텔 다녀왔어요~','뷰는 정말 좋은데 좀 비싸네요.. 그래도 좋은 추억이 되어 행복합니다. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2020/08/01',4,20,'Y'
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),9,'인생맛집 담아래 서귀포점','비린것을 싫어하는데 간장딱새우밥 흡입했네요. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2019/05/01',5,65,'Y'
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),10,'TV에 나온 맛집을 가다니','집에 돌아오는 길에 생각나는 열밥, 또먹고 싶네요 ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2018/07/01',4.5,34,'Y'
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),12,'여행 중 치과 후기','여행을 갔는데 치아가 너무 아파서 치과 다녀왔어요. 
    덕분에 이젠 나아졌어요 ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2017/07/01',3.5,25,'Y'
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),13,'한의원을 다녀왔습니다. ','직원이 불친절해서 다음에는 가고 싶지 않습니다. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2018/06/11',3,15,'Y'
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),15,'죽다 살아났어요 ','밤에 급하게 체하는 바람에 
    잠을 자지 못하다가 응급실을 다녀왔습니다. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2019/11/11',4,53,'Y'
);

select * from review;

-- 리뷰사진테이블
CREATE TABLE rphoto(
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
        CONSTRAINT RPHOTO_RTNO_CK CHECK (rtno IN (10,20,30,40,50))
);

INSERT INTO
    rphoto
VALUES(
    1,'noimage.jpg','사라오름1.jpg',200*100,'img/review/',10
);

INSERT INTO
    rphoto
VALUES(
    1,'noimage.jpg','사라오름3.jpg',200*100,'img/review/',10
);

INSERT INTO
    rphoto
VALUES(
    2,'noimage.jpg','가파도3.jpg',200*100,'img/review/',10
);

INSERT INTO
    rphoto
VALUES(
    2,'noimage.jpg','가파도4.jpg',200*100,'img/review/',10
);

INSERT INTO
    rphoto
VALUES(
    3,'noimage.jpg','더쇼어호텔.jpg',200*100,'img/review/',20
);

INSERT INTO
    rphoto
VALUES(
    4,'noimage.jpg','담아래서귀포점2.jpg',200*100,'img/review/',30
);

INSERT INTO
    rphoto
VALUES(
    5,'noimage.jpg','한라국수2.jpg',200*100,'img/review/',30
);

INSERT INTO
    rphoto
VALUES(
    6,'noimage.jpg','치과후기.jpg',200*100,'img/review/',40
);

INSERT INTO
    rphoto
VALUES(
    7,'noimage.jpg','한의원.jpg',200*100,'img/review/',40
);

INSERT INTO
    rphoto
VALUES(
    8,'noimage.jpg','noimage.jpg',200*100,'img/review/',50
);


SELECT * FROM RPHOTO ;
commit;

-- 참고
SELECT 
    mname, m.mno,u.dno,dname
FROM 
    member m,userdisease u ,disease d
WHERE
    m.mno = u.mno
    AND u.dno=d.dno;