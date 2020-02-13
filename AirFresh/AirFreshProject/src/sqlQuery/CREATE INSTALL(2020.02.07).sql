DROP TABLE INSTALL
CASCADE CONSTRAINTS;


CREATE SEQUENCE INSTALL_SEQ
START WITH 70000
INCREMENT BY 1
MAXVALUE 79999
NOCYCLE;


CREATE TABLE INSTALL(
	--제품설치 인덱스(PK)
	ins_index NUMBER(6) PRIMARY KEY,
	--제품렌탈 인덱스(FK)
	pur_index NUMBER(6) NOT NULL,
	--설치 희망일
	ins_date  DATE  NULL,
	--설치 완료일
	comp_date DATE  NULL,
	--매니저 인덱스(FK)
	mgr_index NUMBER(6)  NULL,
	--처리상태 (1/0)
	ins_state NUMBER(1)  NOT NULL

);

ALTER TABLE INSTALL
ADD CONSTRAINTS FK_INSTALL_pur_index_purchase FOREIGN KEY(pur_index)
REFERENCES purchase(pur_index);

ALTER TABLE INSTALL
ADD CONSTRAINTS FK_INSTALL_mgr_index_purchase FOREIGN KEY(mgr_index)
REFERENCES managerMember(mgr_index);