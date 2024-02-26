/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : pgsql
 Source Server Version : 80027
 Source Host           : localhost:5432
 Source Schema         : kapok

 Target Server Type    : pgsql
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 24/06/2023 17:21:51
*/

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
-- DROP TABLE IF EXISTS "sys_dept";
CREATE TABLE "sys_dept"  (
  "id" SERIAL NOT NULL,
  "parent_id" int NOT NULL ,
  "status" int NOT NULL DEFAULT 1  ,
  "order_num" int NOT NULL DEFAULT 0  ,
  "create_date" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)  ,
  "remark" text   ,
  "name" varchar(50)   ,
  "leader" varchar(50)    ,
  PRIMARY KEY ("id") 
)  ;
-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO "sys_dept" VALUES (1, 0, 1, 0, '2023-05-04 00:16:02.040115', '总公司', 'K科技有限公司', 'kapok');
INSERT INTO "sys_dept" VALUES (2, 1, 1, 0, '2023-05-04 00:16:46.557000', '杭州分部', '杭州技术部', 'kapok');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
-- DROP TABLE IF EXISTS "sys_menu";
CREATE TABLE "sys_menu"  (
  "id" SERIAL NOT NULL,
  "name" varchar(30)  ,
  "code" varchar(50) ,
  "type" int NOT NULL  ,
  "order_num" int NOT NULL DEFAULT 0  ,
  "parent_id" bigint NOT NULL,
  PRIMARY KEY ("id") 
) ;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO "sys_menu" VALUES (1, '首页', 'dashboard', 1, 0, 0);
INSERT INTO "sys_menu" VALUES (2, '权限管理', 'perm', 1, 0, 0);
INSERT INTO "sys_menu" VALUES (3, '用户管理', 'perm_users', 1, 0, 2);
INSERT INTO "sys_menu" VALUES (4, '角色管理', 'perm_roles', 1, 0, 2);
INSERT INTO "sys_menu" VALUES (5, '系统设置', 'system', 1, 0, 0);
INSERT INTO "sys_menu" VALUES (6, '资源管理', 'system_menus', 1, 0, 5);
INSERT INTO "sys_menu" VALUES (7, '文件列表', 'system_oss', 1, 0, 5);
INSERT INTO "sys_menu" VALUES (8, '编辑', 'perm_users:edit', 3, 0, 3);
INSERT INTO "sys_menu" VALUES (9, '启用/禁用', 'perm_users:updateStatus', 3, 0, 3);
INSERT INTO "sys_menu" VALUES (10, '重置密码', 'perm_users:resetPw', 3, 0, 3);
INSERT INTO "sys_menu" VALUES (11, '批量导入', 'perm_users:createMultUser', 3, 0, 3);
INSERT INTO "sys_menu" VALUES (12, '新增', 'perm_roles:create', 3, 0, 4);
INSERT INTO "sys_menu" VALUES (13, '编辑', 'perm_roles:edit', 3, 0, 4);
INSERT INTO "sys_menu" VALUES (14, '删除', 'perm_roles:del', 3, 0, 4);
INSERT INTO "sys_menu" VALUES (15, '关联用户/解除关联', 'perm_roles:bind', 3, 0, 4);
INSERT INTO "sys_menu" VALUES (16, '添加', 'system_menus:create', 3, 0, 6);
INSERT INTO "sys_menu" VALUES (17, '编辑', 'system_menus:edit', 3, 0, 6);
INSERT INTO "sys_menu" VALUES (18, '删除', 'system_menus:del', 3, 0, 6);
INSERT INTO "sys_menu" VALUES (23, '测试按钮', '123232', 3, 0, 0);
INSERT INTO "sys_menu" VALUES (25, '部门管理', 'perm_depts', 1, 0, 2);
INSERT INTO "sys_menu" VALUES (26, '岗位管理', 'perm_posts', 1, 0, 2);
INSERT INTO "sys_menu" VALUES (27, '新增', 'perm_posts:create', 3, 0, 26);
INSERT INTO "sys_menu" VALUES (28, '编辑', 'perm_posts:edit', 3, 0, 26);
INSERT INTO "sys_menu" VALUES (29, '删除', 'perm_posts:del', 3, 0, 26);
INSERT INTO "sys_menu" VALUES (30, '删除', 'perm_depts:del', 3, 0, 25);
INSERT INTO "sys_menu" VALUES (31, '编辑', 'perm_depts:edit', 3, 0, 25);
INSERT INTO "sys_menu" VALUES (32, '新增', 'perm_depts:create', 3, 0, 25);

