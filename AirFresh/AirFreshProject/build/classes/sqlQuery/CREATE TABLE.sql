DROP TABLE orderReview 
CASCADE CONSTRAINTS;
DROP TABLE purchase 
CASCADE CONSTRAINTS;
DROP TABLE modelList 
CASCADE CONSTRAINTS;
DROP TABLE noticeBbs 
CASCADE CONSTRAINTS;
DROP TABLE qnaBbs 
CASCADE CONSTRAINTS;
DROP TABLE asApplication 
CASCADE CONSTRAINTS;
DROP TABLE asReview 
CASCADE CONSTRAINTS;
DROP TABLE members 
CASCADE CONSTRAINTS;
DROP TABLE managerMember 
CASCADE CONSTRAINTS;


DROP SEQUENCE asReview_SEQ; 
DROP SEQUENCE managerMember_SEQ;
DROP SEQUENCE noticeBbs_SEQ;
DROP SEQUENCE qnaBbs_SEQ;
DROP SEQUENCE orderReview_SEQ;
DROP SEQUENCE purchase_SEQ;
DROP SEQUENCE modelList_SEQ;
DROP SEQUENCE asApplication_SEQ;


CREATE SEQUENCE modelList_SEQ
START WITH 10000
INCREMENT BY 1
MAXVALUE 19999
NOCYCLE;

CREATE SEQUENCE purchase_SEQ
START WITH 20000
INCREMENT BY 1
MAXVALUE 29999
NOCYCLE;
 
CREATE SEQUENCE orderReview_SEQ
START WITH 30000
INCREMENT BY 1
MAXVALUE 39999
NOCYCLE;
 

CREATE SEQUENCE qnaBbs_SEQ
START WITH 1
INCREMENT BY 1;
 
CREATE SEQUENCE noticeBbs_SEQ
START WITH 1
INCREMENT BY 1;
 
CREATE SEQUENCE managerMember_SEQ
START WITH 60000
INCREMENT BY 1
MAXVALUE 69999
NOCYCLE;
 

CREATE SEQUENCE asReview_SEQ
START WITH 40000
INCREMENT BY 1
MAXVALUE 49999
NOCYCLE;
 
CREATE SEQUENCE asApplication_SEQ
START WITH 50000
INCREMENT BY 1
MAXVALUE 59999
NOCYCLE;


-- members Table Create SQL
CREATE TABLE members
(
    mem_id       VARCHAR2(50)     NOT NULL, 
    mem_pw       VARCHAR2(20)     NULL, 
    mem_name     VARCHAR2(20)     NULL, 
    mem_cell     NUMBER(12)       NULL, 
    mem_birth    VARCHAR2(20)     NULL, 
    mem_addr1    NUMBER(5)      NULL, 
    mem_addr2    VARCHAR2(100)    NULL, 
    mem_addr3    VARCHAR2(50)     NULL, 
    mem_auth     NUMBER(1)        NULL, 
    CONSTRAINT MEMBERS_PK PRIMARY KEY (mem_id)
);
 

-- members Table Create SQL
CREATE TABLE asApplication
(
    as_index       NUMBER(6)         NOT NULL, 
    mem_id         VARCHAR2(20)      NULL, 
    wdate          VARCHAR2(20)      NULL, 
    req_date       VARCHAR2(20)      NULL, 
    mrg_id         VARCHAR2(50)      NULL, 
    as_title       VARCHAR2(200)     NULL, 
    as_content     VARCHAR2(4000)    NULL, 
    as_img_path    VARCHAR2(100)     NULL, 
    prd_index     NUMBER(6)            NULL, 
    CONSTRAINT ASAPPLICATION_PK PRIMARY KEY (as_index)
);



ALTER TABLE asApplication
    ADD CONSTRAINT FK_asApplication_mem_id_member FOREIGN KEY (mem_id)
        REFERENCES members (mem_id);
        
ALTER TABLE asApplication
    ADD CONSTRAINT FK_asApplication_prd_index_modelList FOREIGN KEY (prd_index)
        REFERENCES modelList (prd_index);


        
        
        
        
-- members Table Create SQL
CREATE TABLE modelList
(
    prd_index         NUMBER(6)        NOT NULL, 
    prd_name          VARCHAR2(100)    NULL, 
    prd_model_name    VARCHAR2(20)     NULL, 
    prd_price         NUMBER(8)        NULL, 
    CONSTRAINT MODELLIST_PK PRIMARY KEY (prd_index)
);






-- members Table Create SQL
CREATE TABLE purchase
(
    pur_index        NUMBER(6)       NOT NULL, 
    mem_id             VARCHAR2(50)    NULL, 
    prd_index         NUMBER(6)       NULL, 
    pur_date             DATE            NULL, 
    installation_date    DATE            NULL, 
    order_num            NUMBER(3)       NULL, 
    review               NUMBER(1)       NULL, 
    order_auth           NUMBER(1)       NULL, 
    CONSTRAINT PURCHASE_PK PRIMARY KEY (pur_index)
);
 






