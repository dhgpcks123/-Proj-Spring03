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
commit;
