/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     01/12/2018 22:00:12                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('address') and o.name = 'FK_ADDRESS_HAVE_TOWN')
alter table address
   drop constraint FK_ADDRESS_HAVE_TOWN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('grade') and o.name = 'FK_GRADE_GRADING_STUDENT')
alter table grade
   drop constraint FK_GRADE_GRADING_STUDENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('student') and o.name = 'FK_STUDENT_LIVE_ON_ADDRESS')
alter table student
   drop constraint FK_STUDENT_LIVE_ON_ADDRESS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('subject_tutor') and o.name = 'FK_SUBJECT__SUBJECT_T_SUBJECT')
alter table subject_tutor
   drop constraint FK_SUBJECT__SUBJECT_T_SUBJECT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('subject_tutor') and o.name = 'FK_SUBJECT__SUBJECT_T_TUTOR')
alter table subject_tutor
   drop constraint FK_SUBJECT__SUBJECT_T_TUTOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('termin') and o.name = 'FK_TERMIN_GRADE_GRADE')
alter table termin
   drop constraint FK_TERMIN_GRADE_GRADE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('termin') and o.name = 'FK_TERMIN_HAS_TERMI_TUTOR')
alter table termin
   drop constraint FK_TERMIN_HAS_TERMI_TUTOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('termin') and o.name = 'FK_TERMIN_IS_LEARNI_STUDENT')
alter table termin
   drop constraint FK_TERMIN_IS_LEARNI_STUDENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('termin') and o.name = 'FK_TERMIN_TAKE_SUBJECT')
alter table termin
   drop constraint FK_TERMIN_TAKE_SUBJECT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('tutor') and o.name = 'FK_TUTOR_LIVE_ADDRESS')
alter table tutor
   drop constraint FK_TUTOR_LIVE_ADDRESS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('address')
            and   name  = 'have_FK'
            and   indid > 0
            and   indid < 255)
   drop index address.have_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('address')
            and   type = 'U')
   drop table address
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('grade')
            and   name  = 'grading_FK'
            and   indid > 0
            and   indid < 255)
   drop index grade.grading_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('grade')
            and   type = 'U')
   drop table grade
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('student')
            and   name  = 'live_on_FK'
            and   indid > 0
            and   indid < 255)
   drop index student.live_on_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('student')
            and   type = 'U')
   drop table student
go

if exists (select 1
            from  sysobjects
           where  id = object_id('subject')
            and   type = 'U')
   drop table subject
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('subject_tutor')
            and   name  = 'subject_tutor2_FK'
            and   indid > 0
            and   indid < 255)
   drop index subject_tutor.subject_tutor2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('subject_tutor')
            and   name  = 'subject_tutor_FK'
            and   indid > 0
            and   indid < 255)
   drop index subject_tutor.subject_tutor_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('subject_tutor')
            and   type = 'U')
   drop table subject_tutor
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('termin')
            and   name  = 'has_termin_FK'
            and   indid > 0
            and   indid < 255)
   drop index termin.has_termin_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('termin')
            and   name  = 'grade_FK'
            and   indid > 0
            and   indid < 255)
   drop index termin.grade_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('termin')
            and   name  = 'take_FK'
            and   indid > 0
            and   indid < 255)
   drop index termin.take_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('termin')
            and   name  = 'is_learning_FK'
            and   indid > 0
            and   indid < 255)
   drop index termin.is_learning_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('termin')
            and   type = 'U')
   drop table termin
go

if exists (select 1
            from  sysobjects
           where  id = object_id('town')
            and   type = 'U')
   drop table town
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('tutor')
            and   name  = 'live_FK'
            and   indid > 0
            and   indid < 255)
   drop index tutor.live_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tutor')
            and   type = 'U')
   drop table tutor
go

/*==============================================================*/
/* Table: address                                               */
/*==============================================================*/
create table address (
   id_address           int                  not null,
   post_number          int                  not null,
   street               varchar(30)          not null,
   house_num            int                  null,
   constraint PK_ADDRESS primary key nonclustered (id_address)
)
go

/*==============================================================*/
/* Index: have_FK                                               */
/*==============================================================*/
create index have_FK on address (
post_number ASC
)
go

/*==============================================================*/
/* Table: grade                                                 */
/*==============================================================*/
create table grade (
   id_grade             int                  not null,
   id_student           int                  not null,
   grade                int                  null,
   constraint PK_GRADE primary key nonclustered (id_grade)
)
go

