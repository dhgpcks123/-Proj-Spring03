[1. ��ó��]
alter table rphoto
ADD 
    PNO NUMBER(10)
;
[3. ���� ���������� ����]

commit;

alter table rphoto
ADD CONSTRAINT RPHOTO_PNO_PK PRIMARY KEY(pno)
;
[2. �ι�° ����]
UPDATE 
    RPHOTO
SET 
    PNO = 10001
WHERE
    RPSNAME='������1.jpg';
  
UPDATE 
    RPHOTO
SET 
    PNO = 10002
WHERE
    RPSNAME='������3.jpg';    
    
UPDATE 
    RPHOTO
SET 
    PNO = 10003
WHERE
    RPSNAME='���ĵ�3.jpg';  
    
    
UPDATE 
    RPHOTO
SET 
    PNO = 10004
WHERE
    RPSNAME='���ĵ�4.jpg';  
    
    
    UPDATE 
    RPHOTO
SET 
    PNO = 10005
WHERE
    RPSNAME='�����ȣ��.jpg';  
    
    
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
    RPONAME='�������2.jpg'; 
    
UPDATE 
    RPHOTO
SET 
    PNO = 10023
WHERE
    RPONAME='������.jpg'; 

