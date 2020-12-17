-- ����������̺�

DROP TABLE rphoto;
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
        CONSTRAINT RPHOTO_RTNO_CK CHECK (rtno IN (10,20,30,40,50))
);
INSERT INTO
    rphoto
VALUES(
    10001,1,'noimage.jpg','������1.jpg',200*100,'/img/review/',10
);

INSERT INTO
    rphoto
VALUES(
    10002,1,'test01.jpg','������3.jpg',200*100,'/img/review/',10
);

INSERT INTO
    rphoto
VALUES(
    10003, 2,'test02.jpg','���ĵ�3.jpg',200*100,'/img/review/',10
);

INSERT INTO
    rphoto
VALUES(
    10004,2,'test03.jpg','���ĵ�4.jpg',200*100,'/img/review/',10
);

INSERT INTO
    rphoto
VALUES(
    10005, 3,'test04.jpg','�����ȣ��.jpg',200*100,'/img/review/',20
);

INSERT INTO
    rphoto
VALUES(
    10006,3,'test10.jpg','�����ȣ��.jpg',200*100,'/img/review/',20
);

INSERT INTO
    rphoto
VALUES(
    10007,4,'test05.jpg','��Ʒ���������2.jpg',200*100,'/img/review/',30
);

INSERT INTO
    rphoto
VALUES(
    10008,4,'test11.jpg','��Ʒ���������2.jpg',200*100,'/img/review/',30
);
INSERT INTO
    rphoto
VALUES(
    10009, 4,'test12.jpg','��Ʒ���������2.jpg',200*100,'/img/review/',30
);

INSERT INTO
    rphoto
VALUES(
    10010, 4,'test13.jpg','��Ʒ���������2.jpg',200*100,'/img/review/',30
);

INSERT INTO
    rphoto
VALUES(
    10011,5,'test06.jpg','�Ѷ󱹼�2.jpg',200*100,'/img/review/',30
);
INSERT INTO
    rphoto
VALUES(
    10012,5,'test12.jpg','�Ѷ󱹼�2.jpg',200*100,'/img/review/',30
);

INSERT INTO
    rphoto
VALUES(
    10013,6,'test07.jpg','ġ���ı�.jpg',200*100,'/img/review/',40
);
INSERT INTO
    rphoto
VALUES(
    10014,6,'test13.jpg','ġ���ı�.jpg',200*100,'/img/review/',40
);

INSERT INTO
    rphoto
VALUES(
    10015,7,'test08.jpg','���ǿ�.jpg',200*100,'/img/review/',40
);

INSERT INTO
    rphoto
VALUES(
    10016,7,'test14.jpg','���ǿ�.jpg',200*100,'/img/review/',40
);

INSERT INTO
    rphoto
VALUES(
    10017,8,'test09.jpg','noimage.jpg',200*100,'/img/review/',50
);
INSERT INTO
    rphoto
VALUES(
    10018,8,'test15.jpg','noimage.jpg',200*100,'/img/review/',50
);

INSERT INTO rphoto
VALUES(
    10019, 9, 'test01.jpg', 'test01.jpg', 20000, 'img/review/', 30
);
INSERT INTO rphoto
VALUES(
    10020, 9, 'test02.jpg', 'test01.jpg', 20000, 'img/review/', 30
);
INSERT INTO rphoto
VALUES(
    10021,9, 'test03.jpg', 'test01.jpg', 20000, 'img/review/', 30
);

commit;
SELECT * FROM RPHOTO ;