/*==============================================================*/
/* Index: grading_FK                                            */
/*==============================================================*/
create index grading_FK on grade (
id_student ASC
)
go

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student (
   id_student           int                  not null,
   id_address           int                  not null,
   name                 varchar(30)          not null,
   lastname             varchar(30)          not null,
   mail                 char(30)             not null,
   password             varchar(50)          not null,
   constraint PK_STUDENT primary key nonclustered (id_student)
)
go

/*==============================================================*/
/* Index: live_on_FK                                            */
/*==============================================================*/
create index live_on_FK on student (
id_address ASC
)
go

/*==============================================================*/
/* Table: subject                                               */
/*==============================================================*/
create table subject (
   id_subject           int                  not null,
   subject              varchar(20)          not null,
   constraint PK_SUBJECT primary key nonclustered (id_subject)
)
go

/*==============================================================*/
/* Table: subject_tutor                                         */
/*==============================================================*/
create table subject_tutor (
   id_subject           int                  not null,
   id_tutor             int                  not null,
   constraint PK_SUBJECT_TUTOR primary key (id_subject, id_tutor)
)
go

/*==============================================================*/
/* Index: subject_tutor_FK                                      */
/*==============================================================*/
create index subject_tutor_FK on subject_tutor (
id_subject ASC
)
go

/*==============================================================*/
/* Index: subject_tutor2_FK                                     */
/*==============================================================*/
create index subject_tutor2_FK on subject_tutor (
id_tutor ASC
)
go

/*==============================================================*/
/* Table: termin                                                */
/*==============================================================*/
create table termin (
   id_termin            int                  not null,
   id_student           int                  null,
   id_tutor             int                  not null,
   id_grade             int                  null,
   id_subject           int                  not null,
   date                 datetime             not null,
   timestamp            timestamp            not null,
   reserved             bit                  not null,
   constraint PK_TERMIN primary key nonclustered (id_termin)
)
go

/*==============================================================*/
/* Index: is_learning_FK                                        */
/*==============================================================*/
create index is_learning_FK on termin (
id_student ASC
)
go

/*==============================================================*/
/* Index: take_FK                                               */
/*==============================================================*/
create index take_FK on termin (
id_subject ASC
)
go

/*==============================================================*/
/* Index: grade_FK                                              */
/*==============================================================*/
create index grade_FK on termin (
id_grade ASC
)
go

/*==============================================================*/
/* Index: has_termin_FK                                         */
/*==============================================================*/
create index has_termin_FK on termin (
id_tutor ASC
)
go

/*==============================================================*/
/* Table: town                                                  */
/*==============================================================*/
create table town (
   post_number          int                  not null,
   name                 varchar(30)          not null,
   constraint PK_TOWN primary key nonclustered (post_number)
)
go

/*==============================================================*/
/* Table: tutor                                                 */
/*==============================================================*/
create table tutor (
   id_tutor             int                  not null,
   id_address           int                  not null,
   name                 varchar(30)          not null,
   lastname             varchar(30)          not null,
   mail                 char(30)             not null,
   password             varchar(50)          not null,
   phone                varchar(20)          not null,
   price                int                  not null,
   constraint PK_TUTOR primary key nonclustered (id_tutor)
)
go

/*==============================================================*/
/* Index: live_FK                                               */
/*==============================================================*/
create index live_FK on tutor (
id_address ASC
)
go

alter table address
   add constraint FK_ADDRESS_HAVE_TOWN foreign key (post_number)
      references town (post_number)
go

alter table grade
   add constraint FK_GRADE_GRADING_STUDENT foreign key (id_student)
      references student (id_student)
go

alter table student
   add constraint FK_STUDENT_LIVE_ON_ADDRESS foreign key (id_address)
      references address (id_address)
go

alter table subject_tutor
   add constraint FK_SUBJECT__SUBJECT_T_SUBJECT foreign key (id_subject)
      references subject (id_subject)
go

alter table subject_tutor
   add constraint FK_SUBJECT__SUBJECT_T_TUTOR foreign key (id_tutor)
      references tutor (id_tutor)
go

alter table termin
   add constraint FK_TERMIN_GRADE_GRADE foreign key (id_grade)
      references grade (id_grade)
go

alter table termin
   add constraint FK_TERMIN_HAS_TERMI_TUTOR foreign key (id_tutor)
      references tutor (id_tutor)
go

alter table termin
   add constraint FK_TERMIN_IS_LEARNI_STUDENT foreign key (id_student)
      references student (id_student)
go

alter table termin
   add constraint FK_TERMIN_TAKE_SUBJECT foreign key (id_subject)
      references subject (id_subject)
go

alter table tutor
   add constraint FK_TUTOR_LIVE_ADDRESS foreign key (id_address)
      references address (id_address)
go