-- ----------------------------
-- Table structure for sys_menu_perm
-- ----------------------------
-- DROP TABLE IF EXISTS "sys_menu_perm";
CREATE TABLE "sys_menu_perm"  (
  "id" SERIAL NOT NULL,
  "menu_id" bigint NOT NULL ,
  "api_url" varchar(255)  ,
  "api_method" varchar(255)  ,
  PRIMARY KEY ("id") 
) ;

-- ----------------------------
-- Records of sys_menu_perm
-- ----------------------------
INSERT INTO "sys_menu_perm" VALUES (2, 3, '/api/user/list', 'GET');
INSERT INTO "sys_menu_perm" VALUES (3, 4, '/api/role/list', 'GET');
INSERT INTO "sys_menu_perm" VALUES (4, 4, '/api/role/one/:id/perms', 'GET');
INSERT INTO "sys_menu_perm" VALUES (5, 4, '/api/user/list', 'GET');
INSERT INTO "sys_menu_perm" VALUES (6, 6, '/api/menu/all', 'GET');
INSERT INTO "sys_menu_perm" VALUES (7, 6, '/api/menu/one/:parentId/btns', 'GET');
INSERT INTO "sys_menu_perm" VALUES (8, 6, '/api/menu/one/:id/menu-perm', 'GET');
INSERT INTO "sys_menu_perm" VALUES (9, 7, '/api/oss/list', 'GET');
INSERT INTO "sys_menu_perm" VALUES (10, 8, '/api/user/one/:id', 'GET');
INSERT INTO "sys_menu_perm" VALUES (11, 8, '/api/user', 'PUT');
INSERT INTO "sys_menu_perm" VALUES (12, 9, '/api/user/status/change', 'PUT');
INSERT INTO "sys_menu_perm" VALUES (13, 10, '/api/user/password/reset/:userId', 'PUT');
INSERT INTO "sys_menu_perm" VALUES (15, 12, '/api/role', 'POST');
INSERT INTO "sys_menu_perm" VALUES (16, 13, '/api/role', 'PUT');
INSERT INTO "sys_menu_perm" VALUES (17, 14, '/api/role/:id', 'DELETE');
INSERT INTO "sys_menu_perm" VALUES (18, 15, '/api/user/role/update', 'POST');
INSERT INTO "sys_menu_perm" VALUES (20, 17, '/api/menu', 'PUT');
INSERT INTO "sys_menu_perm" VALUES (21, 16, '/api/menu', 'POST');
INSERT INTO "sys_menu_perm" VALUES (22, 18, '/api/menu/:id', 'DELETE');
INSERT INTO "sys_menu_perm" VALUES (24, 11, '/api/user/import', 'POST');
INSERT INTO "sys_menu_perm" VALUES (27, 25, '/api/dept/list', 'GET');
INSERT INTO "sys_menu_perm" VALUES (28, 26, '/api/post/list', 'GET');
INSERT INTO "sys_menu_perm" VALUES (32, 29, '/api/post/:id', 'DELETE');
INSERT INTO "sys_menu_perm" VALUES (36, 27, '/api/post', 'POST');
INSERT INTO "sys_menu_perm" VALUES (37, 28, '/api/post/:id', 'GET');
INSERT INTO "sys_menu_perm" VALUES (38, 28, '/api/post', 'PUT');
INSERT INTO "sys_menu_perm" VALUES (39, 30, '/api/dept/:id', 'DELETE');
INSERT INTO "sys_menu_perm" VALUES (40, 31, '/api/dept', 'PUT');
INSERT INTO "sys_menu_perm" VALUES (41, 32, '/api/dept', 'POST');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
-- DROP TABLE IF EXISTS "sys_oss";
CREATE TABLE "sys_oss"  (
  "id" SERIAL NOT NULL,
  "url" varchar(255)  ,
  "size" int NOT NULL  ,
  "location" varchar(200)  ,
  "create_date" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)  ,
  "business" varchar(200)  ,
  "user_id" bigint NOT NULL  ,
  "user_account" varchar(32)  ,
  "type" varchar(255)  ,
  PRIMARY KEY ("id") 
)  ;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO "sys_oss" VALUES (1, 'http://localhost:8081/static/b37f8d762222ffbf280fa708b4b57f4a.jpg', 59975, 'D:\\programmeWork\\kapok\\nest-admin\\upload\\347811e1f6da4221a09cee7f3c7b03ce.jpeg', '2021-11-23 21:13:01.820103', '头像', 1, 'admin', 'image/jpeg');
INSERT INTO "sys_oss" VALUES (2, 'http://localhost:8081/static/67f57d2058984103afc54d164aff5648.jpeg', 59767, 'D:\\programmeWork\\kapok\\nest-admin\\upload\\aa96fb05de9945f690e6d4b8a0f9b5e4.jpeg', '2021-11-24 19:51:01.567326', '头像', 1, 'admin', 'image/jpeg');
INSERT INTO "sys_oss" VALUES (3, 'http://localhost:8081/static/59f38c077c758158297d70061431429b.jpg', 59516, 'D:\\programmeWork\\kapok\\nest-admin\\upload\\67f57d2058984103afc54d164aff5648.jpeg', '2021-11-24 20:31:04.633617', '头像', 1, 'admin', 'image/jpeg');
INSERT INTO "sys_oss" VALUES (4, 'http://localhost:8081/static/用户导入模板.xlsx', 10956, 'D:\\programmeWork\\kapok\\nest-admin\\upload\\用户导入模板.xlsx', '2023-04-24 23:48:09.000000', '文档', 1, 'admin', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
-- DROP TABLE IF EXISTS "sys_post";
CREATE TABLE "sys_post"  (
  "id" SERIAL NOT NULL,
  "code" varchar(50)  ,
  "status" int NOT NULL DEFAULT 1  ,
  "remark" text ,
  "order_num" int NOT NULL DEFAULT 0  ,
  "create_date" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)  ,
  "name" varchar(50) ,
  PRIMARY KEY ("id") 
)  ;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO "sys_post" VALUES (2, 'hr', 0, '山东科技山东科技花生壳', 1, '2022-01-06 20:32:01.513000', '人事');
INSERT INTO "sys_post" VALUES (3, 'it', 1, '写代码', 0, '2022-01-06 04:32:56.250000', '技术员');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
-- DROP TABLE IF EXISTS "sys_role";
CREATE TABLE "sys_role"  (
  "id" SERIAL NOT NULL,
  "name" varchar(100)  ,
  "remark" varchar(100)  ,
  "create_date" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)  ,
  "update_date" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)   ,
  PRIMARY KEY ("id") 
)  ;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "sys_role" VALUES (1, '测试', '测试橘色', '2021-11-18 21:41:50.187783', '2021-11-18 21:41:50.187783');
INSERT INTO "sys_role" VALUES (2, '测试22', '测试呀', '2021-12-30 23:22:18.454332', '2023-06-23 01:46:20.000000');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
-- DROP TABLE IF EXISTS "sys_role_menu";
CREATE TABLE "sys_role_menu"  (
  "id" SERIAL NOT NULL,
  "role_id" bigint NOT NULL  ,
  "menu_id" bigint NOT NULL ,
  PRIMARY KEY ("id") 
) ;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO "sys_role_menu" VALUES (1, 1, 1);
INSERT INTO "sys_role_menu" VALUES (2, 1, 2);
INSERT INTO "sys_role_menu" VALUES (3, 1, 3);
INSERT INTO "sys_role_menu" VALUES (4, 1, 8);
INSERT INTO "sys_role_menu" VALUES (5, 1, 9);
INSERT INTO "sys_role_menu" VALUES (6, 1, 10);
INSERT INTO "sys_role_menu" VALUES (7, 1, 11);
INSERT INTO "sys_role_menu" VALUES (8, 1, 4);
INSERT INTO "sys_role_menu" VALUES (9, 1, 12);
INSERT INTO "sys_role_menu" VALUES (10, 1, 13);
INSERT INTO "sys_role_menu" VALUES (11, 1, 14);
INSERT INTO "sys_role_menu" VALUES (12, 1, 15);
INSERT INTO "sys_role_menu" VALUES (13, 1, 5);
INSERT INTO "sys_role_menu" VALUES (14, 1, 6);
INSERT INTO "sys_role_menu" VALUES (15, 1, 16);
INSERT INTO "sys_role_menu" VALUES (16, 1, 17);
INSERT INTO "sys_role_menu" VALUES (17, 1, 18);
INSERT INTO "sys_role_menu" VALUES (18, 1, 7);
INSERT INTO "sys_role_menu" VALUES (21, 2, 2);
INSERT INTO "sys_role_menu" VALUES (22, 2, 4);
INSERT INTO "sys_role_menu" VALUES (23, 2, 3);
INSERT INTO "sys_role_menu" VALUES (24, 2, 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
-- DROP TABLE IF EXISTS "sys_user";
CREATE TABLE "sys_user"  (
  "id" SERIAL NOT NULL,
  "password" varchar(200)  ,
  "salt" varchar(200) ,
  "account" varchar(32)  ,
  "phone_num" varchar(20)  ,
  "email" varchar(255)  ,
  "status" int NOT NULL DEFAULT 1 ,
  "avatar" varchar(255)  ,
  "type" int NOT NULL DEFAULT 1  ,
  "create_date" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)  ,
  "update_date" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)    ,
  PRIMARY KEY ("id") 
)  ;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "sys_user" VALUES (1, '$2a$10$JChCYKwJYbVV4ANalu2tBenViaF3fuQGAJ1NSBOtR8HJNCV7H710i', '$2a$10$JChCYKwJYbVV4ANalu2tBe', 'admin', '18374914562', '123@qq.com', 1, 'http://localhost:8081/static/67f57d2058984103afc54d164aff5648.jpeg', 0, '2021-11-15 16:09:23.000000', '2023-04-26 15:24:39.000000');
INSERT INTO "sys_user" VALUES (2, '$2a$10$NSrq5H2chKrcMy/AeiHqK.C1ER40JmLWCh/OIpXkL/nZ4lHN/epse', '$2a$10$NSrq5H2chKrcMy/AeiHqK.', 'test', '18374915874', '12345@qq.com', 1, 'http://localhost:8081/static/67f57d2058984103afc54d164aff5648.jpeg', 1, '2021-12-30 15:25:47.000000', '2023-06-24 17:17:06.000000');

-- ----------------------------
-- Table structure for sys_user_dept
-- ----------------------------
-- DROP TABLE IF EXISTS "sys_user_dept";
CREATE TABLE "sys_user_dept"  (
  "id" SERIAL NOT NULL,
  "user_id" bigint NOT NULL ,
  "dept_id" bigint NOT NULL  ,
  PRIMARY KEY ("id") 
) ;

-- ----------------------------
-- Records of sys_user_dept
-- ----------------------------
INSERT INTO "sys_user_dept" VALUES (1, 2, 2);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
-- DROP TABLE IF EXISTS "sys_user_post";
CREATE TABLE "sys_user_post"  (
  "id" SERIAL NOT NULL,
  "user_id" bigint NOT NULL  ,
  "post_id" bigint NOT NULL  ,
  PRIMARY KEY ("id") 
)  ;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
-- DROP TABLE IF EXISTS "sys_user_role";
CREATE TABLE "sys_user_role"  (
  "id" SERIAL NOT NULL,
  "user_id" bigint NOT NULL  ,
  "role_id" bigint NOT NULL  ,
  PRIMARY KEY ("id") 
)  ;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO "sys_user_role" VALUES (33, 2, 2);
INSERT INTO "sys_user_role" VALUES (34, 2, 1);
 
