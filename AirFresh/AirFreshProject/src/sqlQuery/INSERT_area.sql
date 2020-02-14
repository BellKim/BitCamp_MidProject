----------------------------------------------------------------------------------------------------------------------
--		manager insert
----------------------------------------------------------------------------------------------------------------------

insert into managerMember (mgr_index, mgr_auth, mgr_id, mgr_pw, mgr_name, mgr_loc, mgr_cell, mgr_del)
values (managerMember_SEQ.NEXTVAL, 2, 'J_admin', '4321', '부메니저', 1, 01012341234, 0);

insert into managerMember (mgr_index, mgr_auth, mgr_id, mgr_pw, mgr_name, mgr_loc, mgr_cell, mgr_del)
values (managerMember_SEQ.NEXTVAL, 1, 'k_admin', '1234', '왕관리자', 3, 01012341234, 0);

insert into managerMember (mgr_index, mgr_auth, mgr_id, mgr_pw, mgr_name, mgr_loc, mgr_cell, mgr_del)
values (managerMember_SEQ.NEXTVAL, 3, '123', '123', '김철근', 2, 01012341234, 0);

insert into managerMember (mgr_index, mgr_auth, mgr_id, mgr_pw, mgr_name, mgr_loc, mgr_cell, mgr_del)
values (managerMember_SEQ.NEXTVAL, 4, '456', '456', '김공사', 1, 01012341234, 0);


SELECT * FROM managerMember;




----------------------------------------------------------------------------------------------------------------------
--		members insert
----------------------------------------------------------------------------------------------------------------------
INSERT INTO MEMBERS (MEM_ID, MEM_PW, MEM_NAME, MEM_CELL, MEM_BIRTH, MEM_ADDR1, MEM_ADDR2, MEM_ADDR3, MEM_AUTH)
VALUES('a@naver.com', 'aaa111!', '이이이', 01000000000, '19900112', 13483, '경기도 성남시', '분당구 판교동', 3);

SELECT * FROM MEMBERS;








----------------------------------------------------------------------------------------------------------------------
--		MODELLIST insert
----------------------------------------------------------------------------------------------------------------------

INSERT INTO MODELLIST (PRD_INDEX, PRD_NAME, PRD_MODEL_NAME, PRD_PRICE) VALUES(modelList_SEQ.NEXTVAL, '모션공기청정기', 'ACL141MASKWH', 34900);
INSERT INTO MODELLIST (PRD_INDEX, PRD_NAME, PRD_MODEL_NAME, PRD_PRICE) VALUES(modelList_SEQ.NEXTVAL, 'Air Purifier', 'ACLV16BRTLWH', 27900);
INSERT INTO MODELLIST (PRD_INDEX, PRD_NAME, PRD_MODEL_NAME, PRD_PRICE) VALUES(modelList_SEQ.NEXTVAL, '인공지능 슈퍼 L 청정기', 'ACLV15HRTLWH', 29900);
INSERT INTO MODELLIST (PRD_INDEX, PRD_NAME, PRD_MODEL_NAME, PRD_PRICE) VALUES(modelList_SEQ.NEXTVAL, 'U필터 공기청정기', 'ACL120UASKCG', 32900);
INSERT INTO MODELLIST (PRD_INDEX, PRD_NAME, PRD_MODEL_NAME, PRD_PRICE) VALUES(modelList_SEQ.NEXTVAL, '미니언즈 공기청정기', 'ACL121CZSKYL', 25900);
INSERT INTO MODELLIST (PRD_INDEX, PRD_NAME, PRD_MODEL_NAME, PRD_PRICE) VALUES(modelList_SEQ.NEXTVAL, '공기청정기 MINI', 'ACLV12BRTLWH', 23900);

SELECT * FROM MODELLIST;





----------------------------------------------------------------------------------------------------------------------
--		 insert
----------------------------------------------------------------------------------------------------------------------










----------------------------------------------------------------------------------------------------------------------
--		 insert
----------------------------------------------------------------------------------------------------------------------









