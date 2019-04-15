
/* Drop Tables */


DROP TABLE BandImg CASCADE CONSTRAINTS;
DROP TABLE BandMember CASCADE CONSTRAINTS;
DROP TABLE BandMusic CASCADE CONSTRAINTS;
DROP TABLE BandSubmit_Comment CASCADE CONSTRAINTS;
DROP TABLE SafePayCancle CASCADE CONSTRAINTS;
DROP TABLE SafePay CASCADE CONSTRAINTS;
DROP TABLE Reward CASCADE CONSTRAINTS;
DROP TABLE BandSubmit CASCADE CONSTRAINTS;
DROP TABLE Band CASCADE CONSTRAINTS;
DROP TABLE BGSAttachedFile CASCADE CONSTRAINTS;
DROP TABLE BGSHire CASCADE CONSTRAINTS;
DROP TABLE BGSApply CASCADE CONSTRAINTS;
DROP TABLE BGSQnA CASCADE CONSTRAINTS;
DROP TABLE BGSReview CASCADE CONSTRAINTS;
DROP TABLE concertTimes CASCADE CONSTRAINTS;
DROP TABLE BGSConcert CASCADE CONSTRAINTS;
DROP TABLE BGSGuiterlist CASCADE CONSTRAINTS;
DROP TABLE BGSPay CASCADE CONSTRAINTS;
DROP TABLE Members CASCADE CONSTRAINTS;
DROP TABLE Pay CASCADE CONSTRAINTS;



/* Create Tables */

CREATE TABLE Band
(
	B_no number NOT NULL,
	B_name nvarchar2(50),
	B_description nvarchar2(2000),
	BI_profile number,
	BM_title number,
	B_Liked number DEFAULT 0,
	PRIMARY KEY (B_no)
);


CREATE TABLE BandImg
(
	BI_no number NOT NULL,
	B_no number NOT NULL,
	image varchar2(50),
	PRIMARY KEY (BI_no)
);


CREATE TABLE BandMember
(
	id varchar2(30) NOT NULL,
	B_no number NOT NULL
);


CREATE TABLE BandMusic
(
	BM_no number NOT NULL,
	B_no number NOT NULL,
	BM_name nvarchar2(30),
	BM_description nvarchar2(2000),
	BM_Liked number DEFAULT 0,
	PRIMARY KEY (BM_no)
);


CREATE TABLE BandSubmit
(
	S_no number NOT NULL,
	B_no number NOT NULL,
	P_no number,
	S_Account_Bank nvarchar2(50),
	S_Account_Serial varchar2(20),
	S_Album_cover number,
	S_Content nvarchar2(2000),
	S_Goal_Price number,
	S_Goal_DeadLine date,
	S_Goal_Accumulation number DEFAULT 0,
	S_Submit_Date date DEFAULT SYSDATE,
	S_Liked number DEFAULT 0,
	PRIMARY KEY (S_no)
);


CREATE TABLE BandSubmit_Comment
(
	S_no number NOT NULL,
	C_Step number DEFAULT 0,
	C_Depth number DEFAULT 0,
	id varchar2(30) NOT NULL,
	C_Stars number DEFAULT 5,
	C_Content nvarchar2(2000),
	C_Post_Date date DEFAULT SYSDATE,
	C_Liked number DEFAULT 0
);


CREATE TABLE BGSApply
(
	AP_no number NOT NULL,
	G_no number NOT NULL,
	AP_title varchar2(50),
	AP_content varchar2(2000),
	AP_postdate date,
	AP_visit number,
	AP_remarks varchar2(2000),
	id varchar2(30) NOT NULL,
	PRIMARY KEY (AP_no)
);


CREATE TABLE BGSAttachedFile
(
	AF_no number NOT NULL,
	AP_no number NOT NULL,
	AF_Filename varchar2(2000),
	AF_directory varchar2(2000),
	AF_filesize number,
	PRIMARY KEY (AF_no)
);


CREATE TABLE BGSConcert
(
	BGSCO_no number NOT NULL,
	C_title varchar2(1000),
	C_place varchar2(1000),
	C_content varchar2(3000),
	PRIMARY KEY (BGSCO_no)
);


CREATE TABLE BGSGuiterlist
(
	G_no number NOT NULL,
	id varchar2(30) NOT NULL,
	G_skil varchar2(3),
	G_prefergenre varchar2(10),
	G_introduce varchar2(1000),
	PRIMARY KEY (G_no)
);


CREATE TABLE BGSHire
(
	H_no number NOT NULL,
	AP_no number NOT NULL,
	BGSCO_no number NOT NULL,
	PRIMARY KEY (H_no)
);


CREATE TABLE BGSPay
(
	P_no number NOT NULL,
	id varchar2(30) NOT NULL,
	qty number,
	pagydate date,
	reciveway varchar2(100),
	bank_name varchar2(10),
	account_serial number,
	phone number,
	email varchar2(50),
	PRIMARY KEY (P_no)
);


CREATE TABLE BGSQnA
(
	Q_no number NOT NULL,
	id varchar2(30) NOT NULL,
	BGSCO_no number NOT NULL,
	Q_title varchar2(1000),
	Q_content varchar2(3000),
	refer number,
	step number,
	dept number,
	PRIMARY KEY (Q_no)
);


CREATE TABLE BGSReview
(
	R_no number NOT NULL,
	id varchar2(30) NOT NULL,
	BGSCO_no number NOT NULL,
	content varchar2(3000),
	preferlate number,
	postdate date DEFAULT SYSDATE,
	PRIMARY KEY (R_no)
);


CREATE TABLE concertTimes
(
	CT_no number NOT NULL,
	consertDate date DEFAULT SYSDATE,
	price number,
	P_no number NOT NULL,
	BGSCO_no number NOT NULL,
	PRIMARY KEY (CT_no)
);


