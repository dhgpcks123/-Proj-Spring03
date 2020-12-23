-- 여행지 추천시 계절을 구분할 수 있는 SEASONTYPE 생성 (디폴트 값 : 계절 무관)

CREATE TABLE seasontype(
    stno NUMBER(3) 
        CONSTRAINT SEASON_STNO_PK PRIMARY KEY
        CONSTRAINT SEASON_STNO_CK CHECK ( stno IN (100,200,300,400,500)),
    stname VARCHAR2(12) DEFAULT '계절무관'
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


commit;



-- 장소사진 테이블 
-- 기본키 pno 추가, 같은 장소에 대해 여러개의 사진 중 첫번째 사진만 보여줄 subpno 추가

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
VALUES(1, 4, 1, 'test02.jpg', '송악산3.jpg', 20000, '/img/area/', 10)
;

INSERT INTO aphoto
VALUES(2, 5, 1, 'test20.jpg', '제이힐.jpg', 20000, '/img/area/', 20)
;

INSERT INTO aphoto
VALUES(3, 6, 1, 'test19.jpg', '사진.jpg', 20000, '/img/area/', 20)
;

INSERT INTO aphoto
VALUES(4, 7, 1, 'test18.jpg', '사진2.jpg', 20000, '/img/area/', 20)
;

INSERT INTO aphoto
VALUES(5, 8, 1, 'test17.jpg', '사진3.jpg', 20000, '/img/area/', 30)
;

INSERT INTO aphoto
VALUES(6, 9, 1, 'test16.jpg', '사진1.jpg', 20000, '/img/area/', 30)
;
INSERT INTO aphoto
VALUES(7, 9, 1, 'test17.jpg', '사진1.jpg', 20000, '/img/area/', 30)
;
INSERT INTO aphoto
VALUES(8, 9, 1, 'test18.jpg', '사진1.jpg', 20000, '/img/area/', 30)
;
INSERT INTO aphoto
VALUES(9, 9, 1, 'test19.jpg', '사진1.jpg', 20000, '/img/area/', 30)
;

INSERT INTO aphoto
VALUES(10, 11, 1, 'test01.jpg', '사진2.jpg', 20000, '/img/area/', 40)
;
INSERT INTO aphoto
VALUES(11, 12, 1, 'test02.jpg', '사진3.jpg', 20000, '/img/area/', 40)
;
INSERT INTO aphoto
VALUES(12, 12, 1, 'test07.jpg', '사진3.jpg', 20000, '/img/area/', 40)
;
INSERT INTO aphoto
VALUES(13, 13, 1, 'test03.jpg', '사진4.jpg', 20000, '/img/area/', 40)
;
INSERT INTO aphoto
VALUES(14, 14, 1, 'test04.jpg', '사진53.jpg', 20000, '/img/area/', 50)
;
INSERT INTO aphoto
VALUES(15, 15, 1, 'test05.jpg', '사진6.jpg', 20000, '/img/area/', 50)
;
INSERT INTO aphoto
VALUES(16, 15, 1, 'test06.jpg', '사진7.jpg', 20000, '/img/area/', 50)
;
INSERT INTO aphoto
VALUES(17, 15, 1, 'test07.jpg', '사진8.jpg', 20000, '/img/area/', 50)
;

INSERT INTO 
aphoto
VALUES(
18, 1, 1, 'test01.jpg','섭지코지1.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
aphoto
VALUES(
19, 1, 1, 'test02.jpg','섭지코지2.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
aphoto
VALUES(
20, 2, 1, 'test03.jpg','사라오름1.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
aphoto
VALUES(
21, 2, 1, 'test04.jpg','사라오름2.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
aphoto
VALUES(
22, 3, 1, 'test05.jpg','가파도1.jpg',200 * 100,'/img/area/',10
);


INSERT INTO 
aphoto
VALUES(
23, 3, 1, 'test06.jpg','가파도4.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
aphoto
VALUES(
24, 4, 1, 'test07.jpg','송악산1.jpg',200 * 100,'/img/area/',10
);


INSERT INTO 
aphoto
VALUES(
25, 4, 1, 'test08.jpg','송악산2.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
aphoto
VALUES(
26, 5, 1, 'test09.jpg','제이힐호텔.jpg',200 * 100,'/img/area/',20
);


INSERT INTO 
aphoto
VALUES(
27, 6, 1, 'test10.jpg','유탑유블레스호텔.jpg',200 * 100,'/img/area/',20
);


INSERT INTO 
aphoto
VALUES(
28, 7, 1, 'test11.jpg','더쇼어호텔.jpg',200 * 100,'/img/area/',20
);


INSERT INTO 
aphoto
VALUES(
29, 8, 1, 'test12.jpg','성산옥탑.jpg',200 * 100,'/img/area/', 30
);

INSERT INTO 
aphoto
VALUES(
30, 9, 1, 'test13.jpg','담아래 서귀포점.jpg',200 * 100,'/img/area/', 30
);
INSERT INTO 
aphoto
VALUES(
31, 10, 1, 'test14.jpg','제주한라국수1.jpg',200 * 100,'/img/area/', 30
);

INSERT INTO 
aphoto
VALUES(
32, 10, 1, 'test15.jpg','제주한라국수2.jpg',200 * 100,'/img/area/', 30
);



INSERT INTO 
aphoto
VALUES(
33, 11, 1, 'test16.jpg','닥터양내과.jpg',200 * 100,'/img/area/',40
);



INSERT INTO 
aphoto
VALUES(
34, 12, 1, 'test17.jpg','선치과의원.jpg',200 * 100,'/img/area/', 40
);



INSERT INTO 
aphoto
VALUES(
35, 13, 1, 'test18.jpg','다나한의원.jpg',200 * 100,'/img/area/', 40
);



INSERT INTO 
aphoto
VALUES(
36, 14, 1, 'test19.jpg','제주한라병원 응급실.jpg',200 * 100,'/img/area/', 50
);


INSERT INTO 
aphoto
VALUES(
37, 15, 1, 'test20.jpg','서귀포의료원 응급실.jpg',200 * 100,'/img/area/', 50
);


INSERT INTO 
aphoto
VALUES(
38, 16, 1, 'test01.jpg','제주대학교병원 응급실.jpg',200 * 100,'/img/area/', 50
);

commit;
SELECT * FROM aphoto;


