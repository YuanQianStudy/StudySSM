/*
 Navicat MySQL Data Transfer

 Source Server         : book
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : ssmbuild

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 05/12/2021 12:31:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`
(
    `bookID`     int                                                     NOT NULL AUTO_INCREMENT,
    `bookName`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书名',
    `bookCounts` int                                                     NOT NULL COMMENT '数量',
    `detail`     varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
    PRIMARY KEY (`bookID`) USING BTREE,
    INDEX `bookID` (`bookID`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 50
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books`
VALUES (1, '如何变强', 20, '教你如何变强');
INSERT INTO `books`
VALUES (2, '如果变弱', 30, '教你如何变弱');
INSERT INTO `books`
VALUES (3, 'java从入门到放弃', 20, 'java学习教程');
INSERT INTO `books`
VALUES (4, '计算机网络教程', 999, '计算机网络教程');
INSERT INTO `books`
VALUES (5, '大数据可视化技术', 999, '大数据可视化技术');
INSERT INTO `books`
VALUES (6, '高等数学', 123, '高等数学');
INSERT INTO `books`
VALUES (7, '亲热天堂', 1, '亲热天堂');
INSERT INTO `books`
VALUES (8, '算法设计与分析', 789, '算法设计与分析');
INSERT INTO `books`
VALUES (9, '时间简史', 777, '时间简史');
INSERT INTO `books`
VALUES (10, '离散数学', 123, '离散数学');
INSERT INTO `books`
VALUES (11, '线性代数', 123, '线性代数');
INSERT INTO `books`
VALUES (12, '概率论', 123, '概率论');
INSERT INTO `books`
VALUES (13, '云计算技术', 123, '云计算技术');
INSERT INTO `books`
VALUES (14, '数据结构', 123, '数据结构');
INSERT INTO `books`
VALUES (15, 'java编程思想', 123, 'java编程思想');
INSERT INTO `books`
VALUES (16, '深入理解Java虚拟机', 123, '深入理解Java虚拟机');
INSERT INTO `books`
VALUES (17, 'Java性能权威指南', 123, 'Java性能权威指南');
INSERT INTO `books`
VALUES (18, 'Spring揭秘', 555, 'Spring揭秘');
INSERT INTO `books`
VALUES (19, 'Java核心技术卷1', 666, 'Java核心技术卷1');
INSERT INTO `books`
VALUES (20, 'Java核心技术卷2', 777, 'Java核心技术卷2');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`
(
    `userName` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    UNIQUE INDEX `users_password_uindex` (`password`) USING BTREE,
    UNIQUE INDEX `users_username_uindex` (`userName`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users`
VALUES ('admin', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
