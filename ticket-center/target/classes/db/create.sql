/*
Navicat PGSQL Data Transfer

Source Server         : localhost
Source Server Version : 90506
Source Host           : localhost:5432
Source Database       : postgres
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90506
File Encoding         : 65001

Date: 2017-04-05 14:29:09
*/


-- ----------------------------
-- Sequence structure for s_audit_log
-- ----------------------------
-- DROP SEQUENCE IF EXISTS "public"."s_audit_log";
CREATE SEQUENCE  IF NOT EXISTS "public"."s_audit_log"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 10000000000000
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for s_permission
-- ----------------------------
-- DROP SEQUENCE IF EXISTS "public"."s_permission";
CREATE SEQUENCE  IF NOT EXISTS "public"."s_permission"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 1000000000000
 START 1
 CACHE 1
 CYCLE;

-- ----------------------------
-- Sequence structure for s_progress
-- ----------------------------
-- DROP SEQUENCE IF EXISTS "public"."s_progress";
CREATE SEQUENCE  IF NOT EXISTS "public"."s_progress"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 100000000000000
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for s_project
-- ----------------------------
-- DROP SEQUENCE IF EXISTS "public"."s_project";
CREATE SEQUENCE  IF NOT EXISTS "public"."s_project"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 1000000000000000000
 START 1
 CACHE 1;
COMMENT ON SEQUENCE "public"."s_project" IS
'新增project的主键自增长';

-- ----------------------------
-- Sequence structure for s_project_user
-- ----------------------------
-- DROP SEQUENCE IF EXISTS "public"."s_project_user";
CREATE SEQUENCE  IF NOT EXISTS "public"."s_project_user"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 100000000000000
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for s_role_permission
-- ----------------------------
-- DROP SEQUENCE IF EXISTS "public"."s_role_permission";
CREATE SEQUENCE  IF NOT EXISTS "public"."s_role_permission"
 INCREMENT 1
 MINVALUE 5
 MAXVALUE 10000000000000
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for s_sys_role
-- ----------------------------
-- DROP SEQUENCE IF EXISTS "public"."s_sys_role";
CREATE SEQUENCE  IF NOT EXISTS "public"."s_sys_role"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 1000000000000000
 START 1
 CACHE 1
 CYCLE;

-- ----------------------------
-- Sequence structure for s_user
-- ----------------------------
-- DROP SEQUENCE IF EXISTS "public"."s_user";
CREATE SEQUENCE  IF NOT EXISTS "public"."s_user"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 1000000000000
 START 1
 CACHE 1
 CYCLE;

 -- ----------------------------
-- Sequence structure for s_message
-- ----------------------------
-- DROP SEQUENCE IF EXISTS "public"."s_message";
CREATE SEQUENCE  IF NOT EXISTS "public"."s_message"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 1000000000000
 START 1
 CACHE 1
 CYCLE;

-- ----------------------------
-- Table structure for t_audit_log
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_audit_log";
CREATE TABLE  IF NOT EXISTS "public"."t_audit_log" (
"id" int8 PRIMARY KEY NOT NULL,
"progress_id" int8 NOT NULL,
"audit_date" timestamp(0),
"audit_result" int2 NOT NULL,
"audit_desc" varchar(1000) COLLATE "default",
"audit_person" int8 NOT NULL,
"reserve1" varchar(255) COLLATE "default",
"reserve2" varchar(255) COLLATE "default",
"reserve3" varchar(255) COLLATE "default",
"reserve4" varchar(255) COLLATE "default",
"reserve5" varchar(255) COLLATE "default",
"reserve6" varchar(255) COLLATE "default",
"reserve7" int8,
"reserve8" int8,
"reserve9" int8,
"reserve10" int8,
"audit_flag" int2 DEFAULT 1,
CONSTRAINT audit_person_fk FOREIGN KEY (audit_person) REFERENCES t_user (id)  ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT progress_id_fk FOREIGN KEY (progress_id) REFERENCES t_user (id)  ON DELETE NO ACTION ON UPDATE NO ACTION
)
WITH (OIDS=FALSE)

;