ALTER TABLE purchase
    ADD CONSTRAINT FK_purchase_prd_index_model FOREIGN KEY (prd_index)
        REFERENCES modelList (prd_index);
 

ALTER TABLE purchase
    ADD CONSTRAINT FK_purchase_mem_id_members_m FOREIGN KEY (mem_id)
        REFERENCES members (mem_id);
 


-- members Table Create SQL
CREATE TABLE orderReview
(
    re_index             NUMBER(6)         NOT NULL, 
    mem_id               VARCHAR2(50)        NULL, 
    pur_index            NUMBER(6)       NULL, 
    wdate                DATE              NULL, 
    order_re_title       VARCHAR2(200)     NULL, 
    order_re_content     VARCHAR2(4000)    NULL, 
    order_re_img_path    VARCHAR2(50)      NULL, 
    readcount            NUMBER(10)        NULL, 
    rating               NUMBER(1)         NULL, 
    re_auth              NUMBER(1)         NULL, 
    CONSTRAINT ORDERREVIEW_PK PRIMARY KEY (re_index)
);
 




 

ALTER TABLE orderReview
    ADD CONSTRAINT FK_orderReview_pur_index_asApp FOREIGN KEY (pur_index)
        REFERENCES asApplication (as_index);
 

ALTER TABLE orderReview
    ADD CONSTRAINT FK_orderReview_mem_id_members_ FOREIGN KEY (mem_id)
        REFERENCES members (mem_id);
 


-- members Table Create SQL
CREATE TABLE qnaBbs
(
    qna_index      NUMBER(6)         NOT NULL, 
    mem_id        VARCHAR2(50)            NULL, 
    qna_title      VARCHAR2(20)      NULL, 
    qna_content    VARCHAR2(20)      NULL, 
    wdate          DATE              NULL, 
    re_content     VARCHAR2(4000)    NULL, 
    re_date        DATE              NULL, 
    readcount      NUMBER(10)        NULL, 
    depth          NUMBER(2)         NULL, 
    del         NUMBER(1)         NULL, 
    CONSTRAINT QNABBS_PK PRIMARY KEY (qna_index)
);
 




ALTER TABLE qnaBbs
    ADD CONSTRAINT FK_qnaBbs_mem_id_members_mem_i FOREIGN KEY (mem_id)
        REFERENCES members (mem_id);
 


-- members Table Create SQL
CREATE TABLE noticeBbs
(
    noti_index       NUMBER(6)         NOT NULL, 
    noti_title       VARCHAR2(200)     NULL, 
    noti_content     VARCHAR2(4000)    NULL, 
    noti_catagory    NUMBER(1)         NULL, 
    noti_writer      VARCHAR2(20)      NULL, 
    noti_wdate       DATE              NULL, 
    filename         VARCHAR2(100)     NULL, 
    readcount        NUMBER(10)        NULL, 
    noti_del         NUMBER(1)         NULL, 
    CONSTRAINT NOTICEBBS_PK PRIMARY KEY (noti_index)
);
 




-- members Table Create SQL
CREATE TABLE managerMember
(
    mgr_index    NUMBER(6)       NOT NULL, 
    mgr_auth     NUMBER(1)       NULL, 
    mgr_id       VARCHAR2(50)    NULL, 
    mgr_pw       VARCHAR2(20)    NULL, 
    mgr_name     VARCHAR2(20)    NULL, 
    mgr_loc      NUMBER(3)       NULL, 
    mgr_cell     NUMBER(12)      NULL, 
    mgr_del      NUMBER(1)       NULL, 
    CONSTRAINT MANAGERMEMBER_PK PRIMARY KEY (mgr_index)
);
 




-- members Table Create SQL
CREATE TABLE asReview
(
    as_re_index       NUMBER            NOT NULL, 
    mem_id            VARCHAR2(50)      NULL, 
    as_index          NUMBER(6)         NULL, 
    wdate             DATE              NULL, 
    as_re_title       NVARCHAR2(200)    NULL, 
    as_re_content     VARCHAR2(4000)    NULL, 
    as_re_img_path    VARCHAR2(50)      NULL, 
    readcount         NUMBER(10)        NULL, 
    rating            NUMBER(1)         NULL, 
    as_auth           NUMBER(1)         NULL, 
    CONSTRAINT ASREVIEW_PK PRIMARY KEY (as_re_index)
);
 


ALTER TABLE asReview
    ADD CONSTRAINT FK_asReview_mem_id_members_mem FOREIGN KEY (mem_id)
        REFERENCES members (mem_id);
 

ALTER TABLE asReview
    ADD CONSTRAINT FK_asReview_as_index_asApplica FOREIGN KEY (as_index)
        REFERENCES asApplication (as_index);
 
 
-- commit;

--rollback;


