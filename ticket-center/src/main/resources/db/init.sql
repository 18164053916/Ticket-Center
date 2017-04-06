-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO "public"."t_permission" VALUES ('1', '/progress/audit/index', '审核进度', null, 'nav01') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_permission" VALUES ('2', '#', '项目管理', null, 'nav02') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_permission" VALUES ('3', '/user/management/index', '用户管理', null, 'nav03') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_permission" VALUES ('4', '/logs/mylogs/index', '我的消息', null, 'nav04') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_permission" VALUES ('5', '/project/mine/index', '我的项目', null, 'nav02') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_permission" VALUES ('6', '/project/mine/finish', '已完成的', null, 'nav05') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_permission" VALUES ('7', '/project/ongoing/index', '进行中项目', '2', null) ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_permission" VALUES ('8', '/project/finish/index', '已完成项目', '2', null) ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_permission" VALUES ('9', '/project/abnormal/index', '异常终止项目', '2', null) ON CONFLICT (id) DO NOTHING;


-- ----------------------------
-- Records of t_project_type
-- ----------------------------
INSERT INTO "public"."t_project_type" VALUES ('二次开发', '1', 'A', '1', null, null, null, null, null, null, null, null) ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_project_type" VALUES ('众筹项目', '2', 'B', '2', null, null, null, null, null, null, null, null) ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_project_type" VALUES ('大项目', '3', 'C', '3', null, null, null, null, null, null, null, null) ON CONFLICT (id) DO NOTHING;

-- ----------------------------
-- Records of t_req_type
-- ----------------------------
INSERT INTO "public"."t_req_type" VALUES ('1', null, '网络管理', '网络管理', '1') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_req_type" VALUES ('2', '1', '网络线路', '网络线路', '2') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_req_type" VALUES ('3', '1', '网络拓扑', '网络拓扑', '3') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_req_type" VALUES ('4', null, '主机管理', '主机管理', '4') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_req_type" VALUES ('5', '4', '主机线路', '主机线路', '5') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_req_type" VALUES ('6', '4', '主机拓扑', '主机拓扑', '6') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_req_type" VALUES ('7', null, '机房管理', '机房管理', '7') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_req_type" VALUES ('8', '7', '机房线路', '机房线路', '8') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_req_type" VALUES ('9', '7', '机房拓扑', '机房拓扑', '9') ON CONFLICT (id) DO NOTHING;


-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO "public"."t_sys_role" VALUES ('1', '1', '管理员') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_sys_role" VALUES ('2', '2', '维护人员') ON CONFLICT (id) DO NOTHING;
INSERT INTO "public"."t_sys_role" VALUES ('3', '3', '开发人员') ON CONFLICT (id) DO NOTHING;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO "public"."t_user" VALUES ('0', '内置管理员', '4QrcOUm6Wau+VuBX8g+IPg==', 'admin', '0', now(), now(), '0', '1', '0', null, null, null, null, null, null, null, null, null, null) ON CONFLICT (id) DO NOTHING;


