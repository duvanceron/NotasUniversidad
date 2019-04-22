/*
Navicat Oracle Data Transfer
Oracle Client Version : 10.2.0.5.0

Source Server         : CURSOSSEMINARIOS
Source Server Version : 120200
Source Host           : localhost:1521
Source Schema         : CURSOSSEMINARIOS

Target Server Type    : ORACLE
Target Server Version : 120200
File Encoding         : 65001

Date: 2019-04-22 11:43:04
*/


-- ----------------------------
-- Table structure for ACUERDO
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."ACUERDO";
CREATE TABLE "CURSOSSEMINARIOS"."ACUERDO" (
"ACUE_ID" NUMBER NOT NULL ,
"ACUE_NOMBRE" VARCHAR2(100 BYTE) NULL ,
"ACUE_ESTADO" VARCHAR2(100 BYTE) NULL ,
"GRUP_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of ACUERDO
-- ----------------------------

-- ----------------------------
-- Table structure for CALENDARIOACADEMICO
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."CALENDARIOACADEMICO";
CREATE TABLE "CURSOSSEMINARIOS"."CALENDARIOACADEMICO" (
"CALA_ID" NUMBER NOT NULL ,
"CALA_NOMBRE" VARCHAR2(100 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of CALENDARIOACADEMICO
-- ----------------------------
INSERT INTO "CURSOSSEMINARIOS"."CALENDARIOACADEMICO" VALUES ('1', 'CALENDARIO ACADEMICO 2019-I');

-- ----------------------------
-- Table structure for CALIFICACION
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."CALIFICACION";
CREATE TABLE "CURSOSSEMINARIOS"."CALIFICACION" (
"CALI_ID" NUMBER NOT NULL ,
"NOTA_ID" NUMBER NOT NULL ,
"CALI_VALOR" NUMBER NULL ,
"PREM_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of CALIFICACION
-- ----------------------------
INSERT INTO "CURSOSSEMINARIOS"."CALIFICACION" VALUES ('1', '5', '5', '2');
INSERT INTO "CURSOSSEMINARIOS"."CALIFICACION" VALUES ('3', '3', '5', '2');
INSERT INTO "CURSOSSEMINARIOS"."CALIFICACION" VALUES ('4', '2', '5', '2');
INSERT INTO "CURSOSSEMINARIOS"."CALIFICACION" VALUES ('2', '4', '5', '2');
INSERT INTO "CURSOSSEMINARIOS"."CALIFICACION" VALUES ('5', '1', '5', '2');

-- ----------------------------
-- Table structure for CATEGORIAPROFESOR
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."CATEGORIAPROFESOR";
CREATE TABLE "CURSOSSEMINARIOS"."CATEGORIAPROFESOR" (
"CATP_ID" NUMBER NOT NULL ,
"CATP_NOMBRE" VARCHAR2(100 BYTE) NULL ,
"CATP_VALORINTENSIVOSM" NUMBER NULL ,
"CATP_VALORSEMINARIOSM" NUMBER NULL ,
"INCR_ID" NUMBER NULL ,
"CATP_PUNTOS" NUMBER NULL ,
"PUNC_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of CATEGORIAPROFESOR
-- ----------------------------

-- ----------------------------
-- Table structure for COSTO
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."COSTO";
CREATE TABLE "CURSOSSEMINARIOS"."COSTO" (
"COST_ID" NUMBER NOT NULL ,
"COST_VALORSALARIOSMINIMOS" NUMBER DEFAULT 0  NULL ,
"SALM_ID" NUMBER NULL ,
"COST_FORMULA" VARCHAR2(50 BYTE) NULL ,
"COST_TOTAL" NUMBER DEFAULT 0  NULL ,
"COST_INDIVIDUAL" NUMBER DEFAULT 0  NULL ,
"COST_PAGODOCENTE" NUMBER DEFAULT 0  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of COSTO
-- ----------------------------
INSERT INTO "CURSOSSEMINARIOS"."COSTO" VALUES ('1', '0', null, null, '0', '0', '0');

-- ----------------------------
-- Table structure for CURSO
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."CURSO";
CREATE TABLE "CURSOSSEMINARIOS"."CURSO" (
"CURS_ID" NUMBER NOT NULL ,
"CURS_NOMBRE" VARCHAR2(100 BYTE) NULL ,
"CURS_ESTADO" VARCHAR2(100 BYTE) NULL ,
"CURS_CANTMINIMA" NUMBER NULL ,
"CURS_CANTMAXIMA" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of CURSO
-- ----------------------------
INSERT INTO "CURSOSSEMINARIOS"."CURSO" VALUES ('1', 'SEMINARIOS DE PROFUNDIZACIÓN', null, null, null);
INSERT INTO "CURSOSSEMINARIOS"."CURSO" VALUES ('2', 'CURSOS INTENSIVOS', null, null, null);

-- ----------------------------
-- Table structure for DETALLEDOCENTE
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."DETALLEDOCENTE";
CREATE TABLE "CURSOSSEMINARIOS"."DETALLEDOCENTE" (
"DETD_ID" NUMBER NOT NULL ,
"DOCE_ID" NUMBER NOT NULL ,
"GRUP_ID" NUMBER NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of DETALLEDOCENTE
-- ----------------------------
INSERT INTO "CURSOSSEMINARIOS"."DETALLEDOCENTE" VALUES ('2', '57425471', '2');
INSERT INTO "CURSOSSEMINARIOS"."DETALLEDOCENTE" VALUES ('1', '57425471', '1');

-- ----------------------------
-- Table structure for GRUPO
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."GRUPO";
CREATE TABLE "CURSOSSEMINARIOS"."GRUPO" (
"GRUP_ID" NUMBER NOT NULL ,
"GRUP_NOMBRE" VARCHAR2(500 BYTE) NOT NULL ,
"GRUP_TEMA" VARCHAR2(200 BYTE) NULL ,
"GRUP_ESTADO" VARCHAR2(50 BYTE) DEFAULT 'PENDIENTE'  NULL ,
"ASIG_ID" NUMBER NULL ,
"COST_ID" NUMBER NULL ,
"CURS_ID" NUMBER NULL ,
"PERI_ID" NUMBER NULL ,
"CALA_ID" NUMBER NULL ,
"GRUP_CUPOS" NUMBER DEFAULT 30  NULL ,
"INTH_ID" NUMBER NULL ,
"PROA_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of GRUPO
-- ----------------------------
INSERT INTO "CURSOSSEMINARIOS"."GRUPO" VALUES ('1', 'SEMINARIO DE PROFUNDIZACIÓN EN GESTIÓN DE CALIDAD', 'TERRITORIO, PAZ Y POS-ACUERDO', 'PENDIENTE', null, '1', '1', '1', '1', '30', null, '1');
INSERT INTO "CURSOSSEMINARIOS"."GRUPO" VALUES ('2', 'NIVELATORIO MODELOS I', null, 'PENDIENTE', '1', '1', '2', '1', '1', '30', null, null);

-- ----------------------------
-- Table structure for GRUPOHORARIO
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."GRUPOHORARIO";
CREATE TABLE "CURSOSSEMINARIOS"."GRUPOHORARIO" (
"GRUH_ID" NUMBER NOT NULL ,
"GRUP_ID" NUMBER NOT NULL ,
"HORA_ID" NUMBER NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of GRUPOHORARIO
-- ----------------------------

-- ----------------------------
-- Table structure for GRUPORECURSO
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."GRUPORECURSO";
CREATE TABLE "CURSOSSEMINARIOS"."GRUPORECURSO" (
"GRUR_ID" NUMBER NOT NULL ,
"RECF_ID" NUMBER NOT NULL ,
"GRUP_ID" NUMBER NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of GRUPORECURSO
-- ----------------------------

-- ----------------------------
-- Table structure for HORARIO
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."HORARIO";
CREATE TABLE "CURSOSSEMINARIOS"."HORARIO" (
"HORA_ID" NUMBER NOT NULL ,
"HORA_DIA" VARCHAR2(50 BYTE) NULL ,
"HORA_INICIO" DATE NULL ,
"HORA_FIN" DATE NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of HORARIO
-- ----------------------------

-- ----------------------------
-- Table structure for INCREMENTO
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."INCREMENTO";
CREATE TABLE "CURSOSSEMINARIOS"."INCREMENTO" (
"INCR_ID" NUMBER NOT NULL ,
"INCR_CANTIDAD" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of INCREMENTO
-- ----------------------------

-- ----------------------------
-- Table structure for INTENSIDADHORARIA
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."INTENSIDADHORARIA";
CREATE TABLE "CURSOSSEMINARIOS"."INTENSIDADHORARIA" (
"INTH_ID" NUMBER NOT NULL ,
"INTH_PRESENCIAL" NUMBER NULL ,
"INTH_DIRIGIDO" NUMBER NULL ,
"INTH_DEPENDIENTE" NUMBER NULL ,
"INTH_TOTAL" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of INTENSIDADHORARIA
-- ----------------------------

-- ----------------------------
-- Table structure for NOTA
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."NOTA";
CREATE TABLE "CURSOSSEMINARIOS"."NOTA" (
"NOTA_ID" NUMBER NOT NULL ,
"NOTA_NOMBRE" VARCHAR2(50 BYTE) NULL ,
"NOTA_PORCENTAJE" NUMBER NULL ,
"GRUP_ID" NUMBER NULL ,
"SISE_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of NOTA
-- ----------------------------
INSERT INTO "CURSOSSEMINARIOS"."NOTA" VALUES ('1', 'NOTA 5', '10', '1', '2');
INSERT INTO "CURSOSSEMINARIOS"."NOTA" VALUES ('2', 'NOTA 4', '20', '1', '1');
INSERT INTO "CURSOSSEMINARIOS"."NOTA" VALUES ('3', 'NOTA 3', '20', '1', '1');
INSERT INTO "CURSOSSEMINARIOS"."NOTA" VALUES ('4', 'NOTA 2', '20', '1', '1');
INSERT INTO "CURSOSSEMINARIOS"."NOTA" VALUES ('5', 'NOTA 1', '10', '1', '1');

-- ----------------------------
-- Table structure for PERIODO
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."PERIODO";
CREATE TABLE "CURSOSSEMINARIOS"."PERIODO" (
"PERI_ID" NUMBER NOT NULL ,
"PERI_NOMBRE" VARCHAR2(50 BYTE) NULL ,
"PERI_AÑO" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PERIODO
-- ----------------------------
INSERT INTO "CURSOSSEMINARIOS"."PERIODO" VALUES ('1', 'PERIODO 2019-I', '2019');

-- ----------------------------
-- Table structure for PREMATRICULA
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."PREMATRICULA";
CREATE TABLE "CURSOSSEMINARIOS"."PREMATRICULA" (
"PREM_ID" NUMBER NOT NULL ,
"ESTU_ID" NUMBER NOT NULL ,
"GRUP_ID" NUMBER NOT NULL ,
"PREM_NOTAFINAL" NUMBER NULL ,
"PREM_ESTADO" VARCHAR2(50 BYTE) DEFAULT 'PENDIENTE'  NULL ,
"PREM_FALLAS" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PREMATRICULA
-- ----------------------------
INSERT INTO "CURSOSSEMINARIOS"."PREMATRICULA" VALUES ('1', '53253534', '1', null, 'MATRICULADO', null);
INSERT INTO "CURSOSSEMINARIOS"."PREMATRICULA" VALUES ('2', '3463464', '1', '4', 'MATRICULADO', null);
INSERT INTO "CURSOSSEMINARIOS"."PREMATRICULA" VALUES ('3', '4325664', '1', null, 'MATRICULADO', null);

-- ----------------------------
-- Table structure for PUNTOCATEGORIA
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."PUNTOCATEGORIA";
CREATE TABLE "CURSOSSEMINARIOS"."PUNTOCATEGORIA" (
"PUNC_ID" NUMBER NOT NULL ,
"PUNC_VALOR" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of PUNTOCATEGORIA
-- ----------------------------

-- ----------------------------
-- Table structure for RECURSOFISICO
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."RECURSOFISICO";
CREATE TABLE "CURSOSSEMINARIOS"."RECURSOFISICO" (
"RECF_ID" NUMBER NOT NULL ,
"RECF_NOMENCLATURA" VARCHAR2(50 BYTE) NOT NULL ,
"RECF_NOMBRE" VARCHAR2(50 BYTE) NULL ,
"RECF_LOCALIDAD" VARCHAR2(50 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of RECURSOFISICO
-- ----------------------------

-- ----------------------------
-- Table structure for SALARIOMINIMO
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."SALARIOMINIMO";
CREATE TABLE "CURSOSSEMINARIOS"."SALARIOMINIMO" (
"SALM_ID" NUMBER NOT NULL ,
"SALM_VALOR" NUMBER NULL ,
"SALM_AÑO" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of SALARIOMINIMO
-- ----------------------------

-- ----------------------------
-- Table structure for SISTEMAEVALUACION
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."SISTEMAEVALUACION";
CREATE TABLE "CURSOSSEMINARIOS"."SISTEMAEVALUACION" (
"SISE_ID" NUMBER NOT NULL ,
"SISE_NOMBRE" VARCHAR2(250 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of SISTEMAEVALUACION
-- ----------------------------
INSERT INTO "CURSOSSEMINARIOS"."SISTEMAEVALUACION" VALUES ('1', 'PARCIAL 70%');
INSERT INTO "CURSOSSEMINARIOS"."SISTEMAEVALUACION" VALUES ('2', 'PARCIAL 30%');

-- ----------------------------
-- Table structure for VS_ASIGNATURA
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."VS_ASIGNATURA";
CREATE TABLE "CURSOSSEMINARIOS"."VS_ASIGNATURA" (
"ASIG_ID" NUMBER NOT NULL ,
"ASIG_NOMBRE" VARCHAR2(50 BYTE) NULL ,
"ASIG_CREDITOS" NUMBER NULL ,
"ASIG_PENSUM" VARCHAR2(50 BYTE) NULL ,
"ASIG_PROGRAMA" VARCHAR2(50 BYTE) NULL ,
"ASIG_MODALIDAD" VARCHAR2(50 BYTE) NULL ,
"ASIG_JORNADA" VARCHAR2(50 BYTE) NULL ,
"ASIG_FACULTAD" VARCHAR2(50 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of VS_ASIGNATURA
-- ----------------------------
INSERT INTO "CURSOSSEMINARIOS"."VS_ASIGNATURA" VALUES ('1', 'Métodos Numéricos', '3', null, 'Ingenieria de Sistemas', null, null, null);

-- ----------------------------
-- Table structure for VS_DOCENTE
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."VS_DOCENTE";
CREATE TABLE "CURSOSSEMINARIOS"."VS_DOCENTE" (
"DOCE_ID" NUMBER NOT NULL ,
"DOCE_TIPODUMENTO" VARCHAR2(50 BYTE) NULL ,
"DOCE_NUMERODOCUMENTO" NUMBER NULL ,
"DOCE_PRIMERNOMBRE" VARCHAR2(50 BYTE) NULL ,
"DOCE_SEGUNDONOMBRE" VARCHAR2(50 BYTE) NULL ,
"DOCE_PRIMERAPELLIDO" VARCHAR2(50 BYTE) NULL ,
"DOCE_SEGUNDOAPELLIDO" VARCHAR2(50 BYTE) NULL ,
"DOCE_GENERO" VARCHAR2(50 BYTE) NULL ,
"DOCE_CORREO" VARCHAR2(100 BYTE) NULL ,
"CATP_ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of VS_DOCENTE
-- ----------------------------
INSERT INTO "CURSOSSEMINARIOS"."VS_DOCENTE" VALUES ('57425471', 'CEDULA', '10835863', 'LUIS', 'FERNANDO', 'ARGOTE', 'MALES', null, null, null);

-- ----------------------------
-- Table structure for VS_ESTUDIANTE
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."VS_ESTUDIANTE";
CREATE TABLE "CURSOSSEMINARIOS"."VS_ESTUDIANTE" (
"ESTU_ID" NUMBER NOT NULL ,
"ESTU_TIPODUMENTO" VARCHAR2(50 BYTE) NULL ,
"ESTU_NUMERODOCUMENTO" NUMBER NULL ,
"ESTU_PRIMERNOMBRE" VARCHAR2(50 BYTE) NULL ,
"ESTU_SEGUNDONOMBRE" VARCHAR2(50 BYTE) NULL ,
"ESTU_PRIMERAPELLIDO" VARCHAR2(50 BYTE) NULL ,
"ESTU_SEGUNDOAPELLIDO" VARCHAR2(50 BYTE) NULL ,
"ESTU_GENERO" VARCHAR2(50 BYTE) NULL ,
"ESTU_CORREO" VARCHAR2(100 BYTE) NULL ,
"ESTU_SEMESTRE" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of VS_ESTUDIANTE
-- ----------------------------
INSERT INTO "CURSOSSEMINARIOS"."VS_ESTUDIANTE" VALUES ('4325664', 'CEDULA', '1645474575', 'STEFANNIA ', null, 'TORRES ', 'GONZALES ', 'FEMENINO', 'st.torres@udla.edu.co', '8');
INSERT INTO "CURSOSSEMINARIOS"."VS_ESTUDIANTE" VALUES ('53253534', 'CEDULA', '1084259362', 'MARIA ', 'ANGELA ', 'JIMENEZ ', 'ARGOTE', 'FEMENINO', 'en.cero@udla.edu.co', '7');
INSERT INTO "CURSOSSEMINARIOS"."VS_ESTUDIANTE" VALUES ('3463464', 'CEDULA', '1083795343', 'MANUEL ', 'ALEJANDRO ', 'SAMBONI ', 'SEMANATE', 'MASCULINO', 'ma.samboni@udla.edu.co', '9');
INSERT INTO "CURSOSSEMINARIOS"."VS_ESTUDIANTE" VALUES ('2424234', 'CEDULA', '1975398232', 'MARTIN ', 'FERNANDO ', 'GONZALES ', 'VILLANUEVA', 'MASCULINO', 'mar.gonzales@udla.edu.co', '5');

-- ----------------------------
-- Table structure for VS_PROGRAMAACADEMICO
-- ----------------------------
DROP TABLE "CURSOSSEMINARIOS"."VS_PROGRAMAACADEMICO";
CREATE TABLE "CURSOSSEMINARIOS"."VS_PROGRAMAACADEMICO" (
"PROA_ID" NUMBER NOT NULL ,
"PROA_NOMBRE" VARCHAR2(50 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of VS_PROGRAMAACADEMICO
-- ----------------------------
INSERT INTO "CURSOSSEMINARIOS"."VS_PROGRAMAACADEMICO" VALUES ('1', 'Ingenieria De Sistemas');

-- ----------------------------
-- Indexes structure for table ACUERDO
-- ----------------------------

-- ----------------------------
-- Checks structure for table ACUERDO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."ACUERDO" ADD CHECK ("ACUE_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."ACUERDO" ADD CHECK ("ACUE_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ACUERDO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."ACUERDO" ADD PRIMARY KEY ("ACUE_ID");

-- ----------------------------
-- Indexes structure for table CALENDARIOACADEMICO
-- ----------------------------

-- ----------------------------
-- Checks structure for table CALENDARIOACADEMICO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."CALENDARIOACADEMICO" ADD CHECK ("CALA_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."CALENDARIOACADEMICO" ADD CHECK ("CALA_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table CALENDARIOACADEMICO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."CALENDARIOACADEMICO" ADD PRIMARY KEY ("CALA_ID");

-- ----------------------------
-- Indexes structure for table CALIFICACION
-- ----------------------------

-- ----------------------------
-- Checks structure for table CALIFICACION
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."CALIFICACION" ADD CHECK ("CALI_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."CALIFICACION" ADD CHECK ("NOTA_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."CALIFICACION" ADD CHECK ("CALI_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."CALIFICACION" ADD CHECK ("NOTA_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table CALIFICACION
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."CALIFICACION" ADD PRIMARY KEY ("CALI_ID");

-- ----------------------------
-- Indexes structure for table CATEGORIAPROFESOR
-- ----------------------------

-- ----------------------------
-- Checks structure for table CATEGORIAPROFESOR
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."CATEGORIAPROFESOR" ADD CHECK ("CATP_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."CATEGORIAPROFESOR" ADD CHECK ("CATP_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table CATEGORIAPROFESOR
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."CATEGORIAPROFESOR" ADD PRIMARY KEY ("CATP_ID");

-- ----------------------------
-- Indexes structure for table COSTO
-- ----------------------------

-- ----------------------------
-- Checks structure for table COSTO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."COSTO" ADD CHECK ("COST_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."COSTO" ADD CHECK ("COST_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table COSTO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."COSTO" ADD PRIMARY KEY ("COST_ID");

-- ----------------------------
-- Indexes structure for table CURSO
-- ----------------------------

-- ----------------------------
-- Checks structure for table CURSO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."CURSO" ADD CHECK ("CURS_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."CURSO" ADD CHECK ("CURS_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table CURSO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."CURSO" ADD PRIMARY KEY ("CURS_ID");

-- ----------------------------
-- Indexes structure for table DETALLEDOCENTE
-- ----------------------------

-- ----------------------------
-- Checks structure for table DETALLEDOCENTE
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."DETALLEDOCENTE" ADD CHECK ("DETD_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."DETALLEDOCENTE" ADD CHECK ("DOCE_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."DETALLEDOCENTE" ADD CHECK ("GRUP_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."DETALLEDOCENTE" ADD CHECK ("DOCE_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."DETALLEDOCENTE" ADD CHECK ("GRUP_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table DETALLEDOCENTE
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."DETALLEDOCENTE" ADD PRIMARY KEY ("DETD_ID");

-- ----------------------------
-- Indexes structure for table GRUPO
-- ----------------------------

-- ----------------------------
-- Checks structure for table GRUPO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."GRUPO" ADD CHECK ("GRUP_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."GRUPO" ADD CHECK ("GRUP_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."GRUPO" ADD CHECK ("GRUP_NOMBRE" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table GRUPO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."GRUPO" ADD PRIMARY KEY ("GRUP_ID");

-- ----------------------------
-- Indexes structure for table GRUPOHORARIO
-- ----------------------------

-- ----------------------------
-- Checks structure for table GRUPOHORARIO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."GRUPOHORARIO" ADD CHECK ("GRUH_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."GRUPOHORARIO" ADD CHECK ("GRUP_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."GRUPOHORARIO" ADD CHECK ("HORA_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."GRUPOHORARIO" ADD CHECK ("GRUH_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."GRUPOHORARIO" ADD CHECK ("GRUP_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."GRUPOHORARIO" ADD CHECK ("HORA_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table GRUPOHORARIO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."GRUPOHORARIO" ADD PRIMARY KEY ("GRUH_ID");

-- ----------------------------
-- Indexes structure for table GRUPORECURSO
-- ----------------------------

-- ----------------------------
-- Checks structure for table GRUPORECURSO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."GRUPORECURSO" ADD CHECK ("GRUR_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."GRUPORECURSO" ADD CHECK ("RECF_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."GRUPORECURSO" ADD CHECK ("GRUP_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."GRUPORECURSO" ADD CHECK ("GRUR_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."GRUPORECURSO" ADD CHECK ("RECF_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."GRUPORECURSO" ADD CHECK ("GRUP_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table GRUPORECURSO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."GRUPORECURSO" ADD PRIMARY KEY ("GRUR_ID");

-- ----------------------------
-- Indexes structure for table HORARIO
-- ----------------------------

-- ----------------------------
-- Checks structure for table HORARIO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."HORARIO" ADD CHECK ("HORA_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."HORARIO" ADD CHECK ("HORA_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table HORARIO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."HORARIO" ADD PRIMARY KEY ("HORA_ID");

-- ----------------------------
-- Indexes structure for table INCREMENTO
-- ----------------------------

-- ----------------------------
-- Checks structure for table INCREMENTO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."INCREMENTO" ADD CHECK ("INCR_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."INCREMENTO" ADD CHECK ("INCR_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table INCREMENTO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."INCREMENTO" ADD PRIMARY KEY ("INCR_ID");

-- ----------------------------
-- Indexes structure for table INTENSIDADHORARIA
-- ----------------------------

-- ----------------------------
-- Checks structure for table INTENSIDADHORARIA
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."INTENSIDADHORARIA" ADD CHECK ("INTH_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."INTENSIDADHORARIA" ADD CHECK ("INTH_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table INTENSIDADHORARIA
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."INTENSIDADHORARIA" ADD PRIMARY KEY ("INTH_ID");

-- ----------------------------
-- Indexes structure for table NOTA
-- ----------------------------

-- ----------------------------
-- Checks structure for table NOTA
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."NOTA" ADD CHECK ("NOTA_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."NOTA" ADD CHECK ("NOTA_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table NOTA
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."NOTA" ADD PRIMARY KEY ("NOTA_ID");

-- ----------------------------
-- Indexes structure for table PERIODO
-- ----------------------------

-- ----------------------------
-- Checks structure for table PERIODO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."PERIODO" ADD CHECK ("PERI_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."PERIODO" ADD CHECK ("PERI_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table PERIODO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."PERIODO" ADD PRIMARY KEY ("PERI_ID");

-- ----------------------------
-- Indexes structure for table PREMATRICULA
-- ----------------------------

-- ----------------------------
-- Checks structure for table PREMATRICULA
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."PREMATRICULA" ADD CHECK ("PREM_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."PREMATRICULA" ADD CHECK ("ESTU_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."PREMATRICULA" ADD CHECK ("GRUP_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."PREMATRICULA" ADD CHECK ("PREM_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."PREMATRICULA" ADD CHECK ("ESTU_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."PREMATRICULA" ADD CHECK ("GRUP_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table PREMATRICULA
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."PREMATRICULA" ADD PRIMARY KEY ("PREM_ID");

-- ----------------------------
-- Indexes structure for table PUNTOCATEGORIA
-- ----------------------------

-- ----------------------------
-- Checks structure for table PUNTOCATEGORIA
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."PUNTOCATEGORIA" ADD CHECK ("PUNC_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."PUNTOCATEGORIA" ADD CHECK ("PUNC_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table PUNTOCATEGORIA
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."PUNTOCATEGORIA" ADD PRIMARY KEY ("PUNC_ID");

-- ----------------------------
-- Indexes structure for table RECURSOFISICO
-- ----------------------------

-- ----------------------------
-- Checks structure for table RECURSOFISICO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."RECURSOFISICO" ADD CHECK ("RECF_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."RECURSOFISICO" ADD CHECK ("RECF_NOMENCLATURA" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."RECURSOFISICO" ADD CHECK ("RECF_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."RECURSOFISICO" ADD CHECK ("RECF_NOMENCLATURA" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table RECURSOFISICO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."RECURSOFISICO" ADD PRIMARY KEY ("RECF_ID");

-- ----------------------------
-- Indexes structure for table SALARIOMINIMO
-- ----------------------------

-- ----------------------------
-- Checks structure for table SALARIOMINIMO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."SALARIOMINIMO" ADD CHECK ("SALM_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."SALARIOMINIMO" ADD CHECK ("SALM_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SALARIOMINIMO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."SALARIOMINIMO" ADD PRIMARY KEY ("SALM_ID");

-- ----------------------------
-- Indexes structure for table SISTEMAEVALUACION
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table SISTEMAEVALUACION
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."SISTEMAEVALUACION" ADD PRIMARY KEY ("SISE_ID");

-- ----------------------------
-- Indexes structure for table VS_ASIGNATURA
-- ----------------------------

-- ----------------------------
-- Checks structure for table VS_ASIGNATURA
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."VS_ASIGNATURA" ADD CHECK ("ASIG_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."VS_ASIGNATURA" ADD CHECK ("ASIG_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table VS_ASIGNATURA
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."VS_ASIGNATURA" ADD PRIMARY KEY ("ASIG_ID");

-- ----------------------------
-- Indexes structure for table VS_DOCENTE
-- ----------------------------

-- ----------------------------
-- Checks structure for table VS_DOCENTE
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."VS_DOCENTE" ADD CHECK ("DOCE_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."VS_DOCENTE" ADD CHECK ("DOCE_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table VS_DOCENTE
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."VS_DOCENTE" ADD PRIMARY KEY ("DOCE_ID");

-- ----------------------------
-- Indexes structure for table VS_ESTUDIANTE
-- ----------------------------

-- ----------------------------
-- Checks structure for table VS_ESTUDIANTE
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."VS_ESTUDIANTE" ADD CHECK ("ESTU_ID" IS NOT NULL);
ALTER TABLE "CURSOSSEMINARIOS"."VS_ESTUDIANTE" ADD CHECK ("ESTU_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table VS_ESTUDIANTE
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."VS_ESTUDIANTE" ADD PRIMARY KEY ("ESTU_ID");

-- ----------------------------
-- Indexes structure for table VS_PROGRAMAACADEMICO
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table VS_PROGRAMAACADEMICO
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."VS_PROGRAMAACADEMICO" ADD PRIMARY KEY ("PROA_ID");

-- ----------------------------
-- Foreign Key structure for table "CURSOSSEMINARIOS"."ACUERDO"
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."ACUERDO" ADD FOREIGN KEY ("GRUP_ID") REFERENCES "CURSOSSEMINARIOS"."GRUPO" ("GRUP_ID");

-- ----------------------------
-- Foreign Key structure for table "CURSOSSEMINARIOS"."CALIFICACION"
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."CALIFICACION" ADD FOREIGN KEY ("NOTA_ID") REFERENCES "CURSOSSEMINARIOS"."NOTA" ("NOTA_ID") ON DELETE CASCADE;
ALTER TABLE "CURSOSSEMINARIOS"."CALIFICACION" ADD FOREIGN KEY ("PREM_ID") REFERENCES "CURSOSSEMINARIOS"."PREMATRICULA" ("PREM_ID");

-- ----------------------------
-- Foreign Key structure for table "CURSOSSEMINARIOS"."CATEGORIAPROFESOR"
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."CATEGORIAPROFESOR" ADD FOREIGN KEY ("INCR_ID") REFERENCES "CURSOSSEMINARIOS"."INCREMENTO" ("INCR_ID");
ALTER TABLE "CURSOSSEMINARIOS"."CATEGORIAPROFESOR" ADD FOREIGN KEY ("PUNC_ID") REFERENCES "CURSOSSEMINARIOS"."PUNTOCATEGORIA" ("PUNC_ID");

-- ----------------------------
-- Foreign Key structure for table "CURSOSSEMINARIOS"."COSTO"
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."COSTO" ADD FOREIGN KEY ("SALM_ID") REFERENCES "CURSOSSEMINARIOS"."SALARIOMINIMO" ("SALM_ID");

-- ----------------------------
-- Foreign Key structure for table "CURSOSSEMINARIOS"."DETALLEDOCENTE"
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."DETALLEDOCENTE" ADD FOREIGN KEY ("DOCE_ID") REFERENCES "CURSOSSEMINARIOS"."VS_DOCENTE" ("DOCE_ID");
ALTER TABLE "CURSOSSEMINARIOS"."DETALLEDOCENTE" ADD FOREIGN KEY ("GRUP_ID") REFERENCES "CURSOSSEMINARIOS"."GRUPO" ("GRUP_ID");

-- ----------------------------
-- Foreign Key structure for table "CURSOSSEMINARIOS"."GRUPO"
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."GRUPO" ADD FOREIGN KEY ("ASIG_ID") REFERENCES "CURSOSSEMINARIOS"."VS_ASIGNATURA" ("ASIG_ID");
ALTER TABLE "CURSOSSEMINARIOS"."GRUPO" ADD FOREIGN KEY ("CALA_ID") REFERENCES "CURSOSSEMINARIOS"."CALENDARIOACADEMICO" ("CALA_ID");
ALTER TABLE "CURSOSSEMINARIOS"."GRUPO" ADD FOREIGN KEY ("COST_ID") REFERENCES "CURSOSSEMINARIOS"."COSTO" ("COST_ID");
ALTER TABLE "CURSOSSEMINARIOS"."GRUPO" ADD FOREIGN KEY ("CURS_ID") REFERENCES "CURSOSSEMINARIOS"."CURSO" ("CURS_ID");
ALTER TABLE "CURSOSSEMINARIOS"."GRUPO" ADD FOREIGN KEY ("PERI_ID") REFERENCES "CURSOSSEMINARIOS"."PERIODO" ("PERI_ID");
ALTER TABLE "CURSOSSEMINARIOS"."GRUPO" ADD FOREIGN KEY ("INTH_ID") REFERENCES "CURSOSSEMINARIOS"."INTENSIDADHORARIA" ("INTH_ID");
ALTER TABLE "CURSOSSEMINARIOS"."GRUPO" ADD FOREIGN KEY ("PROA_ID") REFERENCES "CURSOSSEMINARIOS"."VS_PROGRAMAACADEMICO" ("PROA_ID");

-- ----------------------------
-- Foreign Key structure for table "CURSOSSEMINARIOS"."GRUPOHORARIO"
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."GRUPOHORARIO" ADD FOREIGN KEY ("GRUP_ID") REFERENCES "CURSOSSEMINARIOS"."GRUPO" ("GRUP_ID");
ALTER TABLE "CURSOSSEMINARIOS"."GRUPOHORARIO" ADD FOREIGN KEY ("HORA_ID") REFERENCES "CURSOSSEMINARIOS"."HORARIO" ("HORA_ID");

-- ----------------------------
-- Foreign Key structure for table "CURSOSSEMINARIOS"."GRUPORECURSO"
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."GRUPORECURSO" ADD FOREIGN KEY ("GRUP_ID") REFERENCES "CURSOSSEMINARIOS"."GRUPO" ("GRUP_ID");
ALTER TABLE "CURSOSSEMINARIOS"."GRUPORECURSO" ADD FOREIGN KEY ("RECF_ID") REFERENCES "CURSOSSEMINARIOS"."RECURSOFISICO" ("RECF_ID");

-- ----------------------------
-- Foreign Key structure for table "CURSOSSEMINARIOS"."NOTA"
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."NOTA" ADD FOREIGN KEY ("GRUP_ID") REFERENCES "CURSOSSEMINARIOS"."GRUPO" ("GRUP_ID");
ALTER TABLE "CURSOSSEMINARIOS"."NOTA" ADD FOREIGN KEY ("SISE_ID") REFERENCES "CURSOSSEMINARIOS"."SISTEMAEVALUACION" ("SISE_ID");

-- ----------------------------
-- Foreign Key structure for table "CURSOSSEMINARIOS"."PREMATRICULA"
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."PREMATRICULA" ADD FOREIGN KEY ("ESTU_ID") REFERENCES "CURSOSSEMINARIOS"."VS_ESTUDIANTE" ("ESTU_ID");
ALTER TABLE "CURSOSSEMINARIOS"."PREMATRICULA" ADD FOREIGN KEY ("GRUP_ID") REFERENCES "CURSOSSEMINARIOS"."GRUPO" ("GRUP_ID");

-- ----------------------------
-- Foreign Key structure for table "CURSOSSEMINARIOS"."VS_DOCENTE"
-- ----------------------------
ALTER TABLE "CURSOSSEMINARIOS"."VS_DOCENTE" ADD FOREIGN KEY ("CATP_ID") REFERENCES "CURSOSSEMINARIOS"."CATEGORIAPROFESOR" ("CATP_ID");
