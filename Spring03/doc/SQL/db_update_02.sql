[1. 맨처음]
alter table rphoto
ADD 
    PNO NUMBER(10)
;
[3. 가장 마지막으로 실행]

commit;

alter table rphoto
ADD CONSTRAINT RPHOTO_PNO_PK PRIMARY KEY(pno)
;
[2. 두번째 실행]
UPDATE 
    RPHOTO
SET 
    PNO = 10001
WHERE
    RPSNAME='사라오름1.jpg';
  
UPDATE 
    RPHOTO
SET 
    PNO = 10002
WHERE
    RPSNAME='사라오름3.jpg';    
    
UPDATE 
    RPHOTO
SET 
    PNO = 10003
WHERE
    RPSNAME='가파도3.jpg';  
    
    
UPDATE 
    RPHOTO
SET 
    PNO = 10004
WHERE
    RPSNAME='가파도4.jpg';  
    
    
    UPDATE 
    RPHOTO
SET 
    PNO = 10005
WHERE
    RPSNAME='더쇼어호텔.jpg';  
    
    
    UPDATE 
    RPHOTO
SET 
    PNO = 10006
WHERE
    RPONAME='test10.jpg';  
    
    
    UPDATE 
    RPHOTO
SET 
    PNO = 10007
WHERE
    RPONAME='test05.jpg';  
    
    
    UPDATE 
    RPHOTO
SET 
    PNO = 10008
WHERE
    RPONAME='test11.jpg';  
    
    
    UPDATE 
    RPHOTO
SET 
    PNO = 10009
WHERE
    RPONAME='test12.jpg';  
    
    
    UPDATE 
    RPHOTO
SET 
    PNO = 10010
WHERE
    RPONAME='test13.jpg';  
    
    
    UPDATE 
    RPHOTO
SET 
    PNO = 10011
WHERE
    RPONAME='test06.jpg';  
    
    
    UPDATE 
    RPHOTO
SET 
    PNO = 10012
WHERE
    RPONAME='test12.jpg';  
    
    
    UPDATE 
    RPHOTO
SET 
    PNO = 10013
WHERE
    RPONAME='test07.jpg';  
    
    
    UPDATE 
    RPHOTO
SET 
    PNO = 10014
WHERE
    RPONAME='test13.jpg';  
    
    
    UPDATE 
    RPHOTO
SET 
    PNO = 10015
WHERE
    RPONAME='test08.jpg';  
    
UPDATE 
    RPHOTO
SET 
    PNO = 10016
WHERE
    RPSNAME='test14.jpg';     
UPDATE 
    RPHOTO
SET 
    PNO = 10017
WHERE
    RPONAME='test09.jpg';    
    
 
 UPDATE 
    RPHOTO
SET 
    PNO = 10018
WHERE
    RPONAME='test15.jpg';   
    
    
    UPDATE 
    RPHOTO
SET 
    PNO = 10019
WHERE
    RPONAME='test01.jpg'; 
    
    UPDATE 
    RPHOTO
SET 
    PNO = 10020
WHERE
    RPONAME='test02.jpg'; 
    
    UPDATE 
    RPHOTO
SET 
    PNO = 10021
WHERE
    RPONAME='test03.jpg'; 
    
UPDATE 
    RPHOTO
SET 
    PNO = 10022
WHERE
    RPONAME='사람오름2.jpg'; 
    
UPDATE 
    RPHOTO
SET 
    PNO = 10023
WHERE
    RPONAME='사라오름.jpg'; 

