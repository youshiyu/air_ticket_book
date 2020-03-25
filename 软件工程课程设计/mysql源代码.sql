/*
 Navicat Premium Data Transfer

 Source Server         : t1
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : fly_ticket

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 03/01/2020 09:45:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员用户名',
  `pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`user`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('admin', 'root');

-- ----------------------------
-- Table structure for flight
-- ----------------------------
DROP TABLE IF EXISTS `flight`;
CREATE TABLE `flight`  (
  `f_n` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航班号',
  `f_s_p` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航班起点',
  `f_a_p` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航班终点',
  `f_s_a` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航班起飞机场',
  `f_a_a` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航班到达机场',
  `f_s_t` time(6) NOT NULL COMMENT '起飞时间',
  `f_a_t` time(6) NOT NULL COMMENT '到达时间',
  `f_p` double(50, 0) NOT NULL COMMENT '票价',
  PRIMARY KEY (`f_n`) USING BTREE,
  UNIQUE INDEX `f_n`(`f_n`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '航班信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flight
-- ----------------------------
INSERT INTO `flight` VALUES ('CA3060', '北京', '上海', '首都机场', '虹桥机场', '08:30:00.000000', '12:30:00.000000', 889);
INSERT INTO `flight` VALUES ('CA4312', '深圳', '成都', '宝安机场', '双流机场', '19:20:00.000000', '22:15:00.000000', 600);
INSERT INTO `flight` VALUES ('CZ3585', '上海', '广州', '浦东机场', '白云机场', '21:20:00.000000', '00:15:00.000000', 470);
INSERT INTO `flight` VALUES ('GJ8821', '杭州', '长沙', '萧山机场', '黄花机场', '20:15:00.000000', '23:50:00.000000', 328);
INSERT INTO `flight` VALUES ('MF8289', '杭州', '西安', '萧山机场', '咸阳机场', '06:55:00.000000', '09:20:00.000000', 387);

-- ----------------------------
-- Table structure for p_inf
-- ----------------------------
DROP TABLE IF EXISTS `p_inf`;
CREATE TABLE `p_inf`  (
  `p_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `p_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `p_tel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `p_sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `p_work` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `p_pwd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号密码',
  PRIMARY KEY (`p_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_inf
-- ----------------------------
INSERT INTO `p_inf` VALUES ('340223199901200033', '陈函', '13967143603', '女', '浙江工业大学', '000000');
INSERT INTO `p_inf` VALUES ('350221198825332562', '年糕', '12551564235', '男', '中国石化', 'ng');
INSERT INTO `p_inf` VALUES ('611502199905130066', '游诗雨', '17816110557', '女', '浙江工业大学', '123456');

-- ----------------------------
-- Table structure for ptp
-- ----------------------------
DROP TABLE IF EXISTS `ptp`;
CREATE TABLE `ptp`  (
  `p_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '关联者身份证号',
  `p_id2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '被关联者身份证号',
  PRIMARY KEY (`p_id`, `p_id2`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ptp
-- ----------------------------
INSERT INTO `ptp` VALUES ('340223199901200033', '340223199901200033');
INSERT INTO `ptp` VALUES ('340223199901200033', '350221198825332562');
INSERT INTO `ptp` VALUES ('340223199901200033', '611502199905130066');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `t_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ticket_id 机票编号',
  `f_n` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'flight_num 航班号',
  `t_d` date NULL DEFAULT NULL COMMENT 'ticket_day 机票日期',
  `t_s` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ticket_seat 座位号',
  `t_b` tinyint(1) NULL DEFAULT NULL COMMENT 'ticket_buy 0代表已被购买，1代表没有被购买',
  `p_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'passenger_id 持票人身份证号',
  `p_id2` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'passenger_id2 订票人身份证号',
  `t_pay` tinyint(1) NULL DEFAULT NULL COMMENT 'ticket_pay 0代表未付款，1代表已付款',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `f_n`(`f_n`) USING BTREE,
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`f_n`) REFERENCES `flight` (`f_n`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES ('10001323990', 'GJ8821', '2019-12-01', 'F1', 1, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES ('10001323991', 'GJ8821', '2019-12-01', 'F2', 0, '340223199901200033', '340223199901200033', 1);
INSERT INTO `ticket` VALUES ('10001323992', 'GJ8821', '2019-12-01', 'F3', 0, '611502199905130066', '340223199901200033', 0);
INSERT INTO `ticket` VALUES ('10001323993', 'CA3060', '2019-12-01', 'A1', 1, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES ('10001323994', 'CA3060', '2019-12-01', 'A2', 1, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES ('10001323995', 'CA3060', '2019-12-01', 'A3', 1, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES ('10001323996', 'CZ3585', '2019-12-01', 'E1', 0, '340223199901200033', '340223199901200033', 0);
INSERT INTO `ticket` VALUES ('10001323997', 'CZ3585', '2019-12-01', 'E2', 0, '611502199905130066', '340223199901200033', 0);
INSERT INTO `ticket` VALUES ('10001323998', 'CZ3585', '2019-12-01', 'E3', 1, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES ('10001323999', 'MF8289', '2019-12-01', 'A1', 1, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES ('10001324000', 'MF8289', '2019-12-01', 'A2', 1, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES ('10001324001', 'MF8289', '2019-12-01', 'A3', 1, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES ('10001324010', 'CA3060', '2019-12-02', 'B1', 1, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES ('10001423001', 'CA4312', '2019-12-01', 'A1', 1, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES ('10001423002', 'CA4312', '2019-12-01', 'A3', 1, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES ('10001423003', 'CA4312', '2019-12-01', 'A2', 1, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES ('10001423004', 'CA4312', '2019-12-01', 'B1', 1, NULL, NULL, NULL);
INSERT INTO `ticket` VALUES ('10001423005', 'CA4312', '2019-12-01', 'B2', 1, NULL, NULL, NULL);

-- ----------------------------
-- View structure for ticket_view
-- ----------------------------
DROP VIEW IF EXISTS `ticket_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `ticket_view` AS select `ticket`.`t_id` AS `t_id`,`ticket`.`f_n` AS `f_n`,`ticket`.`t_d` AS `t_d`,`ticket`.`p_id` AS `p_id`,`ticket`.`p_id2` AS `p_id2`,`ticket`.`t_s` AS `t_s`,`flight`.`f_s_p` AS `f_s_p`,`flight`.`f_a_p` AS `f_a_p`,`flight`.`f_s_a` AS `f_s_a`,`flight`.`f_a_a` AS `f_a_a`,`flight`.`f_s_t` AS `f_s_t`,`flight`.`f_a_t` AS `f_a_t`,`flight`.`f_p` AS `f_p`,`p_inf`.`p_name` AS `p_name`,`p_inf`.`p_tel` AS `p_tel`,`p_inf`.`p_sex` AS `p_sex`,`p_inf`.`p_work` AS `p_work`,`ticket`.`t_pay` AS `t_pay` from ((`ticket` join `flight` on((`ticket`.`f_n` = `flight`.`f_n`))) join `p_inf` on((`ticket`.`p_id` = `p_inf`.`p_id`))) where ((`ticket`.`p_id` is not null) and (`ticket`.`p_id2` is not null));

SET FOREIGN_KEY_CHECKS = 1;
