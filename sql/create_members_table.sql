/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80043
 Source Host           : localhost:3306
 Source Schema         : hs-zhgh

 Target Server Type    : MySQL
 Target Server Version : 80043
 File Encoding         : 65001

 Date: 10/09/2025 10:04:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_members
-- ----------------------------
DROP TABLE IF EXISTS `sys_members`;
CREATE TABLE `sys_members`  (
                                `members_id` bigint NOT NULL AUTO_INCREMENT COMMENT '会员主键id',
                                `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
                                `members_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员姓名',
                                `members_num` bigint NULL DEFAULT NULL COMMENT '会员工号',
                                `members_sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '会员性别 0男 1女 2未知',
                                `members_bir` date NULL DEFAULT NULL COMMENT '会员出生日期',
                                `members_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员学历',
                                `members_nation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员民族',
                                `members_political` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员政治面貌',
                                `members_school_date` date NULL DEFAULT NULL COMMENT '会员来校时间',
                                `members_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员联系电话',
                                `dept_id` bigint NULL DEFAULT NULL COMMENT '会员所在单位id（基层工会下级）',
                                `society_id` bigint NULL DEFAULT NULL COMMENT '会员所在协会id',
                                `members_marital_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '婚姻状况 0未婚 1已婚 2离异(无小孩) 3离异(带小孩) 4离异(不带小孩) 5丧偶(无小孩) 6丧偶(有小孩)',
                                `members_spouse_campus_staff` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '配偶是否为校内职工 0否 1是',
                                `members_native_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '籍贯',
                                `members_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '家庭住址',
                                `school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所在校区',
                                `members_mode_employment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用人方式 0在编人员 1校聘人员  2自聘人员  3其他人员  4博士后',
                                `members_resume` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人工作简历',
                                `members_main_family` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '家庭主要成员/单位',
                                `members_hobby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '特长/爱好',
                                `members_remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员备注',
                                `members_img` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人照片',
                                `members_sign` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手签',
                                `members_contact_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证号码',
                                `members_admission_time` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '人员状态 0在职 1 离职  2退休',
                                `members_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '会员状态 0正常 1退会 2转会',
                                `members_age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '年龄',
                                `members_is_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否是会员 0是 1不是',
                                `members_nationality` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '国籍 0中国 1外国',
                                `members_identity_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '身份类别 0身份证  1护照 2士官证 3港澳通行证 4台湾居民来往大陆通行证',
                                `members_identity_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份类型对应的身份号码',
                                `members_technical` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '技术等级 0初级 1中级 2高级',
                                `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                `members_professional` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '专业技术职称 0正高级 1副高级 2中级 3初级 4其他',
                                `members_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
                                `members_administrative` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '行政职务\r\n0部长\r\n1常务副院长\r\n2常务副主任\r\n3处长\r\n4党委常委\r\n5党委副书记\r\n6党委委员\r\n7党支部书记\r\n8党总支副书记\r\n9党总支书记\r\n10分工会主席\r\n11妇委会主任\r\n12副处长\r\n13副教授\r\n14副科长\r\n15副书记\r\n16副校长\r\n17副院长\r\n18副主任\r\n19副主任医师\r\n20副主席\r\n21工会主席\r\n22工人\r\n23馆长\r\n24护师\r\n25纪委书记\r\n26讲师\r\n27教师\r\n28教授\r\n29教学秘书\r\n30教研室副主任\r\n31教研室支部书记\r\n32教研室主任\r\n33科长\r\n34书记\r\n35所长\r\n36团委书记\r\n37系主任\r\n38校长\r\n39研究室主任\r\n40园长\r\n41院办主任\r\n42院长\r\n43院长助理\r\n44支部书记\r\n45中心主任\r\n46主管护师\r\n47主管技师\r\n48主任\r\n49主任科员\r\n50主任医师\r\n51主席\r\n52总支书记',
                                `members_spouse_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '配偶姓名',
                                `members_household_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '户籍类型 0城镇户口  1农业户口',
                                `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
                                `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
                                `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
                                `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标识 0未删除 2已删除',
                                `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
                                PRIMARY KEY (`members_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 360 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员表' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;