COMMENT ON COLUMN "public"."t_audit_log"."id" IS '主键ID';
COMMENT ON COLUMN "public"."t_audit_log"."progress_id" IS '进度表的主键ID';
COMMENT ON COLUMN "public"."t_audit_log"."audit_date" IS '审核日期';
COMMENT ON COLUMN "public"."t_audit_log"."audit_result" IS '审核结果 1：通过；2：不通过';
COMMENT ON COLUMN "public"."t_audit_log"."audit_desc" IS '审核内容。修改内容';
COMMENT ON COLUMN "public"."t_audit_log"."audit_person" IS '审核人，user表主键';
COMMENT ON COLUMN "public"."t_audit_log"."audit_flag" IS '最近一次的审核标识。 1: 是最近的一次审核。2：历史审核记录';


-- ----------------------------
-- Table structure for t_client
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_client";
CREATE TABLE  IF NOT EXISTS "public"."t_client" (
"id" int8 PRIMARY KEY NOT NULL,
"client_name" varchar(255) COLLATE "default",
"business_type" varchar(255) COLLATE "default",
"reserve1" varchar(255) COLLATE "default",
"reserve2" varchar(255) COLLATE "default",
"reserve3" varchar(255) COLLATE "default",
"reserve4" varchar(255) COLLATE "default",
"reserve5" varchar(255) COLLATE "default",
"reserve6" varchar(255) COLLATE "default",
"reserve7" int8,
"reserve8" int8,
"reserve9" int8,
"reserve10" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."t_client"."id" IS '主键ID';
COMMENT ON COLUMN "public"."t_client"."client_name" IS '客户名称';
COMMENT ON COLUMN "public"."t_client"."business_type" IS '所属行业分类';

-- ----------------------------
-- Records of t_client
-- ----------------------------

-- ----------------------------
-- Table structure for t_identity
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_identity";
CREATE TABLE  IF NOT EXISTS "public"."t_identity" (
"id" int4 PRIMARY KEY NOT NULL,
"project_type" varchar(20) COLLATE "default",
"year" int2,
"number" int2
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of t_identity
-- ----------------------------

-- ----------------------------
-- Table structure for t_patch
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_patch";
CREATE TABLE  IF NOT EXISTS "public"."t_patch" (
"id" int8 PRIMARY KEY NOT NULL,
"patch_name" varchar(255) COLLATE "default",
"patch_code" varchar(255) COLLATE "default",
"reserve1" varchar(255) COLLATE "default",
"reserve2" varchar(255) COLLATE "default",
"reserve3" varchar(255) COLLATE "default",
"reserve4" varchar(255) COLLATE "default",
"reserve5" varchar(255) COLLATE "default",
"reserve6" varchar(255) COLLATE "default",
"reserve7" int8,
"reserve8" int8,
"reserve9" int8,
"reserve10" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."t_patch"."id" IS '补丁表主键ID';
COMMENT ON COLUMN "public"."t_patch"."patch_name" IS '补丁名称';
COMMENT ON COLUMN "public"."t_patch"."patch_code" IS '补丁编号';

-- ----------------------------
-- Records of t_patch
-- ----------------------------

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_permission";
CREATE TABLE  IF NOT EXISTS "public"."t_permission" (
"id" int8 PRIMARY KEY NOT NULL,
"permission_url" varchar(255) COLLATE "default" NOT NULL,
"permission_name" varchar(255) COLLATE "default",
"parent_id" int8,
"permission_class" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."t_permission"."id" IS '主键ID';
COMMENT ON COLUMN "public"."t_permission"."permission_url" IS '权限路径';
COMMENT ON COLUMN "public"."t_permission"."permission_name" IS '权限名称';
COMMENT ON COLUMN "public"."t_permission"."parent_id" IS '父节点';
COMMENT ON COLUMN "public"."t_permission"."permission_class" IS '菜单对应的class';


-- ----------------------------
-- Table structure for t_progress
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_progress";
-- ----------------------------
-- Foreign Key structure for table "public"."t_progress"
-- ----------------------------
-- ALTER TABLE "public"."t_progress" ADD FOREIGN KEY ("update_person") REFERENCES "public"."t_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ALTER TABLE "public"."t_progress" ADD FOREIGN KEY ("create_person") REFERENCES "public"."t_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
--
CREATE TABLE  IF NOT EXISTS "public"."t_progress" (
"id" int8 PRIMARY KEY NOT NULL,
"pro_id" int8 NOT NULL,
"ratio" int4 NOT NULL,
"task_desc" varchar(1000) COLLATE "default",
"is_risk" int2 DEFAULT 1 NOT NULL,
"risk_tips" varchar(1000) COLLATE "default",
"is_updated" int2 DEFAULT 1 NOT NULL,
"updated_desc" varchar(1000) COLLATE "default",
"remark" varchar(1000) COLLATE "default",
"progress_order" int2 NOT NULL,
"create_date" date,
"create_person" int8,
"update_date" date,
"update_person" int8,
"start_date_item" date NOT NULL,
"end_date_item" date NOT NULL,
"reserve1" varchar(255) COLLATE "default",
"reserve2" varchar(255) COLLATE "default",
"reserve3" varchar(255) COLLATE "default",
"reserve4" varchar(255) COLLATE "default",
"reserve5" varchar(255) COLLATE "default",
"reserve6" varchar(255) COLLATE "default",
"reserve7" int8,
"reserve8" int8,
"reserve9" int8,
"reserve10" int8,
CONSTRAINT update_person_fk FOREIGN KEY (update_person) REFERENCES t_user (id)  ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT create_person_fk FOREIGN KEY (create_person) REFERENCES t_user (id)  ON DELETE NO ACTION ON UPDATE NO ACTION
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."t_progress" IS '项目进度表';
COMMENT ON COLUMN "public"."t_progress"."id" IS '主键';
COMMENT ON COLUMN "public"."t_progress"."pro_id" IS '项目ID';
COMMENT ON COLUMN "public"."t_progress"."ratio" IS '项目完成百分比';
COMMENT ON COLUMN "public"."t_progress"."task_desc" IS '已完成项目描述';
COMMENT ON COLUMN "public"."t_progress"."is_risk" IS '是否有风险. 1:无风险；2：有风险';
COMMENT ON COLUMN "public"."t_progress"."risk_tips" IS '风险提示';
COMMENT ON COLUMN "public"."t_progress"."is_updated" IS '是否变更. 1：否；2：是';
COMMENT ON COLUMN "public"."t_progress"."updated_desc" IS '变更内容';
COMMENT ON COLUMN "public"."t_progress"."remark" IS '备注';
COMMENT ON COLUMN "public"."t_progress"."progress_order" IS '进度顺序';
COMMENT ON COLUMN "public"."t_progress"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."t_progress"."create_person" IS '创建人';
COMMENT ON COLUMN "public"."t_progress"."update_date" IS '修改日期';
COMMENT ON COLUMN "public"."t_progress"."start_date_item" IS '进度开始日期';
COMMENT ON COLUMN "public"."t_progress"."end_date_item" IS '进度结束日期';



-- ----------------------------
-- Table structure for t_project
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_project";
-- -- ----------------------------
-- -- Foreign Key structure for table "public"."t_project"
-- -- ----------------------------
-- ALTER TABLE "public"."t_project" ADD FOREIGN KEY ("project_type_id") REFERENCES "public"."t_project_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ALTER TABLE "public"."t_project" ADD FOREIGN KEY ("project_leader_id") REFERENCES "public"."t_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ALTER TABLE "public"."t_project" ADD FOREIGN KEY ("req_type_id") REFERENCES "public"."t_req_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
--
CREATE TABLE  IF NOT EXISTS "public"."t_project" (
"id" int8 PRIMARY KEY NOT NULL,
"end_date" date,
"start_date" date,
"project_name" varchar(255) COLLATE "POSIX" NOT NULL,
"project_code" varchar(255) COLLATE "default" NOT NULL,
"estimate_efforts" int4 NOT NULL,
"project_type_id" int8 NOT NULL,
"client_name" varchar(255) COLLATE "default" NOT NULL,
"project_leader_id" int8 NOT NULL,
"dev_inter_name" varchar(255) COLLATE "default" NOT NULL,
"dev_inter_email" varchar(255) COLLATE "default" NOT NULL,
"scene_inter_name" varchar(255) COLLATE "default" NOT NULL,
"scene_inter_mail" varchar(255) COLLATE "default" NOT NULL,
"req_inter_name" varchar(255) COLLATE "default" NOT NULL,
"req_inter_mail" varchar(255) COLLATE "default" NOT NULL,
"req_type_id" int8 NOT NULL,
"req_keywords" varchar(255) COLLATE "default" NOT NULL,
"is_end" int2 DEFAULT 0 NOT NULL,
"is_terminal" int2 DEFAULT 0 NOT NULL,
"terminal_reason" varchar(255) COLLATE "default",
"terminal_remark" varchar(255) COLLATE "default",
"create_date" date NOT NULL,
"update_date" date,
"workorder_no" varchar(255) COLLATE "default" NOT NULL,
"uuid" varchar(50) COLLATE "default",
"finish_date" date,
"is_risk" int2 DEFAULT 1,
"is_updated" int2 DEFAULT 1,
"is_audit" int2 DEFAULT 1,
"patch_id" int8,
"reserve1" varchar(255) COLLATE "default",
"reserve2" varchar(255) COLLATE "default",
"reserve3" varchar(255) COLLATE "default",
"reserve4" varchar(255) COLLATE "default",
"reserve5" varchar(255) COLLATE "default",
"reserve6" varchar(255) COLLATE "default",
"reserve7" varchar(255) COLLATE "default",
"reserve8" varchar(255) COLLATE "default",
"reserve9" varchar(255) COLLATE "default",
"reserve10" varchar(255) COLLATE "default",
"reserve11" int8,
"reserve12" int8,
"reserve13" int8,
"reserve14" int8,
"reserve15" int8,
"reserve16" int8,
"reserve17" int8,
"reserve18" int8,
"reserve19" int8,
"reserve20" int8,
CONSTRAINT project_type_id_fk FOREIGN KEY (project_type_id) REFERENCES t_project_type (id)  ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT project_leader_id_fk FOREIGN KEY (project_leader_id) REFERENCES t_user (id)  ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT req_type_id_fk FOREIGN KEY (req_type_id) REFERENCES t_req_type (id)  ON DELETE NO ACTION ON UPDATE NO ACTION
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."t_project"."id" IS '主键ID';
COMMENT ON COLUMN "public"."t_project"."end_date" IS '任务结束时间';
COMMENT ON COLUMN "public"."t_project"."start_date" IS '任务开始时间';
COMMENT ON COLUMN "public"."t_project"."project_name" IS '项目名称';
COMMENT ON COLUMN "public"."t_project"."project_code" IS '项目编号';
COMMENT ON COLUMN "public"."t_project"."estimate_efforts" IS '预估工作量';
COMMENT ON COLUMN "public"."t_project"."project_type_id" IS '项目类型，与t_project_type关联';
COMMENT ON COLUMN "public"."t_project"."client_name" IS '客户名称';
COMMENT ON COLUMN "public"."t_project"."project_leader_id" IS '项目维护人,与t_user关联';
COMMENT ON COLUMN "public"."t_project"."dev_inter_name" IS '开发接口人名字';
COMMENT ON COLUMN "public"."t_project"."dev_inter_email" IS '开发接口人邮箱';
COMMENT ON COLUMN "public"."t_project"."scene_inter_name" IS '现场接口人名字';
COMMENT ON COLUMN "public"."t_project"."scene_inter_mail" IS '现场接口人邮箱';
COMMENT ON COLUMN "public"."t_project"."req_inter_name" IS '需求接口人姓名';
COMMENT ON COLUMN "public"."t_project"."req_inter_mail" IS '需求接口人邮箱';
COMMENT ON COLUMN "public"."t_project"."req_type_id" IS '需求分类，与t_req_type表关联';
COMMENT ON COLUMN "public"."t_project"."req_keywords" IS '需求关键字';
COMMENT ON COLUMN "public"."t_project"."is_end" IS '是否结项 1：已结项；0：未结项';
COMMENT ON COLUMN "public"."t_project"."is_terminal" IS '是否终止项目 0：否；1：是';
COMMENT ON COLUMN "public"."t_project"."terminal_reason" IS '项目终止原因';
COMMENT ON COLUMN "public"."t_project"."terminal_remark" IS '项目终止备注';
COMMENT ON COLUMN "public"."t_project"."workorder_no" IS '工单编号';
COMMENT ON COLUMN "public"."t_project"."uuid" IS 'UUID';
COMMENT ON COLUMN "public"."t_project"."finish_date" IS '实际结束日期';
COMMENT ON COLUMN "public"."t_project"."is_risk" IS '是否有风险. 1:无风险；2：有风险';
COMMENT ON COLUMN "public"."t_project"."is_updated" IS '是否变更. 1：否；2：是';
COMMENT ON COLUMN "public"."t_project"."is_audit" IS '是否需要审核, 1:不需要；2：需要';
COMMENT ON COLUMN "public"."t_project"."patch_id" IS '补丁的主键ID';

-- ----------------------------
-- Records of t_project
-- ----------------------------

-- ----------------------------
-- Table structure for t_project_type
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_project_type";
CREATE TABLE  IF NOT EXISTS "public"."t_project_type" (
"pro_desc" varchar(255) COLLATE "default",
"id" int8 PRIMARY KEY NOT NULL,
"type" varchar(50) COLLATE "default",
"pro_order" int2,
"reserve1" varchar(255) COLLATE "default",
"reserve2" varchar(255) COLLATE "default",
"reserve3" varchar(255) COLLATE "default",
"reserve4" varchar(255) COLLATE "default",
"reserve5" varchar(255) COLLATE "default",
"reserve6" int8,
"reserve7" int8,
"reserve8" int2
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."t_project_type" IS '项目类型表';
COMMENT ON COLUMN "public"."t_project_type"."pro_desc" IS '项目描述';
COMMENT ON COLUMN "public"."t_project_type"."id" IS '主键';
COMMENT ON COLUMN "public"."t_project_type"."type" IS '项目名称';
COMMENT ON COLUMN "public"."t_project_type"."pro_order" IS '项目顺序';

-- ----------------------------
-- Records of t_project_type
-- ----------------------------

-- ----------------------------
-- Table structure for t_project_user
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_project_user";
-- -- ----------------------------
-- -- Foreign Key structure for table "public"."t_project_user"
-- -- ----------------------------
-- ALTER TABLE "public"."t_project_user" ADD FOREIGN KEY ("project_id") REFERENCES "public"."t_project" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ALTER TABLE "public"."t_project_user" ADD FOREIGN KEY ("user_id") REFERENCES "public"."t_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
--
CREATE TABLE  IF NOT EXISTS "public"."t_project_user" (
"id" int8 PRIMARY KEY NOT NULL,
"user_id" int8 NOT NULL,
"project_id" int8 NOT NULL,
CONSTRAINT project_id_fk FOREIGN KEY (project_id) REFERENCES t_project (id)  ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT t_user_fk FOREIGN KEY (user_id) REFERENCES t_user (id)  ON DELETE NO ACTION ON UPDATE NO ACTION
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."t_project_user"."id" IS '主键ID';
COMMENT ON COLUMN "public"."t_project_user"."user_id" IS '用户表t_user 主键';
COMMENT ON COLUMN "public"."t_project_user"."project_id" IS '项目表t_project的主键';



-- ----------------------------
-- Table structure for t_projet_related
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_projet_related";
-- -- ----------------------------
-- -- Foreign Key structure for table "public"."t_projet_related"
-- -- ----------------------------
-- ALTER TABLE "public"."t_projet_related" ADD FOREIGN KEY ("child_id") REFERENCES "public"."t_project" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ALTER TABLE "public"."t_projet_related" ADD FOREIGN KEY ("parent_id") REFERENCES "public"."t_project" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
--
CREATE TABLE  IF NOT EXISTS "public"."t_projet_related" (
"id" int8 PRIMARY KEY NOT NULL,
"parent_id" int8 NOT NULL,
"child_id" int8,
CONSTRAINT child_id_fk FOREIGN KEY (child_id) REFERENCES t_project (id)  ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT parent_id_fk FOREIGN KEY (parent_id) REFERENCES t_project (id)  ON DELETE NO ACTION ON UPDATE NO ACTION
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."t_projet_related"."parent_id" IS '主项目主键';
COMMENT ON COLUMN "public"."t_projet_related"."child_id" IS '子项目主键ID';

-- ----------------------------
-- Records of t_projet_related
-- ----------------------------

-- ----------------------------
-- Table structure for t_req_keywords
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_req_keywords";
-- -- ----------------------------
-- -- Foreign Key structure for table "public"."t_req_keywords"
-- -- ----------------------------
-- ALTER TABLE "public"."t_req_keywords" ADD FOREIGN KEY ("req_id") REFERENCES "public"."t_req_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
--
CREATE TABLE  IF NOT EXISTS "public"."t_req_keywords" (
"id" int8 PRIMARY KEY NOT NULL,
"req_keywords" varchar(255) COLLATE "default",
"req_id" int8,
CONSTRAINT req_id_fk FOREIGN KEY (req_id) REFERENCES t_req_type (id)  ON DELETE NO ACTION ON UPDATE NO ACTION
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."t_req_keywords"."id" IS '主键ID';
COMMENT ON COLUMN "public"."t_req_keywords"."req_keywords" IS '需求关键字';
COMMENT ON COLUMN "public"."t_req_keywords"."req_id" IS '需求表的主键，t_req_type主键ID';

-- ----------------------------
-- Records of t_req_keywords
-- ----------------------------

-- ----------------------------
-- Table structure for t_req_type
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_req_type";
CREATE TABLE  IF NOT EXISTS "public"."t_req_type" (
"id" int8 PRIMARY KEY NOT NULL,
"parent_id" int8,
"req_name" varchar(255) COLLATE "default" NOT NULL,
"req_desc" varchar(255) COLLATE "default",
"req_index" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."t_req_type"."id" IS '主键';
COMMENT ON COLUMN "public"."t_req_type"."parent_id" IS '上级ID，父节点';
COMMENT ON COLUMN "public"."t_req_type"."req_name" IS '需求名称';
COMMENT ON COLUMN "public"."t_req_type"."req_desc" IS '需求描述';
COMMENT ON COLUMN "public"."t_req_type"."req_index" IS '需求排序';


-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_message";
CREATE TABLE "public"."t_message" (
"id" int8 NOT NULL,
"sender_id" int8 NOT NULL,
"progress_id" int8 NOT NULL,
"message_body" varchar(1000) COLLATE "default",
"message_type" int2,
"message_time" timestamp(6),
"is_read" int2 DEFAULT 1 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."t_message"."id" IS '主键ID';
COMMENT ON COLUMN "public"."t_message"."sender_id" IS '发送者ID，关联t_user';
COMMENT ON COLUMN "public"."t_message"."progress_id" IS '项目进程id，关联t_progress';
COMMENT ON COLUMN "public"."t_message"."message_body" IS '消息主体';
COMMENT ON COLUMN "public"."t_message"."message_type" IS '消息类型。 1：操作步骤消息。 2: 修改内容意见消息';
COMMENT ON COLUMN "public"."t_message"."message_time" IS '消息时间';
COMMENT ON COLUMN "public"."t_message"."is_read" IS '是否已读，1：未读。2：已读';

-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_message
-- ----------------------------
ALTER TABLE "public"."t_message" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."t_message"
-- ----------------------------
ALTER TABLE "public"."t_message" ADD FOREIGN KEY ("sender_id") REFERENCES "public"."t_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."t_message" ADD FOREIGN KEY ("progress_id") REFERENCES "public"."t_progress" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;





-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_role_permission";
-- -- ----------------------------
-- -- Foreign Key structure for table "public"."t_role_permission"
-- -- ----------------------------
-- ALTER TABLE "public"."t_role_permission" ADD FOREIGN KEY ("sys_role_id") REFERENCES "public"."t_sys_role" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE "public"."t_role_permission" ADD FOREIGN KEY ("per_id") REFERENCES "public"."t_permission" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
--
CREATE TABLE  IF NOT EXISTS "public"."t_role_permission" (
"id" int8 PRIMARY KEY NOT NULL,
"sys_role_id" int8 NOT NULL,
"per_id" int8 NOT NULL,
CONSTRAINT sys_role_id_fk FOREIGN KEY (sys_role_id) REFERENCES t_sys_role (id)  ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT per_id_fk FOREIGN KEY (per_id) REFERENCES t_permission (id)  ON DELETE NO ACTION ON UPDATE NO ACTION
)
WITH (OIDS=FALSE)

;



-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_sys_role";
CREATE TABLE  IF NOT EXISTS "public"."t_sys_role" (
"id" int8 PRIMARY KEY NOT NULL,
"sys_role_type" varchar(255) COLLATE "default",
"sys_role_desc" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."t_sys_role"."sys_role_type" IS '1 管理员；2 维护人员';
COMMENT ON COLUMN "public"."t_sys_role"."sys_role_desc" IS '系统权限描述';


-- ----------------------------
-- Table structure for t_user
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_user";
-- -- ----------------------------
-- -- Foreign Key structure for table "public"."t_user"
-- -- ----------------------------
-- ALTER TABLE "public"."t_user" ADD FOREIGN KEY ("sys_role_id") REFERENCES "public"."t_sys_role" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
--
CREATE TABLE  IF NOT EXISTS "public"."t_user" (
"id" int8 PRIMARY KEY NOT NULL,
"display_name" varchar(255) COLLATE "default" NOT NULL,
"pass_word" varchar(255) COLLATE "default" NOT NULL,
"user_name" varchar(255) COLLATE "default",
"status" varchar(1) COLLATE "default" DEFAULT 0 NOT NULL,
"create_time" timestamp(0) DEFAULT now(),
"last_login_date" timestamp(6),
"pro_type" varchar(50) COLLATE "default" NOT NULL,
"sys_role_id" int4 NOT NULL,
"is_delete" int2 DEFAULT 0,
"reserve1" varchar(255) COLLATE "default",
"reserve2" varchar(255) COLLATE "default",
"reserve3" varchar(255) COLLATE "default",
"reserve4" varchar(255) COLLATE "default",
"reserve5" varchar(255) COLLATE "default",
"reserve6" varchar(255) COLLATE "default",
"reserve7" int8,
"reserve8" int8,
"reserve9" int8,
"reserve10" int8,
CONSTRAINT sys_role_id_fk FOREIGN KEY (sys_role_id) REFERENCES t_sys_role (id)  ON DELETE NO ACTION ON UPDATE NO ACTION
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."t_user"."display_name" IS '用户名';
COMMENT ON COLUMN "public"."t_user"."pass_word" IS '密码';
COMMENT ON COLUMN "public"."t_user"."user_name" IS '登录名';
COMMENT ON COLUMN "public"."t_user"."status" IS '账户状态.0:有效；1：失效';
COMMENT ON COLUMN "public"."t_user"."create_time" IS '创建日期时间';
COMMENT ON COLUMN "public"."t_user"."pro_type" IS '项目角色';
COMMENT ON COLUMN "public"."t_user"."sys_role_id" IS '用户角色表主键';

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_role_permission
-- ----------------------------
-- DROP TABLE IF EXISTS "public"."t_user_role_permission";
-- -- ----------------------------
-- -- Foreign Key structure for table "public"."t_user_role_permission"
-- -- ----------------------------
-- ALTER TABLE "public"."t_user_role_permission" ADD FOREIGN KEY ("user_id") REFERENCES "public"."t_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE "public"."t_user_role_permission" ADD FOREIGN KEY ("role_per_id") REFERENCES "public"."t_role_permission" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE  IF NOT EXISTS "public"."t_user_role_permission" (
"id" int8 PRIMARY KEY NOT NULL,
"user_id" int8 NOT NULL,
"role_per_id" int8 NOT NULL,
CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES t_user (id)  ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT role_per_id_fk FOREIGN KEY (role_per_id) REFERENCES t_role_permission (id)  ON DELETE NO ACTION ON UPDATE NO ACTION
)
WITH (OIDS=FALSE)
;