CREATE TABLE Members
(
	id varchar2(30) NOT NULL,
	password varchar2(30),
	Name varchar2(20),
	Profile_Img number DEFAULT 0,
	Birthday date,
	Zip_Code number,
	Shipping_Adress nvarchar2(100),
	Description nvarchar2(2000),
	Login_Chain nvarchar2(20),
	Phone number,
	Bank_Name nvarchar2(30),
	Bank_Serial number,
	SMS_Recieve nchar(1),
	Email_Recieve nchar(1),
	Join_Date date DEFAULT SYSDATE,
	PRIMARY KEY (id)
);


CREATE TABLE Pay
(
	P_no number NOT NULL,
	P_Complete_Date date DEFAULT SYSDATE,
	P_Total_People number,
	P_Total_Accumulataion number,
	PRIMARY KEY (P_no)
);


CREATE TABLE Reward
(
	R_no number NOT NULL,
	S_no number NOT NULL,
	R_Price number,
	R_Name nvarchar2(30),
	R_Description nvarchar2(1000),
	PRIMARY KEY (R_no)
);


CREATE TABLE SafePay
(
	SP_No number NOT NULL,
	id varchar2(30) NOT NULL,
	R_no number NOT NULL,
	SP_Order_No number,
	P_no number NOT NULL,
	SP_Reward_Qty number,
	-- 제품 이외 추가 후원
	SP_Support number DEFAULT 0,
	SP_Date date DEFAULT SYSDATE,
	SP_Recipient nvarchar2(15),
	SP_Zip_Code number,
	SP_Shipping_Address nvarchar2(1000),
	SP_Depositor nvarchar2(15),
	SP_Bank_Name nvarchar2(30),
	SP_Account_Serial number,
	SP_Phone number,
	PRIMARY KEY (SP_No)
);


CREATE TABLE SafePayCancle
(
	SPC_no number NOT NULL,
	SP_No number NOT NULL,
	SPC_Cancle_Date date DEFAULT SYSDATE,
	SPC_Cause nvarchar2(1000),
	PRIMARY KEY (SPC_no)
);



/* Create Foreign Keys */

ALTER TABLE BandImg
	ADD FOREIGN KEY (B_no)
	REFERENCES Band (B_no)
;


ALTER TABLE BandMember
	ADD FOREIGN KEY (B_no)
	REFERENCES Band (B_no)
;


ALTER TABLE BandMusic
	ADD FOREIGN KEY (B_no)
	REFERENCES Band (B_no)
;


ALTER TABLE BandSubmit
	ADD FOREIGN KEY (B_no)
	REFERENCES Band (B_no)
;


ALTER TABLE BandSubmit_Comment
	ADD FOREIGN KEY (S_no)
	REFERENCES BandSubmit (S_no)
;


ALTER TABLE Reward
	ADD FOREIGN KEY (S_no)
	REFERENCES BandSubmit (S_no)
;


ALTER TABLE BGSAttachedFile
	ADD FOREIGN KEY (AP_no)
	REFERENCES BGSApply (AP_no)
;


ALTER TABLE BGSHire
	ADD FOREIGN KEY (AP_no)
	REFERENCES BGSApply (AP_no)
;


ALTER TABLE BGSHire
	ADD FOREIGN KEY (BGSCO_no)
	REFERENCES BGSConcert (BGSCO_no)
;


ALTER TABLE BGSQnA
	ADD FOREIGN KEY (BGSCO_no)
	REFERENCES BGSConcert (BGSCO_no)
;


ALTER TABLE BGSReview
	ADD FOREIGN KEY (BGSCO_no)
	REFERENCES BGSConcert (BGSCO_no)
;


ALTER TABLE concertTimes
	ADD FOREIGN KEY (BGSCO_no)
	REFERENCES BGSConcert (BGSCO_no)
;


ALTER TABLE BGSApply
	ADD FOREIGN KEY (G_no)
	REFERENCES BGSGuiterlist (G_no)
;


ALTER TABLE concertTimes
	ADD FOREIGN KEY (P_no)
	REFERENCES BGSPay (P_no)
;


ALTER TABLE BandMember
	ADD FOREIGN KEY (id)
	REFERENCES Members (id)
;


ALTER TABLE BandSubmit_Comment
	ADD FOREIGN KEY (id)
	REFERENCES Members (id)
;


ALTER TABLE BGSApply
	ADD FOREIGN KEY (id)
	REFERENCES Members (id)
;


ALTER TABLE BGSGuiterlist
	ADD FOREIGN KEY (id)
	REFERENCES Members (id)
;


ALTER TABLE BGSPay
	ADD FOREIGN KEY (id)
	REFERENCES Members (id)
;


ALTER TABLE BGSQnA
	ADD FOREIGN KEY (id)
	REFERENCES Members (id)
;


ALTER TABLE BGSReview
	ADD FOREIGN KEY (id)
	REFERENCES Members (id)
;


ALTER TABLE SafePay
	ADD FOREIGN KEY (id)
	REFERENCES Members (id)
;


ALTER TABLE BandSubmit
	ADD FOREIGN KEY (P_no)
	REFERENCES Pay (P_no)
;


ALTER TABLE SafePay
	ADD FOREIGN KEY (P_no)
	REFERENCES Pay (P_no)
;


ALTER TABLE SafePay
	ADD FOREIGN KEY (R_no)
	REFERENCES Reward (R_no)
;


ALTER TABLE SafePayCancle
	ADD FOREIGN KEY (SP_No)
	REFERENCES SafePay (SP_No)
;

create sequence seq_bgsapply 
nocycle
nocache;

/* Comments */

COMMENT ON COLUMN SafePay.SP_Support IS '제품 이외 추가 후원';



