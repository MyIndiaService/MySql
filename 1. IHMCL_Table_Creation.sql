/* Formatted on 17/10/2014 9:13:35 PM (QP5 v5.215.12089.38647) */
/*
© copyright 2014 VaaaN Infra (P) Ltd. All rights reserved.

This file contains Proprietary information of VaaaN Infra (P) Ltd.
and should be treated as proprietary and confidential.

The use, copying, disclosure or modification of the programs and/or 
source code is prohibited unless otherwise provided for in the license 
or confidential agreements.

========================================================
Author               : VaaaN Infra                  
Company              : VaaaN Infra Private Ltd.     
Date of Creation     : Jan, 2015
Last Updated        : June 12, 2015                               
========================================================
*/
/*Create tablespace INDEX */
CREATE TABLESPACE INDX
    LOGGING
    DATAFILE 'D:\app\yogesh\oradata\orcl\INDX01.DBF' SIZE 1024M
    AUTOEXTEND
    ON NEXT  500M MAXSIZE  1500M EXTENT MANAGEMENT LOCAL
    SEGMENT SPACE MANAGEMENT AUTO;

--------------------------------------------TABLE DESCRIPTIONS-------------------------------------------------

--1. IHMCL_AVC_CLASS

CREATE TABLE IHMCL_AVC_CLASS
(
            TMS_ID                 NUMBER(2),
            PLAZA_ID               NUMBER(2),
            TRANSFER_STATUS        NUMBER(2),
            AVC_CLASS_ID           NUMBER(3)              NOT NULL,
            PROFILE_ID             NUMBER(2),
            AVC_CLASS_NAME         NVARCHAR2(20),
            WHEEL_BASE_MIN         NUMBER(10,3),
            WHEEL_BASE_MAX         NUMBER(10,3),
            FIRST_AXLE_HEIGHT_MIN  NUMBER(10,3),
            FIRST_AXLE_HEIGHT_MAX  NUMBER(10,3),
            AXLE_COUNT_MIN         NUMBER(2),
            AXLE_COUNT_MAX         NUMBER(2),
            WHEEL_COUNT_MIN        NUMBER(2),
            WHEEL_COUNT_MAX        NUMBER(2),
            VEHICLE_LENGTH_MIN     NUMBER(10,3),
            VEHICLE_LENGTH_MAX     NUMBER(10,3),
            VEHICLE_HEIGHT_MIN     NUMBER(10,3),
            VEHICLE_HEIGHT_MAX     NUMBER(10,3),
            GROUND_CLEARANCE_MIN   NUMBER(10,3),
            GROUND_CLEARANCE_MAX   NUMBER(10,3),
            DESCRIPTION            NVARCHAR2(200),
            MODIFIER_ID            NUMBER(6),
            CREATION_DATE          DATE,
            MODIFICATION_DATE      DATE
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

--2. IHMCL_AVC_TRAN

CREATE TABLE IHMCL_AVC_TRAN
(
            TMS_ID                NUMBER(2),
            PLAZA_ID              NUMBER(2),
            LANE_ID               NUMBER(2),
            TRANSFER_STATUS       NUMBER(2),
            AVC_TRANSACTION_ID    NUMBER(20)              NOT NULL,
            AXLE_COUNT            NUMBER(2),
            WHEEL_COUNT           NUMBER(3),
            VEHICLE_LENGTH        NUMBER(11,2),
            GROUND_CLEARANCE      NUMBER(11,2),
            WHEEL_BASE            NUMBER(11,2),
            FIRST_AXLE_HEIGHT     NUMBER(11,2),
            VEHICLE_SPEED         NUMBER(11,2),
            SENSOR_STATUS         NUMBER(2),
            AVC_REQUEST_ID        NUMBER(20),
            AVC_CLASS_ID          NUMBER(2),
            CREATION_DATE         DATE,
            RTC_DATE              NVARCHAR2(50),
            RTC_TIME              NVARCHAR2(50),
            VEHICLE_DIRECTION     NVARCHAR2(50),
            HS1                   NVARCHAR2(50),
            HS2                   NVARCHAR2(50),
            HS3                   NVARCHAR2(50),
            HS4                   NVARCHAR2(50),
            INCIDENT_ID           NUMBER(20),
            EXTRA_FIELD           NVARCHAR2(100),
            EMBEDDED_AVC_TRAN_NO  NUMBER(20)
)
TABLESPACE SYSTEM
PCTUSED    40
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

--3. IHMCL_BLACKLIST

CREATE TABLE IHMCL_BLACKLIST
(
            TAG_ID          NVARCHAR2(30)                 NOT NULL,
            STATUS          NVARCHAR2(1)                  NOT NULL,
            EFFECTIVE_DATE  DATE,
            REASON_CODE     NVARCHAR2(20)                 NOT NULL,
            TMS_ID          NUMBER(3)                     NOT NULL,
            PLAZA_ID        NUMBER(3)                     NOT NULL,
            CREATION_DATE   DATE                          NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

--4. IHMCL_BLACKLIST_FILE

CREATE TABLE IHMCL_BLACKLIST_FILE
(
            TAG_ID          NVARCHAR2(30)                 NOT NULL,
            STATUS          NVARCHAR2(1)                  NOT NULL,
            EFFECTIVE_DATE  DATE,
            REASON_CODE     NVARCHAR2(20)                 NOT NULL,
            TMS_ID          NUMBER(3),
            PLAZA_ID        NUMBER(3),
            CONCERNED_FILE  NVARCHAR2(50)                 NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

--5. IHMCL_CCH

CREATE TABLE IHMCL_CCH
(
            CCH_ID                   NUMBER(3),
            CCH_NAME                 NVARCHAR2(50),
            IP_ADDRESS               NVARCHAR2(50),
            PORT_NUMBER              NUMBER(10),
            FTP_USER_NAME            NVARCHAR2(50),
            FTP_PASSWORD             NVARCHAR2(50),
            SSH_KEY_FING_PRINT       NVARCHAR2(500),
            CCH_FTP_FOLDER           NVARCHAR2(50),
            CCH_PUBLIC_KEY_PATH      NVARCHAR2(50),
            GPG_ENC_SENDER           NVARCHAR2(50),
            GPG_ENC_RECEIVER         NVARCHAR2(50),
            TRAN_FILE_DUMP           NVARCHAR2(50),
            ENC_TRAN_FILE_DUMP       NVARCHAR2(50),
            TRAN_FILE_SENT_DUMP      NVARCHAR2(50),
            TOLL_RECON_FILE_DUMP     NVARCHAR2(50),
            BLACKLIST_TAG_FILE_DUMP  NVARCHAR2(50),
            VIO_RECON_FILE_DUMP      NVARCHAR2(50),
            DISCOUNT_FILE_DUMP       NVARCHAR2(50),
            MEDIA_FILE_DUMP          NVARCHAR2(50),
            MEDIA_FILE_SENT_DUMP     NVARCHAR2(50),
            CCH_GIVEN_AGENCY_CODE    NVARCHAR2(50),
            CCH_GIVEN_PLAZA_CODE     NVARCHAR2(50),
            SSH_PRI_KEY_PATH         NVARCHAR2(100),
            SSH_PRI_KEY_PASS         NVARCHAR2(50),
            FILE_HEADER_ELEMENT         NVARCHAR2(50)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

--6. IHMCL_DISCOUNT

CREATE TABLE IHMCL_DISCOUNT
(
            CUSTOMER_ID           NVARCHAR2(20),
            TAG_ID                NVARCHAR2(30)           NOT NULL,
            SERIAL_NUMBER         NVARCHAR2(50),
            VEHICLE_NUMBER        NVARCHAR2(20),
            START_EFFECTIVE_DATE  DATE,
            END_EFFECTIVE_DATE    DATE,
            DISCOUNT_TYPE         NVARCHAR2(2),
            TARIFF_DESCRIPTION    NVARCHAR2(50),
            ACTION                NVARCHAR2(1)            NOT NULL,
            TMS_ID                NUMBER(3),
            PLAZA_ID              NUMBER(3),
            CONCERNED_FILE        NVARCHAR2(20)           NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

--7. IHMCL_ETC_TOLL_RECON

CREATE TABLE IHMCL_ETC_TOLL_RECON
(
            TRANSACTION_ID          NUMBER(20)            NOT NULL,
            CUSTOMER_TRIP_ID        NUMBER(10),
            TOLL_ZONE_ID            NVARCHAR2(10),
            CCH_LANE_ID             NVARCHAR2(10),
            TRANSACTION_DATETIME    DATE,
            TAG_ID                  NVARCHAR2(30),
            VEHICLE_CLASSIFICATION  NUMBER(2),
            ACCEPTED_AMOUNT         NUMBER(10,2),
            DISCOUNTED_AMOUNT       NUMBER(10,2),
            RESPONSE_CODE           NVARCHAR2(1),
            REASON_CODE             NVARCHAR2(20),
            PLATE_NUMBER            NVARCHAR2(20),
            SOURCE_FILE_ID          NVARCHAR2(50),
            TMS_ID                  NUMBER(3)             NOT NULL,
            PLAZA_ID                NUMBER(3)             NOT NULL,
            LANE_ID                 NUMBER(3),
            CONCERNED_FILE          NVARCHAR2(50)         NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

--8. IHMCL_ETC_TRAN

CREATE TABLE IHMCL_ETC_TRAN
(
            TRANSACTION_ID              NUMBER(20)        NOT NULL,
            TOLL_ZONE_ID                NVARCHAR2(10)     NOT NULL,
            CCH_LANE_ID                 NVARCHAR2(10)     NOT NULL,
            TRANSACTION_DATETIME        DATE,
            IS_VIOLATION                NUMBER(1),
            IS_EXEMPTED                 NUMBER(1),
            TAG_ID                      NVARCHAR2(30),
            TAG_READ_DATETIME           DATE,
            TAG_VEHICLE_CLASSIFICATION  NUMBER(2),
            AVC_VEHICLE_CLASSIFICATION  NUMBER(2),
            WR_IMAGE_NAME               NVARCHAR2(250),
            WR_IMAGE_DATETIME           DATE,
            RV_IMAGE_NAME               NVARCHAR2(250),
            RV_IMAGE_DATETIME           DATE,
            LANE_STATUS_ID              NVARCHAR2(1),
            LANE_MODE_ID                NVARCHAR2(1),
            TOLL_AMOUNT                 NUMBER(10,2),
            VEHICLE_DETECTION_METHOD    NVARCHAR2(15),
            IS_STRADLE                  NVARCHAR2(1),
            IS_BUFFERED                 NVARCHAR2(1),
            USER_MEMORY_TEXT            NVARCHAR2(50),
            LP_NUMBER                   NVARCHAR2(20),
            CONFIDENCE_LEVEL            NUMBER(1),
            ENTRY_TOLL_ZONE_ID          NVARCHAR2(10),
            ENTRY_LANE_ID               NVARCHAR2(10),
            ENTRY_TRANSACTION_DATETIME  DATE,
            PRICE_MODE                  NVARCHAR2(1),
            IS_OVERWEIGHT_CHARGED       NUMBER(1),
            WIM_WEIGHT                  NUMBER(10,2),
            STATIC_WEIGHT               NUMBER(10,2),
            ATTRIBUTE_1                 NVARCHAR2(20),
            ATTRIBUTE_2                 NVARCHAR2(20),
            ATTRIBUTE_3                 NVARCHAR2(20),
            ATTRIBUTE_4                 NVARCHAR2(20),
            ATTRIBUTE_5                 NVARCHAR2(20),
            ATTRIBUTE_6                 NVARCHAR2(20),
            ATTRIBUTE_7                 NVARCHAR2(20),
            ATTRIBUTE_8                 NVARCHAR2(20),
            ATTRIBUTE_9                 NVARCHAR2(20),
            ATTRIBUTE_10                NVARCHAR2(20),
            TMS_ID                      NUMBER(3)         NOT NULL,
            PLAZA_ID                    NUMBER(3)         NOT NULL,
            LANE_ID                     NUMBER(3)         NOT NULL,
            AVC_TRANSACTION_ID          NUMBER(10),
            IS_TRANSFERED               NUMBER(1),
            CREATION_DATE_TIME          DATE,
            CCH_ID                      NUMBER(3)         NOT NULL,
            RFID_READER_TYPE            NUMBER(1),
            FILE_NAME                   NVARCHAR2(50),
            TOLL_RECON_STATUS           NUMBER(1),
            VIO_RECON_STATUS            NUMBER(1),
            IS_AUDITED    NUMBER(1),
            AUDIT_AMOUNT    NUMBER(10,2),
            AUDIT_COMMENT NVARCHAR2(50),
            AUDIT_CLASS NUMBER(3)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

--9. IHMCL_ETC_VIO_RECON

CREATE TABLE IHMCL_ETC_VIO_RECON
(
            TRANSACTION_ID          NUMBER(20)            NOT NULL,
            CUSTOMER_TRIP_ID        NUMBER(10),
            TOLL_ZONE_ID            NVARCHAR2(10),
            CCH_LANE_ID             NVARCHAR2(10),
            TRANSACTION_DATE_TIME   DATE,
            TAG_ID                  NVARCHAR2(30),
            VEHICLE_CLASSIFICATION  NUMBER(2),
            ACCEPTED_AMOUNT         NUMBER(10,2),
            DISCOUNTED_AMOUNT       NUMBER(10,2),
            RESPONSE_CODE           NVARCHAR2(1),
            REASON_CODE             NVARCHAR2(20),
            PLATE_NUMBER            NVARCHAR2(20),
            SOURCE_FILE_ID          NVARCHAR2(50),
            TMS_ID                  NUMBER(3),
            PLAZA_ID                NUMBER(3),
            LANE_ID                 NUMBER(3),
            CONCERNED_FILE          NVARCHAR2(50)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

--10. IHMCL_FILE_TRAN

CREATE TABLE IHMCL_FILE_TRAN
(
            SERIAL_NUMBER              NUMBER(20),
            TMS_ID                     NUMBER(3),
            PLAZA_ID                   NUMBER(3),
            FILE_TRANSCEIVE_DATE_TIME  DATE,
            FILE_NAME                  NVARCHAR2(50),
            ORIGINATED_AT              NVARCHAR2(50),
            DESTINED_TO                NVARCHAR2(50)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

--11. IHMCL_LANE

CREATE TABLE IHMCL_LANE
(
            TMS_ID        NUMBER(3),
            PLAZA_ID        NUMBER(3),
            LANE_ID        NUMBER(3),
            LANE_NAME        NVARCHAR2(100),
            DIRECTION        NVARCHAR2(20),
            IP_ADDRESS    NVARCHAR2(50)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

--12. IHMCL_PLAZA

CREATE TABLE IHMCL_PLAZA
(
            TMS_ID      NUMBER(3),
            PLAZA_ID    NUMBER(3),
            PLAZA_NAME  NVARCHAR2(50),
            IP_ADDRESS  NVARCHAR2(50)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

--13. IHMCL_TOLL_RATE

CREATE TABLE IHMCL_TOLL_RATE
(
            TMS_ID                NUMBER (2),
            PLAZA_ID                NUMBER (2),
            TRANSFER_STATUS        NUMBER (2),
            RATE_ID                NUMBER (5) NOT NULL,
            PROFILE_ID            NUMBER (2),
            JOURNEY_ID            NUMBER (2),
            VEHICLE_CLASS_ID        NUMBER (2),
            SUBCLASS_ID            NUMBER (2),
            FARE_ID                NUMBER (2),
            RATE_TYPE            NUMBER (1),
            DAY_OF_WEEK            NUMBER (5),
            PRIORITY                NUMBER (1),
            AMOUNT                DECIMAL (5, 2),
            EFFECTIVE_DATE        DATE,
            START_TIME            DATE,
            END_TIME                DATE,
            DESCRIPTION            NVARCHAR2 (100),
            SHORTCUT_KEY            NVARCHAR2 (10),
            MODIFIER_ID            NUMBER (6),
            CREATION_DATE        DATE,
            MODIFICATION_DATE    DATE
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

--14. IHMCL_CCH_VEHICLE_CLASS

CREATE TABLE IHMCL_CCH_VEHICLE_CLASS
(
            TMS_ID              NUMBER(3),
            PLAZA_ID            NUMBER(3),
            CCH_ID              NUMBER(3),
            VEHICLE_CLASS_ID    NUMBER(3),
            VEHICLE_CLASS_DESC  NVARCHAR2(100),
            MAPPED_CLASS_ID NUMBER(3)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

CREATE TABLE IHMCL_SHIFT
(
   TMS_ID              NUMBER (2),
   PLAZA_ID            NUMBER (2),
   TRANSFER_STATUS     NUMBER (2),
   SHIFT_ID            NUMBER (2) NOT NULL,
   SHIFT_NAME          NVARCHAR2 (20),
   DESCRIPTION         NVARCHAR2 (30),
   START_TIME          NVARCHAR2 (50),
   END_TIME            NVARCHAR2 (50),
   PROFILE_ID          NUMBER (2),
   MODIFIER_ID         NUMBER (6),
   CREATION_DATE       DATE,
   MODIFICATION_DATE   DATE
)
TABLESPACE USERS
PCTUSED 0
PCTFREE 10
INITRANS 1
MAXTRANS 255
STORAGE (INITIAL 64 K
         MINEXTENTS 1
         MAXEXTENTS 2147483645
         PCTINCREASE 0);
ALTER TABLE IHMCL_SHIFT ADD (
  PRIMARY KEY
 (TMS_ID,PLAZA_ID,SHIFT_ID)
    USING INDEX
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));

CREATE TABLE IHMCL_JOURNEY
(
   TMS_ID              NUMBER (2),
   PLAZA_ID            NUMBER (2),
   TRANSFER_STATUS     NUMBER (2),
   JOURNEY_ID          NUMBER (2) NOT NULL,
   SOURCE_PLAZA_ID     NUMBER (2),
   DEST_PLAZA_ID       NUMBER (2),
   JOURNEY_NAME        NVARCHAR2 (100),
   IS_GUI_VISIBLE      NUMBER (1),
   DESCRIPTION         NVARCHAR2 (100),
   SHORTCUT_KEY        NVARCHAR2 (4),
   MODIFIER_ID         NUMBER (6),
   CREATION_DATE       DATE,
   MODIFICATION_DATE   DATE
)
TABLESPACE USERS
PCTUSED 0
PCTFREE 10
INITRANS 1
MAXTRANS 255
STORAGE (INITIAL 64 K
         MINEXTENTS 1
         MAXEXTENTS 2147483645
         PCTINCREASE 0
         BUFFER_POOL DEFAULT);


ALTER TABLE IHMCL_JOURNEY ADD (
  PRIMARY KEY
 (TMS_ID,PLAZA_ID,JOURNEY_ID)
    USING INDEX
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));



--------------------------------------------INDEX DESCRIPTIONS-------------------------------------------------


CREATE UNIQUE INDEX IHMCL_AVC_CLASS_PK ON IHMCL_AVC_CLASS
(TMS_ID, PLAZA_ID, AVC_CLASS_ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX IHMCL_AVC_TRAN_PK ON IHMCL_AVC_TRAN
(TMS_ID, PLAZA_ID, LANE_ID, AVC_TRANSACTION_ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX IHMCL_BLACKLIST_PK ON IHMCL_BLACKLIST
(TMS_ID, PLAZA_ID, TAG_ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX IHMCL_BLACKLIST_FILE_PK ON IHMCL_BLACKLIST_FILE
(TMS_ID, PLAZA_ID, TAG_ID, CONCERNED_FILE)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX IHMCL_CCH_PK ON IHMCL_CCH
(CCH_ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX IHMCL_DISCOUNT_PK ON IHMCL_DISCOUNT
(TMS_ID, PLAZA_ID, TAG_ID, CONCERNED_FILE)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX IHMCL_ETC_TOLL_RECON_PK ON IHMCL_ETC_TOLL_RECON
(TMS_ID, PLAZA_ID, LANE_ID, TRANSACTION_ID, CONCERNED_FILE)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX IHMCL_ETC_TRAN_PK ON IHMCL_ETC_TRAN
(TMS_ID, PLAZA_ID, LANE_ID, TRANSACTION_ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX IHMCL_ETC_VIO_RECON_PK ON IHMCL_ETC_VIO_RECON
(TMS_ID, PLAZA_ID, LANE_ID, TRANSACTION_ID, CONCERNED_FILE)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX IHMCL_FILE_TRAN_PK ON IHMCL_FILE_TRAN
(TMS_ID, PLAZA_ID, FILE_NAME)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX IHMCL_LANE_PK ON IHMCL_LANE
(TMS_ID, PLAZA_ID, LANE_ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX IHMCL_PLAZA_PK ON IHMCL_PLAZA
(TMS_ID, PLAZA_ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX IHMCL_TOLL_RATE_PK ON IHMCL_TOLL_RATE
(TMS_ID, PLAZA_ID, RATE_ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX IHMCL_CCH_VEHICLE_CLASS_PK ON IHMCL_CCH_VEHICLE_CLASS
(TMS_ID, PLAZA_ID, CCH_ID, VEHICLE_CLASS_ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

--------------------------------------------CONSTRAINTS DESCRIPTIONS-------------------------------------------------

    ALTER TABLE IHMCL_AVC_CLASS ADD (
    CONSTRAINT IHMCL_AVC_CLASS_PK
    PRIMARY KEY
    (TMS_ID, PLAZA_ID, AVC_CLASS_ID)
    USING INDEX IHMCL_AVC_CLASS_PK
    ENABLE VALIDATE);

    ALTER TABLE IHMCL_AVC_TRAN ADD (
    CONSTRAINT IHMCL_AVC_TRAN_PK
    PRIMARY KEY
    (TMS_ID, PLAZA_ID, LANE_ID, AVC_TRANSACTION_ID)
    USING INDEX IHMCL_AVC_TRAN_PK
    ENABLE VALIDATE);

    ALTER TABLE IHMCL_BLACKLIST ADD (
    CONSTRAINT IHMCL_BLACKLIST_PK
    PRIMARY KEY
    (TMS_ID, PLAZA_ID, TAG_ID)
    USING INDEX IHMCL_BLACKLIST_PK
    ENABLE VALIDATE);

    ALTER TABLE IHMCL_BLACKLIST_FILE ADD (
    CONSTRAINT IHMCL_BLACKLIST_FILE_PK
    PRIMARY KEY
    (TMS_ID, PLAZA_ID, TAG_ID ,CONCERNED_FILE)
    USING INDEX IHMCL_BLACKLIST_FILE_PK
    ENABLE VALIDATE);

    ALTER TABLE IHMCL_CCH ADD (
    CONSTRAINT IHMCL_CCH_PK
    PRIMARY KEY
    (CCH_ID)
    USING INDEX IHMCL_CCH_PK
    ENABLE VALIDATE);

    ALTER TABLE IHMCL_DISCOUNT ADD (
    CONSTRAINT IHMCL_DISCOUNT_PK
    PRIMARY KEY
    (TMS_ID, PLAZA_ID, TAG_ID, CONCERNED_FILE)
    USING INDEX IHMCL_DISCOUNT_PK
    ENABLE VALIDATE);

    ALTER TABLE IHMCL_ETC_TOLL_RECON ADD (
    CONSTRAINT IHMCL_ETC_TOLL_RECON_PK
    PRIMARY KEY
    (TMS_ID, PLAZA_ID, LANE_ID, TRANSACTION_ID, CONCERNED_FILE)
    USING INDEX IHMCL_ETC_TOLL_RECON_PK
    ENABLE VALIDATE);

    ALTER TABLE IHMCL_ETC_TRAN ADD (
    CONSTRAINT IHMCL_ETC_TRAN_PK
    PRIMARY KEY
    (TMS_ID, PLAZA_ID, LANE_ID, TRANSACTION_ID)
    USING INDEX IHMCL_ETC_TRAN_PK
    ENABLE VALIDATE);

    ALTER TABLE IHMCL_ETC_VIO_RECON ADD (
    CONSTRAINT IHMCL_ETC_VIO_RECON_PK
    PRIMARY KEY
    (TMS_ID, PLAZA_ID, LANE_ID, TRANSACTION_ID, CONCERNED_FILE)
    USING INDEX IHMCL_ETC_VIO_RECON_PK
    ENABLE VALIDATE);

    ALTER TABLE IHMCL_FILE_TRAN ADD (
    CONSTRAINT IHMCL_FILE_TRAN_PK
    PRIMARY KEY
    (TMS_ID, PLAZA_ID, FILE_NAME)
    USING INDEX IHMCL_FILE_TRAN_PK
    ENABLE VALIDATE);

    ALTER TABLE IHMCL_LANE ADD (
    CONSTRAINT IHMCL_LANE_PK
    PRIMARY KEY
    (TMS_ID, PLAZA_ID, LANE_ID)
    USING INDEX IHMCL_LANE_PK
    ENABLE VALIDATE);

    ALTER TABLE IHMCL_PLAZA ADD (
    CONSTRAINT IHMCL_PLAZA_PK
    PRIMARY KEY
    (TMS_ID, PLAZA_ID)
    USING INDEX IHMCL_PLAZA_PK
    ENABLE VALIDATE);

    ALTER TABLE IHMCL_TOLL_RATE ADD (
    CONSTRAINT IHMCL_TOLL_RATE_PK
    PRIMARY KEY
    (TMS_ID, PLAZA_ID, RATE_ID)
    USING INDEX IHMCL_TOLL_RATE_PK
    ENABLE VALIDATE);

    ALTER TABLE IHMCL_CCH_VEHICLE_CLASS ADD (
    CONSTRAINT IHMCL_CCH_VEHICLE_CLASS_PK
    PRIMARY KEY
    (TMS_ID, PLAZA_ID, CCH_ID, VEHICLE_CLASS_ID)
    USING INDEX IHMCL_CCH_VEHICLE_CLASS_PK
    ENABLE VALIDATE);

-------------------------------------------------------------------

    COMMIT;

-------------------------------------------------------------------

