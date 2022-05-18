/*
 Navicat Premium Data Transfer

 Source Server         : .
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : localhost:3306
 Source Schema         : blogadmin

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 18/05/2022 10:49:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  `userId` bigint(11) NULL DEFAULT NULL COMMENT '用户id',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章状态1、已发布 2、草稿',
  `fmt_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编辑器类型markdown,html',
  `hits` int(11) NULL DEFAULT NULL COMMENT '点击量',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '目录id',
  `createTime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `authorName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者名',
  `first_picture` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `istop` tinyint(1) NULL DEFAULT 0 COMMENT '是否置顶',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for articlecategory
-- ----------------------------
DROP TABLE IF EXISTS `articlecategory`;
CREATE TABLE `articlecategory`  (
  `category_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '目录id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目录名',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `parentId` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '父级ID',
  `pic_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颜色',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of articlecategory
-- ----------------------------
INSERT INTO `articlecategory` VALUES (7, 'wpf', NULL, 0, 'http://localhost:9999/uploads/2022413//b41212f11a2dafdd.webp', '#2b73af');

-- ----------------------------
-- Table structure for gen_demo
-- ----------------------------
DROP TABLE IF EXISTS `gen_demo`;
CREATE TABLE `gen_demo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `showStatus` int(4) NOT NULL COMMENT '显示状态',
  `addTime` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `sex` int(4) NULL DEFAULT NULL COMMENT '用户性别',
  `sort` int(4) NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `beginTime` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `feature` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特征',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `tableId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `tableName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `tableComment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `subTableName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `subTableFkName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `className` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tplCategory` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `baseNameSpace` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成命名空间前缀',
  `moduleName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `businessName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `functionName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `functionAuthor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `genType` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `genPath` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `dbName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库名',
  PRIMARY KEY (`tableId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 't_blogconfig', '博客信息配置', NULL, NULL, 'Blogconfig', 'crud', 'ZR.', 'Blog', 'TBlogconfig', '博客前台配置表信息修改', 'ztc', '0', '', '{\"treeCode\":\"\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuId\":null,\"sortField\":\"\",\"sortType\":\"asc\",\"checkedBtn\":\"\"}', 'admin', '2022-03-25 10:10:10', 'admin', '2022-03-25 10:17:30', NULL, 'blogadmin');
INSERT INTO `gen_table` VALUES (2, 't_blogessays', '博客随笔表', NULL, NULL, 'Blogessays', 'crud', 'ZR.', 'blog', 'TBlogessays', '随笔管理', 'ztc', '0', '/', '{\"treeCode\":\"\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuId\":2006,\"sortField\":\"CreateTime\",\"sortType\":\"desc\",\"checkedBtn\":\"1,2,3\"}', 'admin', '2022-03-25 17:25:18', 'admin', '2022-03-25 17:31:51', NULL, 'blogadmin');
INSERT INTO `gen_table` VALUES (3, 't_blogproject', '博客项目表', NULL, NULL, 'Blogproject', 'crud', 'ZR.', 'Blog', 'TBlogproject', '博客项目表', 'ztc', '0', '/', '{\"treeCode\":\"\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuId\":2006,\"sortField\":\"\",\"sortType\":\"asc\",\"checkedBtn\":\"1,2,3\"}', 'admin', '2022-03-29 13:31:10', 'admin', '2022-03-29 13:51:42', NULL, 'blogadmin');
INSERT INTO `gen_table` VALUES (4, 't_blogpersonalinfo', '博客个人信息', NULL, NULL, 'Blogpersonalinfo', 'crud', 'ZR.', 'Blog', 'TBlogpersonalinfo', '博客个人信息', 'ztc', '0', '/', '{\"treeCode\":\"\",\"treeName\":\"\",\"treeParentCode\":null,\"parentMenuId\":2006,\"sortField\":\"\",\"sortType\":\"asc\",\"checkedBtn\":\"\"}', 'admin', '2022-03-29 14:52:02', 'admin', '2022-03-29 14:54:30', NULL, 'blogadmin');
INSERT INTO `gen_table` VALUES (5, 'articlecategory', '文章类型', NULL, NULL, 'Articlecategory', 'crud', 'ZR.', 'Blog', 'Articlecategory', '文章类型', 'ztc', '0', '/', '{\"treeCode\":\"\",\"treeName\":\"\",\"treeParentCode\":null,\"parentMenuId\":2006,\"sortField\":\"CreateTime\",\"sortType\":\"desc\",\"checkedBtn\":\"1,2,3\"}', 'admin', '2022-03-30 17:14:35', 'admin', '2022-03-30 17:16:05', NULL, 'blogadmin');
INSERT INTO `gen_table` VALUES (6, 't_blogskill', '博客个人技能', NULL, NULL, 'Blogskill', 'crud', 'ZR.', 'Blog', 'TBlogskill', '博客个人技能', 'ztc', '0', '/', '{\"treeCode\":\"\",\"treeName\":\"\",\"treeParentCode\":null,\"parentMenuId\":null,\"sortField\":\"\",\"sortType\":\"asc\",\"checkedBtn\":\"1,2,3\"}', 'admin', '2022-03-31 10:35:16', 'admin', '2022-03-31 10:36:21', NULL, 'blogadmin');
INSERT INTO `gen_table` VALUES (7, 't_bloglinks', '博客友情链接', NULL, NULL, 'Bloglinks', 'crud', 'ZR.', 'Blog', 'TBloglinks', '博客友情链接', 'ztc', '0', '/', '{\"treeCode\":\"\",\"treeName\":\"\",\"treeParentCode\":null,\"parentMenuId\":2006,\"sortField\":\"\",\"sortType\":\"asc\",\"checkedBtn\":\"1,2,3\"}', 'admin', '2022-04-13 16:23:03', 'admin', '2022-04-13 16:23:57', NULL, 'blogadmin');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `columnId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `tableName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `tableId` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `columnName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `columnComment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `columnType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `csharpType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'C#类型',
  `csharpField` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'C#字段名',
  `isPk` tinyint(1) NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `isIncrement` tinyint(1) NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `isRequired` tinyint(1) NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `isInsert` tinyint(1) NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `isEdit` tinyint(1) NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `isList` tinyint(1) NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `isQuery` tinyint(4) NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `queryType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `htmlType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dictType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`columnId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 't_blogconfig', 1, 'title', '博客标题', 'varchar', 'string', 'Title', 0, 0, 1, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-25 10:10:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (2, 't_blogconfig', 1, 'copyright', '版权所有', 'varchar', 'string', 'Copyright', 0, 0, 1, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-25 10:10:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (3, 't_blogconfig', 1, 'authorQQ', '作者qq', 'varchar', 'string', 'AuthorQQ', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-25 10:10:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (4, 't_blogconfig', 1, 'authorWechart', '作者微信', 'varchar', 'string', 'AuthorWechart', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-25 10:10:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (5, 't_blogconfig', 1, 'authorEmail', '作者邮箱', 'varchar', 'string', 'AuthorEmail', 0, 0, 1, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-25 10:10:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (6, 't_blogconfig', 1, 'isOpenLogin', '是否开放登录', 'bit', 'bool', 'IsOpenLogin', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'radio', 'sys_normal_disable', 0, 'admin', '2022-03-25 10:10:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (7, 't_blogconfig', 1, 'isOpenRegister', '是否开放注册', 'bit', 'bool', 'IsOpenRegister', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'radio', 'sys_normal_disable', 0, 'admin', '2022-03-25 10:10:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (8, 't_blogconfig', 1, 'content', '博客简介', 'varchar', 'string', 'Content', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'textarea', '', 0, 'admin', '2022-03-25 10:10:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (9, 't_blogconfig', 1, 'bottomImage', '最下方图片链接', 'varchar', 'string', 'BottomImage', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'imageUpload', '', 0, 'admin', '2022-03-25 10:10:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (10, 't_blogconfig', 1, 'blogBackGroundImage', '博客背景图', 'varchar', 'string', 'BlogBackGroundImage', 0, 0, 1, 1, 1, 1, 0, 'EQ', 'imageUpload', '', 0, 'admin', '2022-03-25 10:10:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (11, 't_blogconfig', 1, 'fundedAlipayImg', '支付宝赞助图片', 'varchar', 'string', 'FundedAlipayImg', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'imageUpload', '', 0, 'admin', '2022-03-25 10:10:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (12, 't_blogconfig', 1, 'fundedWechartImg', '微信赞助图片', 'varchar', 'string', 'FundedWechartImg', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'imageUpload', '', 0, 'admin', '2022-03-25 10:10:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (13, 't_blogessays', 2, 'id', '', 'int', 'int', 'Id', 1, 1, 1, 0, 0, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-25 17:25:18', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (14, 't_blogessays', 2, 'title', '标题', 'varchar', 'string', 'Title', 0, 0, 0, 1, 1, 1, 1, 'LIKE', 'input', '', 0, 'admin', '2022-03-25 17:25:18', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (15, 't_blogessays', 2, 'color', '边框色彩', 'varchar', 'string', 'Color', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-25 17:25:18', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (16, 't_blogessays', 2, 'content', '内容', 'text', 'string', 'Content', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-25 17:25:18', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (17, 't_blogessays', 2, 'createTime', '创建时间', 'datetime', 'DateTime', 'CreateTime', 0, 0, 0, 1, 1, 1, 0, 'BETWEEN', 'datetime', '', 0, 'admin', '2022-03-25 17:25:18', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (18, 't_blogessays', 2, 'authorName', '作者名', 'varchar', 'string', 'AuthorName', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-25 17:25:18', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (19, 't_blogproject', 3, 'id', '', 'int', 'int', 'Id', 1, 1, 1, 0, 0, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-29 13:31:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (20, 't_blogproject', 3, 'content', '描述', 'text', 'string', 'Content', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'textarea', '', 0, 'admin', '2022-03-29 13:31:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (21, 't_blogproject', 3, 'title', '名称', 'varchar', 'string', 'Title', 0, 0, 0, 1, 1, 1, 1, 'LIKE', 'input', '', 0, 'admin', '2022-03-29 13:31:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (22, 't_blogproject', 3, 'typeName', '类型', 'varchar', 'string', 'TypeName', 0, 0, 0, 1, 1, 1, 1, 'EQ', 'select', 'blog_project_type', 0, 'admin', '2022-03-29 13:31:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (23, 't_blogproject', 3, 'pic_url', '图片', 'varchar', 'string', 'PicUrl', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'imageUpload', '', 0, 'admin', '2022-03-29 13:31:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (24, 't_blogproject', 3, 'techs', '技术栈', 'varchar', 'string', 'Techs', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-29 13:31:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (25, 't_blogproject', 3, 'url', '项目地址', 'varchar', 'string', 'Url', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-29 13:31:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (26, 't_blogproject', 3, 'createTime', '创建时间', 'datetime', 'DateTime', 'CreateTime', 0, 0, 0, 0, 0, 1, 0, 'BETWEEN', 'datetime', '', 0, 'admin', '2022-03-29 13:31:10', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (27, 't_blogpersonalinfo', 4, 'id', '', 'int', 'int', 'Id', 1, 1, 1, 0, 0, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (28, 't_blogpersonalinfo', 4, 'name', '姓名', 'varchar', 'string', 'Name', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (29, 't_blogpersonalinfo', 4, 'sex', '性别', 'varchar', 'string', 'Sex', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'select', 'sys_user_sex', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (30, 't_blogpersonalinfo', 4, 'age', '年龄', 'int', 'int', 'Age', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'inputNumber', '', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (31, 't_blogpersonalinfo', 4, 'degree', '学历', 'varchar', 'string', 'Degree', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (32, 't_blogpersonalinfo', 4, 'height', '身高cm', 'int', 'int', 'Height', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'inputNumber', '', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (33, 't_blogpersonalinfo', 4, 'weight', '体重kg', 'double', 'string', 'Weight', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'inputNumber', '', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (34, 't_blogpersonalinfo', 4, 'birthday', '出生日期', 'date', 'DateTime', 'Birthday', 0, 0, 0, 1, 1, 1, 0, 'BETWEEN', 'datetime', '', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (35, 't_blogpersonalinfo', 4, 'school', '学校', 'varchar', 'string', 'School', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (36, 't_blogpersonalinfo', 4, 'specialized', '专业', 'varchar', 'string', 'Specialized', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (37, 't_blogpersonalinfo', 4, 'blood', '血型', 'varchar', 'string', 'Blood', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (38, 't_blogpersonalinfo', 4, 'giteeUrl', '码云地址', 'varchar', 'string', 'GiteeUrl', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (39, 't_blogpersonalinfo', 4, 'gitHubUrl', 'Github地址', 'varchar', 'string', 'GitHubUrl', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (40, 't_blogpersonalinfo', 4, 'cSDNUrl', 'CSDN博客地址', 'varchar', 'string', 'CSDNUrl', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (41, 't_blogpersonalinfo', 4, 'email', '邮箱', 'varchar', 'string', 'Email', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (42, 't_blogpersonalinfo', 4, 'avatar', '头像', 'varchar', 'string', 'Avatar', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'imageUpload', '', 0, 'admin', '2022-03-29 14:52:02', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (43, 'articlecategory', 5, 'category_id', '目录id', 'int', 'int', 'CategoryId', 1, 1, 1, 0, 0, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-30 17:14:35', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (44, 'articlecategory', 5, 'name', '目录名', 'varchar', 'string', 'Name', 0, 0, 1, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-30 17:14:35', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (45, 'articlecategory', 5, 'create_time', '创建时间', 'datetime', 'DateTime', 'CreateTime', 0, 0, 0, 1, 0, 0, 0, 'BETWEEN', 'datetime', '', 0, 'admin', '2022-03-30 17:14:35', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (46, 'articlecategory', 5, 'parentId', '父级ID', 'int', 'int', 'ParentId', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-30 17:14:35', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (47, 'articlecategory', 5, 'pic_url', '图片', 'varchar', 'string', 'PicUrl', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'imageUpload', '', 0, 'admin', '2022-03-30 17:14:35', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (48, 'articlecategory', 5, 'color', '颜色', 'varchar', 'string', 'Color', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-30 17:14:35', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (49, 't_blogskill', 6, 'id', '', 'int', 'int', 'Id', 1, 1, 1, 0, 0, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-31 10:35:16', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (50, 't_blogskill', 6, 'name', '技能名称', 'varchar', 'string', 'Name', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-31 10:35:16', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (51, 't_blogskill', 6, 'picIcon', '技能icon', 'varchar', 'string', 'PicIcon', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'customInput', '', 0, 'admin', '2022-03-31 10:35:16', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (52, 't_blogskill', 6, 'des', '节能描述', 'varchar', 'string', 'Des', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-03-31 10:35:16', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (53, 't_bloglinks', 7, 'id', '', 'int', 'int', 'Id', 1, 1, 1, 0, 0, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-04-13 16:23:03', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (54, 't_bloglinks', 7, 'name', '名称', 'varchar', 'string', 'Name', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-04-13 16:23:03', NULL, NULL, NULL);
INSERT INTO `gen_table_column` VALUES (55, 't_bloglinks', 7, 'links', '跳转链接', 'varchar', 'string', 'Links', 0, 0, 0, 1, 1, 1, 0, 'EQ', 'input', '', 0, 'admin', '2022-04-13 16:23:03', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `configId` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `configName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `configKey` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `configValue` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `configType` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`configId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-03-23 17:24:21', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-03-23 17:24:21', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-03-23 17:24:21', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2022-03-23 17:24:21', '', NULL, '是否开启验证码功能（off、关闭，1、动态验证码 2、动态gif泡泡 3、泡泡 4、静态验证码）');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dictCode` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dictSort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dictLabel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dictValue` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dictType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `cssClass` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `listClass` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `isDefault` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dictCode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '异常', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:21', '', '2021-07-02 14:09:09', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-02-24 10:56:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 1, '发布', '1', 'sys_article_status', NULL, NULL, NULL, '0', 'admin', '2021-08-19 10:34:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (30, 2, '草稿', '2', 'sys_article_status', NULL, NULL, NULL, '0', 'admin', '2021-08-19 10:35:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (31, 0, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (32, 0, '爱好', '1', 'blog_project_type', 'text-success', 'default', NULL, '0', 'admin', '2022-03-29 13:39:38', '', '2022-03-31 09:42:24', NULL);
INSERT INTO `sys_dict_data` VALUES (33, 1, '完整项目', '2', 'blog_project_type', 'text-info', 'default', NULL, '0', 'admin', '2022-03-29 13:40:06', '', '2022-03-31 09:42:29', NULL);
INSERT INTO `sys_dict_data` VALUES (34, 2, '小练习', '3', 'blog_project_type', 'text-navy', '', NULL, '0', 'admin', '2022-03-29 14:03:37', '', '2022-03-31 09:42:46', NULL);
INSERT INTO `sys_dict_data` VALUES (35, 3, '作品', '4', 'blog_project_type', 'text-green', '', NULL, '0', 'admin', '2022-03-31 09:41:52', '', '2022-03-31 09:42:53', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dictId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dictName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dictType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dictId`) USING BTREE,
  UNIQUE INDEX `dictType`(`dictType`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'Y', 'admin', '2022-03-23 17:24:20', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'Y', 'admin', '2022-03-23 17:24:20', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'Y', 'admin', '2022-03-23 17:24:20', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'Y', 'admin', '2022-03-23 17:24:20', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'Y', 'admin', '2022-03-23 17:24:20', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'Y', 'admin', '2022-03-23 17:24:20', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'Y', 'admin', '2022-03-23 17:24:20', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'Y', 'admin', '2022-03-23 17:24:20', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'Y', 'admin', '2022-03-23 17:24:20', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'Y', 'admin', '2022-03-23 17:24:20', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '文章状态', 'sys_article_status', '0', 'Y', 'admin', '2022-03-23 17:24:20', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (12, '项目类型', 'blog_project_type', '0', 'N', 'admin', '2022-03-29 13:34:48', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint(11) NOT NULL,
  `realName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件真实名',
  `fileName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `fileUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件存储地址',
  `storePath` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库位置',
  `accessUrl` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问路径',
  `fileSize` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `fileType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `fileExt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件扩展名',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  `storeType` int(4) NULL DEFAULT NULL COMMENT '存储类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (1506863561182416896, '1.jpg', '55035f98bf08357f.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022324/55035f98bf08357f.jpg', NULL, 'http://localhost:8888/uploads/2022324//55035f98bf08357f.jpg', '49kb', 'image/jpeg', '.jpg', 'admin', '2022-03-24 13:20:44', 1);
INSERT INTO `sys_file` VALUES (1506864290559299584, '1.jpg', '9a7ab3418b363cc5.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022324/9a7ab3418b363cc5.jpg', NULL, 'http://localhost:8888/uploads/2022324//9a7ab3418b363cc5.jpg', '49kb', 'image/jpeg', '.jpg', 'admin', '2022-03-24 13:23:38', 1);
INSERT INTO `sys_file` VALUES (1506865226027503616, '1.jpg', 'dd4ed27d76b039c3.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022324/dd4ed27d76b039c3.jpg', NULL, 'http://localhost:8888/uploads/2022324//dd4ed27d76b039c3.jpg', '49kb', 'image/jpeg', '.jpg', 'admin', '2022-03-24 13:27:21', 1);
INSERT INTO `sys_file` VALUES (1506865753918410752, '1.jpg', '1675a583ea20e588.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022324/1675a583ea20e588.jpg', NULL, 'http://localhost:8888/uploads/2022324//1675a583ea20e588.jpg', '49kb', 'image/jpeg', '.jpg', 'admin', '2022-03-24 13:29:27', 1);
INSERT INTO `sys_file` VALUES (1506866020999106560, '1.jpg', 'a5f131f6c61986b4.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022324/a5f131f6c61986b4.jpg', NULL, 'http://localhost:8888/uploads/2022324//a5f131f6c61986b4.jpg', '49kb', 'image/jpeg', '.jpg', 'admin', '2022-03-24 13:30:30', 1);
INSERT INTO `sys_file` VALUES (1506866189148753920, '1.jpg', '426d0d146520b08f.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022324/426d0d146520b08f.jpg', NULL, 'http://localhost:8888/uploads/2022324//426d0d146520b08f.jpg', '49kb', 'image/jpeg', '.jpg', 'admin', '2022-03-24 13:31:10', 1);
INSERT INTO `sys_file` VALUES (1506867329336741888, '1.jpg', '0927fe9863bf8c16.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022324/0927fe9863bf8c16.jpg', NULL, 'http://localhost:8888/uploads/2022324//0927fe9863bf8c16.jpg', '49kb', 'image/jpeg', '.jpg', 'admin', '2022-03-24 13:35:42', 1);
INSERT INTO `sys_file` VALUES (1506867613278539776, '1.jpg', '7c74110418ebac88.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022324/7c74110418ebac88.jpg', NULL, 'http://localhost:8888/uploads/2022324//7c74110418ebac88.jpg', '49kb', 'image/jpeg', '.jpg', 'admin', '2022-03-24 13:36:50', 1);
INSERT INTO `sys_file` VALUES (1506868545059950592, '1.jpg', '26f7898e5c86a830.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022324/26f7898e5c86a830.jpg', NULL, 'http://localhost:8888/uploads/2022324//26f7898e5c86a830.jpg', '49kb', 'image/jpeg', '.jpg', 'admin', '2022-03-24 13:40:32', 1);
INSERT INTO `sys_file` VALUES (1506919164642725888, '1.jpg', '8c0e545c6be1c21c.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022324/8c0e545c6be1c21c.jpg', NULL, 'http://localhost:8888/uploads/2022324//8c0e545c6be1c21c.jpg', '49kb', 'image/jpeg', '.jpg', 'admin', '2022-03-24 17:01:41', 1);
INSERT INTO `sys_file` VALUES (1507192271118929920, '1.jpg', 'a7cd85a839c277d0.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022325/a7cd85a839c277d0.jpg', NULL, 'http://localhost:8888/uploads/2022325//a7cd85a839c277d0.jpg', '49kb', 'image/jpeg', '.jpg', 'admin', '2022-03-25 11:06:54', 1);
INSERT INTO `sys_file` VALUES (1507193742157811712, '1.jpg', '740d85987ccf77ba.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022325/740d85987ccf77ba.jpg', NULL, 'http://localhost:8888/uploads/2022325//740d85987ccf77ba.jpg', '49kb', 'image/jpeg', '.jpg', 'admin', '2022-03-25 11:12:45', 1);
INSERT INTO `sys_file` VALUES (1507195205688889344, '1.jpg', 'ce46d2de5419be0d.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022325/ce46d2de5419be0d.jpg', NULL, 'http://localhost:8888/uploads/2022325//ce46d2de5419be0d.jpg', '49kb', 'image/jpeg', '.jpg', 'admin', '2022-03-25 11:18:34', 1);
INSERT INTO `sys_file` VALUES (1507195621587685376, '1.jpg', '07b1806b279e82e4.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022325/07b1806b279e82e4.jpg', NULL, 'http://localhost:8888/uploads/2022325//07b1806b279e82e4.jpg', '49kb', 'image/jpeg', '.jpg', 'admin', '2022-03-25 11:20:13', 1);
INSERT INTO `sys_file` VALUES (1507267345066889216, '1.jpg', '3a57a156c937bae5.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022325/3a57a156c937bae5.jpg', NULL, 'http://localhost:8888/uploads/2022325//3a57a156c937bae5.jpg', '49kb', 'image/jpeg', '.jpg', 'admin', '2022-03-25 16:05:13', 1);
INSERT INTO `sys_file` VALUES (1507276587328999424, 'v2-590024ca18d8260be306112d1af32b03_r.jpg', '331bafb38158ba1e.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022325/331bafb38158ba1e.jpg', NULL, 'http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg', '247kb', 'image/jpeg', '.jpg', 'admin', '2022-03-25 16:41:57', 1);
INSERT INTO `sys_file` VALUES (1507276937515634688, '872306.png', 'b5293b77a44c55ce.png', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022325/b5293b77a44c55ce.png', NULL, 'http://localhost:8888/uploads/2022325//b5293b77a44c55ce.png', '2396kb', 'image/png', '.png', 'admin', '2022-03-25 16:43:20', 1);
INSERT INTO `sys_file` VALUES (1508683729688727552, '箱体坐标系.jpg', '2e054d6066436a57.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022329/2e054d6066436a57.jpg', NULL, 'http://localhost:8888/uploads/2022329//2e054d6066436a57.jpg', '28kb', 'image/jpeg', '.jpg', 'admin', '2022-03-29 13:53:26', 1);
INSERT INTO `sys_file` VALUES (1508690042250465280, '箱体坐标系.jpg', 'bb58142076163f6d.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022329/bb58142076163f6d.jpg', NULL, 'http://localhost:8888/uploads/2022329//bb58142076163f6d.jpg', '28kb', 'image/jpeg', '.jpg', 'admin', '2022-03-29 14:18:31', 1);
INSERT INTO `sys_file` VALUES (1508723002169233408, '1.webp', '8083d765156288ff.webp', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022329/8083d765156288ff.webp', NULL, 'http://localhost:8888/uploads/2022329//8083d765156288ff.webp', '9kb', 'image/webp', '.webp', 'admin', '2022-03-29 16:29:29', 1);
INSERT INTO `sys_file` VALUES (1508989135266910208, '1.webp', 'b397d8fca2f31968.webp', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022330/b397d8fca2f31968.webp', NULL, 'http://localhost:8888/uploads/2022330//b397d8fca2f31968.webp', '9kb', 'image/webp', '.webp', 'admin', '2022-03-30 10:07:00', 1);
INSERT INTO `sys_file` VALUES (1509349382745624576, '12.jpg', '0f063239ec1ae815.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022331/0f063239ec1ae815.jpg', NULL, 'http://localhost:8888/uploads/2022331//0f063239ec1ae815.jpg', '480kb', 'image/jpeg', '.jpg', 'admin', '2022-03-31 09:58:30', 1);
INSERT INTO `sys_file` VALUES (1509349860204220416, 'R-C.jpg', '6c5ed93b615100e2.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022331/6c5ed93b615100e2.jpg', NULL, 'http://localhost:8888/uploads/2022331//6c5ed93b615100e2.jpg', '92kb', 'image/jpeg', '.jpg', 'admin', '2022-03-31 10:00:24', 1);
INSERT INTO `sys_file` VALUES (1509350004421169152, 'R-C.jpg', 'cdde9ee9745429bf.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022331/cdde9ee9745429bf.jpg', NULL, 'http://localhost:8888/uploads/2022331//cdde9ee9745429bf.jpg', '92kb', 'image/jpeg', '.jpg', 'admin', '2022-03-31 10:00:58', 1);
INSERT INTO `sys_file` VALUES (1509461434445205504, '微信图片_20220331172019.jpg', '82284f8c7d8e1e7d.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022331/82284f8c7d8e1e7d.jpg', NULL, 'http://localhost:8888/uploads/2022331//82284f8c7d8e1e7d.jpg', '400kb', 'image/jpeg', '.jpg', 'admin', '2022-03-31 17:23:45', 1);
INSERT INTO `sys_file` VALUES (1509461449309818880, '微信图片_20220331172013.jpg', '0e3453ff8440a51a.jpg', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022331/0e3453ff8440a51a.jpg', NULL, 'http://localhost:8888/uploads/2022331//0e3453ff8440a51a.jpg', '139kb', 'image/jpeg', '.jpg', 'admin', '2022-03-31 17:23:49', 1);
INSERT INTO `sys_file` VALUES (1511581522422009856, '12.jpg', '80331E4F999E2210.jpg', NULL, 'uploads', 'ztc-bolg.oss-cn-beijing.aliyuncs.com/uploads/80331E4F999E2210.jpg', '480.0986328125kb', 'image/jpeg', '.jpg', 'admin', '2022-04-06 13:48:13', 2);
INSERT INTO `sys_file` VALUES (1511588592663793664, 'R-C.jpg', '490C63390C905768.jpg', NULL, 'uploads', 'https://ztc-bolg.oss-cn-beijing.aliyuncs.com/uploads/490C63390C905768.jpg', '92.232421875kb', 'image/jpeg', '.jpg', 'admin', '2022-04-06 14:16:19', 2);
INSERT INTO `sys_file` VALUES (1514130596010528768, 'wpf.webp', 'c97df5604f90a80c.webp', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022413/c97df5604f90a80c.webp', NULL, 'http://localhost:9999/uploads/2022413//c97df5604f90a80c.webp', '11kb', 'image/webp', '.webp', 'admin', '2022-04-13 14:37:20', 1);
INSERT INTO `sys_file` VALUES (1514131523899625472, 'wpf.webp', 'b41212f11a2dafdd.webp', 'E:/文档/张天赐/练习代码/Vstudio/个人博客/ZrAdminNetCore-master/ZR.Admin.WebApi/wwwroot/uploads/2022413/b41212f11a2dafdd.webp', NULL, 'http://localhost:9999/uploads/2022413//b41212f11a2dafdd.webp', '11kb', 'image/webp', '.webp', 'admin', '2022-04-13 14:41:01', 1);
INSERT INTO `sys_file` VALUES (1517415962306023424, 'p369349280.webp', 'FEBFC05371BEDC78.webp', NULL, 'uploads', 'https://ztc-bolg.oss-cn-beijing.aliyuncs.com/uploads/FEBFC05371BEDC78.webp', '166.927734375kb', 'image/webp', '.webp', 'admin', '2022-04-22 16:12:12', 2);
INSERT INTO `sys_file` VALUES (1517421199540490240, 'p369349280.webp', 'BE895AC610442B11.webp', NULL, 'uploads', 'https://ztc-bolg.oss-cn-beijing.aliyuncs.com/uploads/BE895AC610442B11.webp', '166.927734375kb', 'image/webp', '.webp', 'admin', '2022-04-22 16:33:01', 2);

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `infoId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `userName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `loginLocation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `loginTime` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '访问时间',
  PRIMARY KEY (`infoId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-23 17:45:36');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-24 10:37:52');
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-24 11:26:14');
INSERT INTO `sys_logininfor` VALUES (20, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-24 13:20:29');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-24 14:14:10');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-24 16:45:23');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-25 10:00:34');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-25 10:49:02');
INSERT INTO `sys_logininfor` VALUES (25, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-25 11:19:55');
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-25 16:04:53');
INSERT INTO `sys_logininfor` VALUES (27, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-25 16:40:48');
INSERT INTO `sys_logininfor` VALUES (28, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-25 17:23:31');
INSERT INTO `sys_logininfor` VALUES (29, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-26 09:11:30');
INSERT INTO `sys_logininfor` VALUES (30, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-29 13:28:13');
INSERT INTO `sys_logininfor` VALUES (31, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-29 14:02:07');
INSERT INTO `sys_logininfor` VALUES (32, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-29 14:51:31');
INSERT INTO `sys_logininfor` VALUES (33, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-29 15:26:38');
INSERT INTO `sys_logininfor` VALUES (34, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-29 15:59:54');
INSERT INTO `sys_logininfor` VALUES (35, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-29 16:32:27');
INSERT INTO `sys_logininfor` VALUES (36, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-30 09:53:25');
INSERT INTO `sys_logininfor` VALUES (37, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-30 10:25:12');
INSERT INTO `sys_logininfor` VALUES (38, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-30 15:35:42');
INSERT INTO `sys_logininfor` VALUES (39, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-30 16:46:41');
INSERT INTO `sys_logininfor` VALUES (40, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-30 17:28:24');
INSERT INTO `sys_logininfor` VALUES (41, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-31 09:13:55');
INSERT INTO `sys_logininfor` VALUES (42, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-31 09:45:13');
INSERT INTO `sys_logininfor` VALUES (43, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-31 10:34:57');
INSERT INTO `sys_logininfor` VALUES (44, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-31 11:41:49');
INSERT INTO `sys_logininfor` VALUES (45, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-31 13:18:48');
INSERT INTO `sys_logininfor` VALUES (46, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-31 14:17:50');
INSERT INTO `sys_logininfor` VALUES (47, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-31 14:23:55');
INSERT INTO `sys_logininfor` VALUES (48, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-31 15:08:20');
INSERT INTO `sys_logininfor` VALUES (49, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-03-31 17:23:34');
INSERT INTO `sys_logininfor` VALUES (50, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-04-06 13:41:06');
INSERT INTO `sys_logininfor` VALUES (51, 'admin', '172.18.87.79', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-04-06 14:15:13');
INSERT INTO `sys_logininfor` VALUES (52, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-04-12 11:09:08');
INSERT INTO `sys_logininfor` VALUES (53, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-04-12 11:13:46');
INSERT INTO `sys_logininfor` VALUES (54, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-04-12 16:46:16');
INSERT INTO `sys_logininfor` VALUES (55, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-04-13 10:43:29');
INSERT INTO `sys_logininfor` VALUES (56, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-04-13 11:23:51');
INSERT INTO `sys_logininfor` VALUES (57, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-04-13 14:36:39');
INSERT INTO `sys_logininfor` VALUES (58, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-04-13 16:17:47');
INSERT INTO `sys_logininfor` VALUES (59, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-04-13 17:17:32');
INSERT INTO `sys_logininfor` VALUES (60, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-04-14 09:22:30');
INSERT INTO `sys_logininfor` VALUES (61, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-04-14 09:54:37');
INSERT INTO `sys_logininfor` VALUES (62, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-04-14 10:28:56');
INSERT INTO `sys_logininfor` VALUES (63, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-04-22 16:11:45');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menuId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menuName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parentId` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `orderNum` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `isFrame` int(1) NULL DEFAULT 0 COMMENT '是否外链(0 否 1 是)',
  `isCache` int(1) NULL DEFAULT 0 COMMENT '是否缓存(0缓存 1不缓存)',
  `menuType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮 L链接）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2013 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 0, 0, 'M', '0', '0', '', 'system', '', '2022-03-23 17:24:20', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 0, 0, 'M', '0', '0', '', 'monitor', '', '2022-03-23 17:24:20', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 0, 0, 'M', '0', '0', '', 'tool', '', '2022-03-23 17:24:20', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (6, '控制台', 0, 0, 'dashboard', 'index_v1', 0, 0, 'C', '1', '0', '', 'dashboard', '', '2022-03-23 17:24:20', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (7, '图标icon', 0, 6, 'icon', 'components/icons/index', 0, 0, 'C', '1', '0', NULL, 'icon1', '', '2022-03-23 17:24:20', 'admin', NULL, NULL);
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 0, 0, 'C', '0', '0', 'system:user:list', 'user', '', '2022-03-23 17:24:20', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 0, 0, 'C', '0', '0', 'system:role:list', 'peoples', '', '2022-03-23 17:24:20', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 0, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', '', '2022-03-23 17:24:20', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 0, 0, 'C', '0', '0', 'system:dict:list', 'dict', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (106, '角色分配', 1, 2, 'roleusers', 'system/roleusers/index', 0, 0, 'C', '1', '0', 'system:roleusers:list', 'people', '', '2022-03-23 17:24:20', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (107, '参数设置', 1, 8, 'config', 'system/config/index', 0, 0, 'C', '1', '0', 'system:config:list', 'edit', '', '2022-03-23 17:24:20', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 10, 'log', '', 0, 0, 'M', '0', '0', '', 'log', '', '2022-03-23 17:24:20', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '通知公告', 1, 9, 'notice', 'system/notice/index', 0, 0, 'C', '0', '0', 'system:notice:list', 'message', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 10, 'job', 'monitor/job/index', 0, 0, 'C', '0', '0', '', 'job', '', '2022-03-23 17:24:20', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 11, 'server', 'monitor/server/index', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', '', '2022-03-23 17:24:20', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 12, 'cache', 'monitor/cache/index', 0, 0, 'C', '1', '1', 'monitor:cache:list', 'redis', '', '2022-03-23 17:24:20', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 13, 'build', 'tool/build/index', 0, 0, 'C', '0', '0', 'tool:build:list', 'build', '', '2022-03-23 17:24:20', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 14, 'gen', 'tool/gen/index', 0, 0, 'C', '0', '0', 'tool:gen:list', 'code', '', '2022-03-23 17:24:20', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 15, 'swagger', 'tool/swagger/index', 0, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', '', '2022-03-23 17:24:20', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (117, '发送邮件', 3, 16, 'sendEmail', 'tool/email/sendEmail', 0, 0, 'C', '0', '0', 'tool:email:send', 'email', '', '2022-03-23 17:24:20', '', NULL, '发送邮件菜单');
INSERT INTO `sys_menu` VALUES (118, '文章管理', 2006, 18, 'article', NULL, 0, 0, 'M', '0', '0', NULL, 'documentation', '', '2022-03-23 17:24:20', 'admin', NULL, NULL);
INSERT INTO `sys_menu` VALUES (119, '文章列表', 118, 1, 'index', 'blog/article/manager', 0, 0, 'C', '0', '0', 'blog:article:list', 'list', '', '2022-03-23 17:24:20', 'admin', NULL, NULL);
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 0, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', '', '2022-03-23 17:24:20', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 0, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', '', '2022-03-23 17:24:20', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 0, 0, 'F', '0', '0', 'system:user:query', '', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户添加', 100, 2, '', '', 0, 0, 'F', '0', '0', 'system:user:add', '', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 0, 0, 'F', '0', '0', 'system:user:edit', '', '', '2022-03-23 17:24:20', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 0, 0, 'F', '0', '0', 'system:user:delete', '', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 0, 0, 'F', '0', '0', 'system:user:export', '#', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 0, 0, 'F', '0', '0', 'system:user:import', '#', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 0, 0, 'F', '0', '0', 'system:user:resetPwd', '#', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 0, 0, 'F', '0', '0', 'system:role:query', '#', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 0, 0, 'F', '0', '0', 'system:role:add', '#', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 0, 0, 'F', '0', '0', 'system:role:edit', '#', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 0, 0, 'F', '0', '0', 'system:role:remove', '#', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色授权', 101, 5, '', '', 0, 0, 'F', '0', '0', 'system:role:authorize', '#', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 0, 0, 'F', '0', '0', 'system:menu:query', '#', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 0, 0, 'F', '0', '0', 'system:menu:add', '#', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 0, 0, 'F', '0', '0', 'system:menu:edit', '#', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 0, 0, 'F', '0', '0', 'system:menu:remove', '#', '', '2022-03-23 17:24:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '修改排序', 102, 5, '', '', 0, 0, 'F', '0', '0', 'system:menu:changeSort', '', '', '2022-03-23 17:24:20', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 1, '', '', 0, 0, 'F', '0', '0', 'system:dict:add', NULL, '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 2, '', '', 0, 0, 'F', '0', '0', 'system:dict:edit', NULL, '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 3, '', '', 0, 0, 'F', '0', '0', 'system:dict:remove', NULL, '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1029, '新增用户', 106, 2, '', '', 0, 0, 'F', '0', '0', 'system:roleusers:add', NULL, '', '2022-03-23 17:24:20', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1030, '删除用户', 106, 3, '', '', 0, 0, 'F', '0', '0', 'system:roleusers:remove', NULL, '', '2022-03-23 17:24:20', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1032, '任务查询', 110, 1, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:list', '#', '', '2022-03-23 17:24:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '任务新增', 110, 2, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:add', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1034, '任务删除', 110, 3, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:delete', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1035, '任务修改', 110, 4, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:edit', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1036, '任务启动', 110, 5, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:start', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1037, '任务运行', 110, 7, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:run', NULL, '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1038, '任务停止', 110, 8, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:stop', NULL, '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1039, '任务日志', 2, 0, 'job/log', 'monitor/job/log', 0, 0, 'C', '1', '0', 'monitor:job:query', 'log', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1040, '任务导出', 110, 10, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:export', NULL, '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1041, '操作查询', 500, 1, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:operlog:query', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1042, '操作删除', 500, 2, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:operlog:remove', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1043, '操作日志导出', 500, 3, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:operlog:export', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1044, '登录查询', 501, 1, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:logininfor:query', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1045, '登录删除', 501, 1, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:logininfor:remove', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1046, '登录日志导出', 501, 1, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:logininfor:export', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1047, '发布文章', 118, 0, 'publish', 'blog/article/publish', 0, 0, 'C', '0', '0', 'blog:article:publish', 'log', '', '2022-03-23 17:24:20', 'admin', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1048, '文章新增', 118, 3, '#', NULL, 0, 0, 'F', '0', '0', 'blog:article:add', '', '', '2022-03-23 17:24:21', 'admin', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1049, '文章修改', 118, 4, '#', NULL, 0, 0, 'F', '0', '0', 'blog:article:update', '', '', '2022-03-23 17:24:21', 'admin', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1050, '文章删除', 118, 5, '#', NULL, 0, 0, 'F', '0', '0', 'blog:article:delete', '', '', '2022-03-23 17:24:21', 'admin', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1051, '查询公告', 109, 1, '#', NULL, 0, 0, 'F', '0', '0', 'system:notice:query', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1052, '新增公告', 109, 2, '#', NULL, 0, 0, 'F', '0', '0', 'system:notice:add', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1053, '删除公告', 109, 3, '#', NULL, 0, 0, 'F', '0', '0', 'system:notice:delete', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1054, '修改公告', 109, 4, '#', NULL, 0, 0, 'F', '0', '0', 'system:notice:update', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1055, '导出公告', 109, 5, '#', NULL, 0, 0, 'F', '0', '0', 'system:notice:export', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1060, '生成修改', 3, 1, '/gen/editTable', 'tool/gen/editTable', 0, 0, 'C', '1', '0', 'tool:gen:edit', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1061, '生成查询', 115, 1, '#', NULL, 0, 0, 'F', '0', '0', 'tool:gen:query', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1062, '生成删除', 115, 1, '#', NULL, 0, 0, 'F', '0', '0', 'tool:gen:remove', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1063, '导入代码', 115, 1, '#', NULL, 0, 0, 'F', '0', '0', 'tool:gen:import', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1064, '生成代码', 115, 1, '#', NULL, 0, 0, 'F', '0', '0', 'tool:gen:code', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1065, '预览代码', 115, 1, '#', NULL, 0, 0, 'F', '0', '0', 'tool:gen:preview', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1070, '岗位导出', 104, 4, '', '', 0, 0, 'F', '0', '0', 'system:post:export', '', '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1071, '字典导出', 105, 3, '', '', 0, 0, 'F', '0', '0', 'system:dict:export', NULL, '', '2022-03-23 17:24:21', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2000, '文件存储', 3, 17, 'file', 'tool/file/index', 0, 0, 'C', '0', '0', 'tool:file:list', 'upload', '', '2022-03-23 17:24:21', '', NULL, '文件存储菜单');
INSERT INTO `sys_menu` VALUES (2001, '查询', 2000, 1, '#', NULL, 0, 0, 'F', '0', '0', 'tool:file:query', '', '', '2022-03-23 17:24:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '新增', 2000, 2, '#', NULL, 0, 0, 'F', '0', '0', 'tool:file:add', '', '', '2022-03-23 17:24:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '删除', 2000, 3, '#', NULL, 0, 0, 'F', '0', '0', 'tool:file:delete', '', '', '2022-03-23 17:24:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '修改', 2000, 4, '#', NULL, 0, 0, 'F', '0', '0', 'tool:file:update', '', '', '2022-03-23 17:24:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '导出', 2000, 5, '#', NULL, 0, 0, 'F', '0', '0', 'tool:file:export', '', '', '2022-03-23 17:24:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '博客管理', 0, 19, 'blog', NULL, 0, 0, 'M', '0', '0', NULL, 'menu', 'admin', '2022-03-24 10:50:22', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2007, '标签管理', 2006, 20, 'tag', 'blog/tag/index', 0, 0, 'C', '0', '0', 'blog:tag', 'star', 'admin', '2022-03-24 16:46:49', 'admin', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2008, '博客配置', 2006, 0, 'tblogconfig', 'blog/TBlogconfig', 0, 0, 'C', '0', '0', 'blog:blogconfig', 'system', 'admin', '2022-03-25 10:50:59', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2009, '随笔', 2006, 2, 'tblogessays', 'blog/TBlogessays', 0, 0, 'C', '0', '0', 'blog:tblogessays', 'dict', 'admin', '2022-03-25 17:37:08', 'admin', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2010, '作品爱好管理', 2006, 3, 'tblogproject', 'blog/TBlogproject', 0, 0, 'C', '0', '0', 'blog:tblogproject', 'clipboard', 'admin', '2022-03-29 13:47:59', 'admin', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2011, '博客个人信息', 2006, 1, 'tblogpersonalinfo', 'blog/TBlogpersonalinfo', 0, 0, 'C', '0', '0', 'blog:tblogpersonalinfo', 'edit', 'admin', '2022-03-29 15:12:54', 'admin', NULL, NULL);
INSERT INTO `sys_menu` VALUES (2012, '文章类型管理', 2006, 21, 'articlecategory', 'blog/article/Articlecategory', 0, 0, 'C', '0', '0', NULL, 'cascader', 'admin', '2022-03-30 17:30:35', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `operId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `businessType` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `requestMethod` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operatorType` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `operName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `deptName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `operUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `operIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `operLocation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `operParam` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `jsonResult` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `errorMsg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `operTime` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `elapsed` bigint(20) NULL DEFAULT NULL COMMENT '请求用时',
  PRIMARY KEY (`operId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 243 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-24 10:37:34', 0);
INSERT INTO `sys_oper_log` VALUES (2, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-24 10:37:36', 0);
INSERT INTO `sys_oper_log` VALUES (3, '菜单管理', 3, 'SysMenu.Remove()', 'DELETE', 0, 'admin', NULL, '/system/Menu/103', '127.0.0.1', '0 内网IP', '', '{  \"code\": 110,  \"msg\": \"存在子菜单,不允许删除\"}', 0, NULL, '2022-03-24 10:39:34', 0);
INSERT INTO `sys_oper_log` VALUES (4, '菜单管理', 3, 'SysMenu.Remove()', 'DELETE', 0, 'admin', NULL, '/system/Menu/1018', '127.0.0.1', '0 内网IP', '', '{  \"code\": 110,  \"msg\": \"菜单已分配,不允许删除\"}', 0, NULL, '2022-03-24 10:39:43', 0);
INSERT INTO `sys_oper_log` VALUES (5, '用户管理', 3, 'SysUser.Remove()', 'DELETE', 0, 'admin', NULL, '/system/user/2', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 10:39:54', 0);
INSERT INTO `sys_oper_log` VALUES (6, '用户管理', 3, 'SysUser.Remove()', 'DELETE', 0, 'admin', NULL, '/system/user/3', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 10:39:57', 0);
INSERT INTO `sys_oper_log` VALUES (7, NULL, 0, NULL, 'DELETE', 0, 'admin', NULL, '/system/role/2', '127.0.0.1', '0 内网IP', '', '{\"code\":0,\"msg\":\"\\u666e\\u901a\\u89d2\\u8272\\u5df2\\u5206\\u914d,\\u4e0d\\u80fd\\u5220\\u9664\",\"data\":null}', 1, '普通角色已分配,不能删除', '2022-03-24 10:40:08', 0);
INSERT INTO `sys_oper_log` VALUES (8, NULL, 0, NULL, 'DELETE', 0, 'admin', NULL, '/system/role/2', '127.0.0.1', '0 内网IP', '', '{\"code\":0,\"msg\":\"\\u666e\\u901a\\u89d2\\u8272\\u5df2\\u5206\\u914d,\\u4e0d\\u80fd\\u5220\\u9664\",\"data\":null}', 1, '普通角色已分配,不能删除', '2022-03-24 10:41:57', 0);
INSERT INTO `sys_oper_log` VALUES (9, NULL, 0, NULL, 'DELETE', 0, 'admin', NULL, '/system/role/2', '127.0.0.1', '0 内网IP', '', '{\"code\":0,\"msg\":\"\\u666e\\u901a\\u89d2\\u8272\\u5df2\\u5206\\u914d,\\u4e0d\\u80fd\\u5220\\u9664\",\"data\":null}', 1, '普通角色已分配,不能删除', '2022-03-24 10:42:53', 0);
INSERT INTO `sys_oper_log` VALUES (10, '角色管理', 3, 'SysRole.Remove()', 'DELETE', 0, 'admin', NULL, '/system/role/2', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 10:43:11', 0);
INSERT INTO `sys_oper_log` VALUES (11, '菜单管理', 3, 'SysMenu.Remove()', 'DELETE', 0, 'admin', NULL, '/system/Menu/104', '127.0.0.1', '0 内网IP', '', '{  \"code\": 110,  \"msg\": \"存在子菜单,不允许删除\"}', 0, NULL, '2022-03-24 10:43:39', 0);
INSERT INTO `sys_oper_log` VALUES (12, '菜单管理', 3, 'SysMenu.Remove()', 'DELETE', 0, 'admin', NULL, '/system/Menu/1022', '127.0.0.1', '0 内网IP', '', '{  \"code\": 110,  \"msg\": \"菜单已分配,不允许删除\"}', 0, NULL, '2022-03-24 10:43:46', 0);
INSERT INTO `sys_oper_log` VALUES (13, '菜单管理', 3, 'SysMenu.Remove()', 'DELETE', 0, 'admin', NULL, '/system/Menu/1022', '127.0.0.1', '0 内网IP', '', '{  \"code\": 110,  \"msg\": \"菜单已分配,不允许删除\"}', 0, NULL, '2022-03-24 10:45:44', 0);
INSERT INTO `sys_oper_log` VALUES (14, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":6,\"menuName\":\"控制台\",\"parentName\":null,\"parentId\":0,\"orderNum\":0,\"path\":\"dashboard\",\"component\":\"index_v1\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"dashboard\",\"children\":[],\"createBy\":\"\",\"createTime\":\"2022-03-23 17:24:20\",\"updateTime\":null,\"remark\":\"\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 10:48:22', 0);
INSERT INTO `sys_oper_log` VALUES (15, '菜单管理', 1, 'SysMenu.MenuAdd()', 'PUT', 0, 'admin', NULL, '/system/menu/add', '127.0.0.1', '0 内网IP', '{\"parentId\":0,\"menuName\":\"博客管理\",\"icon\":\"menu\",\"menuType\":\"M\",\"orderNum\":19,\"isFrame\":\"0\",\"isCache\":\"0\",\"visible\":\"0\",\"status\":\"0\",\"path\":\"blog\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 10:50:23', 0);
INSERT INTO `sys_oper_log` VALUES (16, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":118,\"menuName\":\"文章管理\",\"parentName\":null,\"parentId\":2006,\"orderNum\":18,\"path\":\"article\",\"component\":null,\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":null,\"icon\":\"documentation\",\"children\":[],\"createBy\":\"\",\"createTime\":\"2022-03-23 17:24:20\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 10:50:53', 0);
INSERT INTO `sys_oper_log` VALUES (17, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":118,\"menuName\":\"文章管理\",\"parentName\":null,\"parentId\":2006,\"orderNum\":18,\"path\":\"blog/article\",\"component\":null,\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":null,\"icon\":\"documentation\",\"children\":[],\"createBy\":\"\",\"createTime\":\"2022-03-23 17:24:20\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 10:51:32', 0);
INSERT INTO `sys_oper_log` VALUES (18, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":1047,\"menuName\":\"发布文章\",\"parentName\":null,\"parentId\":118,\"orderNum\":2,\"path\":\"/blog/publish\",\"component\":\"blog/article/publish\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"blog:article:publish\",\"icon\":\"log\",\"children\":[],\"createBy\":\"\",\"createTime\":\"2022-03-23 17:24:20\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 10:54:23', 0);
INSERT INTO `sys_oper_log` VALUES (19, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":119,\"menuName\":\"文章列表\",\"parentName\":null,\"parentId\":118,\"orderNum\":1,\"path\":\"index\",\"component\":\"blog/article/manager\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"blog:article:list\",\"icon\":\"list\",\"children\":[],\"createBy\":\"\",\"createTime\":\"2022-03-23 17:24:20\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 10:55:12', 0);
INSERT INTO `sys_oper_log` VALUES (20, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":1047,\"menuName\":\"发布文章\",\"parentName\":null,\"parentId\":118,\"orderNum\":2,\"path\":\"publish\",\"component\":\"blog/article/publish\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"blog:article:publish\",\"icon\":\"log\",\"children\":[],\"createBy\":\"\",\"createTime\":\"2022-03-23 17:24:20\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 10:55:29', 0);
INSERT INTO `sys_oper_log` VALUES (21, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":1048,\"menuName\":\"文章新增\",\"parentName\":null,\"parentId\":118,\"orderNum\":3,\"path\":\"#\",\"component\":null,\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"blog:article:add\",\"icon\":\"\",\"children\":[],\"createBy\":\"\",\"createTime\":\"2022-03-23 17:24:21\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 10:55:38', 0);
INSERT INTO `sys_oper_log` VALUES (22, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":1049,\"menuName\":\"文章修改\",\"parentName\":null,\"parentId\":118,\"orderNum\":4,\"path\":\"#\",\"component\":null,\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"blog:article:update\",\"icon\":\"\",\"children\":[],\"createBy\":\"\",\"createTime\":\"2022-03-23 17:24:21\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 10:55:45', 0);
INSERT INTO `sys_oper_log` VALUES (23, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":1050,\"menuName\":\"文章删除\",\"parentName\":null,\"parentId\":118,\"orderNum\":5,\"path\":\"#\",\"component\":null,\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"blog:article:delete\",\"icon\":\"\",\"children\":[],\"createBy\":\"\",\"createTime\":\"2022-03-23 17:24:21\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 10:55:51', 0);
INSERT INTO `sys_oper_log` VALUES (24, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-24 11:25:54', 0);
INSERT INTO `sys_oper_log` VALUES (25, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-24 11:25:56', 0);
INSERT INTO `sys_oper_log` VALUES (26, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-24 13:20:12', 0);
INSERT INTO `sys_oper_log` VALUES (27, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-24 13:20:13', 0);
INSERT INTO `sys_oper_log` VALUES (28, '文章添加', 1, 'Article.Create()', 'POST', 0, 'admin', NULL, '/Article/add', '127.0.0.1', '0 内网IP', '{\"fmt_type\":\"markdown\",\"tags\":[],\"content\":\"啊发撒法发**粗体**\",\"title\":\"测试\",\"category_id\":1,\"status\":\"1\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-24 13:21:24', 0);
INSERT INTO `sys_oper_log` VALUES (29, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":118,\"menuName\":\"文章管理\",\"parentName\":null,\"parentId\":2006,\"orderNum\":18,\"path\":\"article\",\"component\":null,\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":null,\"icon\":\"documentation\",\"children\":[],\"createBy\":\"\",\"createTime\":\"2022-03-23 17:24:20\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 13:22:14', 0);
INSERT INTO `sys_oper_log` VALUES (30, '文章修改', 2, 'Article.Update()', 'PUT', 0, 'admin', NULL, '/Article/edit', '127.0.0.1', '0 内网IP', '{\"fmt_type\":\"markdown\",\"cid\":1,\"title\":\"测试\",\"content\":\"啊发撒法发**粗体**\",\"category_id\":1,\"tags\":[],\"status\":\"1\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-24 13:23:41', 0);
INSERT INTO `sys_oper_log` VALUES (31, '文章修改', 2, 'Article.Update()', 'PUT', 0, 'admin', NULL, '/Article/edit', '127.0.0.1', '0 内网IP', '{\"fmt_type\":\"markdown\",\"cid\":1,\"title\":\"测试\",\"first_picture\":null,\"content\":\"啊发撒法发**粗体**\",\"category_id\":1,\"tags\":[],\"status\":\"1\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-24 13:29:29', 0);
INSERT INTO `sys_oper_log` VALUES (32, '文章修改', 2, 'Article.Update()', 'PUT', 0, 'admin', NULL, '/Article/edit', '127.0.0.1', '0 内网IP', '{\"fmt_type\":\"markdown\",\"cid\":1,\"title\":\"测试\",\"first_picture\":\"first_picture\",\"content\":\"啊发撒法发**粗体**\",\"category_id\":1,\"tags\":[],\"status\":\"1\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-24 13:34:17', 0);
INSERT INTO `sys_oper_log` VALUES (33, '文章修改', 2, 'Article.Update()', 'PUT', 0, 'admin', NULL, '/Article/edit', '127.0.0.1', '0 内网IP', '{\"fmt_type\":\"markdown\",\"cid\":1,\"title\":\"测试\",\"first_picture\":\"first_picture\",\"content\":\"啊发撒法发**粗体**\",\"category_id\":1,\"tags\":[],\"status\":\"1\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-24 13:34:30', 0);
INSERT INTO `sys_oper_log` VALUES (34, '文章修改', 2, 'Article.Update()', 'PUT', 0, 'admin', NULL, '/Article/edit', '127.0.0.1', '0 内网IP', '{\"fmt_type\":\"markdown\",\"cid\":1,\"title\":\"测试\",\"first_picture\":\"first_picture\",\"content\":\"啊发撒法发**粗体**\",\"category_id\":1,\"tags\":[],\"status\":\"1\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-24 13:36:34', 0);
INSERT INTO `sys_oper_log` VALUES (35, '文章修改', 2, 'Article.Update()', 'PUT', 0, 'admin', NULL, '/Article/edit', '127.0.0.1', '0 内网IP', '{\"fmt_type\":\"markdown\",\"cid\":1,\"title\":\"测试\",\"first_picture\":\"first_picture\",\"content\":\"啊发撒法发**粗体**\",\"category_id\":1,\"tags\":[],\"status\":\"1\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-24 13:38:58', 0);
INSERT INTO `sys_oper_log` VALUES (36, '文章修改', 2, 'Article.Update()', 'PUT', 0, 'admin', NULL, '/Article/edit', '127.0.0.1', '0 内网IP', '{\"fmt_type\":\"markdown\",\"cid\":1,\"title\":\"测试\",\"first_picture\":\"http://localhost:8888/uploads/2022324//26f7898e5c86a830.jpg\",\"content\":\"啊发撒法发**粗体**\",\"category_id\":1,\"tags\":[],\"status\":\"1\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-24 13:40:40', 0);
INSERT INTO `sys_oper_log` VALUES (37, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-24 14:13:54', 0);
INSERT INTO `sys_oper_log` VALUES (38, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-24 14:13:55', 0);
INSERT INTO `sys_oper_log` VALUES (39, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-24 16:45:11', 0);
INSERT INTO `sys_oper_log` VALUES (40, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-24 16:45:12', 0);
INSERT INTO `sys_oper_log` VALUES (41, '菜单管理', 1, 'SysMenu.MenuAdd()', 'PUT', 0, 'admin', NULL, '/system/menu/add', '127.0.0.1', '0 内网IP', '{\"parentId\":2006,\"menuName\":\"标签管理\",\"icon\":\"star\",\"menuType\":\"M\",\"orderNum\":20,\"isFrame\":\"0\",\"isCache\":\"0\",\"visible\":\"0\",\"status\":\"0\",\"path\":\"tag\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 16:46:50', 0);
INSERT INTO `sys_oper_log` VALUES (42, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":2007,\"menuName\":\"标签管理\",\"parentName\":null,\"parentId\":2006,\"orderNum\":20,\"path\":\"tag\",\"component\":\"/blog/tag/index\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"blog:tag\",\"icon\":\"star\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-03-24 16:46:49\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 16:47:26', 0);
INSERT INTO `sys_oper_log` VALUES (43, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":2007,\"menuName\":\"标签管理\",\"parentName\":null,\"parentId\":2006,\"orderNum\":20,\"path\":\"tag\",\"component\":\"\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"blog:tag\",\"icon\":\"star\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-03-24 16:46:49\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 16:48:38', 0);
INSERT INTO `sys_oper_log` VALUES (44, '菜单管理', 3, 'SysMenu.Remove()', 'DELETE', 0, 'admin', NULL, '/system/Menu/5', '127.0.0.1', '0 内网IP', '', '{  \"code\": 110,  \"msg\": \"菜单已分配,不允许删除\"}', 0, NULL, '2022-03-24 16:53:15', 0);
INSERT INTO `sys_oper_log` VALUES (45, '菜单管理', 3, 'SysMenu.Remove()', 'DELETE', 0, 'admin', NULL, '/system/Menu/5', '127.0.0.1', '0 内网IP', '', '{  \"code\": 110,  \"msg\": \"菜单已分配,不允许删除\"}', 0, NULL, '2022-03-24 16:54:15', 0);
INSERT INTO `sys_oper_log` VALUES (46, '菜单管理', 3, 'SysMenu.Remove()', 'DELETE', 0, 'admin', NULL, '/system/Menu/5', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 16:55:47', 0);
INSERT INTO `sys_oper_log` VALUES (47, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":2007,\"menuName\":\"标签管理\",\"parentName\":null,\"parentId\":2006,\"orderNum\":20,\"path\":\"tag\",\"component\":\"/blog/tag/index\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"blog:tag\",\"icon\":\"star\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-03-24 16:46:49\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 16:56:56', 0);
INSERT INTO `sys_oper_log` VALUES (48, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":2007,\"menuName\":\"标签管理\",\"parentName\":null,\"parentId\":2006,\"orderNum\":20,\"path\":\"tag\",\"component\":\"blog/tag/index\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"blog:tag\",\"icon\":\"star\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-03-24 16:46:49\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-24 16:57:05', 0);
INSERT INTO `sys_oper_log` VALUES (49, '标签添加', 1, 'Tag.Create()', 'POST', 0, 'admin', NULL, '/tag/add', '127.0.0.1', '0 内网IP', '{\"name\":\"白娃娃格罗\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-24 17:00:43', 0);
INSERT INTO `sys_oper_log` VALUES (50, '标签添加', 1, 'Tag.Create()', 'POST', 0, 'admin', NULL, '/tag/add', '127.0.0.1', '0 内网IP', '{\"name\":\"神田咏梅\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-24 17:00:53', 0);
INSERT INTO `sys_oper_log` VALUES (51, '标签添加', 1, 'Tag.Create()', 'POST', 0, 'admin', NULL, '/tag/add', '127.0.0.1', '0 内网IP', '{\"name\":\"桥本\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-24 17:01:06', 0);
INSERT INTO `sys_oper_log` VALUES (52, '文章添加', 1, 'Article.Create()', 'POST', 0, 'admin', NULL, '/Article/add', '127.0.0.1', '0 内网IP', '{\"fmt_type\":\"markdown\",\"tags\":[{\"tag_id\":1},{\"tag_id\":2}],\"content\":\"博客上线地址：\\n欢迎访问我的博客！http://hikari.top\\n\\n项目介绍\\n实现了一个简单的个人博客系统，技术栈为后端SpringBoot+JPA+MySQL,前端Vue+ElementUI+Echarts系统分为前台展示和后台管理两个部分，前台部分主要分为了引导页，首页，随笔，项目，留言和关于我页面，使用响应式布局，能够自适应移动端，后台有首页，博客管理，撰写博客，用户管理，分类管理，标签管理，评论管理，随笔管理，项目管理，个人中心，图片管理。\\n\\n项目开源地址：\\n博客前端：https://gitee.com/tyoubin_admin/myblog-frontend.git 博客后端：https://gitee.com/tyoubin_admin/myblog-backend.git\\n\\n本项目将长期更新与维护，欢迎拉取和star！\\n\\n项目截图及亮点\",\"first_picture\":\"http://localhost:8888/uploads/2022324//8c0e545c6be1c21c.jpg\",\"title\":\"这是一个简单的\",\"category_id\":2,\"status\":\"1\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 2}', 0, NULL, '2022-03-24 17:02:06', 0);
INSERT INTO `sys_oper_log` VALUES (53, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-25 10:00:26', 0);
INSERT INTO `sys_oper_log` VALUES (54, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-25 10:00:27', 0);
INSERT INTO `sys_oper_log` VALUES (55, NULL, 0, NULL, 'GET', 0, 'admin', NULL, '/tool/gen/getTableList', '127.0.0.1', '0 内网IP', '?dbName=blogadmin&pageNum=1&pageSize=10', '{\"code\":101,\"msg\":\"string cannot be of zero length. (parameter \\u0027oldvalue\\u0027)\",\"data\":null}', 1, 'String cannot be of zero length. (Parameter \'oldValue\')', '2022-03-25 10:06:28', 0);
INSERT INTO `sys_oper_log` VALUES (56, '代码生成', 8, 'CodeGenerator.EditSave()', 'PUT', 0, 'admin', NULL, '/tool/gen/', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": true}', 0, NULL, '2022-03-25 10:14:44', 0);
INSERT INTO `sys_oper_log` VALUES (57, '代码生成', 8, 'CodeGenerator.CodeGenerate()', 'POST', 0, 'admin', NULL, '/tool/gen/genCode', '127.0.0.1', '0 内网IP', '{\"tableId\":1}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"path\": \"/Generatecode/ZrAdmin.NET-博客信息配置-0325101457.zip\",    \"fileName\": null  }}', 0, NULL, '2022-03-25 10:14:58', 0);
INSERT INTO `sys_oper_log` VALUES (58, '代码生成', 8, 'CodeGenerator.EditSave()', 'PUT', 0, 'admin', NULL, '/tool/gen/', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": true}', 0, NULL, '2022-03-25 10:17:30', 0);
INSERT INTO `sys_oper_log` VALUES (59, '代码生成', 8, 'CodeGenerator.CodeGenerate()', 'POST', 0, 'admin', NULL, '/tool/gen/genCode', '127.0.0.1', '0 内网IP', '{\"tableId\":1}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"path\": \"/Generatecode/ZrAdmin.NET-博客信息配置-0325101732.zip\",    \"fileName\": null  }}', 0, NULL, '2022-03-25 10:17:33', 0);
INSERT INTO `sys_oper_log` VALUES (60, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-25 10:48:47', 0);
INSERT INTO `sys_oper_log` VALUES (61, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-25 10:48:48', 0);
INSERT INTO `sys_oper_log` VALUES (62, '菜单管理', 1, 'SysMenu.MenuAdd()', 'PUT', 0, 'admin', NULL, '/system/menu/add', '127.0.0.1', '0 内网IP', '{\"parentId\":2006,\"menuName\":\"博客配置\",\"icon\":\"system\",\"menuType\":\"C\",\"orderNum\":0,\"isFrame\":\"0\",\"isCache\":\"0\",\"visible\":\"0\",\"status\":\"0\",\"path\":\"tblogconfig\",\"perms\":\"blog:blogconfig\",\"component\":\"blog/TBlogconfig\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-25 10:50:59', 0);
INSERT INTO `sys_oper_log` VALUES (63, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":1047,\"menuName\":\"发布文章\",\"parentName\":null,\"parentId\":118,\"orderNum\":0,\"path\":\"publish\",\"component\":\"blog/article/publish\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"blog:article:publish\",\"icon\":\"log\",\"children\":[],\"createBy\":\"\",\"createTime\":\"2022-03-23 17:24:20\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-25 10:51:14', 0);
INSERT INTO `sys_oper_log` VALUES (64, NULL, 0, NULL, 'GET', 0, 'admin', NULL, '/Blog/TBlogconfig/getQuery', '127.0.0.1', '0 内网IP', '', '{\"code\":500,\"msg\":\"\\u670d\\u52a1\\u5668\\u597d\\u50cf\\u51fa\\u4e86\\u70b9\\u95ee\\u9898......\",\"data\":null}', 1, '中文提示 :  连接数据库过程中发生错误，检查服务器是否正常连接字符串是否正确，实在找不到原因请先Google错误信息：A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: SNI_PN11, error: 26 - Error Locating Server/Instance Specified).\r\nEnglish Message : Connection open error . A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: SNI_PN11, error: 26 - Error Locating Server/Instance Specified)', '2022-03-25 10:57:33', 0);
INSERT INTO `sys_oper_log` VALUES (65, NULL, 0, NULL, 'GET', 0, 'admin', NULL, '/Blog/TBlogconfig/getQuery', '127.0.0.1', '0 内网IP', '', '{\"code\":500,\"msg\":\"\\u670d\\u52a1\\u5668\\u597d\\u50cf\\u51fa\\u4e86\\u70b9\\u95ee\\u9898......\",\"data\":null}', 1, '中文提示 :  连接数据库过程中发生错误，检查服务器是否正常连接字符串是否正确，实在找不到原因请先Google错误信息：A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: SNI_PN11, error: 26 - Error Locating Server/Instance Specified).\r\nEnglish Message : Connection open error . A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: SNI_PN11, error: 26 - Error Locating Server/Instance Specified)', '2022-03-25 11:09:29', 0);
INSERT INTO `sys_oper_log` VALUES (66, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-25 11:19:44', 0);
INSERT INTO `sys_oper_log` VALUES (67, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"ssss\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":false,\"isOpenRegister\":false,\"content\":null,\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//07b1806b279e82e4.jpg\",\"fundedAlipayImg\":null,\"fundedWechartImg\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-25 11:20:21', 0);
INSERT INTO `sys_oper_log` VALUES (68, '文件存储', 3, 'SysFile.DeleteSysFile()', 'DELETE', 0, 'admin', NULL, '/tool/file/1506834794116419584,1506836636120518656,1506828070613553152', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-25 16:10:20', 0);
INSERT INTO `sys_oper_log` VALUES (69, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-25 16:40:00', 0);
INSERT INTO `sys_oper_log` VALUES (70, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-25 16:40:01', 0);
INSERT INTO `sys_oper_log` VALUES (71, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"ssss\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":false,\"isOpenRegister\":false,\"content\":null,\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg\",\"fundedAlipayImg\":null,\"fundedWechartImg\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-25 16:42:27', 0);
INSERT INTO `sys_oper_log` VALUES (72, NULL, 0, NULL, 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"ssss\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":\"0\",\"isOpenRegister\":\"0\",\"content\":null,\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//b5293b77a44c55ce.png\",\"fundedAlipayImg\":null,\"fundedWechartImg\":null}', '{\"code\":500,\"msg\":\"\\u670d\\u52a1\\u5668\\u597d\\u50cf\\u51fa\\u4e86\\u70b9\\u95ee\\u9898......\",\"data\":null}', 1, 'Object reference not set to an instance of an object.', '2022-03-25 16:44:13', 0);
INSERT INTO `sys_oper_log` VALUES (73, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"ssss\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":\"1\",\"isOpenRegister\":\"1\",\"content\":null,\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg\",\"fundedAlipayImg\":null,\"fundedWechartImg\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-25 16:48:33', 0);
INSERT INTO `sys_oper_log` VALUES (74, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"Copright©2018-2022 taiyonoyoni Designed by taiyonoyoni\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":\"1\",\"isOpenRegister\":\"1\",\"content\":null,\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg\",\"fundedAlipayImg\":null,\"fundedWechartImg\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-25 16:51:26', 0);
INSERT INTO `sys_oper_log` VALUES (75, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"Copright©2022 sageinqi Designed by taiyonoyoni\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":\"1\",\"isOpenRegister\":\"1\",\"content\":\"这是一个测试\",\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg\",\"fundedAlipayImg\":null,\"fundedWechartImg\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-25 17:09:18', 0);
INSERT INTO `sys_oper_log` VALUES (76, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-25 17:23:22', 0);
INSERT INTO `sys_oper_log` VALUES (77, '代码生成', 6, 'CodeGenerator.ImportTableSave()', 'POST', 0, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"tableId\": 2,    \"dbName\": \"blogadmin\",    \"tableName\": \"t_blogessays\",    \"tableComment\": \"\",    \"subTableName\": null,    \"subTableFkName\": null,    \"className\": \"Blogessays\",    \"tplCategory\": null,    \"baseNameSpace\": \"ZR.\",    \"moduleName\": \"business\",    \"businessName\": \"TBlogessays\",    \"functionName\": \"\",    \"functionAuthor\": \"ztc\",    \"genType\": null,    \"genPath\": null,    \"options\": null,    \"columns\": [      {        \"columnId\": 0,        \"columnName\": \"id\",        \"tableId\": 2,        \"tableName\": \"t_blogessays\",        \"columnComment\": \"\",        \"columnType\": \"int\",        \"csharpType\": \"int\",        \"csharpField\": \"Id\",        \"isPk\": true,        \"isRequired\": true,        \"isIncrement\": true,        \"isInsert\": false,        \"isEdit\": false,        \"isList\": true,        \"isQuery\": false,        \"htmlType\": \"input\",        \"queryType\": \"EQ\",        \"sort\": 0,        \"dictType\": \"\",        \"requiredStr\": \"\",        \"csharpFieldFl\": null,        \"createBy\": \"admin\",        \"createTime\": \"2022-03-25 17:25:18\",        \"updateTime\": null,        \"remark\": null      },      {        \"columnId\": 0,        \"columnName\": \"title\",        \"tableId\": 2,        \"tableName\": \"t_blogessays\",        \"columnComment\": \"标题\",        \"columnType\": \"varchar\",        \"csharpType\": \"string\",        \"csharpField\": \"Title\",        \"isPk\": false,        \"isRequired\": false,        \"isIncrement\": false,        \"isInsert\": true,        \"isEdit\": true,        \"isList\": true,        \"isQuery\": false,        \"htmlType\": \"input\",        \"queryType\": \"EQ\",        \"sort\": 0,        \"dictType\": \"\",        \"requiredStr\": \"\",        \"csharpFieldFl\": null,        \"createBy\": \"admin\",        \"createTime\": \"2022-03-25 17:25:18\",        \"updateTime\": null,        \"remark\": null      },      {        \"columnId\": 0,        \"columnName\": \"color\",        \"tableId\": 2,        \"tableName\": \"t_blogessays\",        \"columnComment\": \"边框色彩\",        \"columnType\": \"varchar\",        \"csharpType\": \"string\",        \"csharpField\": \"Color\",        \"isPk\": false,        \"isRequired\": false,        \"isIncrement\": false,        \"isInsert\": true,        \"isEdit\": true,        \"isList\": true,        \"isQuery\": false,        \"htmlType\": \"input\",        \"queryType\": \"EQ\",        \"sort\": 0,        \"dictType\": \"\",        \"requiredStr\": \"\",        \"csharpFieldFl\": null,        \"createBy\": \"admin\",        \"createTime\": \"2022-03-25 17:25:18\",        \"updateTime\": null,        \"remark\": null      },      {        \"columnId\": 0,        \"columnName\": \"content\",        \"tableId\": 2,        \"tableName\": \"t_blogessays\",        \"columnComment\": \"内容\",        \"columnType\": \"text\",        \"csharpType\": \"string\",        \"csharpField\": \"Content\",        \"isPk\": false,        \"isRequired\": false,        \"isIncrement\": false,        \"isInsert\": true,        \"isEdit\": true,        \"isList\": true,        \"isQuery\": false,        \"htmlType\": \"input\",        \"queryType\": \"EQ\",        \"sort\": 0,        \"dictType\": \"\",        \"requiredStr\": \"\",        \"csharpFieldFl\": null,        \"createBy\": \"admin\",        \"createTime\": \"2022-03-25 17:25:18\",        \"updateTime\": null,        \"remark\": null      },      {        \"columnId\": 0,        \"columnName\": \"createTime\",        \"tableId\": 2,        \"tableName\": \"t_blogessays\",        \"columnComment\": \"创建时间\",        \"columnType\": \"datetime\",        \"csharpType\": \"DateTime\",        \"csharpField\": \"CreateTime\",        \"isPk\": false,        \"isRequired\": false,        \"isIncrement\": false,        \"isInsert\": true,        \"isEdit\": true,        \"isList\": true,        \"isQuery\": false,        \"htmlType\": \"datetime\",        \"queryType\": \"BETWEEN\",        \"sort\": 0,        \"dictType\": \"\",        \"requiredStr\": \"?\",        \"csharpFieldFl\": null,        \"createBy\": \"admin\",        \"createTime\": \"2022-03-25 17:25:18\",        \"updateTime\": null,        \"remark\": null      },      {        \"columnId\": 0,        \"columnName\": \"authorName\",        \"tableId\": 2,        \"tableName\": \"t_blogessays\",        \"columnComment\": \"作者名\",        \"columnType\": \"varchar\",        \"csharpType\": \"string\",        \"csharpField\": \"AuthorName\",        \"isPk\": false,        \"isRequired\": false,        \"isIncrement\": false,        \"isInsert\": true,        \"isEdit\": true,        \"isList\": true,        \"isQuery\": false,        \"htmlType\": \"input\",        \"queryType\": \"EQ\",        \"sort\": 0,        \"dictType\": \"\",        \"requiredStr\": \"\",        \"csharpFieldFl\": null,        \"createBy\": \"admin\",        \"createTime\": \"2022-03-25 17:25:18\",        \"updateTime\": null,        \"remark\": null      }    ],    \"parentMenuId\": null,    \"sortType\": \"asc\",    \"sortField\": \"\",    \"treeCode\": \"\",    \"treeName\": \"\",    \"treeParentCode\": null,    \"checkedBtn\": [      1,      2,      3    ],    \"createBy\": \"admin\",    \"createTime\": \"2022-03-25 17:25:18\",    \"updateTime\": null,    \"remark\": null  }}', 0, NULL, '2022-03-25 17:25:18', 0);
INSERT INTO `sys_oper_log` VALUES (78, '代码生成', 8, 'CodeGenerator.EditSave()', 'PUT', 0, 'admin', NULL, '/tool/gen/', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": true}', 0, NULL, '2022-03-25 17:30:21', 0);
INSERT INTO `sys_oper_log` VALUES (79, '代码生成', 8, 'CodeGenerator.CodeGenerate()', 'POST', 0, 'admin', NULL, '/tool/gen/genCode', '127.0.0.1', '0 内网IP', '{\"tableId\":2}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"path\": \"/Generatecode/ZrAdmin.NET-博客随笔表-0325173115.zip\",    \"fileName\": null  }}', 0, NULL, '2022-03-25 17:31:16', 0);
INSERT INTO `sys_oper_log` VALUES (80, '代码生成', 8, 'CodeGenerator.EditSave()', 'PUT', 0, 'admin', NULL, '/tool/gen/', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": true}', 0, NULL, '2022-03-25 17:31:52', 0);
INSERT INTO `sys_oper_log` VALUES (81, '代码生成', 8, 'CodeGenerator.CodeGenerate()', 'POST', 0, 'admin', NULL, '/tool/gen/genCode', '127.0.0.1', '0 内网IP', '{\"tableId\":2}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"path\": \"/Generatecode/ZrAdmin.NET-博客随笔表-0325173155.zip\",    \"fileName\": null  }}', 0, NULL, '2022-03-25 17:31:55', 0);
INSERT INTO `sys_oper_log` VALUES (82, '菜单管理', 1, 'SysMenu.MenuAdd()', 'PUT', 0, 'admin', NULL, '/system/menu/add', '127.0.0.1', '0 内网IP', '{\"parentId\":2006,\"menuName\":\"随笔\",\"icon\":\"dict\",\"menuType\":\"C\",\"orderNum\":2,\"isFrame\":\"0\",\"isCache\":\"0\",\"visible\":\"0\",\"status\":\"0\",\"path\":\"tblogessays\",\"component\":\"blog/tblogessays\",\"perms\":\"blog:tblogessays\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-25 17:37:08', 0);
INSERT INTO `sys_oper_log` VALUES (83, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":2009,\"menuName\":\"随笔\",\"parentName\":null,\"parentId\":2006,\"orderNum\":2,\"path\":\"tblogessays\",\"component\":\"blog/TBlogessays\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"blog:tblogessays\",\"icon\":\"dict\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-03-25 17:37:08\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-25 17:38:34', 0);
INSERT INTO `sys_oper_log` VALUES (84, '随笔管理', 1, 'Blogessays.AddBlogessays()', 'POST', 0, 'admin', NULL, '/blog/TBlogessays', '127.0.0.1', '0 内网IP', '{\"title\":\"测试\",\"color\":\"#DE7373\",\"content\":\"水水水水\",\"authorName\":\"水水水\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-25 17:46:38', 0);
INSERT INTO `sys_oper_log` VALUES (85, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-26 09:11:12', 0);
INSERT INTO `sys_oper_log` VALUES (86, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-26 09:11:13', 0);
INSERT INTO `sys_oper_log` VALUES (87, '随笔管理', 2, 'Blogessays.UpdateBlogessays()', 'PUT', 0, 'admin', NULL, '/blog/TBlogessays', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"测试\",\"color\":\"#B8DE38\",\"content\":\"水水水水\",\"createTime\":\"2022-03-25 17:46:37\",\"authorName\":\"水水水\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-26 09:19:27', 0);
INSERT INTO `sys_oper_log` VALUES (88, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-29 10:42:03', 0);
INSERT INTO `sys_oper_log` VALUES (89, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-29 13:28:01', 0);
INSERT INTO `sys_oper_log` VALUES (90, '代码生成', 8, 'CodeGenerator.EditSave()', 'PUT', 0, 'admin', NULL, '/tool/gen/', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": true}', 0, NULL, '2022-03-29 13:33:57', 0);
INSERT INTO `sys_oper_log` VALUES (91, '字典操作', 1, 'SysDictType.Add()', 'POST', 0, 'admin', NULL, '/system/dict/type/edit', '127.0.0.1', '0 内网IP', '{\"dictName\":\"项目类型\",\"dictType\":\"blog_project_type\",\"status\":\"0\",\"type\":\"N\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 12}', 0, NULL, '2022-03-29 13:34:48', 0);
INSERT INTO `sys_oper_log` VALUES (92, '字典数据', 1, 'SysDictData.Add()', 'POST', 0, 'admin', NULL, '/system/dict/data', '127.0.0.1', '0 内网IP', '{\"dictLabel\":\"爱好\",\"dictValue\":\"1\",\"dictSort\":0,\"status\":\"0\",\"dictType\":\"blog_project_type\",\"listClass\":\"default\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 32}', 0, NULL, '2022-03-29 13:39:38', 0);
INSERT INTO `sys_oper_log` VALUES (93, '字典数据', 1, 'SysDictData.Add()', 'POST', 0, 'admin', NULL, '/system/dict/data', '127.0.0.1', '0 内网IP', '{\"dictLabel\":\"作品\",\"dictValue\":\"2\",\"dictSort\":1,\"status\":\"0\",\"dictType\":\"blog_project_type\",\"listClass\":\"default\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 33}', 0, NULL, '2022-03-29 13:40:06', 0);
INSERT INTO `sys_oper_log` VALUES (94, '代码生成', 8, 'CodeGenerator.EditSave()', 'PUT', 0, 'admin', NULL, '/tool/gen/', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": true}', 0, NULL, '2022-03-29 13:40:29', 0);
INSERT INTO `sys_oper_log` VALUES (95, '代码生成', 8, 'CodeGenerator.CodeGenerate()', 'POST', 0, 'admin', NULL, '/tool/gen/genCode', '127.0.0.1', '0 内网IP', '{\"tableId\":3}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"path\": \"/Generatecode/ZrAdmin.NET-博客项目表-0329134033.zip\",    \"fileName\": null  }}', 0, NULL, '2022-03-29 13:40:34', 0);
INSERT INTO `sys_oper_log` VALUES (96, '菜单管理', 1, 'SysMenu.MenuAdd()', 'PUT', 0, 'admin', NULL, '/system/menu/add', '127.0.0.1', '0 内网IP', '{\"parentId\":2006,\"menuName\":\"作品爱好管理\",\"icon\":\"clipboard\",\"menuType\":\"C\",\"orderNum\":3,\"isFrame\":\"0\",\"isCache\":\"0\",\"visible\":\"0\",\"status\":\"0\",\"path\":\"tblogproject\",\"component\":\"blog/tblogproject\",\"perms\":\"blog:tblogproject\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-29 13:47:59', 0);
INSERT INTO `sys_oper_log` VALUES (97, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":2010,\"menuName\":\"作品爱好管理\",\"parentName\":null,\"parentId\":2006,\"orderNum\":3,\"path\":\"tblogproject\",\"component\":\"blog/TBlogproject\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"blog:tblogproject\",\"icon\":\"clipboard\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-03-29 13:47:59\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-29 13:49:07', 0);
INSERT INTO `sys_oper_log` VALUES (98, '代码生成', 8, 'CodeGenerator.EditSave()', 'PUT', 0, 'admin', NULL, '/tool/gen/', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": true}', 0, NULL, '2022-03-29 13:51:42', 0);
INSERT INTO `sys_oper_log` VALUES (99, '博客项目表', 1, 'Blogproject.AddBlogproject()', 'POST', 0, 'admin', NULL, '/Blog/TBlogproject', '127.0.0.1', '0 内网IP', '{\"content\":\"一个简单的个人博客项目，分为前台展示和后台管理系统，前台展示部分实现了博客的浏览，查找，分类，标签，评论，留言等功能，后台管理系统实现了博客发表，博客管理，用户管理等功能。\",\"title\":\"个人博客\",\"typeName\":\"2\",\"picUrl\":\"http://localhost:8888/uploads/2022329//2e054d6066436a57.jpg\",\"techs\":\"netcore、vue\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-29 13:53:46', 0);
INSERT INTO `sys_oper_log` VALUES (100, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-29 14:01:53', 0);
INSERT INTO `sys_oper_log` VALUES (101, '字典数据', 1, 'SysDictData.Add()', 'POST', 0, 'admin', NULL, '/system/dict/data', '127.0.0.1', '0 内网IP', '{\"dictLabel\":\"小练习\",\"dictValue\":\"2\",\"dictSort\":2,\"status\":\"0\",\"dictType\":\"blog_project_type\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 34}', 0, NULL, '2022-03-29 14:03:37', 0);
INSERT INTO `sys_oper_log` VALUES (102, '字典数据', 2, 'SysDictData.Edit()', 'PUT', 0, 'admin', NULL, '/system/dict/data', '127.0.0.1', '0 内网IP', '{\"dictCode\":33,\"dictSort\":1,\"dictLabel\":\"完整项目\",\"dictValue\":\"2\",\"dictType\":\"blog_project_type\",\"cssClass\":\"\",\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"createBy\":\"admin\",\"createTime\":\"2022-03-29 13:40:06\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-29 14:03:50', 0);
INSERT INTO `sys_oper_log` VALUES (103, '字典数据', 2, 'SysDictData.Edit()', 'PUT', 0, 'admin', NULL, '/system/dict/data', '127.0.0.1', '0 内网IP', '{\"dictCode\":34,\"dictSort\":2,\"dictLabel\":\"小练习\",\"dictValue\":\"3\",\"dictType\":\"blog_project_type\",\"cssClass\":\"\",\"listClass\":\"\",\"isDefault\":null,\"status\":\"0\",\"createBy\":\"admin\",\"createTime\":\"2022-03-29 14:03:37\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-29 14:03:56', 0);
INSERT INTO `sys_oper_log` VALUES (104, '博客项目表', 2, 'Blogproject.UpdateBlogproject()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogproject', '127.0.0.1', '0 内网IP', '{\"id\":1,\"content\":\"一个简单的个人博客项目，分为前台展示和后台管理系统，前台展示部分实现了博客的浏览，查找，分类，标签，评论，留言等功能，后台管理系统实现了博客发表，博客管理，用户管理等功能。\",\"title\":\"个人博客\",\"typeName\":\"2\",\"picUrl\":\"\",\"techs\":\"netcore、vue\",\"url\":\"http://localhost:8887/blog/tblogproject\",\"createTime\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-29 14:18:23', 0);
INSERT INTO `sys_oper_log` VALUES (105, '博客项目表', 2, 'Blogproject.UpdateBlogproject()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogproject', '127.0.0.1', '0 内网IP', '{\"id\":1,\"content\":\"一个简单的个人博客项目，分为前台展示和后台管理系统，前台展示部分实现了博客的浏览，查找，分类，标签，评论，留言等功能，后台管理系统实现了博客发表，博客管理，用户管理等功能。\",\"title\":\"个人博客\",\"typeName\":\"2\",\"picUrl\":\"http://localhost:8888/uploads/2022329//bb58142076163f6d.jpg\",\"techs\":\"netcore、vue\",\"url\":\"http://localhost:8887/blog/tblogproject\",\"createTime\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-29 14:18:32', 0);
INSERT INTO `sys_oper_log` VALUES (106, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-29 14:41:24', 0);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 8, 'CodeGenerator.EditSave()', 'PUT', 0, 'admin', NULL, '/tool/gen/', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": true}', 0, NULL, '2022-03-29 14:54:31', 0);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'CodeGenerator.CodeGenerate()', 'POST', 0, 'admin', NULL, '/tool/gen/genCode', '127.0.0.1', '0 内网IP', '{\"tableId\":4}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"path\": \"/Generatecode/ZrAdmin.NET-博客个人信息-0329145445.zip\",    \"fileName\": null  }}', 0, NULL, '2022-03-29 14:54:46', 0);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 1, 'SysMenu.MenuAdd()', 'PUT', 0, 'admin', NULL, '/system/menu/add', '127.0.0.1', '0 内网IP', '{\"parentId\":2006,\"menuName\":\"博客个人信息\",\"icon\":\"edit\",\"menuType\":\"C\",\"orderNum\":4,\"isFrame\":\"0\",\"isCache\":\"0\",\"visible\":\"0\",\"status\":\"0\",\"path\":\"tblogpersonalinfo\",\"component\":\"blog/TBlogpersonalinfo\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-29 15:12:55', 0);
INSERT INTO `sys_oper_log` VALUES (110, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-29 15:26:25', 0);
INSERT INTO `sys_oper_log` VALUES (111, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-29 15:26:26', 0);
INSERT INTO `sys_oper_log` VALUES (112, NULL, 0, NULL, 'PUT', 0, 'admin', NULL, '/Blog/TBlogpersonalinfo', '127.0.0.1', '0 内网IP', '{\"id\":1,\"name\":\"ztc\",\"sex\":null,\"age\":0,\"degree\":null,\"height\":0,\"weight\":0,\"birthday\":null,\"school\":null,\"specialized\":null,\"blood\":null,\"giteeUrl\":null,\"gitHubUrl\":null,\"csdnUrl\":null,\"email\":null,\"avatar\":null}', '{\"code\":0,\"msg\":\"\\u8bf7\\u6c42\\u5b9e\\u4f53\\u4e0d\\u80fd\\u4e3a\\u7a7a\",\"data\":null}', 1, '请求实体不能为空', '2022-03-29 15:32:09', 0);
INSERT INTO `sys_oper_log` VALUES (113, NULL, 0, NULL, 'PUT', 0, 'admin', NULL, '/Blog/TBlogpersonalinfo', '127.0.0.1', '0 内网IP', '{\"id\":1,\"name\":\"ztc\",\"sex\":null,\"age\":0,\"degree\":null,\"height\":0,\"weight\":0,\"birthday\":null,\"school\":null,\"specialized\":null,\"blood\":null,\"giteeUrl\":null,\"gitHubUrl\":null,\"csdnUrl\":null,\"email\":null,\"avatar\":null}', '{\"code\":0,\"msg\":\"\\u8bf7\\u6c42\\u5b9e\\u4f53\\u4e0d\\u80fd\\u4e3a\\u7a7a\",\"data\":null}', 1, '请求实体不能为空', '2022-03-29 15:33:01', 0);
INSERT INTO `sys_oper_log` VALUES (114, NULL, 0, NULL, 'PUT', 0, 'admin', NULL, '/Blog/TBlogpersonalinfo', '127.0.0.1', '0 内网IP', '{\"id\":1,\"name\":\"ztc\",\"sex\":null,\"age\":0,\"degree\":null,\"height\":0,\"weight\":0,\"birthday\":null,\"school\":null,\"specialized\":null,\"blood\":null,\"giteeUrl\":null,\"gitHubUrl\":null,\"csdnUrl\":null,\"email\":null,\"avatar\":null}', '{\"code\":0,\"msg\":\"\\u8bf7\\u6c42\\u5b9e\\u4f53\\u4e0d\\u80fd\\u4e3a\\u7a7a\",\"data\":null}', 1, '请求实体不能为空', '2022-03-29 15:35:00', 0);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":2011,\"menuName\":\"博客个人信息\",\"parentName\":null,\"parentId\":2006,\"orderNum\":4,\"path\":\"tblogpersonalinfo\",\"component\":\"blog/TBlogpersonalinfo\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"blog:tblogpersonalinfo\",\"icon\":\"edit\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-03-29 15:12:54\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-29 15:35:51', 0);
INSERT INTO `sys_oper_log` VALUES (116, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-29 15:59:43', 0);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":2011,\"menuName\":\"博客个人信息\",\"parentName\":null,\"parentId\":2006,\"orderNum\":1,\"path\":\"tblogpersonalinfo\",\"component\":\"blog/TBlogpersonalinfo\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"blog:tblogpersonalinfo\",\"icon\":\"edit\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-03-29 15:12:54\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-29 16:02:02', 0);
INSERT INTO `sys_oper_log` VALUES (118, NULL, 0, NULL, 'PUT', 0, 'admin', NULL, '/Blog/TBlogpersonalinfo/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"name\":\"ztc\",\"sex\":null,\"age\":0,\"degree\":null,\"height\":0,\"weight\":0,\"birthday\":null,\"school\":null,\"specialized\":null,\"blood\":null,\"giteeUrl\":null,\"gitHubUrl\":null,\"csdnUrl\":null,\"email\":null,\"avatar\":null}', '{\"code\":0,\"msg\":\"\\u8bf7\\u6c42\\u5b9e\\u4f53\\u4e0d\\u80fd\\u4e3a\\u7a7a\",\"data\":null}', 1, '请求实体不能为空', '2022-03-29 16:25:22', 0);
INSERT INTO `sys_oper_log` VALUES (119, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-29 16:32:17', 0);
INSERT INTO `sys_oper_log` VALUES (120, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"Copright©2022 sageinqi Designed by taiyonoyoni\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":\"1\",\"isOpenRegister\":\"1\",\"content\":\"这是一个测试\",\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg\",\"fundedAlipayImg\":null,\"fundedWechartImg\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-29 16:32:36', 0);
INSERT INTO `sys_oper_log` VALUES (121, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"Copright©2022 sageinqi Designed by taiyonoyoni\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":\"1\",\"isOpenRegister\":\"1\",\"content\":\"这是一个测试\",\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg\",\"fundedAlipayImg\":null,\"fundedWechartImg\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-29 16:36:20', 0);
INSERT INTO `sys_oper_log` VALUES (122, NULL, 0, NULL, 'PUT', 0, 'admin', NULL, '/Blog/TBlogpersonalinfo/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"name\":\"ztc\",\"sex\":null,\"age\":0,\"degree\":null,\"height\":0,\"weight\":0,\"birthday\":null,\"school\":null,\"specialized\":null,\"blood\":null,\"giteeUrl\":null,\"gitHubUrl\":null,\"csdnUrl\":null,\"email\":null,\"avatar\":null}', '{\"code\":0,\"msg\":\"\\u8bf7\\u6c42\\u5b9e\\u4f53\\u4e0d\\u80fd\\u4e3a\\u7a7a\",\"data\":null}', 1, '请求实体不能为空', '2022-03-29 16:37:45', 0);
INSERT INTO `sys_oper_log` VALUES (123, NULL, 0, NULL, 'PUT', 0, 'admin', NULL, '/Blog/TBlogpersonalinfo/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"name\":\"ztc\",\"sex\":null,\"age\":0,\"degree\":null,\"height\":0,\"weight\":0,\"birthday\":null,\"school\":null,\"specialized\":null,\"blood\":null,\"giteeUrl\":null,\"gitHubUrl\":null,\"csdnUrl\":null,\"email\":null,\"avatar\":null}', '{\"code\":0,\"msg\":\"\\u8bf7\\u6c42\\u5b9e\\u4f53\\u4e0d\\u80fd\\u4e3a\\u7a7a\",\"data\":null}', 1, '请求实体不能为空', '2022-03-29 16:48:59', 0);
INSERT INTO `sys_oper_log` VALUES (124, NULL, 0, NULL, 'PUT', 0, 'admin', NULL, '/Blog/TBlogpersonalinfo/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"name\":\"ztc\",\"sex\":null,\"age\":0,\"degree\":null,\"height\":0,\"weight\":0,\"birthday\":null,\"school\":null,\"specialized\":null,\"blood\":null,\"giteeUrl\":null,\"gitHubUrl\":null,\"csdnUrl\":null,\"email\":null,\"avatar\":null}', '{\"code\":0,\"msg\":\"\\u8bf7\\u6c42\\u5b9e\\u4f53\\u4e0d\\u80fd\\u4e3a\\u7a7a\",\"data\":null}', 1, '请求实体不能为空', '2022-03-29 16:57:56', 0);
INSERT INTO `sys_oper_log` VALUES (125, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-30 09:53:15', 0);
INSERT INTO `sys_oper_log` VALUES (126, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-30 09:53:16', 0);
INSERT INTO `sys_oper_log` VALUES (127, '博客个人信息详情管理', 2, 'Blogpersonalinfo.UpdateBlogpersonalinfo()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogpersonalinfo/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"name\":\"ztc\",\"sex\":\"0\",\"age\":25,\"degree\":\"专升本\",\"height\":174,\"weight\":72,\"birthday\":\"2022-03-01 00:00:00\",\"school\":\"河北科技\",\"specialized\":\"计算机科学与技术\",\"blood\":\"B\",\"giteeUrl\":null,\"gitHubUrl\":null,\"csdnUrl\":null,\"email\":null,\"avatar\":\"http://localhost:8888/uploads/2022330//b397d8fca2f31968.webp\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-30 10:11:12', 0);
INSERT INTO `sys_oper_log` VALUES (128, '博客个人信息详情管理', 2, 'Blogpersonalinfo.UpdateBlogpersonalinfo()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogpersonalinfo/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"name\":\"ztc\",\"sex\":\"0\",\"age\":25,\"degree\":\"专升本\",\"height\":174,\"weight\":72,\"birthday\":\"2022-03-01 00:00:00\",\"school\":\"河北科技\",\"specialized\":\"计算机科学与技术\",\"blood\":\"B\",\"giteeUrl\":null,\"gitHubUrl\":null,\"csdnUrl\":null,\"email\":null,\"avatar\":\"http://localhost:8888/uploads/2022330//b397d8fca2f31968.webp\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-30 10:11:36', 0);
INSERT INTO `sys_oper_log` VALUES (129, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-30 10:24:41', 0);
INSERT INTO `sys_oper_log` VALUES (130, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-30 10:24:43', 0);
INSERT INTO `sys_oper_log` VALUES (131, '博客个人信息详情管理', 2, 'Blogpersonalinfo.UpdateBlogpersonalinfo()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogpersonalinfo/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"name\":\"ztc\",\"sex\":\"0\",\"age\":25,\"degree\":\"专升本\",\"height\":174,\"weight\":72.7,\"birthday\":\"2022-03-01 00:00:00\",\"school\":\"河北科技\",\"specialized\":\"计算机科学与技术\",\"blood\":\"B\",\"giteeUrl\":null,\"gitHubUrl\":null,\"csdnUrl\":null,\"email\":null,\"avatar\":\"http://localhost:8888/uploads/2022330//b397d8fca2f31968.webp\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-30 10:25:33', 0);
INSERT INTO `sys_oper_log` VALUES (132, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-30 15:35:27', 0);
INSERT INTO `sys_oper_log` VALUES (133, '文章修改', 2, 'Article.Update()', 'PUT', 0, 'admin', NULL, '/Article/edit', '127.0.0.1', '0 内网IP', '{\"fmt_type\":\"markdown\",\"cid\":1,\"title\":\"测试\",\"first_picture\":\"http://localhost:8888/uploads/2022324//26f7898e5c86a830.jpg\",\"content\":\"啊发撒法发**粗体**\",\"category_id\":1,\"tags\":[],\"istop\":true,\"status\":\"1\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-30 15:35:57', 0);
INSERT INTO `sys_oper_log` VALUES (134, '文章修改', 2, 'Article.Update()', 'PUT', 0, 'admin', NULL, '/Article/edit', '127.0.0.1', '0 内网IP', '{\"fmt_type\":\"markdown\",\"cid\":1,\"title\":\"测试\",\"first_picture\":\"http://localhost:8888/uploads/2022324//26f7898e5c86a830.jpg\",\"content\":\"啊发撒法发**粗体**\",\"category_id\":1,\"tags\":[],\"istop\":true,\"status\":\"1\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-30 15:37:55', 0);
INSERT INTO `sys_oper_log` VALUES (135, '文章修改', 2, 'Article.Update()', 'PUT', 0, 'admin', NULL, '/Article/edit', '127.0.0.1', '0 内网IP', '{\"fmt_type\":\"markdown\",\"cid\":1,\"title\":\"测试\",\"first_picture\":\"http://localhost:8888/uploads/2022324//26f7898e5c86a830.jpg\",\"content\":\"啊发撒法发**粗体**\",\"category_id\":1,\"istop\":true,\"tags\":[],\"status\":\"1\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-30 15:39:14', 0);
INSERT INTO `sys_oper_log` VALUES (136, '文章修改', 2, 'Article.Update()', 'PUT', 0, 'admin', NULL, '/Article/edit', '127.0.0.1', '0 内网IP', '{\"fmt_type\":\"markdown\",\"cid\":1,\"title\":\"测试\",\"first_picture\":\"http://localhost:8888/uploads/2022324//26f7898e5c86a830.jpg\",\"content\":\"啊发撒法发**粗体**\",\"category_id\":1,\"istop\":true,\"tags\":[],\"status\":\"1\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-30 15:39:41', 0);
INSERT INTO `sys_oper_log` VALUES (137, '文章修改', 2, 'Article.Update()', 'PUT', 0, 'admin', NULL, '/Article/edit', '127.0.0.1', '0 内网IP', '{\"fmt_type\":\"markdown\",\"cid\":1,\"title\":\"测试\",\"first_picture\":\"http://localhost:8888/uploads/2022324//26f7898e5c86a830.jpg\",\"content\":\"啊发撒法发**粗体**\",\"category_id\":1,\"istop\":true,\"tags\":[],\"status\":\"1\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-30 15:41:21', 0);
INSERT INTO `sys_oper_log` VALUES (138, '文章修改', 2, 'Article.Update()', 'PUT', 0, 'admin', NULL, '/Article/edit', '127.0.0.1', '0 内网IP', '{\"fmt_type\":\"markdown\",\"cid\":1,\"title\":\"测试\",\"first_picture\":\"http://localhost:8888/uploads/2022324//26f7898e5c86a830.jpg\",\"content\":\"啊发撒法发**粗体**\",\"category_id\":1,\"istop\":true,\"tags\":[],\"status\":\"1\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-30 15:41:29', 0);
INSERT INTO `sys_oper_log` VALUES (139, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-30 16:46:20', 0);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":7,\"menuName\":\"图标icon\",\"parentName\":null,\"parentId\":0,\"orderNum\":6,\"path\":\"icon\",\"component\":\"components/icons/index\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":null,\"icon\":\"icon1\",\"children\":[],\"createBy\":\"\",\"createTime\":\"2022-03-23 17:24:20\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-30 16:46:58', 0);
INSERT INTO `sys_oper_log` VALUES (141, NULL, 0, NULL, 'DELETE', 0, 'admin', NULL, '/system/dict/type/5', '127.0.0.1', '0 内网IP', '', '{\"code\":0,\"msg\":\"\\u4efb\\u52a1\\u5206\\u7ec4\\u5df2\\u5206\\u914d,\\u4e0d\\u80fd\\u5220\\u9664\",\"data\":null}', 1, '任务分组已分配,不能删除', '2022-03-30 16:49:04', 0);
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":107,\"menuName\":\"参数设置\",\"parentName\":null,\"parentId\":1,\"orderNum\":8,\"path\":\"config\",\"component\":\"system/config/index\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"system:config:list\",\"icon\":\"edit\",\"children\":[],\"createBy\":\"\",\"createTime\":\"2022-03-23 17:24:20\",\"updateTime\":null,\"remark\":\"\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-30 16:50:00', 0);
INSERT INTO `sys_oper_log` VALUES (143, '修改头像', 2, 'SysProfile.Avatar()', 'POST', 0, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"imgUrl\": \"http://localhost:8888/uploads/2022330//F7F4E052737F6AA6.png\"  }}', 0, NULL, '2022-03-30 17:11:42', 0);
INSERT INTO `sys_oper_log` VALUES (144, '修改信息', 2, 'SysProfile.UpdateProfile()', 'PUT', 0, 'admin', NULL, '/system/user/profile', '127.0.0.1', '0 内网IP', '{\"userId\":1,\"userName\":\"admin\",\"nickName\":\"管理员\",\"avatar\":\"\",\"email\":\"\",\"phonenumber\":\"\",\"sex\":\"0\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIP\":\"127.0.0.1\",\"loginDate\":\"2022-03-30 16:46:41\",\"roleIds\":[1],\"postIds\":null,\"roles\":[{\"roleId\":1,\"roleName\":\"超级管理员\",\"roleKey\":\"admin\",\"roleSort\":1,\"status\":\"0\",\"delFlag\":\"0\",\"dataScope\":\"1\",\"menuCheckStrictly\":true,\"menuIds\":null,\"userNum\":0,\"createBy\":\"admin\",\"createTime\":\"2022-03-23 17:24:21\",\"updateTime\":null,\"remark\":\"超级管理员\"}],\"welcomeMessage\":\"下午好\",\"welcomeContent\":null,\"createBy\":\"admin\",\"createTime\":\"2020-11-26 11:52:59\",\"updateTime\":\"2021-08-03 10:11:24\",\"remark\":\"管理员\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-30 17:11:47', 0);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 8, 'CodeGenerator.EditSave()', 'PUT', 0, 'admin', NULL, '/tool/gen/', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": true}', 0, NULL, '2022-03-30 17:16:06', 0);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 8, 'CodeGenerator.CodeGenerate()', 'POST', 0, 'admin', NULL, '/tool/gen/genCode', '127.0.0.1', '0 内网IP', '{\"tableId\":5}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"path\": \"/Generatecode/ZrAdmin.NET-文章类型-0330171608.zip\",    \"fileName\": null  }}', 0, NULL, '2022-03-30 17:16:09', 0);
INSERT INTO `sys_oper_log` VALUES (147, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-30 17:28:09', 0);
INSERT INTO `sys_oper_log` VALUES (148, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-30 17:28:10', 0);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 1, 'SysMenu.MenuAdd()', 'PUT', 0, 'admin', NULL, '/system/menu/add', '127.0.0.1', '0 内网IP', '{\"parentId\":2006,\"menuName\":\"文章类型管理\",\"icon\":\"cascader\",\"menuType\":\"C\",\"orderNum\":21,\"isFrame\":\"0\",\"isCache\":\"0\",\"visible\":\"0\",\"status\":\"0\",\"path\":\"articlecategory\",\"component\":\"blog/article/Articlecategory\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-30 17:30:35', 0);
INSERT INTO `sys_oper_log` VALUES (150, '文章类型', 3, 'Articlecategory.DeleteArticlecategory()', 'DELETE', 0, 'admin', NULL, '/Blog/Articlecategory/8', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-30 17:37:53', 0);
INSERT INTO `sys_oper_log` VALUES (151, '文章类型', 3, 'Articlecategory.DeleteArticlecategory()', 'DELETE', 0, 'admin', NULL, '/Blog/Articlecategory/7', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-30 17:37:59', 0);
INSERT INTO `sys_oper_log` VALUES (152, '文章类型', 3, 'Articlecategory.DeleteArticlecategory()', 'DELETE', 0, 'admin', NULL, '/Blog/Articlecategory/1', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-30 17:38:09', 0);
INSERT INTO `sys_oper_log` VALUES (153, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-31 09:13:36', 0);
INSERT INTO `sys_oper_log` VALUES (154, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-31 09:13:38', 0);
INSERT INTO `sys_oper_log` VALUES (155, '文章类型', 3, 'Articlecategory.DeleteArticlecategory()', 'DELETE', 0, 'admin', NULL, '/Blog/Articlecategory/5', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-31 09:14:30', 0);
INSERT INTO `sys_oper_log` VALUES (156, '文章类型', 3, 'Articlecategory.DeleteArticlecategory()', 'DELETE', 0, 'admin', NULL, '/Blog/Articlecategory/4', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-31 09:14:34', 0);
INSERT INTO `sys_oper_log` VALUES (157, '字典数据', 1, 'SysDictData.Add()', 'POST', 0, 'admin', NULL, '/system/dict/data', '127.0.0.1', '0 内网IP', '{\"dictLabel\":\"作品\",\"dictValue\":\"4\",\"dictSort\":3,\"status\":\"0\",\"dictType\":\"blog_project_type\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 35}', 0, NULL, '2022-03-31 09:41:52', 0);
INSERT INTO `sys_oper_log` VALUES (158, '字典数据', 2, 'SysDictData.Edit()', 'PUT', 0, 'admin', NULL, '/system/dict/data', '127.0.0.1', '0 内网IP', '{\"dictCode\":32,\"dictSort\":0,\"dictLabel\":\"爱好\",\"dictValue\":\"1\",\"dictType\":\"blog_project_type\",\"cssClass\":\"text-success\",\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"createBy\":\"admin\",\"createTime\":\"2022-03-29 13:39:38\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-31 09:42:24', 0);
INSERT INTO `sys_oper_log` VALUES (159, '字典数据', 2, 'SysDictData.Edit()', 'PUT', 0, 'admin', NULL, '/system/dict/data', '127.0.0.1', '0 内网IP', '{\"dictCode\":33,\"dictSort\":1,\"dictLabel\":\"完整项目\",\"dictValue\":\"2\",\"dictType\":\"blog_project_type\",\"cssClass\":\"text-info\",\"listClass\":\"default\",\"isDefault\":null,\"status\":\"0\",\"createBy\":\"admin\",\"createTime\":\"2022-03-29 13:40:06\",\"updateTime\":\"2022-03-29 14:03:50\",\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-31 09:42:29', 0);
INSERT INTO `sys_oper_log` VALUES (160, '字典数据', 2, 'SysDictData.Edit()', 'PUT', 0, 'admin', NULL, '/system/dict/data', '127.0.0.1', '0 内网IP', '{\"dictCode\":34,\"dictSort\":2,\"dictLabel\":\"小练习\",\"dictValue\":\"3\",\"dictType\":\"blog_project_type\",\"cssClass\":\"text-navy\",\"listClass\":\"\",\"isDefault\":null,\"status\":\"0\",\"createBy\":\"admin\",\"createTime\":\"2022-03-29 14:03:37\",\"updateTime\":\"2022-03-29 14:03:56\",\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-31 09:42:46', 0);
INSERT INTO `sys_oper_log` VALUES (161, '字典数据', 2, 'SysDictData.Edit()', 'PUT', 0, 'admin', NULL, '/system/dict/data', '127.0.0.1', '0 内网IP', '{\"dictCode\":35,\"dictSort\":3,\"dictLabel\":\"作品\",\"dictValue\":\"4\",\"dictType\":\"blog_project_type\",\"cssClass\":\"text-green\",\"listClass\":\"\",\"isDefault\":null,\"status\":\"0\",\"createBy\":\"admin\",\"createTime\":\"2022-03-31 09:41:52\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-31 09:42:53', 0);
INSERT INTO `sys_oper_log` VALUES (162, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-31 09:45:00', 0);
INSERT INTO `sys_oper_log` VALUES (163, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-31 09:45:02', 0);
INSERT INTO `sys_oper_log` VALUES (164, '博客项目表', 1, 'Blogproject.AddBlogproject()', 'POST', 0, 'admin', NULL, '/Blog/TBlogproject', '127.0.0.1', '0 内网IP', '{\"content\":\"这是一个小练习\",\"title\":\"小练习\",\"typeName\":\"3\",\"picUrl\":\"http://localhost:8888/uploads/2022331//0f063239ec1ae815.jpg\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-31 09:58:37', 0);
INSERT INTO `sys_oper_log` VALUES (165, '博客项目表', 1, 'Blogproject.AddBlogproject()', 'POST', 0, 'admin', NULL, '/Blog/TBlogproject', '127.0.0.1', '0 内网IP', '{\"content\":\"我的爱好很多这只是其中一个\",\"title\":\"骑车子\",\"typeName\":\"1\",\"picUrl\":\"http://localhost:8888/uploads/2022331//6c5ed93b615100e2.jpg\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-31 10:00:27', 0);
INSERT INTO `sys_oper_log` VALUES (166, '博客项目表', 1, 'Blogproject.AddBlogproject()', 'POST', 0, 'admin', NULL, '/Blog/TBlogproject', '127.0.0.1', '0 内网IP', '{\"content\":\"这是我的一个作品\",\"title\":\"作品1\",\"typeName\":\"4\",\"picUrl\":\"http://localhost:8888/uploads/2022331//cdde9ee9745429bf.jpg\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-31 10:01:02', 0);
INSERT INTO `sys_oper_log` VALUES (167, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-31 10:34:47', 0);
INSERT INTO `sys_oper_log` VALUES (168, '代码生成', 6, 'CodeGenerator.ImportTableSave()', 'POST', 0, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"tableId\": 6,    \"dbName\": \"blogadmin\",    \"tableName\": \"t_blogskill\",    \"tableComment\": \"博客个人技能\",    \"subTableName\": null,    \"subTableFkName\": null,    \"className\": \"Blogskill\",    \"tplCategory\": null,    \"baseNameSpace\": \"ZR.\",    \"moduleName\": \"business\",    \"businessName\": \"TBlogskill\",    \"functionName\": \"博客个人技能\",    \"functionAuthor\": \"ztc\",    \"genType\": null,    \"genPath\": null,    \"options\": null,    \"columns\": [      {        \"columnId\": 0,        \"columnName\": \"id\",        \"tableId\": 6,        \"tableName\": \"t_blogskill\",        \"columnComment\": \"\",        \"columnType\": \"int\",        \"csharpType\": \"int\",        \"csharpField\": \"Id\",        \"isPk\": true,        \"isRequired\": true,        \"isIncrement\": true,        \"isInsert\": false,        \"isEdit\": false,        \"isList\": true,        \"isQuery\": false,        \"htmlType\": \"input\",        \"queryType\": \"EQ\",        \"sort\": 0,        \"dictType\": \"\",        \"requiredStr\": \"\",        \"csharpFieldFl\": null,        \"createBy\": \"admin\",        \"createTime\": \"2022-03-31 10:35:15\",        \"updateTime\": null,        \"remark\": null      },      {        \"columnId\": 0,        \"columnName\": \"name\",        \"tableId\": 6,        \"tableName\": \"t_blogskill\",        \"columnComment\": \"技能名称\",        \"columnType\": \"varchar\",        \"csharpType\": \"string\",        \"csharpField\": \"Name\",        \"isPk\": false,        \"isRequired\": false,        \"isIncrement\": false,        \"isInsert\": true,        \"isEdit\": true,        \"isList\": true,        \"isQuery\": false,        \"htmlType\": \"input\",        \"queryType\": \"EQ\",        \"sort\": 0,        \"dictType\": \"\",        \"requiredStr\": \"\",        \"csharpFieldFl\": null,        \"createBy\": \"admin\",        \"createTime\": \"2022-03-31 10:35:15\",        \"updateTime\": null,        \"remark\": null      },      {        \"columnId\": 0,        \"columnName\": \"picIcon\",        \"tableId\": 6,        \"tableName\": \"t_blogskill\",        \"columnComment\": \"技能icon\",        \"columnType\": \"varchar\",        \"csharpType\": \"string\",        \"csharpField\": \"PicIcon\",        \"isPk\": false,        \"isRequired\": false,        \"isIncrement\": false,        \"isInsert\": true,        \"isEdit\": true,        \"isList\": true,        \"isQuery\": false,        \"htmlType\": \"imageUpload\",        \"queryType\": \"EQ\",        \"sort\": 0,        \"dictType\": \"\",        \"requiredStr\": \"\",        \"csharpFieldFl\": null,        \"createBy\": \"admin\",        \"createTime\": \"2022-03-31 10:35:15\",        \"updateTime\": null,        \"remark\": null      },      {        \"columnId\": 0,        \"columnName\": \"des\",        \"tableId\": 6,        \"tableName\": \"t_blogskill\",        \"columnComment\": \"节能描述\",        \"columnType\": \"varchar\",        \"csharpType\": \"string\",        \"csharpField\": \"Des\",        \"isPk\": false,        \"isRequired\": false,        \"isIncrement\": false,        \"isInsert\": true,        \"isEdit\": true,        \"isList\": true,        \"isQuery\": false,        \"htmlType\": \"input\",        \"queryType\": \"EQ\",        \"sort\": 0,        \"dictType\": \"\",        \"requiredStr\": \"\",        \"csharpFieldFl\": null,        \"createBy\": \"admin\",        \"createTime\": \"2022-03-31 10:35:15\",        \"updateTime\": null,        \"remark\": null      }    ],    \"parentMenuId\": null,    \"sortType\": \"asc\",    \"sortField\": \"\",    \"treeCode\": \"\",    \"treeName\": \"\",    \"treeParentCode\": null,    \"checkedBtn\": [      1,      2,      3    ],    \"createBy\": \"admin\",    \"createTime\": \"2022-03-31 10:35:15\",    \"updateTime\": null,    \"remark\": null  }}', 0, NULL, '2022-03-31 10:35:16', 0);
INSERT INTO `sys_oper_log` VALUES (169, '代码生成', 8, 'CodeGenerator.EditSave()', 'PUT', 0, 'admin', NULL, '/tool/gen/', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": true}', 0, NULL, '2022-03-31 10:36:21', 0);
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 8, 'CodeGenerator.CodeGenerate()', 'POST', 0, 'admin', NULL, '/tool/gen/genCode', '127.0.0.1', '0 内网IP', '{\"tableId\":6}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"path\": \"/Generatecode/ZrAdmin.NET-博客个人技能-0331103624.zip\",    \"fileName\": null  }}', 0, NULL, '2022-03-31 10:36:24', 0);
INSERT INTO `sys_oper_log` VALUES (171, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-31 11:41:36', 0);
INSERT INTO `sys_oper_log` VALUES (172, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-31 13:18:34', 0);
INSERT INTO `sys_oper_log` VALUES (173, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-31 13:18:35', 0);
INSERT INTO `sys_oper_log` VALUES (174, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-31 14:17:33', 0);
INSERT INTO `sys_oper_log` VALUES (175, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-31 14:17:34', 0);
INSERT INTO `sys_oper_log` VALUES (176, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-31 14:17:35', 0);
INSERT INTO `sys_oper_log` VALUES (177, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, 'admin', NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": \"admin\",    \"id\": 1  }}', 0, NULL, '2022-03-31 14:23:25', 0);
INSERT INTO `sys_oper_log` VALUES (178, '博客个人信息详情管理', 2, 'Blogpersonalinfo.UpdateBlogpersonalinfo()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogpersonalinfo/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"name\":\"ztc\",\"sex\":\"0\",\"age\":25,\"degree\":\"专升本\",\"height\":174,\"weight\":72.7,\"birthday\":\"2022-03-01 00:00:00\",\"school\":\"河北科技\",\"specialized\":\"计算机科学与技术\",\"blood\":\"B\",\"giteeUrl\":null,\"gitHubUrl\":null,\"csdnUrl\":null,\"email\":null,\"avatar\":\"http://localhost:8888/uploads/2022330//b397d8fca2f31968.webp\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-31 14:51:08', 0);
INSERT INTO `sys_oper_log` VALUES (179, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/Blog/TBlogpersonalinfo/skill/add', '127.0.0.1', '0 内网IP', '{\"name\":\"js\",\"picIcon\":\"iconfont icon-logo-javascript\",\"des\":\"前端js\"}', '{\"code\":500,\"msg\":\"\\u670d\\u52a1\\u5668\\u597d\\u50cf\\u51fa\\u4e86\\u70b9\\u95ee\\u9898......\",\"data\":null}', 1, '中文提示 :  连接数据库过程中发生错误，检查服务器是否正常连接字符串是否正确，实在找不到原因请先Google错误信息：A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: SNI_PN11, error: 26 - Error Locating Server/Instance Specified).\r\nEnglish Message : Connection open error . A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: SNI_PN11, error: 26 - Error Locating Server/Instance Specified)', '2022-03-31 14:51:08', 0);
INSERT INTO `sys_oper_log` VALUES (180, '博客个人信息详情管理', 2, 'Blogpersonalinfo.UpdateBlogpersonalinfo()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogpersonalinfo/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"name\":\"ztc\",\"sex\":\"0\",\"age\":25,\"degree\":\"专升本\",\"height\":174,\"weight\":72.7,\"birthday\":\"2022-03-01 00:00:00\",\"school\":\"河北科技\",\"specialized\":\"计算机科学与技术\",\"blood\":\"B\",\"giteeUrl\":null,\"gitHubUrl\":null,\"csdnUrl\":null,\"email\":null,\"avatar\":\"http://localhost:8888/uploads/2022330//b397d8fca2f31968.webp\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-31 14:53:03', 0);
INSERT INTO `sys_oper_log` VALUES (181, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/Blog/TBlogpersonalinfo/skill/add', '127.0.0.1', '0 内网IP', '{\"name\":\"js\",\"picIcon\":\"iconfont icon-html\",\"des\":\"前端js\"}', '{\"code\":500,\"msg\":\"\\u670d\\u52a1\\u5668\\u597d\\u50cf\\u51fa\\u4e86\\u70b9\\u95ee\\u9898......\",\"data\":null}', 1, '中文提示 :  连接数据库过程中发生错误，检查服务器是否正常连接字符串是否正确，实在找不到原因请先Google错误信息：A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: SNI_PN11, error: 26 - Error Locating Server/Instance Specified).\r\nEnglish Message : Connection open error . A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: SNI_PN11, error: 26 - Error Locating Server/Instance Specified)', '2022-03-31 14:53:15', 0);
INSERT INTO `sys_oper_log` VALUES (182, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-31 15:08:02', 0);
INSERT INTO `sys_oper_log` VALUES (183, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-31 15:08:03', 0);
INSERT INTO `sys_oper_log` VALUES (184, '博客个人技能', 1, 'Blogpersonalinfo.AddBlogskill()', 'POST', 0, 'admin', NULL, '/Blog/TBlogpersonalinfo/skill/add', '127.0.0.1', '0 内网IP', '{\"name\":\"js\",\"picIcon\":\"iconfont icon-html\",\"des\":\"水水水水水\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-03-31 15:13:09', 0);
INSERT INTO `sys_oper_log` VALUES (185, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-31 17:23:15', 0);
INSERT INTO `sys_oper_log` VALUES (186, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-03-31 17:23:16', 0);
INSERT INTO `sys_oper_log` VALUES (187, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"Copright©2022 sageinqi Designed by taiyonoyoni\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":\"1\",\"isOpenRegister\":\"1\",\"content\":\"这是一个测试\",\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg\",\"fundedAlipayImg\":\"http://localhost:8888/uploads/2022331//82284f8c7d8e1e7d.jpg\",\"fundedWechartImg\":\"http://localhost:8888/uploads/2022331//0e3453ff8440a51a.jpg\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-03-31 17:23:50', 0);
INSERT INTO `sys_oper_log` VALUES (188, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-06 13:40:58', 0);
INSERT INTO `sys_oper_log` VALUES (189, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-06 13:40:59', 0);
INSERT INTO `sys_oper_log` VALUES (190, '文件存储', 3, 'SysFile.DeleteSysFile()', 'DELETE', 0, 'admin', NULL, '/tool/file/1511580843083173888', '172.18.87.79', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-04-06 14:15:29', 0);
INSERT INTO `sys_oper_log` VALUES (191, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-12 11:07:47', 0);
INSERT INTO `sys_oper_log` VALUES (192, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-12 11:08:37', 0);
INSERT INTO `sys_oper_log` VALUES (193, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, 'admin', NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": \"admin\",    \"id\": 1  }}', 0, NULL, '2022-04-12 11:13:36', 0);
INSERT INTO `sys_oper_log` VALUES (194, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-12 16:46:00', 0);
INSERT INTO `sys_oper_log` VALUES (195, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-12 16:46:02', 0);
INSERT INTO `sys_oper_log` VALUES (196, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-13 10:43:08', 0);
INSERT INTO `sys_oper_log` VALUES (197, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-13 10:43:09', 0);
INSERT INTO `sys_oper_log` VALUES (198, '文章删除', 3, 'Article.Delete()', 'DELETE', 0, 'admin', NULL, '/Article/1', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-04-13 10:56:32', 0);
INSERT INTO `sys_oper_log` VALUES (199, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-13 11:23:39', 0);
INSERT INTO `sys_oper_log` VALUES (200, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-13 11:23:41', 0);
INSERT INTO `sys_oper_log` VALUES (201, '标签删除', 3, 'Tag.Delete()', 'DELETE', 0, 'admin', NULL, '/tag/3', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-04-13 11:26:44', 0);
INSERT INTO `sys_oper_log` VALUES (202, '标签删除', 3, 'Tag.Delete()', 'DELETE', 0, 'admin', NULL, '/tag/2', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-04-13 11:26:52', 0);
INSERT INTO `sys_oper_log` VALUES (203, '标签删除', 3, 'Tag.Delete()', 'DELETE', 0, 'admin', NULL, '/tag/1', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-04-13 11:26:55', 0);
INSERT INTO `sys_oper_log` VALUES (204, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-13 14:36:24', 0);
INSERT INTO `sys_oper_log` VALUES (205, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-13 14:36:29', 0);
INSERT INTO `sys_oper_log` VALUES (206, '文章类型', 3, 'Articlecategory.DeleteArticlecategory()', 'DELETE', 0, 'admin', NULL, '/Blog/Articlecategory/6', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-04-13 14:36:51', 0);
INSERT INTO `sys_oper_log` VALUES (207, '文章类型', 3, 'Articlecategory.DeleteArticlecategory()', 'DELETE', 0, 'admin', NULL, '/Blog/Articlecategory/3', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-04-13 14:36:53', 0);
INSERT INTO `sys_oper_log` VALUES (208, '文章类型', 3, 'Articlecategory.DeleteArticlecategory()', 'DELETE', 0, 'admin', NULL, '/Blog/Articlecategory/2', '127.0.0.1', '0 内网IP', '', '{  \"code\": 110,  \"msg\": \"删除失败，文章类型下有文章存在\"}', 0, NULL, '2022-04-13 14:36:55', 0);
INSERT INTO `sys_oper_log` VALUES (209, '文章删除', 3, 'Article.Delete()', 'DELETE', 0, 'admin', NULL, '/Article/2', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 0}', 0, NULL, '2022-04-13 14:37:04', 0);
INSERT INTO `sys_oper_log` VALUES (210, '文章类型', 3, 'Articlecategory.DeleteArticlecategory()', 'DELETE', 0, 'admin', NULL, '/Blog/Articlecategory/2', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-04-13 14:37:10', 0);
INSERT INTO `sys_oper_log` VALUES (211, '文章类型', 1, 'Articlecategory.AddArticlecategory()', 'POST', 0, 'admin', NULL, '/Blog/Articlecategory', '127.0.0.1', '0 内网IP', '{\"name\":\"wpf\",\"pic_url\":\"http://localhost:9999/uploads/2022413//c97df5604f90a80c.webp\",\"color\":\"#2b73af\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-04-13 14:37:31', 0);
INSERT INTO `sys_oper_log` VALUES (212, '文章类型', 2, 'Articlecategory.UpdateArticlecategory()', 'PUT', 0, 'admin', NULL, '/Blog/Articlecategory', '127.0.0.1', '0 内网IP', '{\"category_Id\":7,\"name\":\"wpf\",\"parentId\":0,\"pic_url\":\"http://localhost:9999/uploads/2022413//b41212f11a2dafdd.webp\",\"color\":null}', '{  \"code\": 1,  \"msg\": \"FAIL\"}', 0, NULL, '2022-04-13 14:41:06', 0);
INSERT INTO `sys_oper_log` VALUES (213, '文章类型', 2, 'Articlecategory.UpdateArticlecategory()', 'PUT', 0, 'admin', NULL, '/Blog/Articlecategory', '127.0.0.1', '0 内网IP', '{\"category_Id\":7,\"name\":\"wpf\",\"parentId\":0,\"pic_url\":\"http://localhost:9999/uploads/2022413//b41212f11a2dafdd.webp\",\"color\":\"#2b73af\"}', '{  \"code\": 1,  \"msg\": \"FAIL\"}', 0, NULL, '2022-04-13 14:41:19', 0);
INSERT INTO `sys_oper_log` VALUES (214, '文章类型', 2, 'Articlecategory.UpdateArticlecategory()', 'PUT', 0, 'admin', NULL, '/Blog/Articlecategory', '127.0.0.1', '0 内网IP', '{\"category_Id\":7,\"name\":\"wpf\",\"parentId\":0,\"pic_url\":\"http://localhost:9999/uploads/2022413//b41212f11a2dafdd.webp\",\"color\":\"#2b73af\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-04-13 14:43:02', 0);
INSERT INTO `sys_oper_log` VALUES (215, '文章类型', 2, 'Articlecategory.UpdateArticlecategory()', 'PUT', 0, 'admin', NULL, '/Blog/Articlecategory', '127.0.0.1', '0 内网IP', '{\"category_Id\":7,\"name\":\"wpf\",\"parentId\":0,\"pic_url\":\"http://localhost:9999/uploads/2022413//b41212f11a2dafdd.webp\",\"color\":\"#2b73af\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-04-13 14:43:23', 0);
INSERT INTO `sys_oper_log` VALUES (216, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-13 16:17:17', 0);
INSERT INTO `sys_oper_log` VALUES (217, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-13 16:17:19', 0);
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 6, 'CodeGenerator.ImportTableSave()', 'POST', 0, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"tableId\": 7,    \"dbName\": \"blogadmin\",    \"tableName\": \"t_bloglinks\",    \"tableComment\": \"博客友情链接\",    \"subTableName\": null,    \"subTableFkName\": null,    \"className\": \"Bloglinks\",    \"tplCategory\": null,    \"baseNameSpace\": \"ZR.\",    \"moduleName\": \"business\",    \"businessName\": \"TBloglinks\",    \"functionName\": \"博客友情链接\",    \"functionAuthor\": \"ztc\",    \"genType\": null,    \"genPath\": null,    \"options\": null,    \"columns\": [      {        \"columnId\": 0,        \"columnName\": \"id\",        \"tableId\": 7,        \"tableName\": \"t_bloglinks\",        \"columnComment\": \"\",        \"columnType\": \"int\",        \"csharpType\": \"int\",        \"csharpField\": \"Id\",        \"isPk\": true,        \"isRequired\": true,        \"isIncrement\": true,        \"isInsert\": false,        \"isEdit\": false,        \"isList\": true,        \"isQuery\": false,        \"htmlType\": \"input\",        \"queryType\": \"EQ\",        \"sort\": 0,        \"dictType\": \"\",        \"requiredStr\": \"\",        \"csharpFieldFl\": null,        \"createBy\": \"admin\",        \"createTime\": \"2022-04-13 16:23:03\",        \"updateTime\": null,        \"remark\": null      },      {        \"columnId\": 0,        \"columnName\": \"name\",        \"tableId\": 7,        \"tableName\": \"t_bloglinks\",        \"columnComment\": \"名称\",        \"columnType\": \"varchar\",        \"csharpType\": \"string\",        \"csharpField\": \"Name\",        \"isPk\": false,        \"isRequired\": false,        \"isIncrement\": false,        \"isInsert\": true,        \"isEdit\": true,        \"isList\": true,        \"isQuery\": false,        \"htmlType\": \"input\",        \"queryType\": \"EQ\",        \"sort\": 0,        \"dictType\": \"\",        \"requiredStr\": \"\",        \"csharpFieldFl\": null,        \"createBy\": \"admin\",        \"createTime\": \"2022-04-13 16:23:03\",        \"updateTime\": null,        \"remark\": null      },      {        \"columnId\": 0,        \"columnName\": \"links\",        \"tableId\": 7,        \"tableName\": \"t_bloglinks\",        \"columnComment\": \"跳转链接\",        \"columnType\": \"varchar\",        \"csharpType\": \"string\",        \"csharpField\": \"Links\",        \"isPk\": false,        \"isRequired\": false,        \"isIncrement\": false,        \"isInsert\": true,        \"isEdit\": true,        \"isList\": true,        \"isQuery\": false,        \"htmlType\": \"input\",        \"queryType\": \"EQ\",        \"sort\": 0,        \"dictType\": \"\",        \"requiredStr\": \"\",        \"csharpFieldFl\": null,        \"createBy\": \"admin\",        \"createTime\": \"2022-04-13 16:23:03\",        \"updateTime\": null,        \"remark\": null      }    ],    \"parentMenuId\": null,    \"sortType\": \"asc\",    \"sortField\": \"\",    \"treeCode\": \"\",    \"treeName\": \"\",    \"treeParentCode\": null,    \"checkedBtn\": [      1,      2,      3    ],    \"createBy\": \"admin\",    \"createTime\": \"2022-04-13 16:23:03\",    \"updateTime\": null,    \"remark\": null  }}', 0, NULL, '2022-04-13 16:23:03', 0);
INSERT INTO `sys_oper_log` VALUES (219, '代码生成', 8, 'CodeGenerator.EditSave()', 'PUT', 0, 'admin', NULL, '/tool/gen/', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": true}', 0, NULL, '2022-04-13 16:23:57', 0);
INSERT INTO `sys_oper_log` VALUES (220, '代码生成', 8, 'CodeGenerator.CodeGenerate()', 'POST', 0, 'admin', NULL, '/tool/gen/genCode', '127.0.0.1', '0 内网IP', '{\"tableId\":7}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"path\": \"/Generatecode/ZrAdmin.NET-博客友情链接-0413162414.zip\",    \"fileName\": null  }}', 0, NULL, '2022-04-13 16:24:15', 0);
INSERT INTO `sys_oper_log` VALUES (221, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-13 17:17:22', 0);
INSERT INTO `sys_oper_log` VALUES (222, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-13 17:17:23', 0);
INSERT INTO `sys_oper_log` VALUES (223, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/Blog/TBlogconfig/addLinks', '127.0.0.1', '0 内网IP', '{}', '{\"code\":101,\"msg\":\"value cannot be null. (parameter \\u0027source\\u0027)\",\"data\":null}', 1, 'Value cannot be null. (Parameter \'source\')', '2022-04-13 17:24:26', 0);
INSERT INTO `sys_oper_log` VALUES (224, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/Blog/TBlogconfig/addLinks', '127.0.0.1', '0 内网IP', '{}', '{\"code\":101,\"msg\":\"value cannot be null. (parameter \\u0027source\\u0027)\",\"data\":null}', 1, 'Value cannot be null. (Parameter \'source\')', '2022-04-13 17:28:42', 0);
INSERT INTO `sys_oper_log` VALUES (225, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/Blog/TBlogconfig/addLinks', '127.0.0.1', '0 内网IP', '{}', '{\"code\":101,\"msg\":\"value cannot be null. (parameter \\u0027source\\u0027)\",\"data\":null}', 1, 'Value cannot be null. (Parameter \'source\')', '2022-04-13 17:30:09', 0);
INSERT INTO `sys_oper_log` VALUES (226, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/Blog/TBlogconfig/addLinks', '127.0.0.1', '0 内网IP', '{\"name\":\"ZrAdmin.NET\",\"links\":\"http://www.izhaorui.cn/doc/#/\"}', '{\"code\":101,\"msg\":\"value cannot be null. (parameter \\u0027source\\u0027)\",\"data\":null}', 1, 'Value cannot be null. (Parameter \'source\')', '2022-04-13 17:32:54', 0);
INSERT INTO `sys_oper_log` VALUES (227, '博客友情链接添加', 1, 'Blogconfig.InsertBloglinks()', 'POST', 0, 'admin', NULL, '/Blog/TBlogconfig/addLinks', '127.0.0.1', '0 内网IP', '{\"name\":\"ZrAdmin.NET\",\"links\":\"http://www.izhaorui.cn/doc/#/\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-04-13 17:33:37', 0);
INSERT INTO `sys_oper_log` VALUES (228, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-14 09:22:04', 0);
INSERT INTO `sys_oper_log` VALUES (229, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-14 09:22:05', 0);
INSERT INTO `sys_oper_log` VALUES (230, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-14 09:54:14', 0);
INSERT INTO `sys_oper_log` VALUES (231, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"Copright©2022 sageinqi Designed by taiyonoyoni\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":\"1\",\"isOpenRegister\":\"1\",\"content\":\"这是一个测试\",\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg\",\"fundedAlipayImg\":\"\",\"fundedWechartImg\":\"\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-04-14 09:54:53', 0);
INSERT INTO `sys_oper_log` VALUES (232, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"Copright©2022 sageinqi Designed by taiyonoyoni\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":\"1\",\"isOpenRegister\":\"1\",\"content\":\"这是一个测试\",\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg\",\"fundedAlipayImg\":\"\",\"fundedWechartImg\":\"\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-04-14 09:56:36', 0);
INSERT INTO `sys_oper_log` VALUES (233, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-14 10:28:45', 0);
INSERT INTO `sys_oper_log` VALUES (234, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-14 10:28:46', 0);
INSERT INTO `sys_oper_log` VALUES (235, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"<i>Copright©2022 sageinqi Designed by taiyonoyoni</i>\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":\"1\",\"isOpenRegister\":\"1\",\"content\":\"这是一个测试\",\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg\",\"fundedAlipayImg\":\"\",\"fundedWechartImg\":\"\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-04-14 10:31:26', 0);
INSERT INTO `sys_oper_log` VALUES (236, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"<p><a href=\\\"https://beian.miit.gov.cn\\\" target=\\\"_blank\\\">冀ICP备19003479号-2</a></p>\\n<i>Copright©2022 sageinqi Designed by taiyonoyoni</i>\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":\"1\",\"isOpenRegister\":\"1\",\"content\":\"这是一个测试\",\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg\",\"fundedAlipayImg\":\"\",\"fundedWechartImg\":\"\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-04-14 10:47:13', 0);
INSERT INTO `sys_oper_log` VALUES (237, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"<p><a class=\\\"list item\\\" href=\\\"https://beian.miit.gov.cn\\\" target=\\\"_blank\\\">冀ICP备19003479号-2</a></p>\\n<i>Copright©2022 sageinqi Designed by taiyonoyoni</i>\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":\"1\",\"isOpenRegister\":\"1\",\"content\":\"这是一个测试\",\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg\",\"fundedAlipayImg\":\"\",\"fundedWechartImg\":\"\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-04-14 10:50:02', 0);
INSERT INTO `sys_oper_log` VALUES (238, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"<p><a href=\\\"https://beian.miit.gov.cn\\\" target=\\\"_blank\\\">冀ICP备19003479号-2</a></p>\\n<i>Copright©2022 sageinqi Designed by taiyonoyoni</i>\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":\"1\",\"isOpenRegister\":\"1\",\"content\":\"这是一个测试\",\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg\",\"fundedAlipayImg\":\"\",\"fundedWechartImg\":\"\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-04-14 10:50:31', 0);
INSERT INTO `sys_oper_log` VALUES (239, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"<a href=\\\"https://beian.miit.gov.cn\\\" target=\\\"_blank\\\">冀ICP备19003479号-2</a>\\n<i>Copright©2022 sageinqi Designed by taiyonoyoni</i>\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":\"1\",\"isOpenRegister\":\"1\",\"content\":\"这是一个测试\",\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg\",\"fundedAlipayImg\":\"\",\"fundedWechartImg\":\"\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-04-14 10:52:08', 0);
INSERT INTO `sys_oper_log` VALUES (240, '博客配置修改', 2, 'Blogconfig.UpdateBlogconfig()', 'PUT', 0, 'admin', NULL, '/Blog/TBlogconfig/edit', '127.0.0.1', '0 内网IP', '{\"id\":1,\"title\":\"ceshi\",\"copyright\":\"<p><a href=\\\"https://beian.miit.gov.cn\\\" target=\\\"_blank\\\">冀ICP备19003479号-2</a></p>\\n<i>Copright©2022 sageinqi Designed by taiyonoyoni</i>\",\"authorQQ\":null,\"authorWechart\":null,\"authorEmail\":\"sageinqi@qq.com\",\"isOpenLogin\":\"1\",\"isOpenRegister\":\"1\",\"content\":\"这是一个测试\",\"bottomImage\":null,\"blogBackGroundImage\":\"http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg\",\"fundedAlipayImg\":\"\",\"fundedWechartImg\":\"\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-04-14 10:52:17', 0);
INSERT INTO `sys_oper_log` VALUES (241, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-22 16:09:17', 0);
INSERT INTO `sys_oper_log` VALUES (242, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, NULL, NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": null,    \"id\": 0  }}', 0, NULL, '2022-04-22 16:11:33', 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `roleId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `roleName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `roleKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `roleSort` int(4) NOT NULL COMMENT '显示顺序',
  `dataScope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 ）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NOT NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `delFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 0, '0', '0', 'admin', '2022-03-23 17:24:21', 'system', NULL, '超级管理员');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_tasks_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_tasks_log`;
CREATE TABLE `sys_tasks_log`  (
  `jobLogId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `jobId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务id',
  `jobName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `jobGroup` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `jobMessage` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `invokeTarget` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用目标',
  `elapsed` double(10, 0) NULL DEFAULT NULL COMMENT '作业用时',
  PRIMARY KEY (`jobLogId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 458 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_tasks_log
-- ----------------------------
INSERT INTO `sys_tasks_log` VALUES (196, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', NULL, '2022-03-23 17:24:20', 'ZRTasks.Job_SyncTest', 18);
INSERT INTO `sys_tasks_log` VALUES (197, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', NULL, '2022-03-23 17:24:20', 'ZRTasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (198, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-23 17:40:00', 'ZR.Tasks.Job_SyncTest', 17);
INSERT INTO `sys_tasks_log` VALUES (199, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-23 17:50:00', 'ZR.Tasks.Job_SyncTest', 20);
INSERT INTO `sys_tasks_log` VALUES (200, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 10:40:00', 'ZR.Tasks.Job_SyncTest', 10);
INSERT INTO `sys_tasks_log` VALUES (201, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 10:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (202, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 11:00:00', 'ZR.Tasks.Job_SyncTest', 21);
INSERT INTO `sys_tasks_log` VALUES (203, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 11:10:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (204, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 11:20:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (205, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 11:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (206, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 11:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (207, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 11:50:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (208, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 12:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (209, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 13:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (210, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 13:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (211, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 13:40:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (212, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 13:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (213, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 14:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (214, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 14:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (215, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 14:20:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (216, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 14:30:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (217, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 14:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (218, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 14:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (219, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 15:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (220, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 15:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (221, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 15:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (222, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 15:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (223, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 15:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (224, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 15:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (225, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 16:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (226, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 16:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (227, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 16:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (228, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 16:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (229, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 16:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (230, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 16:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (231, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 17:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (232, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 17:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (233, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 17:20:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (234, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 17:30:00', 'ZR.Tasks.Job_SyncTest', 12);
INSERT INTO `sys_tasks_log` VALUES (235, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 17:50:00', 'ZR.Tasks.Job_SyncTest', 8);
INSERT INTO `sys_tasks_log` VALUES (236, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-24 18:00:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (237, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 09:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (238, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 09:10:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (239, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 09:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (240, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 10:40:00', 'ZR.Tasks.Job_SyncTest', 12);
INSERT INTO `sys_tasks_log` VALUES (241, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 10:50:00', 'ZR.Tasks.Job_SyncTest', 23);
INSERT INTO `sys_tasks_log` VALUES (242, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 11:10:00', 'ZR.Tasks.Job_SyncTest', 13);
INSERT INTO `sys_tasks_log` VALUES (243, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 11:20:00', 'ZR.Tasks.Job_SyncTest', 8);
INSERT INTO `sys_tasks_log` VALUES (244, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 11:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (245, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 14:20:00', 'ZR.Tasks.Job_SyncTest', 8);
INSERT INTO `sys_tasks_log` VALUES (246, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 14:30:00', 'ZR.Tasks.Job_SyncTest', 17);
INSERT INTO `sys_tasks_log` VALUES (247, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 14:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (248, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 14:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (249, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 15:00:00', 'ZR.Tasks.Job_SyncTest', 10);
INSERT INTO `sys_tasks_log` VALUES (250, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 15:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (251, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 15:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (252, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 15:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (253, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 15:40:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (254, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 15:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (255, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 16:00:00', 'ZR.Tasks.Job_SyncTest', 30);
INSERT INTO `sys_tasks_log` VALUES (256, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 16:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (257, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 16:20:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (258, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 16:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (259, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 16:40:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (260, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 16:50:00', 'ZR.Tasks.Job_SyncTest', 25);
INSERT INTO `sys_tasks_log` VALUES (261, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 17:00:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (262, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 17:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (263, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 17:20:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (264, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 17:30:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (265, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 17:50:00', 'ZR.Tasks.Job_SyncTest', 9);
INSERT INTO `sys_tasks_log` VALUES (266, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-25 18:00:00', 'ZR.Tasks.Job_SyncTest', 13);
INSERT INTO `sys_tasks_log` VALUES (267, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-26 09:10:00', 'ZR.Tasks.Job_SyncTest', 10);
INSERT INTO `sys_tasks_log` VALUES (268, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-26 09:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (269, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-26 09:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (270, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 10:40:00', 'ZR.Tasks.Job_SyncTest', 20);
INSERT INTO `sys_tasks_log` VALUES (271, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 10:50:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (272, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 11:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (273, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 11:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (274, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 11:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (275, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 11:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (276, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 11:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (277, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 11:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (278, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 12:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (279, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 12:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (280, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 12:20:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (281, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 12:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (282, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 12:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (283, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 12:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (284, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 13:00:00', 'ZR.Tasks.Job_SyncTest', 30);
INSERT INTO `sys_tasks_log` VALUES (285, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 13:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (286, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 13:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (287, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 13:30:00', 'ZR.Tasks.Job_SyncTest', 31);
INSERT INTO `sys_tasks_log` VALUES (288, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 13:40:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (289, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 14:00:00', 'ZR.Tasks.Job_SyncTest', 24);
INSERT INTO `sys_tasks_log` VALUES (290, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 14:10:00', 'ZR.Tasks.Job_SyncTest', 24);
INSERT INTO `sys_tasks_log` VALUES (291, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 14:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (292, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 14:30:00', 'ZR.Tasks.Job_SyncTest', 30);
INSERT INTO `sys_tasks_log` VALUES (293, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 14:40:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (294, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 14:50:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (295, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 15:20:00', 'ZR.Tasks.Job_SyncTest', 11);
INSERT INTO `sys_tasks_log` VALUES (296, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 15:50:00', 'ZR.Tasks.Job_SyncTest', 27);
INSERT INTO `sys_tasks_log` VALUES (297, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 16:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (298, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 16:10:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (299, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 16:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (300, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 16:30:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (301, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 16:40:00', 'ZR.Tasks.Job_SyncTest', 27);
INSERT INTO `sys_tasks_log` VALUES (302, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 16:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (303, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 17:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (304, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 17:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (305, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 17:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (306, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 17:30:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (307, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 17:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (308, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 17:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (309, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-29 18:00:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (310, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 10:10:00', 'ZR.Tasks.Job_SyncTest', 2);
INSERT INTO `sys_tasks_log` VALUES (311, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 10:20:00', 'ZR.Tasks.Job_SyncTest', 4);
INSERT INTO `sys_tasks_log` VALUES (312, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 10:30:00', 'ZR.Tasks.Job_SyncTest', 10);
INSERT INTO `sys_tasks_log` VALUES (313, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 10:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (314, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 10:50:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (315, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 11:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (316, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 11:10:00', 'ZR.Tasks.Job_SyncTest', 13);
INSERT INTO `sys_tasks_log` VALUES (317, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 11:20:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (318, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 11:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (319, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 11:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (320, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 11:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (321, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 12:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (322, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 12:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (323, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 12:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (324, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 12:30:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (325, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 12:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (326, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 12:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (327, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 13:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (328, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 13:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (329, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 13:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (330, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 13:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (331, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 13:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (332, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 13:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (333, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 14:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (334, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 14:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (335, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 14:20:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (336, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 14:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (337, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 14:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (338, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 14:50:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (339, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 15:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (340, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 15:20:00', 'ZR.Tasks.Job_SyncTest', 20);
INSERT INTO `sys_tasks_log` VALUES (341, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 15:40:00', 'ZR.Tasks.Job_SyncTest', 17);
INSERT INTO `sys_tasks_log` VALUES (342, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 15:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (343, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 16:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (344, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 16:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (345, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 16:20:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (346, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 16:30:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (347, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 16:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (348, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 16:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (349, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 17:00:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (350, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 17:10:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (351, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 17:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (352, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-30 17:40:00', 'ZR.Tasks.Job_SyncTest', 13);
INSERT INTO `sys_tasks_log` VALUES (353, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 09:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (354, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 09:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (355, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 09:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (356, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 09:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (357, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 10:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (358, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 10:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (359, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 10:20:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (360, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 10:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (361, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 10:50:00', 'ZR.Tasks.Job_SyncTest', 18);
INSERT INTO `sys_tasks_log` VALUES (362, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 11:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (363, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 11:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (364, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 11:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (365, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 11:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (366, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 11:40:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (367, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 11:50:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (368, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 12:00:00', 'ZR.Tasks.Job_SyncTest', 31);
INSERT INTO `sys_tasks_log` VALUES (369, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 13:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (370, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 13:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (371, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 13:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (372, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 13:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (373, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 13:40:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (374, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 13:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (375, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 14:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (376, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 14:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (377, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 14:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (378, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 14:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (379, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 14:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (380, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 14:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (381, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 15:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (382, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 15:10:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (383, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 15:20:00', 'ZR.Tasks.Job_SyncTest', 25);
INSERT INTO `sys_tasks_log` VALUES (384, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 15:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (385, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 15:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (386, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 15:50:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (387, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 16:00:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (388, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 16:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (389, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 16:20:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (390, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 16:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (391, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 16:50:00', 'ZR.Tasks.Job_SyncTest', 9);
INSERT INTO `sys_tasks_log` VALUES (392, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 17:00:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (393, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 17:10:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (394, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 17:20:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (395, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 17:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (396, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 17:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (397, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 17:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (398, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-03-31 18:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (399, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-01 09:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (400, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-01 09:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (401, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-01 09:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (402, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-02 10:50:00', 'ZR.Tasks.Job_SyncTest', 11);
INSERT INTO `sys_tasks_log` VALUES (403, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-02 11:00:00', 'ZR.Tasks.Job_SyncTest', 6);
INSERT INTO `sys_tasks_log` VALUES (404, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-02 11:10:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (405, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-02 11:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (406, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-02 11:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (407, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-02 11:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (408, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-02 11:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (409, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-02 12:00:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (410, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-06 13:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (411, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-06 13:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (412, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-11 11:00:00', 'ZR.Tasks.Job_SyncTest', 12);
INSERT INTO `sys_tasks_log` VALUES (413, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-11 11:10:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (414, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-11 11:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (415, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-11 11:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (416, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-11 11:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (417, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-11 11:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (418, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-11 12:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (419, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-11 12:10:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (420, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-11 12:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (421, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-11 12:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (422, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-11 12:40:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (423, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-11 12:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (424, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-11 13:00:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (425, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-11 13:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (426, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-11 13:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (427, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-12 11:10:00', 'ZR.Tasks.Job_SyncTest', 6);
INSERT INTO `sys_tasks_log` VALUES (428, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-12 11:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (429, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-12 11:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (430, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-12 11:40:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (431, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-13 10:50:00', 'ZR.Tasks.Job_SyncTest', 22);
INSERT INTO `sys_tasks_log` VALUES (432, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-13 11:00:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (433, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-13 11:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (434, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-13 14:40:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (435, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-13 16:20:00', 'ZR.Tasks.Job_SyncTest', 9);
INSERT INTO `sys_tasks_log` VALUES (436, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-13 17:20:00', 'ZR.Tasks.Job_SyncTest', 7);
INSERT INTO `sys_tasks_log` VALUES (437, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-13 17:30:00', 'ZR.Tasks.Job_SyncTest', 29);
INSERT INTO `sys_tasks_log` VALUES (438, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-13 17:40:00', 'ZR.Tasks.Job_SyncTest', 10);
INSERT INTO `sys_tasks_log` VALUES (439, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-13 17:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (440, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-13 18:00:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (441, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-13 21:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (442, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-13 21:20:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (443, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-13 21:50:00', 'ZR.Tasks.Job_SyncTest', 16);
INSERT INTO `sys_tasks_log` VALUES (444, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-14 09:20:00', 'ZR.Tasks.Job_SyncTest', 6);
INSERT INTO `sys_tasks_log` VALUES (445, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-14 09:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (446, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-14 09:40:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (447, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-14 09:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (448, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-14 10:00:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (449, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-14 10:10:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (450, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-14 10:20:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (451, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-14 10:30:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (452, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-14 10:40:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (453, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-14 10:50:00', 'ZR.Tasks.Job_SyncTest', 15);
INSERT INTO `sys_tasks_log` VALUES (454, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-22 16:10:00', 'ZR.Tasks.Job_SyncTest', 18);
INSERT INTO `sys_tasks_log` VALUES (455, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-22 16:20:00', 'ZR.Tasks.Job_SyncTest', 10);
INSERT INTO `sys_tasks_log` VALUES (456, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-22 16:30:00', 'ZR.Tasks.Job_SyncTest', 14);
INSERT INTO `sys_tasks_log` VALUES (457, '1410905433996136448', '测试任务', 'SYSTEM', 'Succeed', '0', '', '2022-04-22 16:40:00', 'ZR.Tasks.Job_SyncTest', 15);

-- ----------------------------
-- Table structure for sys_tasksqz
-- ----------------------------
DROP TABLE IF EXISTS `sys_tasksqz`;
CREATE TABLE `sys_tasksqz`  (
  `ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'UID',
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `JobGroup` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务分组',
  `Cron` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运行时间表达式',
  `AssemblyName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '程序集名称',
  `ClassName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务所在类',
  `Remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '任务描述',
  `RunTimes` int(11) NOT NULL COMMENT '执行次数',
  `BeginTime` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `EndTime` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `TriggerType` int(11) NOT NULL COMMENT '触发器类型（0、simple 1、cron）',
  `IntervalSecond` int(11) NOT NULL COMMENT '执行间隔时间(单位:秒)',
  `IsStart` tinyint(4) NOT NULL COMMENT '是否启动',
  `JobParams` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '传入参数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人编码',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人编码',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划任务' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_tasksqz
-- ----------------------------
INSERT INTO `sys_tasksqz` VALUES ('1410905433996136448', '测试任务', 'SYSTEM', '0 0/10 * * * ? ', 'ZR.Tasks', 'Job_SyncTest', NULL, 260, '2021-07-02 18:17:31', '9999-12-31 00:00:00', 1, 1, 1, NULL, '2021-07-02 18:17:23', '2021-07-02 18:17:31', 'admin', NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `deptId` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nickName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `userType` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `delFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `loginIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `loginDate` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 0, 'admin', '管理员', '0', '', '', '0', 'http://localhost:8888/uploads/2022330//F7F4E052737F6AA6.png', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '127.0.0.1', '2022-04-22 16:11:44', 'admin', '2020-11-26 11:52:59', 'admin', '2022-03-30 17:11:47', '管理员');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);

-- ----------------------------
-- Table structure for t_article_tags
-- ----------------------------
DROP TABLE IF EXISTS `t_article_tags`;
CREATE TABLE `t_article_tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_blogconfig
-- ----------------------------
DROP TABLE IF EXISTS `t_blogconfig`;
CREATE TABLE `t_blogconfig`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客标题',
  `Copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版权所有',
  `AuthorQQ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者qq',
  `AuthorWechart` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者微信',
  `AuthorEmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者邮箱',
  `IsOpenLogin` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '\0' COMMENT '是否开放登录',
  `IsOpenRegister` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '\0' COMMENT '是否开放注册',
  `Content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客简介',
  `BottomImage` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最下方图片链接',
  `BlogBackGroundImage` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客背景图',
  `FundedAlipayImg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝赞助图片',
  `FundedWechartImg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信赞助图片',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_blogconfig
-- ----------------------------
INSERT INTO `t_blogconfig` VALUES (1, 'ceshi', '<p><a href=\"https://beian.miit.gov.cn\" target=\"_blank\">冀ICP备19003479号-2</a></p>\n<i>Copright©2022 sageinqi Designed by taiyonoyoni</i>', NULL, NULL, 'sageinqi@qq.com', '1', '1', '这是一个测试', NULL, 'http://localhost:8888/uploads/2022325//331bafb38158ba1e.jpg', '', '');

-- ----------------------------
-- Table structure for t_blogessays
-- ----------------------------
DROP TABLE IF EXISTS `t_blogessays`;
CREATE TABLE `t_blogessays`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `Color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '边框色彩',
  `Content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `createTime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `authorName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者名',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_blogessays
-- ----------------------------
INSERT INTO `t_blogessays` VALUES (1, '测试', '#B8DE38', '水水水水', '2022-03-25 17:46:37.000000', '水水水');

-- ----------------------------
-- Table structure for t_bloglinks
-- ----------------------------
DROP TABLE IF EXISTS `t_bloglinks`;
CREATE TABLE `t_bloglinks`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `Links` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转链接',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客友情链接' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_bloglinks
-- ----------------------------
INSERT INTO `t_bloglinks` VALUES (1, 'ZrAdmin.NET', 'http://www.izhaorui.cn/doc/#/');

-- ----------------------------
-- Table structure for t_blogpersonalinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_blogpersonalinfo`;
CREATE TABLE `t_blogpersonalinfo`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `Sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `Age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `Degree` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `Height` int(11) NULL DEFAULT NULL COMMENT '身高cm',
  `Weight` double NULL DEFAULT NULL COMMENT '体重kg',
  `Birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `School` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学校',
  `Specialized` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `Blood` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '血型',
  `GiteeUrl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '码云地址',
  `GitHubUrl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Github地址',
  `CSDNUrl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CSDN博客地址',
  `Email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `Avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客个人信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_blogpersonalinfo
-- ----------------------------
INSERT INTO `t_blogpersonalinfo` VALUES (1, 'ztc', '0', 25, '专升本', 174, 72.7, '2022-03-01', '河北科技', '计算机科学与技术', 'B', NULL, NULL, NULL, NULL, 'http://localhost:8888/uploads/2022330//b397d8fca2f31968.webp');

-- ----------------------------
-- Table structure for t_blogproject
-- ----------------------------
DROP TABLE IF EXISTS `t_blogproject`;
CREATE TABLE `t_blogproject`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '项目描述',
  `Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `TypeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目类型',
  `Pic_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目图片',
  `Techs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '技术栈',
  `Url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目地址',
  `createTime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客项目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_blogproject
-- ----------------------------
INSERT INTO `t_blogproject` VALUES (1, '一个简单的个人博客项目，分为前台展示和后台管理系统，前台展示部分实现了博客的浏览，查找，分类，标签，评论，留言等功能，后台管理系统实现了博客发表，博客管理，用户管理等功能。', '个人博客', '2', 'http://localhost:8888/uploads/2022329//bb58142076163f6d.jpg', 'netcore、vue', 'http://localhost:8887/blog/tblogproject', NULL);
INSERT INTO `t_blogproject` VALUES (2, '这是一个小练习', '小练习', '3', 'http://localhost:8888/uploads/2022331//0f063239ec1ae815.jpg', NULL, NULL, NULL);
INSERT INTO `t_blogproject` VALUES (3, '我的爱好很多这只是其中一个', '骑车子', '1', 'http://localhost:8888/uploads/2022331//6c5ed93b615100e2.jpg', NULL, NULL, NULL);
INSERT INTO `t_blogproject` VALUES (4, '这是我的一个作品', '作品1', '4', 'http://localhost:8888/uploads/2022331//cdde9ee9745429bf.jpg', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_blogskill
-- ----------------------------
DROP TABLE IF EXISTS `t_blogskill`;
CREATE TABLE `t_blogskill`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '技能名称',
  `PicIcon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '技能icon',
  `Des` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节能描述',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客个人技能' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_blogskill
-- ----------------------------
INSERT INTO `t_blogskill` VALUES (1, 'js', 'iconfont icon-html', '水水水水水');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
