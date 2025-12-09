/*
 Navicat Premium Dump SQL

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 80013 (8.0.13)
 Source Host           : localhost:3306
 Source Schema         : mall

 Target Server Type    : MySQL
 Target Server Version : 80013 (8.0.13)
 File Encoding         : 65001

 Date: 08/12/2025 18:38:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_help
-- ----------------------------
DROP TABLE IF EXISTS `cms_help`;
CREATE TABLE `cms_help`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `read_count` int(1) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帮助表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_help
-- ----------------------------

-- ----------------------------
-- Table structure for cms_help_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_help_category`;
CREATE TABLE `cms_help_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `help_count` int(11) NULL DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帮助分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_help_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_member_report
-- ----------------------------
DROP TABLE IF EXISTS `cms_member_report`;
CREATE TABLE `cms_member_report`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `report_type` int(1) NULL DEFAULT NULL COMMENT '举报类型：0->商品评价；1->话题内容；2->用户评论',
  `report_member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '举报人',
  `create_time` datetime NULL DEFAULT NULL,
  `report_object` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `report_status` int(1) NULL DEFAULT NULL COMMENT '举报状态：0->未处理；1->已处理',
  `handle_status` int(1) NULL DEFAULT NULL COMMENT '处理结果：0->无效；1->有效；2->恶意',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户举报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_member_report
-- ----------------------------

-- ----------------------------
-- Table structure for cms_prefrence_area
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area`;
CREATE TABLE `cms_prefrence_area`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varbinary(500) NULL DEFAULT NULL COMMENT '展示图片',
  `sort` int(11) NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优选专区' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_prefrence_area
-- ----------------------------
INSERT INTO `cms_prefrence_area` VALUES (1, '让音质更出众', '音质不打折 完美现场感', NULL, NULL, 1);
INSERT INTO `cms_prefrence_area` VALUES (2, '让音质更出众22', '让音质更出众22', NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (3, '让音质更出众33', NULL, NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (4, '让音质更出众44', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_prefrence_area_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area_product_relation`;
CREATE TABLE `cms_prefrence_area_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint(20) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优选专区和产品关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_prefrence_area_product_relation
-- ----------------------------
INSERT INTO `cms_prefrence_area_product_relation` VALUES (1, 1, 12);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (2, 1, 13);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (3, 1, 14);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (4, 1, 18);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (5, 1, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (6, 2, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (7, 1, 22);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (24, 1, 23);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (25, 2, 47);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (26, 1, 49);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (27, 2, 49);

-- ----------------------------
-- Table structure for cms_subject
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject`;
CREATE TABLE `cms_subject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题主图',
  `product_count` int(11) NULL DEFAULT NULL COMMENT '关联产品数量',
  `recommend_status` int(1) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `collect_count` int(11) NULL DEFAULT NULL,
  `read_count` int(11) NULL DEFAULT NULL,
  `comment_count` int(11) NULL DEFAULT NULL,
  `album_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '画册图片用逗号分割',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `forward_count` int(11) NULL DEFAULT NULL COMMENT '转发数',
  `category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_subject
-- ----------------------------
INSERT INTO `cms_subject` VALUES (1, 1, 'polo衬衫的也时尚', NULL, NULL, NULL, '2018-11-11 13:26:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '服装专题');
INSERT INTO `cms_subject` VALUES (2, 2, '大牌手机低价秒', NULL, NULL, NULL, '2018-11-12 13:27:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '手机专题');
INSERT INTO `cms_subject` VALUES (3, 2, '晓龙845新品上市', NULL, NULL, NULL, '2018-11-13 13:27:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '手机专题');
INSERT INTO `cms_subject` VALUES (4, 1, '夏天应该穿什么', NULL, NULL, NULL, '2018-11-01 13:27:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '服装专题');
INSERT INTO `cms_subject` VALUES (5, 1, '夏季精选', NULL, NULL, NULL, '2018-11-06 13:27:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '服装专题');
INSERT INTO `cms_subject` VALUES (6, 2, '品牌手机降价', NULL, NULL, NULL, '2018-11-07 13:27:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '手机专题');

-- ----------------------------
-- Table structure for cms_subject_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_category`;
CREATE TABLE `cms_subject_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) NULL DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_subject_category
-- ----------------------------
INSERT INTO `cms_subject_category` VALUES (1, '服装专题', NULL, NULL, NULL, NULL);
INSERT INTO `cms_subject_category` VALUES (2, '手机专题', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_subject_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_comment`;
CREATE TABLE `cms_subject_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_subject_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_subject_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_product_relation`;
CREATE TABLE `cms_subject_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题商品关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_subject_product_relation
-- ----------------------------
INSERT INTO `cms_subject_product_relation` VALUES (1, 1, 12);
INSERT INTO `cms_subject_product_relation` VALUES (2, 1, 13);
INSERT INTO `cms_subject_product_relation` VALUES (3, 1, 14);
INSERT INTO `cms_subject_product_relation` VALUES (4, 1, 18);
INSERT INTO `cms_subject_product_relation` VALUES (5, 1, 7);
INSERT INTO `cms_subject_product_relation` VALUES (6, 2, 7);
INSERT INTO `cms_subject_product_relation` VALUES (7, 1, 22);
INSERT INTO `cms_subject_product_relation` VALUES (29, 1, 23);
INSERT INTO `cms_subject_product_relation` VALUES (30, 4, 23);
INSERT INTO `cms_subject_product_relation` VALUES (31, 5, 23);
INSERT INTO `cms_subject_product_relation` VALUES (78, 1, 47);
INSERT INTO `cms_subject_product_relation` VALUES (79, 2, 47);
INSERT INTO `cms_subject_product_relation` VALUES (80, 1, 49);
INSERT INTO `cms_subject_product_relation` VALUES (81, 2, 49);
INSERT INTO `cms_subject_product_relation` VALUES (82, 3, 49);
INSERT INTO `cms_subject_product_relation` VALUES (83, 4, 49);
INSERT INTO `cms_subject_product_relation` VALUES (84, 2, 26);
INSERT INTO `cms_subject_product_relation` VALUES (85, 3, 26);
INSERT INTO `cms_subject_product_relation` VALUES (86, 6, 26);
INSERT INTO `cms_subject_product_relation` VALUES (87, 1, 26);

-- ----------------------------
-- Table structure for cms_topic
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic`;
CREATE TABLE `cms_topic`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `attend_count` int(11) NULL DEFAULT NULL COMMENT '参与人数',
  `attention_count` int(11) NULL DEFAULT NULL COMMENT '关注人数',
  `read_count` int(11) NULL DEFAULT NULL,
  `award_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖品名称',
  `attend_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参与方式',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '话题内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_topic
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_category`;
CREATE TABLE `cms_topic_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) NULL DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话题分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_topic_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_comment`;
CREATE TABLE `cms_topic_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `topic_id` bigint(20) NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_topic_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_ugc_post
-- ----------------------------
DROP TABLE IF EXISTS `cms_ugc_post`;
CREATE TABLE `cms_ugc_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) NOT NULL COMMENT '会员ID',
  `member_nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `member_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员头像',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '正文',
  `cover_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面图',
  `media_urls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '媒体URL(JSON数组)',
  `media_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'IMAGE' COMMENT '媒体类型：IMAGE/VIDEO/MIX',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态：0草稿 1发布',
  `top_status` tinyint(4) NULL DEFAULT 0 COMMENT '是否置顶：0否 1是',
  `like_count` int(11) NULL DEFAULT 0 COMMENT '点赞数',
  `view_count` int(11) NULL DEFAULT 0 COMMENT '浏览数',
  `comment_count` int(11) NULL DEFAULT 0 COMMENT '评论数（预留）',
  `publish_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `delete_status` tinyint(4) NULL DEFAULT 0 COMMENT '删除标记：0正常 1删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member`(`member_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC, `delete_status` ASC) USING BTREE,
  INDEX `idx_top`(`top_status` ASC, `publish_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'UGC帖子' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_ugc_post
-- ----------------------------

-- ----------------------------
-- Table structure for cms_ugc_post_like
-- ----------------------------
DROP TABLE IF EXISTS `cms_ugc_post_like`;
CREATE TABLE `cms_ugc_post_like`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `post_id` bigint(20) NOT NULL COMMENT '帖子ID',
  `member_id` bigint(20) NOT NULL COMMENT '会员ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_post_member`(`post_id` ASC, `member_id` ASC) USING BTREE,
  INDEX `idx_member`(`member_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'UGC帖子点赞' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_ugc_post_like
-- ----------------------------

-- ----------------------------
-- Table structure for oms_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_sku_id` bigint(20) NULL DEFAULT NULL,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '添加到购物车的价格',
  `product_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品主图',
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_sub_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品副标题（卖点）',
  `product_sku_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `member_nickname` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `delete_status` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `product_category_id` bigint(20) NULL DEFAULT NULL COMMENT '商品分类',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 168 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_cart_item
-- ----------------------------
INSERT INTO `oms_cart_item` VALUES (12, 26, 90, 1, 1, 3788.00, NULL, '华为 HUAWEI P20', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2018-08-27 16:53:44', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (13, 27, 98, 1, 3, 2699.00, NULL, '小米8', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2018-08-27 17:11:53', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (14, 28, 102, 1, 1, 649.00, NULL, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-27 17:18:02', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (15, 28, 103, 1, 1, 699.00, NULL, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-28 10:22:45', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (16, 29, 106, 1, 1, 5499.00, NULL, 'Apple iPhone 8 Plus', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2018-08-28 10:50:50', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (19, 36, 163, 1, 3, 100.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036001', 'windir', '2020-02-25 15:51:59', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `oms_cart_item` VALUES (20, 36, 164, 1, 2, 120.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036001', 'windir', '2020-02-25 15:54:23', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_cart_item` VALUES (21, 36, 164, 1, 2, 120.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036001', 'windir', '2020-02-25 16:49:53', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_cart_item` VALUES (22, 26, 110, 1, 3, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-04 15:34:24', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (23, 27, 98, 1, 7, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-04 15:35:43', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (24, 26, 110, 1, 4, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-04 16:58:17', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (25, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-04 16:58:23', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (26, 28, 102, 1, 4, 649.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2020-05-04 16:58:26', NULL, 1, 19, '小米', '7437789', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (27, 29, 106, 1, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2020-05-04 16:58:29', NULL, 1, 19, '苹果', '7437799', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (28, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-04 17:07:20', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (29, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-04 17:07:23', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (30, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-04 17:08:14', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (31, 29, 106, 1, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2020-05-04 17:09:56', NULL, 1, 19, '苹果', '7437799', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (32, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-04 17:13:50', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (33, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-04 17:16:15', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (34, 36, 164, 1, 1, 120.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036002', 'windir', '2020-05-04 17:19:20', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_cart_item` VALUES (35, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-05 10:41:39', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (36, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-05 10:41:55', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (37, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-05 10:42:57', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (38, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-05 14:29:28', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (39, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-05 14:32:52', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (40, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-05 14:33:20', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (41, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-05 14:49:13', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (42, 26, 111, 1, 1, 3999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026002', 'windir', '2020-05-05 15:26:05', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (43, 28, 102, 1, 1, 649.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2020-05-16 15:16:04', NULL, 1, 19, '小米', '7437789', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (44, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-16 15:18:00', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (45, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 15:00:16', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (46, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-17 15:00:22', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (47, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 15:14:14', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (48, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 15:20:03', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (49, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 15:21:54', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (50, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 16:07:22', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (51, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-17 16:07:26', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (52, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 19:33:36', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (53, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-17 19:33:39', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (54, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 19:39:07', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (55, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 19:41:26', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (56, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-18 16:50:00', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (57, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-18 20:22:04', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (58, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-18 20:22:08', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (59, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-23 16:21:13', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (60, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-23 17:01:28', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (61, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-24 09:36:50', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (62, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-24 09:44:39', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (63, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-06-07 17:01:48', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (64, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-06-14 15:24:40', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (65, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-06-21 14:27:13', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (66, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-06-21 15:12:14', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (67, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-06-21 15:12:53', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (68, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-06-21 15:15:10', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (69, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-06-27 10:27:48', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (70, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2022-10-28 14:50:46', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (71, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 紫色 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'windir', '2022-10-28 15:27:32', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (72, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'windir', '2022-11-09 15:14:46', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (73, 38, 213, 1, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'windir', '2022-11-09 15:25:28', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (74, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'windir', '2022-11-09 15:26:04', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (75, 45, 239, 1, 1, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄 3200万前置索尼镜头 5G手机', '【11.11提前购机享价保，好货不用等，系统申请一键价保补差!】【Reno8Pro爆款优惠】 ', '202211080045001', 'windir', '2022-11-09 16:16:23', NULL, 1, 19, 'OPPO', '10052147850350', '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (76, 45, 239, 1, 1, 2299.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄 3200万前置索尼镜头 5G手机', '【11.11提前购机享价保，好货不用等，系统申请一键价保补差!】【Reno8Pro爆款优惠】 ', '202211080045001', 'windir', '2022-11-09 16:18:36', NULL, 1, 19, 'OPPO', '10052147850350', '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (77, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量 墨羽 12GB+256GB 5G智能手机 小米 红米', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'windir', '2022-11-10 15:19:36', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (78, 37, 201, 1, 2, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'windir', '2022-11-10 15:19:44', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (79, 38, 213, 1, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'windir', '2022-11-11 15:37:40', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (80, 38, 213, 1, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'windir', '2022-11-11 15:38:12', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (81, 38, 213, 1, 3, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'windir', '2022-11-11 15:38:22', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (82, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'windir', '2022-11-11 16:07:23', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (83, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'windir', '2022-11-11 16:13:11', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (84, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'windir', '2022-11-11 16:15:05', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (85, 28, 102, 1, 1, 649.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2022-11-11 16:21:05', NULL, 1, 19, '小米', '7437789', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (86, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'windir', '2022-11-16 10:22:47', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (87, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'windir', '2022-11-16 10:22:51', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (88, 39, 217, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', '【双十一大促来袭】指定型号至高优惠1000，以旧换新至高补贴1000元，晒单赢好礼', '202210280039001', 'windir', '2022-11-16 10:22:54', NULL, 1, 54, '小米', '100023207945', '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_cart_item` VALUES (89, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'windir', '2022-11-16 10:23:16', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (90, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2022-12-21 15:49:00', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (91, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'test', '2022-12-21 15:49:42', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (92, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'test', '2022-12-21 15:49:53', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (93, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2022-12-21 15:51:03', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (94, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'test', '2022-12-21 15:51:28', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (95, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'test', '2022-12-21 16:45:16', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (96, 40, 221, 1, 2, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2022-12-21 16:46:41', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (97, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2022-12-21 16:50:10', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (98, 40, 221, 1, 2, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2022-12-23 09:55:11', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (99, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'test', '2023-01-10 15:39:03', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (100, 26, 111, 1, 1, 3899.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026002', 'test', '2023-01-10 16:58:08', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (101, 26, 110, 1, 1, 3699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'test', '2023-01-10 17:10:26', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (102, 40, 221, 11, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'member', '2023-05-11 15:24:33', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (103, 41, 225, 11, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'member', '2023-05-11 15:24:37', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (104, 38, 213, 11, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'member', '2023-05-11 15:30:32', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (105, 39, 217, 11, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', '【双十一大促来袭】指定型号至高优惠1000，以旧换新至高补贴1000元，晒单赢好礼', '202210280039001', 'member', '2023-05-11 15:31:38', NULL, 1, 54, '小米', '100023207945', '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_cart_item` VALUES (106, 44, 235, 11, 1, 369.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', '【满血无缓存！进店抽百元E卡，部分型号白条三期免息】兼具速度与可靠性！读速高达3500MB/s，全功率模式！点击 ', '202211080044001', 'member', '2023-05-11 15:32:16', NULL, 1, 55, '三星', '100018768480', '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `oms_cart_item` VALUES (107, 42, 229, 11, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', '【华为Mate50新品上市】内置66W华为充电套装，超光变XMAGE影像,北斗卫星消息，鸿蒙操作系统3.0！立即抢购！华为新品可持续计划，猛戳》 ', '202211040042001', 'member', '2023-05-11 15:32:44', NULL, 1, 19, '华为', '100035295081', '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (108, 37, 201, 11, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'member', '2023-05-11 15:34:32', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (109, 40, 221, 11, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'member', '2023-05-11 15:35:02', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (110, 41, 225, 11, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'member', '2023-05-11 15:35:21', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (111, 40, 221, 11, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'member', '2023-05-11 15:36:57', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (112, 39, 217, 11, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', '【双十一大促来袭】指定型号至高优惠1000，以旧换新至高补贴1000元，晒单赢好礼', '202210280039001', 'member', '2023-05-11 15:37:04', NULL, 1, 54, '小米', '100023207945', '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_cart_item` VALUES (113, 40, 221, 11, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'member', '2023-05-11 15:37:57', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (114, 41, 225, 11, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'member', '2023-05-11 15:38:03', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (115, 29, 106, 13, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', NULL, '2025-11-27 18:34:55', NULL, 1, 19, '苹果', '7437799', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (116, 30, 181, 12, 1, 88.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', 'HLA海澜之家简约动物印花短袖T恤', '2018夏季新品微弹舒适新款短T男生 6月6日-6月20日，满300减30，参与互动赢百元礼券，立即分享赢大奖', '202004190030003', NULL, '2025-11-27 20:56:13', NULL, 1, 8, '海澜之家', 'HNTBJ2E042A', '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"M\"}]');
INSERT INTO `oms_cart_item` VALUES (117, 30, 183, 12, 1, 88.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', 'HLA海澜之家简约动物印花短袖T恤', '2018夏季新品微弹舒适新款短T男生 6月6日-6月20日，满300减30，参与互动赢百元礼券，立即分享赢大奖', '202004190030005', NULL, '2025-11-27 20:56:20', NULL, 1, 8, '海澜之家', 'HNTBJ2E042A', '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"XL\"}]');
INSERT INTO `oms_cart_item` VALUES (118, 44, 235, 13, 1, 369.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', '【满血无缓存！进店抽百元E卡，部分型号白条三期免息】兼具速度与可靠性！读速高达3500MB/s，全功率模式！点击 ', '202211080044001', NULL, '2025-11-28 08:04:00', NULL, 1, 55, '三星', '100018768480', '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `oms_cart_item` VALUES (119, 37, 201, 12, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', NULL, '2025-11-28 08:04:41', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (120, 27, 98, 12, 7, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', NULL, '2025-11-28 08:29:37', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (121, 40, 221, 12, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', NULL, '2025-11-28 08:30:11', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (122, 45, 239, 12, 1, 2299.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄', '【11.11提前购机享价保，好货不用等，系统申请一键价保补差!】【Reno8Pro爆款优惠】 ', '202211080045001', NULL, '2025-11-28 08:31:05', NULL, 1, 19, 'OPPO', '10052147850350', '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (123, 32, 190, 12, 1, 99.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg', 'HLA海澜之家短袖T恤男基础款', 'HLA海澜之家短袖T恤男基础款简约圆领HNTBJ2E153A藏青(F3)175/92A(50)', '202004190032002', NULL, '2025-11-28 09:24:00', NULL, 1, 8, '海澜之家', 'HNTBJ2E153A', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"尺寸\",\"value\":\"M\"}]');
INSERT INTO `oms_cart_item` VALUES (124, 38, 213, 12, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', NULL, '2025-11-28 09:24:47', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (125, 44, 235, 12, 1, 369.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', '【满血无缓存！进店抽百元E卡，部分型号白条三期免息】兼具速度与可靠性！读速高达3500MB/s，全功率模式！点击 ', '202211080044001', NULL, '2025-11-28 09:27:54', NULL, 1, 55, '三星', '100018768480', '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `oms_cart_item` VALUES (126, 44, 235, 12, 1, 369.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', '【满血无缓存！进店抽百元E卡，部分型号白条三期免息】兼具速度与可靠性！读速高达3500MB/s，全功率模式！点击 ', '202211080044001', NULL, '2025-11-28 09:32:54', NULL, 1, 55, '三星', '100018768480', '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `oms_cart_item` VALUES (127, 39, 217, 12, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', '【双十一大促来袭】指定型号至高优惠1000，以旧换新至高补贴1000元，晒单赢好礼', '202210280039001', NULL, '2025-11-28 10:09:03', NULL, 1, 54, '小米', '100023207945', '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_cart_item` VALUES (128, 44, 235, 12, 1, 369.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', '【满血无缓存！进店抽百元E卡，部分型号白条三期免息】兼具速度与可靠性！读速高达3500MB/s，全功率模式！点击 ', '202211080044001', NULL, '2025-11-28 11:35:32', NULL, 1, 55, '三星', '100018768480', '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `oms_cart_item` VALUES (129, 44, 235, 12, 1, 369.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', '【满血无缓存！进店抽百元E卡，部分型号白条三期免息】兼具速度与可靠性！读速高达3500MB/s，全功率模式！点击 ', '202211080044001', NULL, '2025-11-28 11:36:49', NULL, 1, 55, '三星', '100018768480', '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `oms_cart_item` VALUES (130, 31, 185, 12, 1, 88.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', 'HLA海澜之家蓝灰花纹圆领针织布短袖T恤', '2018夏季新品短袖T恤男HNTBJ2E080A 蓝灰花纹80 175/92A/L80A 蓝灰花纹80 175/92A/L', '202004190031001', NULL, '2025-11-28 11:42:58', NULL, 1, 8, '海澜之家', 'HNTBJ2E080A', '[{\"key\":\"颜色\",\"value\":\"浅灰色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]');
INSERT INTO `oms_cart_item` VALUES (131, 45, 239, 13, 1, 2299.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄', '【11.11提前购机享价保，好货不用等，系统申请一键价保补差!】【Reno8Pro爆款优惠】 ', '202211080045001', NULL, '2025-11-28 19:04:05', NULL, 1, 19, 'OPPO', '10052147850350', '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (132, 28, 102, 12, 1, 649.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', NULL, '2025-11-29 09:43:44', NULL, 1, 19, '小米', '7437789', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (133, 53, 255, 11, 1, 5599.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/77e9cc14d7724276b41e031a7a5f8649.webp', '小米 17 Pro Max', 'MIUI/小米 Xiaomi 17 Pro新款5G手机 官方旗舰店官网同款正品徕卡影像大电池快充', '83671982', 'member', '2025-11-30 17:50:31', NULL, 1, 19, '小米', '7384748932', '[{\"key\":\"颜色\",\"value\":\"森野绿\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `oms_cart_item` VALUES (134, 53, 252, 11, 1, 4999.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/77e9cc14d7724276b41e031a7a5f8649.webp', '小米 17 Pro Max', 'MIUI/小米 Xiaomi 17 Pro新款5G手机 官方旗舰店官网同款正品徕卡影像大电池快充', '73849293', 'member', '2025-11-30 20:51:49', NULL, 1, 19, '小米', '7384748932', '[{\"key\":\"颜色\",\"value\":\"冷艳紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (135, 54, 260, 11, 1, 2399.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/70e1b5fcc3b34a7ba202b5258af63a5d.jpg', 'REDMI K80至尊版', '【至高享3期免息】REDMI K80至尊版红米手机小米手机小米官方旗舰店新品红米k80至尊学生游戏电竞旗舰手机', '765334546', 'member', '2025-11-30 21:33:31', NULL, 1, 19, '小米', '1233421', '[{\"key\":\"颜色\",\"value\":\"白岩灰\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (136, 59, 276, 11, 1, 4088.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/15ebce10b0064f8e89338814ccd6cf6b.png', 'iPhone 15', 'Apple/苹果 iPhone 15苹果15灵动岛iPhone15国行双卡正品5G手机国行双卡双待分期免息', '54634523', 'member', '2025-12-01 00:13:24', NULL, 1, 19, '苹果', '74565542', '[{\"key\":\"颜色\",\"value\":\" 粉色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `oms_cart_item` VALUES (137, 71, 309, 13, 1, 8499.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/80367ed4e74349279d9357df09d3d1e5.jpg', 'OPPO Find N5', 'OPPO Find N5折叠旗舰新款超薄机身骁龙8至尊版findn5oppo5G手机官方旗舰店正品AI智能拍照手机', '5432534', NULL, '2025-12-01 15:12:14', NULL, 1, 19, 'OPPO', '10607003', '[{\"key\":\"颜色\",\"value\":\"缎黑\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `oms_cart_item` VALUES (138, 72, 315, 13, 1, 3419.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/6ef58c24e9ec4fa0b67b95ccb207f416.jpg', '华硕无畏 14 AI 旗舰版', '华硕无畏14 英特尔酷睿Ultra5 14英寸 2.5k护眼屏轻薄笔记本电脑大学生商务办公', '54363453', NULL, '2025-12-01 17:39:17', NULL, 1, 54, 'ASUS', '3458434', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"版本\",\"value\":\"I5 16G 512\"}]');
INSERT INTO `oms_cart_item` VALUES (139, 72, 315, 12, 1, 3419.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/6ef58c24e9ec4fa0b67b95ccb207f416.jpg', '华硕无畏 14 AI 旗舰版', '华硕无畏14 英特尔酷睿Ultra5 14英寸 2.5k护眼屏轻薄笔记本电脑大学生商务办公', '54363453', NULL, '2025-12-01 19:55:26', NULL, 1, 54, 'ASUS', '3458434', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"版本\",\"value\":\"I5 16G 512\"}]');
INSERT INTO `oms_cart_item` VALUES (140, 57, 270, 12, 5, 11399.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/1331b39fa74f41d5b9590bb5bfd4968a.jpg', 'iPhone 17 Pro Max ', '顺丰速发【24期免息】Apple/苹果 iPhone 17 Pro Max 新款全网通5G手机 国行全新官方正品旗舰店16直降5', '398755434', NULL, '2025-12-01 19:57:41', NULL, 1, 19, '苹果', '45678765', '[{\"key\":\"颜色\",\"value\":\"星宇橙色\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `oms_cart_item` VALUES (141, 66, 297, 13, 1, 7999.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/bc8e233c976b406596d9a73ad14d839f.jpg', '华为Mate 70 Pro+', '【24期免息】HUAWEI/华为Mate 70 Pro+ 手机智能手机旗舰店官网官方正品鸿蒙智能手机', '242134', NULL, '2025-12-01 20:11:26', NULL, 1, 19, '华为', '23479523', '[{\"key\":\"颜色\",\"value\":\"墨韵黑\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `oms_cart_item` VALUES (142, 66, 297, 12, 1, 7999.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/bc8e233c976b406596d9a73ad14d839f.jpg', '华为Mate 70 Pro+', '【24期免息】HUAWEI/华为Mate 70 Pro+ 手机智能手机旗舰店官网官方正品鸿蒙智能手机', '242134', NULL, '2025-12-01 20:12:08', NULL, 1, 19, '华为', '23479523', '[{\"key\":\"颜色\",\"value\":\"墨韵黑\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `oms_cart_item` VALUES (143, 57, 270, 13, 1, 11399.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/1331b39fa74f41d5b9590bb5bfd4968a.jpg', 'iPhone 17 Pro Max ', '顺丰速发【24期免息】Apple/苹果 iPhone 17 Pro Max 新款全网通5G手机 国行全新官方正品旗舰店16直降5', '398755434', NULL, '2025-12-03 08:12:15', NULL, 1, 19, '苹果', '45678765', '[{\"key\":\"颜色\",\"value\":\"星宇橙色\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `oms_cart_item` VALUES (144, 75, 319, 13, 1, 8799.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/90945326fee74154bb0fc8edaa6baeec.jpg', 'Al9 HX370', '【畅玩3A游戏】华硕天选6 Pro AMD锐龙版R9 16英寸高性能电竞游戏本RTX5060学生笔记本电脑官方正品', '212312154', NULL, '2025-12-03 08:16:40', NULL, 1, 54, 'ASUS', '5423344', '[{\"key\":\"颜色\",\"value\":\"日蚀灰\"},{\"key\":\"版本\",\"value\":\"套餐一\"}]');
INSERT INTO `oms_cart_item` VALUES (145, 26, 110, 13, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', NULL, '2025-12-03 08:29:54', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (146, 27, 98, 13, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', NULL, '2025-12-03 08:43:47', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (147, 53, 252, 11, 1, 4999.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/77e9cc14d7724276b41e031a7a5f8649.webp', '小米 17 Pro Max', 'MIUI/小米 Xiaomi 17 Pro新款5G手机 官方旗舰店官网同款正品徕卡影像大电池快充', '73849293', 'member', '2025-12-03 09:05:15', NULL, 1, 19, '小米', '7384748932', '[{\"key\":\"颜色\",\"value\":\"冷艳紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (148, 61, 282, 11, 1, 1500.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/8382f35fa65c465aacf5f6752db440ad.jpg', 'iPhone 13', '【二手】Apple/苹果 iPhone 13国行苹果13双卡13mini单卡99新手机 二手商品 多人评价\"服务态度很好\" 超1千人加购', '202512010061001', 'member', '2025-12-03 10:31:08', NULL, 1, 19, '小米', '7543252', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (149, 70, 305, 11, 70, 5299.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/69e0423508f64b2e82b4d134bc6c91e9.jpg', 'OPPO Find X9 Pro', '新品上市 OPPO Find X9 Pro正品新款【孙颖莎同款】 哈苏 2 亿超清长焦镜头oppo手机官方旗舰店oppofindx9pro', '324324688', 'member', '2025-12-03 10:32:26', NULL, 1, 19, 'OPPO', '3960654', '[{\"key\":\"颜色\",\"value\":\"追光红\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `oms_cart_item` VALUES (150, 42, 229, 11, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', '【华为Mate50新品上市】内置66W华为充电套装，超光变XMAGE影像,北斗卫星消息，鸿蒙操作系统3.0！立即抢购！华为新品可持续计划，猛戳》 ', '202211040042001', 'member', '2025-12-04 16:09:19', NULL, 1, 19, '华为', '100035295081', '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (151, 52, 243, 11, 1, 3999.00, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/afc5489db69840059ec3e107e7507139.jpg', 'Redmi K90 Pro Max', 'REDMI K90 Pro Max红米手机官方旗舰店游戏拍照学生小米手机红米手机手机redmik90promax', '123123123', 'member', '2025-12-05 11:56:17', NULL, 1, 19, '小米', '271829273', '[{\"key\":\"颜色\",\"value\":\"流白金\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (152, 38, 213, 11, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'member', '2025-12-05 14:12:36', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (153, 42, 229, 11, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', '【华为Mate50新品上市】内置66W华为充电套装，超光变XMAGE影像,北斗卫星消息，鸿蒙操作系统3.0！立即抢购！华为新品可持续计划，猛戳》 ', '202211040042001', 'member', '2025-12-05 14:35:04', NULL, 1, 19, '华为', '100035295081', '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (154, 42, 229, 11, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', '【华为Mate50新品上市】内置66W华为充电套装，超光变XMAGE影像,北斗卫星消息，鸿蒙操作系统3.0！立即抢购！华为新品可持续计划，猛戳》 ', '202211040042001', 'member', '2025-12-05 14:45:42', NULL, 1, 19, '华为', '100035295081', '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (155, 42, 229, 11, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', '【华为Mate50新品上市】内置66W华为充电套装，超光变XMAGE影像,北斗卫星消息，鸿蒙操作系统3.0！立即抢购！华为新品可持续计划，猛戳》 ', '202211040042001', 'member', '2025-12-05 19:47:02', NULL, 1, 19, '华为', '100035295081', '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (156, 26, 110, 11, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'member', '2025-12-06 08:09:33', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (157, 42, 229, 11, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', '【华为Mate50新品上市】内置66W华为充电套装，超光变XMAGE影像,北斗卫星消息，鸿蒙操作系统3.0！立即抢购！华为新品可持续计划，猛戳》 ', '202211040042001', 'member', '2025-12-06 08:39:36', NULL, 1, 19, '华为', '100035295081', '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (158, 28, 102, 11, 1, 649.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'member', '2025-12-06 12:44:51', NULL, 1, 19, '小米', '7437789', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (159, 38, 213, 11, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'member', '2025-12-06 13:56:28', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (160, 26, 110, 11, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'member', '2025-12-06 13:58:09', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (161, 26, 110, 11, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'member', '2025-12-06 14:26:52', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (162, 26, 110, 11, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'member', '2025-12-08 03:54:09', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (163, 39, 217, 11, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', '【双十一大促来袭】指定型号至高优惠1000，以旧换新至高补贴1000元，晒单赢好礼', '202210280039001', 'member', '2025-12-08 07:33:41', NULL, 1, 54, '小米', '100023207945', '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_cart_item` VALUES (164, 27, 98, 11, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'member', '2025-12-08 14:44:27', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (165, 26, 110, 11, 1, 3699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'member', '2025-12-08 17:29:27', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (166, 29, 106, 11, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'member', '2025-12-08 18:04:28', NULL, 1, 19, '苹果', '7437799', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (167, 28, 102, 11, 1, 649.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'member', '2025-12-08 18:05:11', NULL, 1, 19, '小米', '7437789', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');

-- ----------------------------
-- Table structure for oms_company_address
-- ----------------------------
DROP TABLE IF EXISTS `oms_company_address`;
CREATE TABLE `oms_company_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址名称',
  `send_status` int(1) NULL DEFAULT NULL COMMENT '默认发货地址：0->否；1->是',
  `receive_status` int(1) NULL DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收发货人姓名',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省/直辖市',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `region` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司收发货地址表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_company_address
-- ----------------------------
INSERT INTO `oms_company_address` VALUES (1, '深圳发货点', 1, 1, '大梨', '18000000000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `oms_company_address` VALUES (2, '北京发货点', 0, 0, '大梨', '18000000000', '北京市', NULL, '南山区', '科兴科学园');
INSERT INTO `oms_company_address` VALUES (3, '南京发货点', 0, 0, '大梨', '18000000000', '江苏省', '南京市', '南山区', '科兴科学园');

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` bigint(20) NOT NULL,
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(1) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(1) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(1) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(11) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(11) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(11) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(1) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(1) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(1) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(11) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `store_id` bigint(20) NULL DEFAULT NULL COMMENT '商家ID',
  `store_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1169 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES (12, 1, 2, '201809150101000001', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 20.00, 2344.25, 0.00, 10.00, 10.00, 0, 1, 4, 0, '', '', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '江苏省', '常州市', '天宁区', '东晓街道', '111', 0, 0, NULL, NULL, NULL, NULL, NULL, '2019-11-09 16:50:28', NULL, NULL);
INSERT INTO `oms_order` VALUES (13, 1, 2, '201809150102000002', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 1, 0, '', '', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, 1000, '2018-10-11 14:04:19', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (14, 1, 2, '201809130101000001', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 3, 0, '顺丰快递', '201707196398345', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2018-10-13 13:44:04', '2018-10-16 13:43:41', '2022-11-11 16:19:34', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (15, 1, 2, '201809130102000002', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 3, 0, '顺丰快递', '201707196398346', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 1, NULL, '2018-10-13 13:44:54', '2018-10-16 13:45:01', '2018-10-18 14:05:31', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (16, 1, 2, '201809140101000001', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 4, 0, NULL, NULL, 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (17, 1, 2, '201809150101000003', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, '顺丰快递', '201707196398345', 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, '2018-10-12 14:01:28', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (18, 1, 2, '201809150102000004', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 1, 0, '圆通快递', 'xx', 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, 1000, NULL, '2018-10-16 14:42:17', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (19, 1, 2, '201809130101000003', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, NULL, NULL, 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (20, 1, 2, '201809130102000004', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 3, 0, NULL, NULL, 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (21, 1, 2, '201809140101000002', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 4, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (22, 1, 2, '201809150101000005', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, '顺丰快递', '201707196398345', 15, 0, 0, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, '2018-10-12 14:01:28', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (23, 1, 2, '201809150102000006', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 1, 0, '顺丰快递', 'xxx', 15, 0, 0, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, 1000, NULL, '2018-10-16 14:41:28', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (24, 1, 2, '201809130101000005', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (25, 1, 2, '201809130102000006', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 10.00, 2344.25, 0.00, 10.00, 5.00, 1, 1, 4, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨22', '18033441849', '518000', '北京市', '北京城区', '东城区', '东城街道', 'xxx', 0, 1, NULL, NULL, NULL, NULL, NULL, '2018-10-30 15:08:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (26, 1, 2, '201809140101000003', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 4, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (27, 1, NULL, '202002250100000001', '2020-02-25 15:59:20', 'test', 540.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, NULL, 0, 0, '无优惠,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (28, 1, NULL, '202002250100000002', '2020-02-25 16:05:47', 'test', 540.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, NULL, 0, 0, '无优惠,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (29, 1, NULL, '202002250100000003', '2020-02-25 16:07:58', 'test', 540.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, NULL, 0, 0, '无优惠,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (30, 1, NULL, '202002250100000004', '2020-02-25 16:50:13', 'test', 240.00, 240.00, 20.00, 0.00, 0.00, 0.00, 10.00, 0, 1, 3, 0, '顺丰快递', '12333333', NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 1, 0, NULL, '2020-02-25 16:53:29', '2020-02-25 16:54:03', '2020-05-17 19:38:15', NULL, '2020-02-25 16:52:51', NULL, NULL);
INSERT INTO `oms_order` VALUES (31, 1, 26, '202005160100000001', '2020-05-16 15:16:54', 'test', 13623.00, 11842.40, 0.00, 1629.60, 1.00, 150.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 13623, 13623, '满减优惠：满5000.00元，减500.00元;打折优惠：满2件，打8.00折;满减优惠：满500.00元，减50.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (32, 1, NULL, '202005170100000001', '2020-05-17 15:00:38', 'test', 6487.00, 6187.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 6487, 6487, '满减优惠：满3000.00元，减300.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2020-05-17 15:33:28', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (33, 1, NULL, '202005170100000002', '2020-05-17 15:14:18', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (34, 1, NULL, '202005170100000003', '2020-05-17 15:20:10', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (35, 1, NULL, '202005170100000004', '2020-05-17 15:22:03', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, '顺丰快递', '123', 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2020-05-17 15:29:07', '2020-05-17 15:30:24', '2020-05-17 15:41:45', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (36, 1, NULL, '202005170100000005', '2020-05-17 16:59:26', 'test', 10275.00, 9775.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 10275, 10275, '满减优惠：满5000.00元，减500.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (37, 1, NULL, '202005170100000006', '2020-05-17 19:33:48', 'test', 6487.00, 6187.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '顺丰快递', 'aadd', 15, 6487, 6487, '满减优惠：满3000.00元，减300.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2020-05-17 19:33:59', '2020-05-17 19:34:59', '2020-05-17 19:35:50', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (38, 1, NULL, '202005170100000007', '2020-05-17 19:39:10', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (39, 1, NULL, '202005170100000008', '2020-05-17 19:41:30', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '顺丰快递', 'sdf', 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 1, NULL, '2020-05-17 19:41:41', '2020-05-17 19:42:07', '2020-05-17 19:42:36', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (40, 1, NULL, '202005180100000001', '2020-05-18 16:50:03', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2020-05-18 16:50:29', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (41, 1, 26, '202005180100000002', '2020-05-18 20:22:24', 'test', 6487.00, 6037.00, 0.00, 300.00, 0.00, 150.00, 0.00, 1, 1, 3, 0, '顺丰快递', '12313', 15, 6487, 6487, '满减优惠：满3000.00元，减300.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '清水河街道', NULL, 1, 0, NULL, '2020-05-18 20:22:29', '2020-05-18 20:23:03', '2020-05-18 20:23:20', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (42, 1, NULL, '202005230100000001', '2020-05-23 16:21:27', 'test', 5398.00, 4318.40, 0.00, 1079.60, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 5398, 5398, '打折优惠：满2件，打8.00折', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '清水河街道', NULL, 0, 0, NULL, '2020-05-23 16:21:30', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (43, 1, NULL, '202005230100000002', '2020-05-23 17:01:33', 'test', 5398.00, 4318.40, 0.00, 1079.60, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 5398, 5398, '打折优惠：满2件，打8.00折', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (44, 1, NULL, '202005240100000001', '2020-05-24 09:37:07', 'test', 7576.00, 7076.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 7576, 7576, '满减优惠：满5000.00元，减500.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (45, 1, 25, '202006070100000001', '2020-06-07 17:02:04', 'test', 10275.00, 9674.90, 0.00, 500.00, 0.00, 100.10, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 10275, 10275, '满减优惠：满5000.00元，减500.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '清水河街道', NULL, 0, 0, NULL, '2020-06-07 17:02:17', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (46, 1, 24, '202006210100000001', '2020-06-21 14:27:34', 'test', 9186.00, 7796.40, 0.00, 1379.60, 0.00, 10.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 9186, 9186, '满减优惠：满3000.00元，减300.00元;打折优惠：满2件，打8.00折', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2020-06-21 14:27:38', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (47, 1, NULL, '202006210100000002', '2020-06-21 15:13:06', 'test', 6487.00, 6187.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '顺丰快递', '123131', 15, 6487, 6487, '满减优惠：满3000.00元，减300.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '清水河街道', NULL, 1, 0, NULL, '2020-06-21 15:13:12', '2020-06-21 15:13:44', '2020-06-21 15:13:58', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (48, 1, 26, '202006210100000003', '2020-06-21 15:15:18', 'test', 3788.00, 3338.00, 0.00, 300.00, 0.00, 150.00, 0.00, 2, 1, 3, 0, '圆通快递', '12313', 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2020-06-21 15:15:20', '2020-06-21 15:15:48', '2020-06-21 15:15:58', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (49, 1, NULL, '202006270100000001', '2020-06-27 10:27:56', 'test', 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 2699, 2699, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '清水河街道', NULL, 0, 0, NULL, '2020-06-27 10:27:58', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (50, 1, NULL, '202210280100000001', '2022-10-28 14:50:58', 'test', 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 2699, 2699, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '清水河街道', NULL, 0, 0, NULL, '2022-10-28 14:51:02', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (51, 1, NULL, '202210280100000002', '2022-10-28 15:27:41', 'test', 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-10-28 15:27:44', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (52, 1, 30, '202211090100000001', '2022-11-09 15:14:58', 'test', 2999.00, 2799.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2, 1, 3, 0, '顺丰快递', '1233', 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2022-11-09 15:15:00', '2022-11-09 15:16:12', '2022-11-09 15:16:31', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (53, 1, 27, '202211090100000002', '2022-11-09 15:25:38', 'test', 3599.00, 3589.00, 0.00, 0.00, 0.00, 10.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-11-09 15:25:41', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (54, 1, 29, '202211090100000003', '2022-11-09 15:26:11', 'test', 5999.00, 5399.00, 0.00, 0.00, 0.00, 600.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-11-09 15:26:13', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (55, 1, NULL, '202211100100000001', '2022-11-10 16:57:59', 'test', 11998.00, 11998.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (56, 1, 28, '202211110100000001', '2022-11-11 16:12:42', 'test', 2999.00, 2899.00, 0.00, 0.00, 0.00, 100.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-11-11 16:12:48', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (57, 1, NULL, '202211110100000002', '2022-11-11 16:13:14', 'test', 2999.00, 2999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-11-11 16:13:21', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (58, 1, NULL, '202211110100000003', '2022-11-11 16:15:08', 'test', 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-11-11 16:17:46', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (59, 1, NULL, '202211110100000004', '2022-11-11 16:21:12', 'test', 649.00, 599.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 649, 649, '满减优惠：满500.00元，减50.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (60, 1, NULL, '202211160100000001', '2022-11-16 10:36:08', 'test', 11097.00, 11097.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, '顺丰快递', '1234555', 15, 0, 0, '无优惠;无优惠;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2022-11-16 10:37:25', '2022-11-16 10:42:50', '2022-11-16 10:44:40', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (61, 1, NULL, '202212210100000001', '2022-12-21 15:49:08', 'test', 2999.00, 2999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (62, 1, NULL, '202212210100000002', '2022-12-21 15:49:57', 'test', 8098.00, 8098.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, '顺丰快递', 'SDFERR7845', 15, 0, 0, '无优惠;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2022-12-21 15:50:00', '2022-12-21 15:50:23', '2022-12-21 15:50:33', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (63, 1, NULL, '202212210100000003', '2022-12-21 15:51:09', 'test', 2999.00, 2999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 2, 0, '顺丰快递', '112', 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-12-21 15:51:11', '2023-01-10 10:14:12', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (64, 1, NULL, '202212210100000004', '2022-12-21 15:51:35', 'test', 2099.00, 2099.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (65, 1, 28, '202212210100000005', '2022-12-21 16:53:07', 'test', 5098.00, 4788.00, 0.00, 200.00, 10.00, 100.00, 0.00, 2, 1, 2, 0, '圆通快递', '115', 15, 0, 0, '满减优惠：满2000.00元，减200.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2022-12-21 16:53:58', '2023-01-10 10:14:12', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (66, 1, NULL, '202301100100000001', '2023-01-10 15:34:59', 'test', 5998.00, 5798.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, '满减优惠：满2000.00元，减200.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (67, 1, NULL, '202301100100000002', '2023-01-10 15:39:07', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 3788, 3788, '满减优惠：满3000.00元，减300.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2023-01-10 15:39:16', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (68, 1, NULL, '202301100100000003', '2023-01-10 16:58:19', 'test', 3999.00, 3899.00, 0.00, 100.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 3788, 3788, '单品促销', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2023-01-10 16:58:21', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (69, 11, 30, '202305110100000001', '2023-05-11 15:28:56', 'member', 5098.00, 4698.00, 0.00, 200.00, 0.00, 200.00, 0.00, 2, 1, 3, 0, '顺丰快递', '1231313', 15, 0, 0, '满减优惠：满2000.00元，减200.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2023-05-11 15:28:59', '2023-05-11 15:30:08', '2023-05-11 15:30:16', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (70, 11, NULL, '202305110100000002', '2023-05-11 15:30:36', 'member', 3599.00, 3599.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, '顺丰快递', '232342', 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2023-05-11 15:30:40', '2023-05-11 15:31:22', '2023-05-11 15:31:30', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (71, 11, NULL, '202305110100000003', '2023-05-11 15:31:55', 'member', 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (72, 11, NULL, '202305110100000004', '2023-05-11 15:33:13', 'member', 5368.00, 5368.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, '圆通快递', '1231434', 15, 0, 0, '无优惠;无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2023-05-11 15:33:21', '2023-05-11 15:33:43', '2025-12-06 08:13:16', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (73, 11, NULL, '202305110100000005', '2023-05-11 15:34:39', 'member', 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (74, 11, NULL, '202305110100000006', '2023-05-11 15:35:05', 'member', 2999.00, 2799.00, 0.00, 200.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, '顺丰快递', '123131', 15, 0, 0, '满减优惠：满2000.00元，减200.00元', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2023-05-11 15:35:08', '2023-05-11 15:36:00', '2025-12-05 18:30:30', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (75, 11, NULL, '202305110100000007', '2023-05-11 15:35:24', 'member', 2099.00, 2099.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, '顺丰快递', '123131311', 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2023-05-11 15:35:26', '2023-05-11 15:36:11', '2023-05-11 15:36:34', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (76, 11, 28, '202305110100000008', '2023-05-11 15:37:16', 'member', 8998.00, 8698.00, 0.00, 200.00, 0.00, 100.00, 0.00, 2, 1, 3, 0, '顺丰快递', '1231313', 15, 0, 0, '无优惠;满减优惠：满2000.00元，减200.00元', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2023-05-11 15:37:18', '2023-05-11 15:37:33', '2023-05-11 15:37:48', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (77, 13, NULL, '202511270100000001', '2025-11-27 18:39:48', '123', 5499.00, 4999.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 5499, 5499, '单品促销', NULL, NULL, NULL, NULL, NULL, '1', '18136256911', '211400', '江苏省', '', '', '南京', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (78, 12, NULL, '202511270100000002', '2025-11-27 20:57:39', '111', 176.00, 176.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, '顺丰快递', '1231', 15, 0, 0, '无优惠;无优惠', NULL, NULL, NULL, NULL, NULL, '周家坤', '18136256911', '211400', '江苏省', '', '', '南京市', NULL, 1, 0, NULL, '2025-11-27 20:57:42', '2025-11-27 21:02:43', '2025-11-27 21:03:11', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (79, 12, NULL, '202511280100000001', '2025-11-28 08:04:48', '111', 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '韵达快递', '12131213', 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '周家坤', '18136256911', '211400', '江苏省', '', '', '南京市', NULL, 1, 0, NULL, '2025-11-28 08:04:50', '2025-11-28 08:10:14', '2025-11-28 08:10:27', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (80, 12, NULL, '202511280100000002', '2025-11-28 08:29:43', '111', 18893.00, 14169.75, 0.00, 4723.25, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 18893, 18893, '打折优惠：满3件，打7.50折', NULL, NULL, NULL, NULL, NULL, '周家坤', '18136256911', '211400', '江苏省', '', '', '南京市', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (81, 12, NULL, '202511280100000003', '2025-11-28 08:30:16', '111', 2999.00, 2799.00, 0.00, 200.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '韵达快递', '1122', 15, 0, 0, '满减优惠：满2000.00元，减200.00元', NULL, NULL, NULL, NULL, NULL, '周家坤', '18136256911', '211400', '江苏省', '', '', '南京市', NULL, 1, 0, NULL, '2025-11-28 08:30:18', '2025-11-28 09:25:34', '2025-11-28 09:25:58', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (82, 12, NULL, '202511280100000004', '2025-11-28 08:31:10', '111', 2299.00, 2199.00, 0.00, 100.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 0, 0, '满减优惠：满2000.00元，减100.00元', NULL, NULL, NULL, NULL, NULL, '周家坤', '18136256911', '211400', '江苏省', '', '', '南京市', NULL, 0, 0, NULL, '2025-11-28 08:31:12', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (87, 12, NULL, '202511280100000009', '2025-11-28 09:24:50', '111', 3599.00, 3599.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '周家坤', '18136256911', '211400', '江苏省', '', '', '南京市', NULL, 0, 0, NULL, '2025-11-28 09:24:54', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (88, 12, NULL, '202511280100000010', '2025-11-28 09:27:59', '111', 369.00, 369.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '韵达快递', '12212', 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '周家坤', '18136256911', '211400', '江苏省', '', '', '南京市', NULL, 1, 0, NULL, '2025-11-28 09:28:01', '2025-11-28 09:28:24', '2025-11-28 09:28:29', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (89, 12, NULL, '202511280100000011', '2025-11-28 09:32:58', '111', 369.00, 369.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '周家坤', '18136256911', '211400', '江苏省', '', '', '南京市', NULL, 0, 0, NULL, '2025-11-28 09:33:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (90, 12, NULL, '202511280100000012', '2025-11-28 10:09:07', '111', 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '周家坤', '18136256911', '211400', '江苏省', '', '', '南京市', NULL, 0, 0, NULL, '2025-11-28 10:09:09', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (91, 12, NULL, '202511280100000013', '2025-11-28 11:36:53', '111', 369.00, 369.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '周家坤', '18136256911', '211400', '江苏省', '', '', '南京市', NULL, 0, 0, NULL, '2025-11-28 11:36:55', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (92, 12, NULL, '202511280100000014', '2025-11-28 11:43:02', '111', 88.00, 88.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '周家坤', '18136256911', '211400', '江苏省', '', '', '南京市', NULL, 0, 0, NULL, '2025-11-28 11:43:03', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (93, 11, NULL, '202511300100000001', '2025-11-30 17:55:28', 'member', 5599.00, 5599.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2025-11-30 17:55:31', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (94, 11, NULL, '202511300100000002', '2025-11-30 20:52:15', 'member', 4999.00, 4999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, '圆通快递', '12121221', 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2025-11-30 20:52:17', '2025-11-30 20:52:40', '2025-11-30 20:52:50', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (95, 11, NULL, '202512010100000001', '2025-12-01 00:13:38', 'member', 6487.00, 6487.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠;无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2025-12-01 00:13:40', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (96, 13, NULL, '202512010100000002', '2025-12-01 17:37:13', '123', 11167.00, 11067.00, 0.00, 100.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠;满减优惠：满2000.00元，减100.00元;无优惠', NULL, NULL, NULL, NULL, NULL, '1', '18136256911', '211400', '江苏省', '', '', '南京', NULL, 0, 0, NULL, '2025-12-01 17:37:16', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (97, 12, 27, '202512010100000003', '2025-12-01 19:56:27', '111', 3419.00, -6581.00, 0.00, 0.00, 0.00, 10000.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '谢先安', '18136256911', '211400', '安徽省', '铜陵市', '义安区', '南京市', NULL, 0, 0, NULL, '2025-12-01 19:56:29', NULL, NULL, NULL, '2025-12-01 20:02:28', NULL, NULL);
INSERT INTO `oms_order` VALUES (98, 12, 32, '202512010100000004', '2025-12-01 20:00:17', '111', 56995.00, 6995.00, 0.00, 0.00, 0.00, 50000.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '周家坤', '18136256911', '211400', '江苏省', '', '', '南京市', NULL, 0, 0, NULL, '2025-12-01 20:00:19', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (99, 13, 33, '202512030100000001', '2025-12-03 08:12:26', '123', 11399.00, 1399.00, 0.00, 0.00, 0.00, 10000.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '1', '18136256911', '211400', '江苏省', '', '', '南京', NULL, 0, 0, NULL, '2025-12-03 08:12:30', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (100, 13, 27, '202512030100000002', '2025-12-03 08:17:08', '123', 8799.00, -91201.00, 0.00, 0.00, 0.00, 100000.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '1', '18136256911', '211400', '江苏省', '', '', '南京', NULL, 0, 0, NULL, '2025-12-03 08:17:17', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (101, 13, NULL, '202512030100000003', '2025-12-03 08:30:07', '123', 3788.00, 3699.00, 0.00, 89.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 3788, 3788, '单品促销', NULL, NULL, NULL, NULL, NULL, '1', '18136256911', '211400', '江苏省', '', '', '南京', NULL, 0, 0, NULL, '2025-12-03 08:30:09', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (102, 13, 27, '202512030100000004', '2025-12-03 08:44:12', '123', 2699.00, -97301.00, 0.00, 0.00, 0.00, 100000.00, 0.00, 2, 1, 2, 0, '顺丰快递', '67', 15, 2699, 2699, '无优惠', NULL, NULL, NULL, NULL, NULL, '郑子航', '111230930', '211400', '江苏省', '南京市', '栖霞区', '南京', NULL, 0, 0, NULL, '2025-12-03 08:44:16', '2025-12-03 10:33:38', NULL, NULL, '2025-12-03 08:46:01', NULL, NULL);
INSERT INTO `oms_order` VALUES (103, 11, 27, '202512030100000005', '2025-12-03 09:05:22', 'member', 4999.00, -95001.00, 0.00, 0.00, 0.00, 100000.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (104, 11, 27, '202512030100000006', '2025-12-03 10:32:36', 'member', 370930.00, 272930.00, 0.00, 0.00, 0.00, 98000.00, 0.00, 2, 1, 3, 0, '顺丰快递', '2333', 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2025-12-03 10:32:42', '2025-12-03 10:33:06', '2025-12-04 16:16:09', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (105, 11, NULL, '202512040100000001', '2025-12-04 16:09:23', 'member', 4999.00, 4999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2025-12-04 16:09:26', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (110, 11, NULL, '202512050100000005', '2025-12-05 14:11:41', 'member', 3900.00, 3700.00, 0.00, 200.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '圆通快递', '12424', 15, 100, 1000, '单品促销', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2025-12-05 14:11:44', '2025-12-05 14:13:08', '2025-12-05 23:54:06', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (111, 11, NULL, '202512050100000006', '2025-12-05 14:12:40', 'member', 3599.00, 3599.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '圆通快递', '7877', 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2025-12-05 14:12:41', '2025-12-05 14:13:28', '2025-12-05 14:15:50', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (112, 11, NULL, '202512050100000007', '2025-12-05 14:35:11', 'member', 4999.00, 4999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2025-12-05 14:35:12', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (113, 11, NULL, '202512050100000008', '2025-12-05 14:45:46', 'member', 4999.00, 4999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '顺丰快递', '212', 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2025-12-05 14:45:48', '2025-12-05 14:46:48', '2025-12-05 14:47:02', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (134, 11, NULL, '202512050101000029', '2025-12-05 22:26:03', 'member', 4999.00, 4999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2025-12-05 22:26:07', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (135, 11, NULL, '202512060101000001', '2025-12-06 08:09:38', 'member', 3788.00, 3699.00, 0.00, 89.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '圆通快递', '1234512234', 15, 3788, 3788, '单品促销', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2025-12-06 08:09:40', '2025-12-06 08:10:24', '2025-12-06 08:12:03', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (136, 11, NULL, '202512060101000002', '2025-12-06 08:39:40', 'member', 4999.00, 4999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2025-12-06 08:39:42', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (139, 11, NULL, '202512060101000005', '2025-12-06 12:45:56', 'member', 649.00, 599.00, 0.00, 50.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '圆通快递', '45687', 15, 649, 649, '满减优惠：满500.00元，减50.00元', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2025-12-06 12:45:59', '2025-12-06 12:47:28', '2025-12-08 03:34:48', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (141, 11, NULL, '202512060101000007', '2025-12-06 13:58:14', 'member', 7387.00, 7298.00, 0.00, 89.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 3788, 3788, '单品促销;无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2025-12-06 13:58:19', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (142, 11, NULL, '202512060101000008', '2025-12-06 14:26:55', 'member', 3788.00, 3699.00, 0.00, 89.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 3788, 3788, '单品促销', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2025-12-06 14:26:57', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (143, 11, NULL, '202512080101000001', '2025-12-08 03:54:12', 'member', 3788.00, 3699.00, 0.00, 89.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '圆通快递', '32144234', 15, 3788, 3788, '单品促销', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2025-12-08 03:54:14', '2025-12-08 03:55:16', '2025-12-08 03:55:28', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (144, 1, NULL, 'TEST202511102037', '2025-11-13 07:20:56', 'test_user1', 605.29, 587.05, 10.00, 17.09, 0.00, 1.15, 0.00, 1, 1, 4, 0, '顺丰快递', 'SF0278823542', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13837574033', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-08 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (145, 1, NULL, 'TEST202512087044', '2025-11-15 07:20:56', 'test_user3', 193.85, 181.14, 10.00, 5.94, 0.00, 6.77, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13878907861', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:20:56', NULL, '2025-11-28 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (146, 2, NULL, 'TEST202512065019', '2025-11-27 07:20:56', 'test_user2', 546.97, 536.25, 10.00, 9.60, 0.00, 1.12, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13859869648', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (147, 3, NULL, 'TEST202511178634', '2025-11-28 07:20:56', 'test_user1', 216.25, 191.79, 10.00, 16.84, 0.00, 7.62, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0202433659', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13837931875', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-15 07:28:27', '2025-12-01 07:20:56', '2025-11-25 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (148, 4, NULL, 'TEST202511225176', '2025-12-06 07:20:56', 'test_user5', 654.35, 628.57, 10.00, 17.82, 0.00, 7.96, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13882943756', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:28:27', '2025-11-24 07:20:56', '2025-11-26 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (149, 3, NULL, 'TEST202511186696', '2025-11-21 07:20:56', 'test_user2', 396.68, 382.77, 10.00, 10.96, 0.00, 2.95, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13873436742', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (150, 5, NULL, 'TEST202511109120', '2025-11-23 07:20:56', 'test_user4', 827.95, 808.55, 10.00, 15.50, 0.00, 3.90, 0.00, 2, 1, 5, 0, '顺丰快递', 'SF0306719245', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13880977593', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:20:56', '2025-11-23 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (151, 1, NULL, 'TEST202512043364', '2025-12-02 07:20:56', 'test_user2', 138.80, 115.48, 10.00, 15.62, 0.00, 7.70, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13888518370', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-20 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (152, 1, NULL, 'TEST202511273055', '2025-11-09 07:20:56', 'test_user2', 631.12, 618.68, 10.00, 8.31, 0.00, 4.13, 0.00, 2, 1, 5, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13857586344', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-11 07:20:56', '2025-11-25 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (153, 3, NULL, 'TEST202511092149', '2025-11-10 07:20:56', 'test_user1', 453.52, 446.54, 10.00, 0.06, 0.00, 6.92, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13812624519', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:20:56', '2025-11-23 07:20:56', '2025-11-24 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (154, 3, NULL, 'TEST202511100929', '2025-11-21 07:20:56', 'test_user3', 211.06, 197.53, 10.00, 4.68, 0.00, 8.85, 0.00, 2, 1, 5, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13875893772', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-07 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (155, 4, NULL, 'TEST202511183365', '2025-11-28 07:20:56', 'test_user4', 312.88, 308.58, 10.00, 1.61, 0.00, 2.69, 0.00, 1, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13823332220', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-21 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (156, 2, NULL, 'TEST202512023836', '2025-11-09 07:20:56', 'test_user2', 204.92, 184.71, 10.00, 16.70, 0.00, 3.51, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0573816922', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13861365065', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-04 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (157, 5, NULL, 'TEST202511150430', '2025-12-03 07:20:56', 'test_user5', 796.55, 772.90, 10.00, 13.86, 0.00, 9.79, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0987293557', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13822969497', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-26 07:25:32', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (158, 1, NULL, 'TEST202512052130', '2025-11-23 07:20:56', 'test_user4', 206.36, 190.95, 10.00, 15.38, 0.00, 0.03, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13850893370', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-23 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (159, 1, NULL, 'TEST202512017600', '2025-11-18 07:20:56', 'test_user1', 278.65, 262.79, 10.00, 15.77, 0.00, 0.09, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13836260442', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:20:56', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (160, 4, NULL, 'TEST202511181533', '2025-11-20 07:20:56', 'test_user4', 564.85, 547.53, 10.00, 14.16, 0.00, 3.16, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0280535579', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13829630701', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:20:56', '2025-12-01 07:20:56', '2025-11-25 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (161, 1, NULL, 'TEST202511225216', '2025-12-04 07:20:56', 'test_user5', 486.07, 465.99, 10.00, 11.62, 0.00, 8.46, 0.00, 1, 1, 5, 0, '圆通快递', 'SF0627333982', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13843390407', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:20:56', '2025-11-30 07:20:56', '2025-11-25 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (162, 4, NULL, 'TEST202511132255', '2025-11-15 07:20:56', 'test_user4', 341.34, 329.94, 10.00, 9.20, 0.00, 2.20, 0.00, 2, 1, 5, 0, '顺丰快递', 'SF0779584866', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13895213522', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-14 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (163, 5, NULL, 'TEST202512067827', '2025-11-27 07:20:56', 'test_user4', 659.80, 631.91, 10.00, 18.11, 0.00, 9.78, 0.00, 1, 1, 5, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13883130300', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:20:56', '2025-12-02 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (164, 4, NULL, 'TEST202511108672', '2025-11-30 07:20:56', 'test_user3', 61.66, 45.03, 10.00, 14.13, 0.00, 2.50, 0.00, 1, 1, 5, 0, '圆通快递', 'SF0893449593', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13899860379', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-30 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (165, 1, NULL, 'TEST202511277591', '2025-11-10 07:20:56', 'test_user4', 441.43, 426.40, 10.00, 14.23, 0.00, 0.80, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0044048647', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13842978361', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-27 07:25:32', '2025-11-30 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (166, 4, NULL, 'TEST202512087959', '2025-11-30 07:20:56', 'test_user5', 267.78, 254.14, 10.00, 13.56, 0.00, 0.08, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13895177204', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:25:32', '2025-12-07 07:20:56', '2025-11-26 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (167, 3, NULL, 'TEST202511206171', '2025-11-22 07:20:56', 'test_user2', 446.98, 442.71, 10.00, 2.39, 0.00, 1.88, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0510095598', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13881023730', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-09 07:20:56', '2025-11-30 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (168, 3, NULL, 'TEST202511276843', '2025-11-19 07:20:56', 'test_user2', 137.20, 116.59, 10.00, 17.27, 0.00, 3.34, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0327422244', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13856913811', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:20:56', '2025-11-19 07:20:56', '2025-12-07 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (169, 1, NULL, 'TEST202512046982', '2025-11-20 07:20:56', 'test_user1', 290.92, 274.44, 10.00, 6.55, 0.00, 9.93, 0.00, 2, 1, 5, 0, '顺丰快递', 'SF0083078962', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13897946889', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-05 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (170, 5, NULL, 'TEST202512047787', '2025-12-04 07:20:56', 'test_user3', 40.56, 21.78, 10.00, 14.57, 0.00, 4.21, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13895437615', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:20:56', '2025-11-18 07:20:56', '2025-12-01 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (171, 4, NULL, 'TEST202511176905', '2025-12-01 07:20:56', 'test_user2', 157.50, 140.64, 10.00, 15.13, 0.00, 1.73, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13862678212', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-03 07:20:56', '2025-12-04 07:20:56', '2025-11-23 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (172, 5, NULL, 'TEST202511144164', '2025-11-15 07:20:56', 'test_user3', 76.50, 48.99, 10.00, 17.63, 0.00, 9.88, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0623437177', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13803486249', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:20:56', '2025-12-05 07:20:56', '2025-11-21 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (173, 2, NULL, 'TEST202512074101', '2025-11-14 07:20:56', 'test_user5', 376.92, 354.19, 10.00, 15.60, 0.00, 7.13, 0.00, 1, 1, 5, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13895090525', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-27 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (174, 4, NULL, 'TEST202512072270', '2025-11-10 07:20:56', 'test_user5', 70.51, 48.77, 10.00, 18.33, 0.00, 3.41, 0.00, 2, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13899348448', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-15 07:20:56', '2025-11-20 07:20:56', '2025-11-21 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (175, 1, NULL, 'TEST202511172902', '2025-11-26 07:20:56', 'test_user2', 167.66, 154.84, 10.00, 8.56, 0.00, 4.26, 0.00, 2, 1, 5, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13804930327', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-06 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (176, 5, NULL, 'TEST202511162660', '2025-12-06 07:20:56', 'test_user1', 156.15, 149.61, 10.00, 5.43, 0.00, 1.11, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0386124031', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13811201185', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-26 07:20:56', '2025-11-20 07:20:56', '2025-11-29 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (177, 1, NULL, 'TEST202512089346', '2025-11-10 07:20:56', 'test_user4', 196.66, 180.17, 10.00, 8.46, 0.00, 8.03, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0085936110', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13841399330', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:20:56', NULL, '2025-12-04 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (178, 1, NULL, 'TEST202511277527', '2025-11-27 07:20:56', 'test_user4', 293.50, 274.66, 10.00, 15.16, 0.00, 3.68, 0.00, 2, 1, 4, 0, '顺丰快递', 'SF0008753425', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13858694310', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (179, 3, NULL, 'TEST202512026355', '2025-12-07 07:20:56', 'test_user3', 369.86, 352.22, 10.00, 13.49, 0.00, 4.15, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13884321690', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:28:27', '2025-12-01 07:20:56', '2025-11-24 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (180, 1, NULL, 'TEST202512046059', '2025-11-28 07:20:56', 'test_user3', 418.70, 402.96, 10.00, 10.87, 0.00, 4.87, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13874550300', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:20:56', NULL, '2025-11-19 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (181, 5, NULL, 'TEST202512042117', '2025-11-29 07:20:56', 'test_user4', 128.08, 103.91, 10.00, 18.59, 0.00, 5.58, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13876229236', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-09 07:20:56', '2025-11-14 07:20:56', '2025-11-20 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (182, 5, NULL, 'TEST202512043229', '2025-11-29 07:20:56', 'test_user1', 44.08, 32.49, 10.00, 6.92, 0.00, 4.67, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13899161970', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:25:32', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (183, 5, NULL, 'TEST202511133135', '2025-11-16 07:20:56', 'test_user1', 466.30, 439.71, 10.00, 19.40, 0.00, 7.19, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0932890269', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13882809441', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-03 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (184, 5, NULL, 'TEST202511298252', '2025-12-01 07:20:56', 'test_user1', 616.32, 609.14, 10.00, 3.24, 0.00, 3.94, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0920834603', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13821600003', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:20:56', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (185, 4, NULL, 'TEST202512044824', '2025-12-07 07:20:56', 'test_user5', 988.35, 967.73, 10.00, 10.72, 0.00, 9.90, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13840455540', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:20:56', '2025-11-23 07:20:56', '2025-11-26 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (186, 3, NULL, 'TEST202511139951', '2025-12-02 07:20:56', 'test_user3', 522.73, 501.53, 10.00, 15.83, 0.00, 5.37, 0.00, 1, 1, 5, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13897180006', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (187, 2, NULL, 'TEST202511142138', '2025-11-14 07:20:56', 'test_user4', 375.91, 353.00, 10.00, 16.96, 0.00, 5.95, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0295062658', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13830575722', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-03 07:20:56', NULL, '2025-11-29 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (188, 4, NULL, 'TEST202512080055', '2025-11-23 07:20:56', 'test_user5', 130.59, 105.33, 10.00, 16.04, 0.00, 9.22, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0311584714', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13868412327', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-29 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (189, 3, NULL, 'TEST202512068415', '2025-11-11 07:20:56', 'test_user5', 42.10, 17.08, 10.00, 16.59, 0.00, 8.43, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0487789879', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13893234627', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:25:32', NULL, '2025-12-04 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (190, 4, NULL, 'TEST202512062029', '2025-12-05 07:20:56', 'test_user4', 342.16, 331.60, 10.00, 7.74, 0.00, 2.82, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13848714252', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-28 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (191, 1, NULL, 'TEST202511184373', '2025-11-27 07:20:56', 'test_user1', 681.40, 671.49, 10.00, 3.69, 0.00, 6.22, 0.00, 2, 1, 5, 0, '顺丰快递', 'SF0865602547', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13845898359', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:20:56', '2025-11-14 07:20:56', '2025-11-29 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (192, 3, NULL, 'TEST202512078719', '2025-11-20 07:20:56', 'test_user2', 54.88, 45.15, 10.00, 2.51, 0.00, 7.22, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0252234603', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13877699164', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-18 07:28:27', NULL, '2025-11-29 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (193, 4, NULL, 'TEST202511243589', '2025-11-13 07:20:56', 'test_user2', 591.65, 580.27, 10.00, 4.68, 0.00, 6.70, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13857424162', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:20:56', '2025-11-19 07:20:56', '2025-11-21 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (194, 4, NULL, 'TEST202511131788', '2025-12-04 07:20:56', 'test_user2', 78.19, 60.18, 10.00, 11.24, 0.00, 6.77, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0091085943', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13865343004', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-26 07:20:56', '2025-11-17 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (195, 4, NULL, 'TEST202512063018', '2025-11-19 07:20:56', 'test_user2', 206.20, 194.96, 10.00, 9.06, 0.00, 2.18, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13848586924', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:25:32', '2025-12-04 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (196, 5, NULL, 'TEST202511282387', '2025-12-08 07:20:56', 'test_user1', 718.15, 704.92, 10.00, 3.34, 0.00, 9.89, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0436874804', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13804663748', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-03 07:20:56', '2025-11-19 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (197, 2, NULL, 'TEST202511296836', '2025-12-05 07:20:56', 'test_user3', 680.95, 675.07, 10.00, 0.81, 0.00, 5.07, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0815527875', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13897528335', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:20:56', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (198, 4, NULL, 'TEST202511115476', '2025-12-07 07:20:56', 'test_user1', 456.28, 444.19, 10.00, 3.35, 0.00, 8.74, 0.00, 2, 1, 4, 0, '圆通快递', 'SF0577132853', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13877334234', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:20:56', NULL, '2025-11-20 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (199, 3, NULL, 'TEST202511300153', '2025-11-25 07:20:56', 'test_user1', 499.25, 477.74, 10.00, 16.75, 0.00, 4.76, 0.00, 2, 1, 5, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13894648207', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-18 07:20:56', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (200, 1, NULL, 'TEST202511205476', '2025-11-29 07:20:56', 'test_user5', 896.90, 882.27, 10.00, 5.99, 0.00, 8.64, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13889675757', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-01 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (201, 3, NULL, 'TEST202511197332', '2025-11-22 07:20:56', 'test_user4', 138.49, 119.22, 10.00, 12.60, 0.00, 6.67, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13825556089', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:20:56', NULL, '2025-11-21 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (202, 1, NULL, 'TEST202511157547', '2025-12-02 07:20:56', 'test_user2', 609.79, 584.84, 10.00, 14.96, 0.00, 9.99, 0.00, 2, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13836542441', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-15 07:20:56', NULL, '2025-11-26 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (203, 2, NULL, 'TEST202511202645', '2025-11-10 07:20:56', 'test_user3', 475.85, 463.79, 10.00, 4.04, 0.00, 8.02, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0275678116', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13821948776', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:20:56', '2025-12-07 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (204, 1, NULL, 'TEST202511225593', '2025-11-18 07:20:56', 'test_user1', 182.68, 156.01, 10.00, 17.08, 0.00, 9.59, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0936756380', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13863674338', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:20:56', '2025-12-08 07:20:56', '2025-11-24 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (205, 2, NULL, 'TEST202512015138', '2025-11-27 07:20:56', 'test_user5', 151.90, 140.95, 10.00, 5.43, 0.00, 5.52, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13837530019', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:25:32', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (206, 4, NULL, 'TEST202511155111', '2025-11-21 07:20:56', 'test_user2', 160.41, 147.68, 10.00, 9.73, 0.00, 3.00, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13845752370', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:20:56', '2025-11-26 07:20:56', '2025-12-03 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (207, 1, NULL, 'TEST202511243356', '2025-12-07 07:20:56', 'test_user1', 298.20, 291.35, 10.00, 0.61, 0.00, 6.24, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13819845234', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-08 07:20:56', '2025-12-05 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (208, 4, NULL, 'TEST202511117465', '2025-11-18 07:20:56', 'test_user5', 100.30, 91.72, 10.00, 5.58, 0.00, 3.00, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13819973981', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-18 07:20:56', '2025-12-03 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (209, 3, NULL, 'TEST202511161356', '2025-11-28 07:20:56', 'test_user3', 706.32, 694.51, 10.00, 4.58, 0.00, 7.23, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13877433815', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-23 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (210, 2, NULL, 'TEST202511201334', '2025-12-03 07:20:56', 'test_user4', 148.06, 133.68, 10.00, 13.97, 0.00, 0.41, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0752707791', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13883826795', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-01 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (211, 4, NULL, 'TEST202511176575', '2025-11-16 07:20:56', 'test_user1', 215.64, 208.40, 10.00, 0.17, 0.00, 7.07, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0705057954', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13805053826', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (212, 2, NULL, 'TEST202511119769', '2025-12-02 07:20:56', 'test_user1', 196.95, 190.36, 10.00, 1.86, 0.00, 4.73, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0110562913', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13805312730', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:25:32', '2025-11-27 07:20:56', '2025-11-30 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (213, 5, NULL, 'TEST202511187283', '2025-11-30 07:20:56', 'test_user4', 252.91, 244.58, 10.00, 5.68, 0.00, 2.65, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13807611523', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:20:56', '2025-12-04 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (214, 2, NULL, 'TEST202511237321', '2025-11-27 07:20:56', 'test_user1', 95.33, 82.87, 10.00, 4.93, 0.00, 7.53, 0.00, 1, 1, 5, 0, '圆通快递', 'SF0131234346', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13895021888', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:20:56', '2025-11-18 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (215, 4, NULL, 'TEST202511190004', '2025-11-17 07:20:56', 'test_user1', 333.28, 320.71, 10.00, 3.29, 0.00, 9.28, 0.00, 1, 1, 5, 0, '圆通快递', 'SF0111763796', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13806972607', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-30 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (216, 3, NULL, 'TEST202511248275', '2025-12-08 07:20:56', 'test_user4', 49.44, 36.57, 10.00, 10.56, 0.00, 2.31, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0011598117', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13868381987', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:25:32', '2025-11-29 07:20:56', '2025-11-30 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (217, 5, NULL, 'TEST202512077978', '2025-11-12 07:20:56', 'test_user5', 846.08, 822.25, 10.00, 14.06, 0.00, 9.77, 0.00, 2, 1, 5, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13863256161', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-24 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (218, 2, NULL, 'TEST202511124996', '2025-11-17 07:20:56', 'test_user5', 350.80, 332.75, 10.00, 16.46, 0.00, 1.59, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0800813461', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13875257411', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:25:32', '2025-11-26 07:20:56', '2025-12-03 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (219, 4, NULL, 'TEST202511163723', '2025-11-23 07:20:56', 'test_user4', 650.30, 628.78, 10.00, 12.01, 0.00, 9.51, 0.00, 2, 1, 5, 0, '顺丰快递', 'SF0168720195', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13869024449', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:20:56', NULL, '2025-12-01 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (220, 2, NULL, 'TEST202512011496', '2025-11-23 07:20:56', 'test_user1', 210.77, 198.22, 10.00, 12.13, 0.00, 0.42, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13827035656', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:20:56', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (221, 4, NULL, 'TEST202511301097', '2025-11-15 07:20:56', 'test_user4', 181.72, 175.68, 10.00, 1.21, 0.00, 4.83, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13821072042', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-20 07:20:56', '2025-12-07 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (222, 4, NULL, 'TEST202512038154', '2025-12-01 07:20:56', 'test_user3', 610.93, 598.96, 10.00, 8.64, 0.00, 3.33, 0.00, 1, 1, 5, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13862831869', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-04 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (223, 3, NULL, 'TEST202512058070', '2025-12-06 07:20:56', 'test_user4', 467.17, 456.19, 10.00, 7.97, 0.00, 3.01, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0236617952', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13863786359', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:20:56', '2025-11-30 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (224, 2, NULL, 'TEST202511279455', '2025-12-02 07:20:56', 'test_user3', 776.30, 771.02, 10.00, 2.46, 0.00, 2.82, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13809256748', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-25 07:20:56', '2025-12-07 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (225, 4, NULL, 'TEST202512044943', '2025-11-11 07:20:56', 'test_user1', 127.55, 106.69, 10.00, 19.91, 0.00, 0.95, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13836647740', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:25:32', '2025-12-01 07:20:56', '2025-11-24 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (226, 2, NULL, 'TEST202512028662', '2025-11-23 07:20:56', 'test_user4', 28.53, 25.60, 10.00, 0.90, 0.00, 2.03, 0.00, 2, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13826269666', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:20:56', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (227, 2, NULL, 'TEST202511126304', '2025-11-24 07:20:56', 'test_user3', 228.36, 213.76, 10.00, 10.74, 0.00, 3.86, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0857414693', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13853166816', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:20:56', '2025-11-24 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (228, 1, NULL, 'TEST202511158237', '2025-11-14 07:20:56', 'test_user4', 635.88, 632.80, 10.00, 0.40, 0.00, 2.68, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0162195512', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13881089123', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-04 07:20:56', '2025-12-04 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (229, 3, NULL, 'TEST202512068976', '2025-11-27 07:20:56', 'test_user2', 436.52, 416.60, 10.00, 14.79, 0.00, 5.13, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13835334660', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-30 07:20:56', '2025-12-02 07:20:56', '2025-12-01 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (230, 4, NULL, 'TEST202511155391', '2025-11-30 07:20:56', 'test_user2', 561.32, 552.81, 10.00, 6.09, 0.00, 2.42, 0.00, 1, 1, 4, 0, '顺丰快递', 'SF0450704534', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13893780690', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-21 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (231, 5, NULL, 'TEST202511177893', '2025-11-20 07:20:56', 'test_user5', 176.64, 159.95, 10.00, 8.60, 0.00, 8.09, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13843859076', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (232, 4, NULL, 'TEST202512060949', '2025-11-15 07:20:56', 'test_user1', 376.96, 370.11, 10.00, 3.50, 0.00, 3.35, 0.00, 1, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13848222683', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-28 07:20:56', '2025-11-26 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (233, 1, NULL, 'TEST202511105435', '2025-11-14 07:20:56', 'test_user5', 93.09, 87.38, 10.00, 5.35, 0.00, 0.36, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13879190480', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-25 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (234, 1, NULL, 'TEST202511256786', '2025-11-10 07:20:56', 'test_user1', 350.56, 346.80, 10.00, 1.76, 0.00, 2.00, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0687526097', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13801257647', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:25:32', '2025-12-06 07:20:56', '2025-12-06 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (235, 2, NULL, 'TEST202512053444', '2025-11-16 07:20:56', 'test_user3', 50.54, 29.02, 10.00, 14.47, 0.00, 7.05, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13860405848', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-29 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (236, 2, NULL, 'TEST202512021748', '2025-11-23 07:20:56', 'test_user2', 361.54, 356.44, 10.00, 4.13, 0.00, 0.97, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13885368927', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-27 07:25:32', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (237, 4, NULL, 'TEST202511237586', '2025-12-05 07:20:56', 'test_user2', 82.46, 53.02, 10.00, 19.47, 0.00, 9.97, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13862909222', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:20:56', '2025-12-05 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (238, 2, NULL, 'TEST202511295097', '2025-12-04 07:20:56', 'test_user4', 309.28, 286.04, 10.00, 18.47, 0.00, 4.77, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13857694036', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-27 07:20:56', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (239, 3, NULL, 'TEST202511147124', '2025-12-01 07:20:56', 'test_user1', 224.16, 207.04, 10.00, 12.70, 0.00, 4.42, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0561446850', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13805140179', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:20:56', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (240, 2, NULL, 'TEST202511116318', '2025-11-14 07:20:56', 'test_user2', 525.08, 503.68, 10.00, 13.07, 0.00, 8.33, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13873905209', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:20:56', '2025-11-15 07:20:56', '2025-11-21 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (241, 3, NULL, 'TEST202511156158', '2025-12-08 07:20:56', 'test_user4', 831.25, 817.45, 10.00, 11.35, 0.00, 2.45, 0.00, 2, 1, 5, 0, '顺丰快递', 'SF0433373331', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13858353840', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-30 07:20:56', '2025-11-14 07:20:56', '2025-12-05 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (242, 3, NULL, 'TEST202511222536', '2025-11-29 07:20:56', 'test_user3', 401.50, 391.15, 10.00, 5.24, 0.00, 5.11, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13873494888', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:20:56', NULL, '2025-12-05 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (243, 1, NULL, 'TEST202511302501', '2025-11-17 07:20:56', 'test_user3', 79.60, 78.27, 10.00, 1.03, 0.00, 0.30, 0.00, 2, 1, 5, 0, '圆通快递', 'SF0743912727', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13800969643', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-02 07:20:56', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (244, 2, NULL, 'TEST202511127539', '2025-11-09 07:20:56', 'test_user1', 176.42, 173.20, 10.00, 0.82, 0.00, 2.40, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13842122292', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-09 07:20:56', '2025-12-05 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (245, 1, NULL, 'TEST202511276863', '2025-11-27 07:20:56', 'test_user2', 272.25, 266.43, 10.00, 1.13, 0.00, 4.69, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0157707749', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13854119936', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:20:56', '2025-11-29 07:20:56', '2025-12-01 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (246, 4, NULL, 'TEST202511146683', '2025-11-30 07:20:56', 'test_user5', 176.35, 157.50, 10.00, 11.53, 0.00, 7.32, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13865441007', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:20:56', '2025-11-15 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (247, 4, NULL, 'TEST202511157405', '2025-11-27 07:20:56', 'test_user2', 88.39, 87.05, 10.00, 1.09, 0.00, 0.25, 0.00, 2, 1, 4, 0, '顺丰快递', 'SF0131887623', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13850179422', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (248, 3, NULL, 'TEST202511273952', '2025-11-12 07:20:56', 'test_user5', 139.52, 116.97, 10.00, 14.00, 0.00, 8.55, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13810760375', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:20:56', '2025-12-02 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (249, 2, NULL, 'TEST202511301888', '2025-11-30 07:20:56', 'test_user1', 177.84, 156.43, 10.00, 16.82, 0.00, 4.59, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13860930912', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:20:56', '2025-12-07 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (250, 3, NULL, 'TEST202512083920', '2025-11-10 07:20:56', 'test_user5', 219.98, 208.79, 10.00, 8.72, 0.00, 2.47, 0.00, 2, 1, 5, 0, '顺丰快递', 'SF0287237515', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13899498622', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:20:56', '2025-11-30 07:20:56', '2025-11-24 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (251, 3, NULL, 'TEST202511144354', '2025-12-03 07:20:56', 'test_user4', 58.87, 36.98, 10.00, 16.27, 0.00, 5.62, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13875818792', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-03 07:20:56', '2025-11-30 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (252, 4, NULL, 'TEST202511159127', '2025-12-07 07:20:56', 'test_user2', 100.42, 93.66, 10.00, 4.31, 0.00, 2.45, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0484795586', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13888695068', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:28:27', '2025-11-28 07:20:56', '2025-12-02 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (253, 2, NULL, 'TEST202512013411', '2025-12-05 07:20:56', 'test_user1', 58.85, 58.57, 10.00, 0.11, 0.00, 0.17, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13807344705', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-19 07:20:56', '2025-11-29 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (254, 1, NULL, 'TEST202511257484', '2025-11-25 07:20:56', 'test_user2', 655.04, 652.43, 10.00, 1.78, 0.00, 0.83, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13825220379', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-20 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (255, 2, NULL, 'TEST202512073902', '2025-12-07 07:20:56', 'test_user5', 590.00, 577.02, 10.00, 12.89, 0.00, 0.09, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13899195763', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (256, 2, NULL, 'TEST202511174590', '2025-11-12 07:20:56', 'test_user1', 422.98, 411.23, 10.00, 2.40, 0.00, 9.35, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13890635596', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:20:56', '2025-11-19 07:20:56', '2025-11-30 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (257, 1, NULL, 'TEST202511094810', '2025-12-05 07:20:56', 'test_user3', 603.25, 579.31, 10.00, 14.37, 0.00, 9.57, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0311869581', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13867806728', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:20:56', NULL, '2025-12-04 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (258, 1, NULL, 'TEST202511184460', '2025-12-07 07:20:56', 'test_user1', 175.43, 160.01, 10.00, 13.04, 0.00, 2.38, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13827255654', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-21 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (259, 5, NULL, 'TEST202511255189', '2025-11-29 07:20:56', 'test_user2', 260.84, 252.20, 10.00, 7.22, 0.00, 1.42, 0.00, 2, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13855208695', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:20:56', NULL, '2025-11-25 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (260, 3, NULL, 'TEST202511300820', '2025-11-23 07:20:56', 'test_user3', 71.52, 54.45, 10.00, 16.25, 0.00, 0.82, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0625546365', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13876761568', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-02 07:20:56', '2025-11-18 07:20:56', '2025-11-28 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (261, 1, NULL, 'TEST202512051636', '2025-12-03 07:20:56', 'test_user3', 274.00, 261.93, 10.00, 10.38, 0.00, 1.69, 0.00, 1, 1, 5, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13841970626', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-20 07:20:56', '2025-11-26 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (262, 1, NULL, 'TEST202511244598', '2025-12-01 07:20:56', 'test_user5', 621.19, 605.35, 10.00, 8.34, 0.00, 7.50, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0482185403', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13854121467', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:20:56', '2025-11-25 07:20:56', '2025-11-26 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (263, 2, NULL, 'TEST202511133447', '2025-11-27 07:20:56', 'test_user1', 43.28, 28.31, 10.00, 12.19, 0.00, 2.78, 0.00, 2, 1, 5, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13838211939', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-15 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (264, 4, NULL, 'TEST202511286846', '2025-12-01 07:20:56', 'test_user2', 715.80, 697.33, 10.00, 18.36, 0.00, 0.11, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0243333273', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13886527724', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-18 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (265, 5, NULL, 'TEST202511300387', '2025-11-21 07:20:56', 'test_user2', 158.35, 146.01, 10.00, 11.80, 0.00, 0.54, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13856751944', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-05 07:20:56', '2025-11-22 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (266, 3, NULL, 'TEST202511215435', '2025-12-03 07:20:56', 'test_user5', 718.64, 707.94, 10.00, 7.47, 0.00, 3.23, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0567721853', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13830005199', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:20:56', NULL, '2025-12-05 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (267, 3, NULL, 'TEST202511250853', '2025-11-16 07:20:56', 'test_user1', 80.99, 78.16, 10.00, 2.10, 0.00, 0.73, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13869020653', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:25:32', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (268, 2, NULL, 'TEST202512049311', '2025-11-15 07:20:56', 'test_user1', 87.70, 70.61, 10.00, 9.31, 0.00, 7.78, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0008928900', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13853687366', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:25:32', '2025-11-19 07:20:56', '2025-12-03 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (269, 1, NULL, 'TEST202511300555', '2025-11-29 07:20:56', 'test_user3', 786.25, 773.43, 10.00, 5.22, 0.00, 7.60, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13850290829', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:20:56', '2025-11-21 07:20:56', '2025-11-22 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (270, 1, NULL, 'TEST202511224386', '2025-11-16 07:20:56', 'test_user3', 555.16, 542.41, 10.00, 7.37, 0.00, 5.38, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13803220759', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-20 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (271, 1, NULL, 'TEST202511114160', '2025-11-13 07:20:56', 'test_user2', 47.71, 21.63, 10.00, 18.48, 0.00, 7.60, 0.00, 1, 1, 5, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13852208420', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-01 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (272, 4, NULL, 'TEST202511292140', '2025-11-18 07:20:56', 'test_user1', 136.84, 125.00, 10.00, 10.68, 0.00, 1.16, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13894748496', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:20:56', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (273, 5, NULL, 'TEST202511133666', '2025-11-20 07:20:56', 'test_user2', 825.40, 818.00, 10.00, 4.31, 0.00, 3.09, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13808418028', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:20:56', NULL, '2025-11-28 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (274, 3, NULL, 'TEST202511127916', '2025-11-20 07:20:56', 'test_user2', 1058.00, 1038.40, 10.00, 15.74, 0.00, 3.86, 0.00, 2, 1, 4, 0, '顺丰快递', 'SF0344548518', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13868697860', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-27 07:20:56', '2025-12-04 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (275, 2, NULL, 'TEST202511132176', '2025-11-28 07:20:56', 'test_user3', 379.96, 371.65, 10.00, 6.70, 0.00, 1.61, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0238789502', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13842345493', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-02 07:20:56', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (276, 2, NULL, 'TEST202512059504', '2025-11-10 07:20:56', 'test_user2', 65.29, 60.60, 10.00, 3.59, 0.00, 1.10, 0.00, 1, 1, 4, 0, '顺丰快递', 'SF0572886681', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13835106279', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-29 07:20:56', '2025-11-23 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (277, 3, NULL, 'TEST202511230962', '2025-11-26 07:20:56', 'test_user5', 208.12, 194.56, 10.00, 4.73, 0.00, 8.83, 0.00, 2, 1, 5, 0, '圆通快递', 'SF0893266792', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13848897421', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-19 07:20:56', '2025-11-28 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (278, 3, NULL, 'TEST202511157208', '2025-11-25 07:20:56', 'test_user2', 400.95, 374.58, 10.00, 18.66, 0.00, 7.71, 0.00, 1, 1, 5, 0, '顺丰快递', 'SF0488611565', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13812500915', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-28 07:20:56', '2025-11-28 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (279, 3, NULL, 'TEST202511193839', '2025-11-09 07:20:56', 'test_user1', 182.83, 166.99, 10.00, 7.10, 0.00, 8.74, 0.00, 1, 1, 5, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13865917990', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:20:56', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (280, 2, NULL, 'TEST202511140320', '2025-11-22 07:20:56', 'test_user4', 763.44, 742.07, 10.00, 14.68, 0.00, 6.69, 0.00, 1, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13886974989', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-14 07:20:56', '2025-11-28 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (281, 1, NULL, 'TEST202511113435', '2025-11-28 07:20:56', 'test_user5', 229.10, 207.53, 10.00, 12.41, 0.00, 9.16, 0.00, 2, 1, 5, 0, '圆通快递', 'SF0965569315', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13815124014', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:20:56', '2025-11-21 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (282, 5, NULL, 'TEST202512033433', '2025-12-03 07:20:56', 'test_user1', 96.64, 75.35, 10.00, 18.87, 0.00, 2.42, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13854044103', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:20:56', '2025-12-07 07:20:56', '2025-12-04 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (283, 1, NULL, 'TEST202512088411', '2025-11-11 07:20:56', 'test_user1', 118.26, 100.01, 10.00, 11.37, 0.00, 6.88, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13840615860', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:20:56', '2025-11-17 07:20:56', '2025-12-05 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (284, 1, NULL, 'TEST202511103272', '2025-11-13 07:20:56', 'test_user4', 156.58, 137.72, 10.00, 10.44, 0.00, 8.42, 0.00, 2, 1, 4, 0, '顺丰快递', 'SF0054825754', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13838011295', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-05 07:20:56', '2025-12-07 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (285, 5, NULL, 'TEST202511296503', '2025-12-01 07:20:56', 'test_user2', 202.70, 190.09, 10.00, 4.69, 0.00, 7.92, 0.00, 1, 1, 5, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13836558631', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:20:56', '2025-11-22 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (286, 5, NULL, 'TEST202511204094', '2025-11-13 07:20:56', 'test_user2', 67.21, 58.16, 10.00, 7.85, 0.00, 1.20, 0.00, 1, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13862531950', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:20:56', '2025-11-21 07:20:56', '2025-12-01 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (287, 1, NULL, 'TEST202511148508', '2025-11-17 07:20:56', 'test_user5', 206.99, 183.21, 10.00, 15.85, 0.00, 7.93, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13851129430', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-15 07:20:56', '2025-12-04 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (288, 5, NULL, 'TEST202512033356', '2025-12-04 07:20:56', 'test_user1', 242.50, 237.19, 10.00, 2.76, 0.00, 2.55, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13821186833', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:20:56', NULL, '2025-12-01 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (289, 4, NULL, 'TEST202511202106', '2025-11-13 07:20:56', 'test_user2', 623.88, 605.10, 10.00, 15.61, 0.00, 3.17, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13836036652', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-30 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (290, 5, NULL, 'TEST202512022837', '2025-11-20 07:20:56', 'test_user4', 517.21, 505.34, 10.00, 10.04, 0.00, 1.83, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0320865911', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13821055438', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:20:56', '2025-11-22 07:20:56', '2025-11-25 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (291, 1, NULL, 'TEST202511285693', '2025-12-02 07:20:56', 'test_user5', 33.52, 20.76, 10.00, 3.95, 0.00, 8.81, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0011900888', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13839069133', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-14 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (292, 5, NULL, 'TEST202511230893', '2025-11-26 07:20:56', 'test_user5', 57.32, 38.83, 10.00, 10.85, 0.00, 7.64, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13899072388', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-05 07:20:56', '2025-11-29 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (293, 4, NULL, 'TEST202511125633', '2025-11-26 07:20:56', 'test_user1', 72.14, 56.47, 10.00, 15.11, 0.00, 0.56, 0.00, 1, 1, 5, 0, '圆通快递', 'SF0354659842', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13872636265', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:20:56', '2025-12-05 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (294, 1, NULL, 'TEST202511158535', '2025-12-04 07:20:56', 'test_user5', 54.29, 37.64, 10.00, 14.67, 0.00, 1.98, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0479746713', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13852245028', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:20:56', '2025-11-14 07:20:56', '2025-11-25 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (295, 4, NULL, 'TEST202512010625', '2025-11-22 07:20:56', 'test_user3', 152.21, 138.19, 10.00, 5.72, 0.00, 8.30, 0.00, 1, 1, 5, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13860461529', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (296, 4, NULL, 'TEST202511219432', '2025-11-13 07:20:56', 'test_user5', 185.56, 175.49, 10.00, 6.48, 0.00, 3.59, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0376392810', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13862148615', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:25:32', NULL, '2025-11-29 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (297, 5, NULL, 'TEST202511162463', '2025-11-25 07:20:56', 'test_user5', 410.72, 392.29, 10.00, 9.75, 0.00, 8.68, 0.00, 2, 1, 4, 0, '圆通快递', 'SF0732284077', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13872993000', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-22 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (298, 1, NULL, 'TEST202511122183', '2025-12-08 07:20:56', 'test_user3', 508.88, 492.46, 10.00, 11.64, 0.00, 4.78, 0.00, 2, 1, 4, 0, '圆通快递', 'SF0203631132', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13886834028', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-22 07:20:56', '2025-12-02 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (299, 1, NULL, 'TEST202511215641', '2025-11-24 07:20:56', 'test_user1', 33.18, 25.73, 10.00, 0.95, 0.00, 6.50, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13861297823', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-03 07:20:56', '2025-11-17 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (300, 4, NULL, 'TEST202512038002', '2025-11-23 07:20:56', 'test_user3', 383.74, 365.02, 10.00, 14.35, 0.00, 4.37, 0.00, 1, 1, 5, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13851680094', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-24 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (301, 3, NULL, 'TEST202511233683', '2025-11-26 07:20:56', 'test_user2', 699.25, 681.16, 10.00, 14.31, 0.00, 3.78, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0810059103', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13847556099', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-01 07:20:56', '2025-11-21 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (302, 3, NULL, 'TEST202512017324', '2025-11-13 07:20:56', 'test_user5', 219.07, 208.32, 10.00, 8.86, 0.00, 1.89, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0505583259', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13843123629', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:20:56', NULL, '2025-11-19 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (303, 2, NULL, 'TEST202511126193', '2025-12-07 07:20:56', 'test_user3', 466.52, 454.80, 10.00, 7.33, 0.00, 4.39, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13820240090', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-18 07:25:32', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (304, 3, NULL, 'TEST202511195438', '2025-12-03 07:20:56', 'test_user4', 717.75, 694.33, 10.00, 17.48, 0.00, 5.94, 0.00, 1, 1, 5, 0, '顺丰快递', 'SF0321060824', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13825038437', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-26 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (305, 5, NULL, 'TEST202512023024', '2025-11-26 07:20:56', 'test_user5', 99.88, 83.55, 10.00, 6.93, 0.00, 9.40, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0308907668', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13895846639', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-02 07:20:56', '2025-11-24 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (306, 5, NULL, 'TEST202511307827', '2025-11-26 07:20:56', 'test_user1', 296.14, 286.82, 10.00, 9.08, 0.00, 0.24, 0.00, 2, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13829630013', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:20:56', '2025-11-20 07:20:56', '2025-11-30 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (307, 5, NULL, 'TEST202512023416', '2025-11-10 07:20:56', 'test_user1', 419.83, 406.23, 10.00, 12.45, 0.00, 1.15, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0624955449', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13829838355', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:20:56', NULL, '2025-11-22 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (308, 2, NULL, 'TEST202511141212', '2025-11-20 07:20:56', 'test_user1', 93.21, 80.84, 10.00, 10.86, 0.00, 1.51, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13853644764', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-23 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (309, 5, NULL, 'TEST202511248068', '2025-11-22 07:20:56', 'test_user3', 137.36, 125.34, 10.00, 11.37, 0.00, 0.65, 0.00, 2, 1, 5, 0, '顺丰快递', 'SF0123412018', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13832609917', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-17 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (310, 1, NULL, 'TEST202511252764', '2025-11-12 07:20:56', 'test_user5', 53.46, 48.87, 10.00, 1.57, 0.00, 3.02, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13829698724', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-24 07:20:56', '2025-11-23 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (311, 1, NULL, 'TEST202511191048', '2025-11-10 07:20:56', 'test_user3', 187.78, 182.36, 10.00, 3.81, 0.00, 1.61, 0.00, 1, 1, 4, 0, '顺丰快递', 'SF0550012451', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13849920692', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-04 07:20:56', '2025-11-20 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (312, 5, NULL, 'TEST202511178299', '2025-11-16 07:20:56', 'test_user1', 316.90, 293.95, 10.00, 19.61, 0.00, 3.34, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13855939175', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:20:56', '2025-12-02 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (313, 3, NULL, 'TEST202512033932', '2025-11-16 07:20:56', 'test_user3', 412.88, 388.24, 10.00, 16.56, 0.00, 8.08, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13837853827', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-26 07:20:56', '2025-11-28 07:20:56', '2025-11-29 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (314, 2, NULL, 'TEST202512074896', '2025-11-18 07:20:56', 'test_user2', 113.90, 93.61, 10.00, 15.77, 0.00, 4.52, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0358455109', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13804572980', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:25:32', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (315, 1, NULL, 'TEST202511302981', '2025-12-03 07:20:56', 'test_user3', 255.88, 235.95, 10.00, 19.85, 0.00, 0.08, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13875114163', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:20:56', '2025-12-06 07:20:56', '2025-11-27 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (316, 1, NULL, 'TEST202511309706', '2025-11-29 07:20:56', 'test_user5', 59.71, 45.99, 10.00, 6.21, 0.00, 7.51, 0.00, 2, 1, 5, 0, '顺丰快递', 'SF0592586962', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13868071807', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-30 07:20:56', '2025-11-15 07:20:56', '2025-12-08 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (317, 3, NULL, 'TEST202512062671', '2025-12-08 07:20:56', 'test_user1', 531.48, 517.38, 10.00, 11.44, 0.00, 2.66, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0427419229', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13840503087', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:20:56', '2025-11-25 07:20:56', '2025-11-27 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (318, 2, NULL, 'TEST202511175029', '2025-12-08 07:20:56', 'test_user2', 231.98, 214.84, 10.00, 8.03, 0.00, 9.11, 0.00, 1, 1, 0, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13893830658', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-01 07:20:56', '2025-11-23 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (319, 4, NULL, 'TEST202511138805', '2025-11-29 07:20:56', 'test_user5', 411.22, 405.03, 10.00, 1.37, 0.00, 4.82, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13813198403', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (320, 3, NULL, 'TEST202511135376', '2025-12-07 07:20:56', 'test_user1', 86.84, 65.25, 10.00, 19.12, 0.00, 2.47, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0204351498', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13832030937', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-15 07:25:32', '2025-12-06 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (321, 1, NULL, 'TEST202511292925', '2025-11-12 07:20:56', 'test_user3', 226.00, 203.74, 10.00, 12.46, 0.00, 9.80, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13888269407', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-14 07:20:56', '2025-12-03 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (322, 4, NULL, 'TEST202511270996', '2025-12-01 07:20:56', 'test_user2', 141.92, 118.31, 10.00, 16.24, 0.00, 7.37, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0697787466', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13849883931', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:25:32', NULL, '2025-12-02 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (323, 1, NULL, 'TEST202511103848', '2025-11-26 07:20:56', 'test_user1', 847.25, 839.15, 10.00, 0.77, 0.00, 7.33, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0111780761', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13863171322', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:20:56', '2025-11-20 07:20:56', '2025-12-07 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (324, 5, NULL, 'TEST202511147010', '2025-11-11 07:20:56', 'test_user1', 205.00, 187.21, 10.00, 13.05, 0.00, 4.74, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0178008768', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13891358929', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (325, 5, NULL, 'TEST202511273542', '2025-11-28 07:20:56', 'test_user4', 63.41, 48.47, 10.00, 9.17, 0.00, 5.77, 0.00, 2, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13819271549', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:20:56', NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (326, 1, NULL, 'TEST202511233335', '2025-11-15 07:20:56', 'test_user1', 552.60, 540.08, 10.00, 10.85, 0.00, 1.67, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0737664580', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13873564304', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:20:56', '2025-12-02 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (327, 5, NULL, 'TEST202511297929', '2025-11-12 07:20:56', 'test_user1', 285.36, 269.70, 10.00, 12.09, 0.00, 3.57, 0.00, 2, 1, 4, 0, '圆通快递', 'SF0491755516', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13874770078', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (328, 2, NULL, 'TEST202511115848', '2025-12-04 07:20:56', 'test_user2', 273.22, 258.82, 10.00, 11.86, 0.00, 2.54, 0.00, 1, 1, 4, 0, '顺丰快递', 'SF0122614497', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13855081670', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-14 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (329, 1, NULL, 'TEST202511105105', '2025-12-06 07:20:56', 'test_user4', 384.00, 368.01, 10.00, 10.36, 0.00, 5.63, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0463055025', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13804297821', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-04 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (330, 5, NULL, 'TEST202511193019', '2025-11-27 07:20:56', 'test_user3', 542.92, 519.44, 10.00, 19.75, 0.00, 3.73, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0085161974', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13863402667', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-18 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (331, 3, NULL, 'TEST202512017812', '2025-12-08 07:20:56', 'test_user1', 95.90, 86.62, 10.00, 1.85, 0.00, 7.43, 0.00, 1, 1, 5, 0, '顺丰快递', 'SF0757671059', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13879596370', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:20:56', '2025-11-14 07:20:56', '2025-12-02 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (332, 1, NULL, 'TEST202511162721', '2025-11-19 07:20:56', 'test_user1', 311.85, 303.16, 10.00, 5.86, 0.00, 2.83, 0.00, 2, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13835780555', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-19 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (333, 1, NULL, 'TEST202511233563', '2025-11-11 07:20:56', 'test_user1', 216.77, 209.10, 10.00, 2.86, 0.00, 4.81, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0704351636', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13826107358', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-07 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (334, 3, NULL, 'TEST202511161901', '2025-12-04 07:20:56', 'test_user4', 126.87, 107.70, 10.00, 14.84, 0.00, 4.33, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13877230530', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:20:56', '2025-11-21 07:20:56', '2025-11-27 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (335, 5, NULL, 'TEST202512075129', '2025-11-29 07:20:56', 'test_user3', 105.04, 89.55, 10.00, 13.45, 0.00, 2.04, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0612987969', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13833741562', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:20:56', NULL, '2025-11-29 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (336, 1, NULL, 'TEST202511155490', '2025-11-21 07:20:56', 'test_user2', 175.39, 157.28, 10.00, 9.17, 0.00, 8.94, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13850237926', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:20:56', '2025-12-07 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (337, 2, NULL, 'TEST202512010134', '2025-12-07 07:20:56', 'test_user2', 183.92, 172.93, 10.00, 10.60, 0.00, 0.39, 0.00, 2, 1, 5, 0, '顺丰快递', 'SF0697054577', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13802658309', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:20:56', '2025-11-14 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (338, 1, NULL, 'TEST202512071497', '2025-12-03 07:20:56', 'test_user3', 244.68, 229.53, 10.00, 11.42, 0.00, 3.73, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0851828423', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13844902199', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-27 07:20:56', '2025-11-21 07:20:56', '2025-11-29 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (339, 3, NULL, 'TEST202512032294', '2025-12-02 07:20:56', 'test_user4', 265.60, 245.57, 10.00, 11.95, 0.00, 8.08, 0.00, 1, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13838845801', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:20:56', '2025-12-02 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (340, 5, NULL, 'TEST202511249963', '2025-11-21 07:20:56', 'test_user3', 983.65, 968.03, 10.00, 6.05, 0.00, 9.57, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13858907647', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-05 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (341, 4, NULL, 'TEST202511158464', '2025-11-25 07:20:56', 'test_user5', 90.05, 71.73, 10.00, 12.44, 0.00, 5.88, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13873631010', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:20:56', '2025-11-18 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (342, 1, NULL, 'TEST202511274505', '2025-11-16 07:20:56', 'test_user1', 261.72, 252.87, 10.00, 7.53, 0.00, 1.32, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0724312728', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13884902793', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-29 07:20:56', NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (343, 2, NULL, 'TEST202511242792', '2025-11-26 07:20:56', 'test_user5', 631.75, 608.85, 10.00, 17.87, 0.00, 5.03, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13851086519', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-15 07:20:56', NULL, NULL, '2025-12-08 07:20:56', NULL, NULL);
INSERT INTO `oms_order` VALUES (399, 25, NULL, 'TEST202511297299', '2025-11-16 07:24:00', 'test_user20', 149.53, 126.83, 10.00, 17.39, 0.00, 5.31, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13836377443', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-24 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (400, 16, NULL, 'TEST202511246397', '2025-11-13 07:24:00', 'test_user19', 36.77, 17.90, 10.00, 15.23, 0.00, 3.64, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0174889896', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13848509461', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:24:00', '2025-12-01 07:24:00', '2025-12-03 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (401, 5, NULL, 'TEST202512069619', '2025-11-12 07:24:00', 'test_user15', 63.82, 55.41, 10.00, 0.06, 0.00, 8.35, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0086365263', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13841648047', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:24:00', '2025-11-24 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (402, 5, NULL, 'TEST202511248830', '2025-12-07 07:24:00', 'test_user1', 188.20, 164.93, 10.00, 19.32, 0.00, 3.95, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13867202485', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:24:00', '2025-11-16 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (403, 20, NULL, 'TEST202511293559', '2025-11-12 07:24:00', 'test_user22', 183.31, 164.61, 10.00, 11.70, 0.00, 7.00, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13881513834', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-15 07:24:00', '2025-11-17 07:24:00', '2025-11-29 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (404, 1, NULL, 'TEST202511122727', '2025-12-07 07:24:00', 'test_user20', 113.95, 101.77, 10.00, 9.41, 0.00, 2.77, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13839435725', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-15 07:25:32', NULL, '2025-11-27 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (405, 24, NULL, 'TEST202511135583', '2025-11-13 07:24:00', 'test_user7', 198.38, 193.62, 10.00, 1.95, 0.00, 2.81, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13898673586', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-09 07:24:00', '2025-11-18 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (406, 3, NULL, 'TEST202511155436', '2025-12-03 07:24:00', 'test_user11', 777.85, 769.60, 10.00, 2.15, 0.00, 6.10, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0948102971', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13819702309', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-30 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (407, 7, NULL, 'TEST202511185738', '2025-12-04 07:24:00', 'test_user23', 223.15, 202.08, 10.00, 18.32, 0.00, 2.75, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0879007439', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13828612630', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-26 07:24:00', NULL, '2025-12-04 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (408, 19, NULL, 'TEST202511278537', '2025-12-05 07:24:00', 'test_user3', 195.88, 180.31, 10.00, 9.32, 0.00, 6.25, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0719170698', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13885002392', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-02 07:24:00', '2025-12-02 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (409, 2, NULL, 'TEST202512071637', '2025-12-01 07:24:00', 'test_user17', 193.95, 172.73, 10.00, 16.82, 0.00, 4.40, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13849068702', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-11 07:25:32', '2025-11-27 07:24:00', '2025-11-22 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (410, 18, NULL, 'TEST202511107045', '2025-11-20 07:24:00', 'test_user18', 215.60, 200.79, 10.00, 6.97, 0.00, 7.84, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13895182605', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-27 07:25:32', '2025-11-14 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (411, 6, NULL, 'TEST202511281617', '2025-11-27 07:24:00', 'test_user19', 156.13, 138.87, 10.00, 14.16, 0.00, 3.10, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13839888428', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:24:00', '2025-11-29 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (412, 5, NULL, 'TEST202511308833', '2025-11-13 07:24:00', 'test_user16', 301.45, 294.93, 10.00, 1.02, 0.00, 5.50, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13875264621', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (413, 25, NULL, 'TEST202511091468', '2025-11-27 07:24:00', 'test_user20', 641.12, 627.54, 10.00, 12.25, 0.00, 1.33, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0848454573', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13856792875', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-30 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (414, 5, NULL, 'TEST202511119963', '2025-12-08 07:24:00', 'test_user7', 206.46, 195.73, 10.00, 5.53, 0.00, 5.20, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0514258194', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13861609385', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-15 07:24:00', '2025-11-23 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (415, 3, NULL, 'TEST202511130230', '2025-11-30 07:24:00', 'test_user15', 272.90, 266.96, 10.00, 0.14, 0.00, 5.80, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13812488977', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-24 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (416, 24, NULL, 'TEST202511160645', '2025-12-02 07:24:00', 'test_user1', 1019.60, 997.33, 10.00, 18.69, 0.00, 3.58, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13834759414', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:24:00', '2025-11-19 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (417, 7, NULL, 'TEST202511203618', '2025-12-03 07:24:00', 'test_user25', 109.81, 100.33, 10.00, 5.72, 0.00, 3.76, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13830967880', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-01 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (418, 10, NULL, 'TEST202512038861', '2025-11-20 07:24:00', 'test_user23', 144.65, 136.96, 10.00, 0.63, 0.00, 7.06, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0154263742', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13889325469', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:25:32', NULL, '2025-12-06 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (419, 6, NULL, 'TEST202512075796', '2025-11-29 07:24:00', 'test_user20', 815.64, 798.28, 10.00, 10.98, 0.00, 6.38, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13843344456', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:24:00', '2025-11-16 07:24:00', '2025-11-25 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (420, 7, NULL, 'TEST202511297579', '2025-11-28 07:24:00', 'test_user23', 166.38, 145.79, 10.00, 14.69, 0.00, 5.90, 0.00, 2, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13807416884', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:24:00', '2025-12-02 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (421, 20, NULL, 'TEST202512062122', '2025-12-07 07:24:00', 'test_user21', 409.54, 394.86, 10.00, 5.20, 0.00, 9.48, 0.00, 2, 1, 4, 0, '顺丰快递', 'SF0275217756', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13873335049', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:24:00', '2025-11-30 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (422, 18, NULL, 'TEST202512047195', '2025-11-18 07:24:00', 'test_user5', 603.64, 595.85, 10.00, 3.68, 0.00, 4.11, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0222093380', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13829017965', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:24:00', '2025-11-26 07:24:00', '2025-12-05 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (423, 14, NULL, 'TEST202511213638', '2025-11-11 07:24:00', 'test_user1', 125.12, 120.74, 10.00, 0.50, 0.00, 3.88, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13861757782', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (424, 21, NULL, 'TEST202511206975', '2025-12-05 07:24:00', 'test_user17', 752.36, 732.04, 10.00, 16.98, 0.00, 3.34, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0550124768', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13897788899', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (425, 12, NULL, 'TEST202511120290', '2025-11-25 07:24:00', 'test_user13', 1000.90, 986.98, 10.00, 8.50, 0.00, 5.42, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13803556806', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:24:00', NULL, '2025-11-24 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (426, 1, NULL, 'TEST202511098935', '2025-11-11 07:24:00', 'test_user14', 580.24, 569.19, 10.00, 5.12, 0.00, 5.93, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0701383998', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13831042036', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (427, 11, NULL, 'TEST202511302280', '2025-11-23 07:24:00', 'test_user8', 586.45, 567.05, 10.00, 16.12, 0.00, 3.28, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0669393425', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13887180333', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-26 07:24:00', NULL, '2025-11-22 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (428, 15, NULL, 'TEST202511265232', '2025-11-30 07:24:00', 'test_user9', 308.78, 288.07, 10.00, 19.17, 0.00, 1.54, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0574058983', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13877406293', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:25:32', NULL, '2025-11-26 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (429, 23, NULL, 'TEST202511187763', '2025-11-12 07:24:00', 'test_user23', 208.30, 197.42, 10.00, 4.08, 0.00, 6.80, 0.00, 2, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13883295857', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:24:00', '2025-12-08 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (430, 16, NULL, 'TEST202511305961', '2025-11-21 07:24:00', 'test_user4', 218.62, 215.12, 10.00, 0.32, 0.00, 3.18, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0892541833', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13816202547', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-02 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (431, 18, NULL, 'TEST202511132832', '2025-11-18 07:24:00', 'test_user22', 358.60, 340.20, 10.00, 18.29, 0.00, 0.11, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0202307218', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13868425079', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (432, 20, NULL, 'TEST202511300623', '2025-11-27 07:24:00', 'test_user14', 188.29, 181.98, 10.00, 0.80, 0.00, 5.51, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13825580313', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:24:00', '2025-12-01 07:24:00', '2025-12-05 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (433, 1, NULL, 'TEST202511286693', '2025-11-11 07:24:00', 'test_user8', 231.76, 219.07, 10.00, 9.61, 0.00, 3.08, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0032427105', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13892388111', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-08 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (434, 15, NULL, 'TEST202512032741', '2025-11-15 07:24:00', 'test_user21', 411.48, 402.74, 10.00, 8.59, 0.00, 0.15, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0087638760', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13811690120', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:24:00', '2025-12-03 07:24:00', '2025-11-30 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (435, 23, NULL, 'TEST202511272504', '2025-12-03 07:24:00', 'test_user4', 70.74, 59.09, 10.00, 11.42, 0.00, 0.23, 0.00, 1, 1, 4, 0, '顺丰快递', 'SF0240550414', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13889631020', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (436, 20, NULL, 'TEST202511241483', '2025-11-21 07:24:00', 'test_user8', 999.70, 990.98, 10.00, 5.74, 0.00, 2.98, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13804031103', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (437, 10, NULL, 'TEST202512071734', '2025-11-21 07:24:00', 'test_user19', 29.38, 15.67, 10.00, 4.52, 0.00, 9.19, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0497048889', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13876888647', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:24:00', '2025-12-04 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (438, 24, NULL, 'TEST202511118420', '2025-11-24 07:24:00', 'test_user13', 202.90, 185.60, 10.00, 7.93, 0.00, 9.37, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13826962520', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-30 07:24:00', NULL, '2025-11-27 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (439, 19, NULL, 'TEST202511251183', '2025-11-22 07:24:00', 'test_user7', 768.16, 755.11, 10.00, 10.20, 0.00, 2.85, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13804528585', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:24:00', '2025-11-22 07:24:00', '2025-11-19 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (440, 5, NULL, 'TEST202511265577', '2025-11-23 07:24:00', 'test_user15', 73.42, 44.39, 10.00, 19.63, 0.00, 9.40, 0.00, 2, 1, 4, 0, '顺丰快递', 'SF0602461866', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13851299212', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-27 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (441, 3, NULL, 'TEST202511199819', '2025-11-23 07:24:00', 'test_user26', 665.40, 648.72, 10.00, 11.32, 0.00, 5.36, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0384541461', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13847038455', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-15 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (442, 9, NULL, 'TEST202511184136', '2025-11-10 07:24:00', 'test_user2', 329.10, 304.23, 10.00, 15.42, 0.00, 9.45, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0074676968', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13847087459', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-09 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (443, 21, NULL, 'TEST202512018030', '2025-11-10 07:24:00', 'test_user8', 93.29, 72.19, 10.00, 11.84, 0.00, 9.26, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13898767107', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-03 07:24:00', '2025-11-26 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (444, 20, NULL, 'TEST202511190393', '2025-11-12 07:24:00', 'test_user7', 391.16, 377.50, 10.00, 7.28, 0.00, 6.38, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13899060785', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (445, 18, NULL, 'TEST202511226459', '2025-11-21 07:24:00', 'test_user16', 883.05, 873.59, 10.00, 7.05, 0.00, 2.41, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13840569761', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:25:32', '2025-11-17 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (446, 11, NULL, 'TEST202511122325', '2025-12-01 07:24:00', 'test_user14', 102.12, 87.22, 10.00, 5.12, 0.00, 9.78, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13895533058', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (447, 4, NULL, 'TEST202512060038', '2025-11-18 07:24:00', 'test_user21', 45.46, 24.48, 10.00, 11.14, 0.00, 9.84, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0795290491', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13845695488', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:24:00', '2025-11-26 07:24:00', '2025-11-24 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (448, 9, NULL, 'TEST202511124598', '2025-11-22 07:24:00', 'test_user17', 385.95, 360.09, 10.00, 19.43, 0.00, 6.43, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13868353542', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:24:00', '2025-11-22 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (449, 10, NULL, 'TEST202511106060', '2025-12-06 07:24:00', 'test_user6', 476.32, 451.15, 10.00, 16.30, 0.00, 8.87, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13859125073', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:24:00', '2025-11-27 07:24:00', '2025-11-27 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (450, 26, NULL, 'TEST202511090685', '2025-12-04 07:24:00', 'test_user10', 86.74, 73.85, 10.00, 8.88, 0.00, 4.01, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13870376875', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-18 07:24:00', '2025-11-16 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (451, 14, NULL, 'TEST202512068664', '2025-11-24 07:24:00', 'test_user3', 1021.35, 1004.52, 10.00, 12.92, 0.00, 3.91, 0.00, 1, 1, 4, 0, '圆通快递', 'SF0007771829', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13881401545', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-02 07:24:00', '2025-12-01 07:24:00', '2025-12-05 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (452, 13, NULL, 'TEST202512085948', '2025-11-27 07:24:00', 'test_user25', 116.36, 100.11, 10.00, 11.30, 0.00, 4.95, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13893385576', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:24:00', '2025-11-20 07:24:00', '2025-11-19 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (453, 18, NULL, 'TEST202511236033', '2025-11-13 07:24:00', 'test_user11', 620.10, 602.31, 10.00, 17.76, 0.00, 0.03, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13883874369', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (454, 8, NULL, 'TEST202512049355', '2025-11-16 07:24:00', 'test_user7', 153.38, 142.09, 10.00, 3.61, 0.00, 7.68, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0056743877', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13824230895', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (455, 4, NULL, 'TEST202511138974', '2025-11-30 07:24:00', 'test_user24', 298.98, 282.69, 10.00, 14.14, 0.00, 2.15, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13879150679', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-16 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (456, 13, NULL, 'TEST202511128765', '2025-12-07 07:24:00', 'test_user21', 123.45, 113.37, 10.00, 9.11, 0.00, 0.97, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0929236899', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13823563344', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-22 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (457, 6, NULL, 'TEST202511136040', '2025-11-22 07:24:00', 'test_user12', 323.90, 318.80, 10.00, 4.49, 0.00, 0.61, 0.00, 2, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13868372645', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-24 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (458, 21, NULL, 'TEST202511146315', '2025-11-22 07:24:00', 'test_user20', 207.58, 198.24, 10.00, 1.97, 0.00, 7.37, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0939162774', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13888887942', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (459, 9, NULL, 'TEST202511176231', '2025-11-26 07:24:00', 'test_user26', 613.80, 609.88, 10.00, 0.16, 0.00, 3.76, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0080826569', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13874165739', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:24:00', '2025-11-30 07:24:00', '2025-11-19 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (460, 19, NULL, 'TEST202512054380', '2025-11-14 07:24:00', 'test_user22', 36.50, 25.38, 10.00, 9.25, 0.00, 1.87, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13898585338', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:24:00', '2025-12-05 07:24:00', '2025-12-02 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (461, 19, NULL, 'TEST202511242407', '2025-11-29 07:24:00', 'test_user20', 27.24, 16.05, 10.00, 8.04, 0.00, 3.15, 0.00, 1, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13889230805', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:24:00', '2025-11-23 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (462, 9, NULL, 'TEST202511235957', '2025-12-04 07:24:00', 'test_user11', 361.03, 342.59, 10.00, 13.80, 0.00, 4.64, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0105263161', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13857905658', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (463, 8, NULL, 'TEST202512013730', '2025-12-04 07:24:00', 'test_user3', 356.74, 337.33, 10.00, 18.52, 0.00, 0.89, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0294445256', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13812748125', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:25:32', '2025-11-14 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (464, 14, NULL, 'TEST202512069397', '2025-11-30 07:24:00', 'test_user11', 45.86, 40.59, 10.00, 0.14, 0.00, 5.13, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0832366113', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13858097372', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (465, 24, NULL, 'TEST202511127231', '2025-11-09 07:24:00', 'test_user25', 536.23, 518.22, 10.00, 17.75, 0.00, 0.26, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0055356807', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13835721547', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-30 07:24:00', NULL, '2025-11-23 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (466, 5, NULL, 'TEST202511197549', '2025-11-21 07:24:00', 'test_user22', 172.90, 152.35, 10.00, 13.17, 0.00, 7.38, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13846318806', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:24:00', '2025-11-28 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (467, 8, NULL, 'TEST202511270246', '2025-11-24 07:24:00', 'test_user26', 206.15, 197.58, 10.00, 1.55, 0.00, 7.02, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13895206767', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:24:00', '2025-11-14 07:24:00', '2025-11-24 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (468, 13, NULL, 'TEST202512069740', '2025-11-27 07:24:00', 'test_user16', 283.48, 264.87, 10.00, 12.14, 0.00, 6.47, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0484683378', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13879836729', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:24:00', '2025-11-26 07:24:00', '2025-11-21 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (469, 26, NULL, 'TEST202511200555', '2025-12-04 07:24:00', 'test_user13', 272.84, 257.22, 10.00, 7.61, 0.00, 8.01, 0.00, 2, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13851229280', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-21 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (470, 14, NULL, 'TEST202512033801', '2025-11-29 07:24:00', 'test_user9', 157.04, 135.75, 10.00, 17.83, 0.00, 3.46, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0371101373', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13863481408', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-01 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (471, 19, NULL, 'TEST202512029446', '2025-11-19 07:24:00', 'test_user2', 198.55, 189.48, 10.00, 8.90, 0.00, 0.17, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0911810638', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13860146181', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-15 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (472, 14, NULL, 'TEST202512077109', '2025-12-02 07:24:00', 'test_user12', 490.18, 472.51, 10.00, 7.96, 0.00, 9.71, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0271937339', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13853977426', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-04 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (473, 22, NULL, 'TEST202512069022', '2025-11-09 07:24:00', 'test_user8', 236.89, 220.25, 10.00, 6.98, 0.00, 9.66, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13808894868', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:25:32', '2025-11-30 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (474, 21, NULL, 'TEST202512018938', '2025-11-20 07:24:00', 'test_user18', 207.84, 185.95, 10.00, 13.07, 0.00, 8.82, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0144231769', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13848485549', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:24:00', '2025-11-17 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (475, 20, NULL, 'TEST202512061538', '2025-12-04 07:24:00', 'test_user14', 316.68, 294.12, 10.00, 12.98, 0.00, 9.58, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0618239500', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13822981742', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (476, 19, NULL, 'TEST202512054678', '2025-12-04 07:24:00', 'test_user26', 751.65, 744.12, 10.00, 3.89, 0.00, 3.64, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0419445206', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13807341261', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:25:32', NULL, '2025-11-26 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (477, 15, NULL, 'TEST202512015714', '2025-11-19 07:24:00', 'test_user3', 225.02, 197.04, 10.00, 19.47, 0.00, 8.51, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0533060051', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13865711501', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:24:00', NULL, '2025-12-06 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (478, 17, NULL, 'TEST202512020997', '2025-11-23 07:24:00', 'test_user24', 394.60, 377.45, 10.00, 9.48, 0.00, 7.67, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13884643029', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (479, 6, NULL, 'TEST202511221189', '2025-11-12 07:24:00', 'test_user24', 209.57, 188.97, 10.00, 12.83, 0.00, 7.77, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0775616965', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13875552444', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-27 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (480, 25, NULL, 'TEST202512073631', '2025-11-22 07:24:00', 'test_user19', 156.70, 133.39, 10.00, 15.29, 0.00, 8.02, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13871022134', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (481, 13, NULL, 'TEST202512033627', '2025-11-30 07:24:00', 'test_user8', 86.84, 67.81, 10.00, 15.83, 0.00, 3.20, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13861770192', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-19 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (482, 16, NULL, 'TEST202512015069', '2025-11-26 07:24:00', 'test_user21', 554.62, 547.70, 10.00, 5.10, 0.00, 1.82, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0677752454', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13810505685', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:24:00', '2025-11-25 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (483, 9, NULL, 'TEST202511116602', '2025-11-14 07:24:00', 'test_user14', 79.72, 76.13, 10.00, 2.49, 0.00, 1.10, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0216712433', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13883663869', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:24:00', '2025-11-18 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (484, 26, NULL, 'TEST202511244767', '2025-12-01 07:24:00', 'test_user25', 335.76, 320.15, 10.00, 9.38, 0.00, 6.23, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13897570995', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:24:00', '2025-11-30 07:24:00', '2025-11-26 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (485, 17, NULL, 'TEST202511297379', '2025-11-20 07:24:00', 'test_user18', 262.00, 243.25, 10.00, 17.83, 0.00, 0.92, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0745961306', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13872636512', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:24:00', '2025-11-26 07:24:00', '2025-11-24 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (486, 21, NULL, 'TEST202512060839', '2025-12-07 07:24:00', 'test_user5', 63.12, 46.43, 10.00, 15.84, 0.00, 0.85, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13805892100', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-09 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (487, 23, NULL, 'TEST202512067878', '2025-11-22 07:24:00', 'test_user18', 209.10, 189.38, 10.00, 14.83, 0.00, 4.89, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0340327953', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13856908207', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (488, 4, NULL, 'TEST202512027196', '2025-11-12 07:24:00', 'test_user25', 672.45, 644.10, 10.00, 19.79, 0.00, 8.56, 0.00, 1, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13838614090', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (489, 7, NULL, 'TEST202512074715', '2025-11-29 07:24:00', 'test_user7', 727.15, 715.32, 10.00, 2.29, 0.00, 9.54, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13803002764', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:24:00', '2025-12-03 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (490, 7, NULL, 'TEST202512057962', '2025-11-21 07:24:00', 'test_user18', 586.68, 576.15, 10.00, 7.53, 0.00, 3.00, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13842282277', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (491, 16, NULL, 'TEST202511245215', '2025-11-25 07:24:00', 'test_user6', 505.92, 476.45, 10.00, 19.91, 0.00, 9.56, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13871273138', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (492, 25, NULL, 'TEST202512014349', '2025-11-22 07:24:00', 'test_user11', 283.86, 275.10, 10.00, 4.76, 0.00, 4.00, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0934931875', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13866922869', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-18 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (493, 8, NULL, 'TEST202511236831', '2025-11-17 07:24:00', 'test_user24', 422.55, 407.78, 10.00, 8.07, 0.00, 6.70, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13803044031', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-11 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (494, 4, NULL, 'TEST202512042724', '2025-11-26 07:24:00', 'test_user25', 61.74, 47.18, 10.00, 6.39, 0.00, 8.17, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0190740703', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13821363344', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:24:00', NULL, '2025-11-29 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (495, 8, NULL, 'TEST202512056749', '2025-11-21 07:24:00', 'test_user2', 156.12, 142.53, 10.00, 12.18, 0.00, 1.41, 0.00, 2, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13893362834', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-02 07:24:00', '2025-12-04 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (496, 22, NULL, 'TEST202511249271', '2025-11-13 07:24:00', 'test_user6', 710.80, 691.60, 10.00, 18.51, 0.00, 0.69, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13815091408', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:24:00', NULL, '2025-12-05 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (497, 25, NULL, 'TEST202511211536', '2025-11-19 07:24:00', 'test_user26', 423.00, 406.52, 10.00, 10.92, 0.00, 5.56, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0759069010', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13829801778', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:25:32', '2025-11-27 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (498, 18, NULL, 'TEST202511252005', '2025-11-27 07:24:00', 'test_user19', 833.85, 830.03, 10.00, 1.19, 0.00, 2.63, 0.00, 1, 1, 4, 0, '圆通快递', 'SF0598131649', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13849086941', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-20 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (499, 4, NULL, 'TEST202511154493', '2025-11-16 07:24:00', 'test_user25', 427.52, 408.33, 10.00, 14.58, 0.00, 4.61, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0494847617', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13897256984', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (500, 13, NULL, 'TEST202511095230', '2025-11-27 07:24:00', 'test_user17', 126.82, 108.23, 10.00, 17.03, 0.00, 1.56, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13804099396', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (501, 9, NULL, 'TEST202512063296', '2025-12-03 07:24:00', 'test_user12', 54.92, 45.29, 10.00, 1.41, 0.00, 8.22, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13813449420', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-26 07:25:32', '2025-11-15 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (502, 5, NULL, 'TEST202511129705', '2025-11-23 07:24:00', 'test_user5', 195.58, 184.18, 10.00, 6.11, 0.00, 5.29, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13837648498', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:25:32', '2025-11-29 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (503, 15, NULL, 'TEST202511100677', '2025-11-17 07:24:00', 'test_user13', 323.15, 298.26, 10.00, 15.96, 0.00, 8.93, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0410598342', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13835871318', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:24:00', NULL, '2025-12-06 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (504, 22, NULL, 'TEST202512025820', '2025-12-06 07:24:00', 'test_user8', 424.56, 413.76, 10.00, 7.10, 0.00, 3.70, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0896150116', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13889568407', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (505, 24, NULL, 'TEST202511280807', '2025-11-22 07:24:00', 'test_user9', 405.90, 399.41, 10.00, 5.65, 0.00, 0.84, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13854288569', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (506, 18, NULL, 'TEST202511098592', '2025-11-25 07:24:00', 'test_user11', 290.64, 280.68, 10.00, 8.99, 0.00, 0.97, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0913024924', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13854715464', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-02 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (507, 2, NULL, 'TEST202511278203', '2025-11-12 07:24:00', 'test_user24', 105.80, 99.17, 10.00, 4.09, 0.00, 2.54, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0807268415', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13830665518', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:24:00', '2025-12-07 07:24:00', '2025-11-23 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (508, 4, NULL, 'TEST202511290748', '2025-11-30 07:24:00', 'test_user12', 147.90, 127.74, 10.00, 11.04, 0.00, 9.12, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0506068085', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13889437405', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-30 07:24:00', '2025-11-28 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (509, 5, NULL, 'TEST202511273976', '2025-11-11 07:24:00', 'test_user23', 411.54, 394.40, 10.00, 8.15, 0.00, 8.99, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0973496315', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13854894380', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:24:00', '2025-11-28 07:24:00', '2025-12-02 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (510, 21, NULL, 'TEST202511207774', '2025-11-21 07:24:00', 'test_user26', 1050.15, 1024.64, 10.00, 17.11, 0.00, 8.40, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0648083593', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13882118682', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (511, 5, NULL, 'TEST202511265410', '2025-11-12 07:24:00', 'test_user12', 555.25, 544.50, 10.00, 4.44, 0.00, 6.31, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0978773168', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13805085475', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:24:00', NULL, '2025-11-19 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (512, 3, NULL, 'TEST202511233412', '2025-12-04 07:24:00', 'test_user4', 664.60, 641.76, 10.00, 18.82, 0.00, 4.02, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13889121960', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-27 07:24:00', '2025-11-25 07:24:00', '2025-11-19 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (513, 22, NULL, 'TEST202511095222', '2025-11-21 07:24:00', 'test_user17', 518.23, 496.49, 10.00, 16.79, 0.00, 4.95, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13831277913', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-07 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (514, 22, NULL, 'TEST202511103383', '2025-12-04 07:24:00', 'test_user22', 28.36, 4.23, 10.00, 18.75, 0.00, 5.38, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0014970869', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13843758609', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (515, 19, NULL, 'TEST202511158961', '2025-12-08 07:24:00', 'test_user3', 379.38, 355.14, 10.00, 18.26, 0.00, 5.98, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13806505661', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-14 07:24:00', '2025-11-23 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (516, 9, NULL, 'TEST202512021153', '2025-11-29 07:24:00', 'test_user24', 229.00, 212.00, 10.00, 16.79, 0.00, 0.21, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13886664590', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:24:00', NULL, '2025-12-06 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (517, 2, NULL, 'TEST202512036819', '2025-11-22 07:24:00', 'test_user24', 359.58, 342.80, 10.00, 16.01, 0.00, 0.77, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13849532122', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (518, 14, NULL, 'TEST202511197685', '2025-11-17 07:24:00', 'test_user23', 331.02, 318.36, 10.00, 3.66, 0.00, 9.00, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13882004005', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-09 07:25:32', NULL, '2025-11-29 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (519, 7, NULL, 'TEST202512066065', '2025-11-27 07:24:00', 'test_user22', 247.25, 229.86, 10.00, 15.74, 0.00, 1.65, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13893602854', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:24:00', '2025-11-19 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (520, 4, NULL, 'TEST202511164039', '2025-11-28 07:24:00', 'test_user19', 651.32, 639.58, 10.00, 2.21, 0.00, 9.53, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13828771790', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-16 07:24:00', '2025-12-08 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (521, 25, NULL, 'TEST202511109039', '2025-12-06 07:24:00', 'test_user19', 889.90, 869.54, 10.00, 18.95, 0.00, 1.41, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0312257529', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13832129571', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-25 07:24:00', '2025-11-26 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (522, 5, NULL, 'TEST202511170930', '2025-12-01 07:24:00', 'test_user9', 675.92, 653.47, 10.00, 12.68, 0.00, 9.77, 0.00, 2, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13868543654', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:24:00', '2025-12-03 07:24:00', '2025-12-02 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (523, 8, NULL, 'TEST202511109255', '2025-11-12 07:24:00', 'test_user20', 231.20, 215.75, 10.00, 13.58, 0.00, 1.87, 0.00, 2, 1, 4, 0, '顺丰快递', 'SF0899523137', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13857432234', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:24:00', '2025-12-04 07:24:00', '2025-12-06 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (524, 16, NULL, 'TEST202512014505', '2025-11-29 07:24:00', 'test_user13', 428.40, 420.54, 10.00, 3.11, 0.00, 4.75, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13800105411', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (525, 26, NULL, 'TEST202511304194', '2025-12-06 07:24:00', 'test_user7', 104.52, 90.30, 10.00, 11.72, 0.00, 2.50, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13880200088', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:24:00', '2025-11-30 07:24:00', '2025-12-06 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (526, 17, NULL, 'TEST202511297341', '2025-12-07 07:24:00', 'test_user18', 195.46, 183.87, 10.00, 1.89, 0.00, 9.70, 0.00, 2, 1, 4, 0, '顺丰快递', 'SF0777356328', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13829587105', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-02 07:24:00', '2025-11-25 07:24:00', '2025-12-08 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (527, 16, NULL, 'TEST202511177834', '2025-11-23 07:24:00', 'test_user21', 393.96, 369.09, 10.00, 15.32, 0.00, 9.55, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13865171643', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:24:00', '2025-11-28 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (528, 21, NULL, 'TEST202511095017', '2025-12-07 07:24:00', 'test_user15', 120.40, 107.15, 10.00, 7.43, 0.00, 5.82, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13860509015', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:24:00', NULL, '2025-11-26 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (529, 12, NULL, 'TEST202512019077', '2025-11-24 07:24:00', 'test_user21', 45.13, 43.39, 10.00, 1.17, 0.00, 0.57, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13895941289', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:24:00', '2025-12-04 07:24:00', '2025-12-03 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (530, 21, NULL, 'TEST202511309892', '2025-12-02 07:24:00', 'test_user3', 72.16, 59.41, 10.00, 6.05, 0.00, 6.70, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0571739065', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13892166440', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:24:00', '2025-12-03 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (531, 26, NULL, 'TEST202511296287', '2025-11-14 07:24:00', 'test_user5', 196.12, 171.67, 10.00, 18.77, 0.00, 5.68, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0394089564', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13819317316', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-27 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (532, 10, NULL, 'TEST202511183577', '2025-11-10 07:24:00', 'test_user19', 256.21, 239.52, 10.00, 10.27, 0.00, 6.42, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13893828630', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:24:00', '2025-11-23 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (533, 26, NULL, 'TEST202511210343', '2025-11-13 07:24:00', 'test_user10', 277.36, 262.96, 10.00, 10.77, 0.00, 3.63, 0.00, 1, 1, 4, 0, '顺丰快递', 'SF0675057328', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13855623981', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (534, 13, NULL, 'TEST202512043002', '2025-12-01 07:24:00', 'test_user2', 345.25, 332.08, 10.00, 5.86, 0.00, 7.31, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0491513271', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13816107879', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-01 07:24:00', '2025-12-04 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (535, 16, NULL, 'TEST202512057643', '2025-11-25 07:24:00', 'test_user12', 186.50, 178.45, 10.00, 5.05, 0.00, 3.00, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13805213294', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (536, 5, NULL, 'TEST202511249690', '2025-11-21 07:24:00', 'test_user11', 405.44, 387.14, 10.00, 13.33, 0.00, 4.97, 0.00, 1, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13852949792', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:24:00', '2025-12-04 07:24:00', '2025-12-07 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (537, 11, NULL, 'TEST202512070726', '2025-11-23 07:24:00', 'test_user6', 102.25, 91.16, 10.00, 8.22, 0.00, 2.87, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13890702225', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:24:00', NULL, '2025-12-03 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (538, 16, NULL, 'TEST202511297749', '2025-12-07 07:24:00', 'test_user26', 149.47, 128.97, 10.00, 11.10, 0.00, 9.40, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13822325832', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-28 07:24:00', '2025-12-06 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (539, 9, NULL, 'TEST202511140659', '2025-11-30 07:24:00', 'test_user24', 327.20, 314.03, 10.00, 6.19, 0.00, 6.98, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13808194173', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-22 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (540, 16, NULL, 'TEST202511271702', '2025-12-01 07:24:00', 'test_user18', 592.60, 589.12, 10.00, 3.20, 0.00, 0.28, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0385994070', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13822676286', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:24:00', '2025-11-14 07:24:00', '2025-12-01 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (541, 3, NULL, 'TEST202511173525', '2025-12-02 07:24:00', 'test_user16', 192.55, 170.06, 10.00, 17.37, 0.00, 5.12, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0093729143', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13809314472', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (542, 7, NULL, 'TEST202511271505', '2025-11-14 07:24:00', 'test_user17', 190.87, 168.20, 10.00, 14.08, 0.00, 8.59, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0006036347', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13837301359', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (543, 10, NULL, 'TEST202511294826', '2025-11-09 07:24:00', 'test_user12', 47.92, 38.14, 10.00, 0.10, 0.00, 9.68, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0834398096', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13804282892', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-27 07:24:00', '2025-11-20 07:24:00', '2025-11-27 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (544, 25, NULL, 'TEST202511117631', '2025-11-17 07:24:00', 'test_user2', 332.24, 315.76, 10.00, 12.80, 0.00, 3.68, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13855345411', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (545, 8, NULL, 'TEST202511133507', '2025-11-20 07:24:00', 'test_user6', 517.24, 509.89, 10.00, 4.95, 0.00, 2.40, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0380464252', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13820775745', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:24:00', '2025-11-22 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (546, 21, NULL, 'TEST202511284961', '2025-11-18 07:24:00', 'test_user11', 208.60, 192.20, 10.00, 16.33, 0.00, 0.07, 0.00, 2, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13802254039', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:24:00', '2025-11-15 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (547, 9, NULL, 'TEST202511252780', '2025-12-01 07:24:00', 'test_user1', 704.92, 681.71, 10.00, 17.26, 0.00, 5.95, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13869133266', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-30 07:24:00', '2025-12-01 07:24:00', '2025-11-22 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (548, 10, NULL, 'TEST202511234200', '2025-12-08 07:24:00', 'test_user16', 41.50, 32.44, 10.00, 8.62, 0.00, 0.44, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13830397223', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:24:00', '2025-11-20 07:24:00', '2025-11-19 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (549, 20, NULL, 'TEST202511300966', '2025-11-17 07:24:00', 'test_user17', 226.92, 217.99, 10.00, 0.59, 0.00, 8.34, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0197664977', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13842538568', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:24:00', '2025-12-08 07:24:00', '2025-12-03 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (550, 22, NULL, 'TEST202511171033', '2025-11-11 07:24:00', 'test_user11', 57.28, 32.55, 10.00, 18.11, 0.00, 6.62, 0.00, 2, 1, 4, 0, '圆通快递', 'SF0531327001', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13872919352', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:24:00', '2025-11-16 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (551, 3, NULL, 'TEST202512061612', '2025-12-08 07:24:00', 'test_user14', 731.64, 719.04, 10.00, 11.08, 0.00, 1.52, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13809603565', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:25:32', '2025-11-26 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (552, 26, NULL, 'TEST202512073977', '2025-11-13 07:24:00', 'test_user21', 489.04, 471.07, 10.00, 17.39, 0.00, 0.58, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0423530546', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13831863731', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:24:00', '2025-11-18 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (553, 16, NULL, 'TEST202512075524', '2025-11-28 07:24:00', 'test_user16', 207.07, 192.84, 10.00, 13.95, 0.00, 0.28, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13841091824', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:24:00', NULL, '2025-12-03 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (554, 23, NULL, 'TEST202511257654', '2025-11-26 07:24:00', 'test_user12', 254.76, 232.57, 10.00, 15.62, 0.00, 6.57, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13862701895', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:24:00', NULL, '2025-11-27 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (555, 14, NULL, 'TEST202511196998', '2025-11-14 07:24:00', 'test_user15', 159.81, 136.36, 10.00, 16.21, 0.00, 7.24, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13867804713', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-23 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (556, 3, NULL, 'TEST202512036295', '2025-11-11 07:24:00', 'test_user16', 128.51, 107.56, 10.00, 16.03, 0.00, 4.92, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0120674606', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13841262152', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:24:00', '2025-11-20 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (557, 14, NULL, 'TEST202511101246', '2025-11-23 07:24:00', 'test_user21', 73.54, 60.98, 10.00, 12.40, 0.00, 0.16, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0000227320', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13880816238', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:28:27', '2025-12-07 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (558, 8, NULL, 'TEST202511201885', '2025-11-27 07:24:00', 'test_user3', 293.10, 274.66, 10.00, 17.54, 0.00, 0.90, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0221314810', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13872675932', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-09 07:24:00', '2025-12-04 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (559, 6, NULL, 'TEST202511299703', '2025-11-24 07:24:00', 'test_user23', 413.77, 400.30, 10.00, 9.47, 0.00, 4.00, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0170495021', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13842344699', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-23 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (560, 14, NULL, 'TEST202512059831', '2025-11-22 07:24:00', 'test_user15', 89.77, 80.98, 10.00, 7.55, 0.00, 1.24, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13853508927', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-03 07:25:32', '2025-12-01 07:24:00', '2025-11-21 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (561, 5, NULL, 'TEST202511248724', '2025-12-02 07:24:00', 'test_user25', 271.90, 248.41, 10.00, 17.86, 0.00, 5.63, 0.00, 1, 1, 4, 0, '顺丰快递', 'SF0481358771', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13807146271', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-22 07:24:00', '2025-11-20 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (562, 10, NULL, 'TEST202511242158', '2025-12-01 07:24:00', 'test_user18', 344.30, 343.29, 10.00, 0.07, 0.00, 0.94, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13894815756', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:25:32', '2025-11-27 07:24:00', '2025-11-19 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (563, 2, NULL, 'TEST202512061929', '2025-11-23 07:24:00', 'test_user20', 786.08, 773.09, 10.00, 8.75, 0.00, 4.24, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0931848701', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13881513610', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:24:00', '2025-12-05 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (564, 18, NULL, 'TEST202512054844', '2025-11-09 07:24:00', 'test_user4', 162.53, 145.42, 10.00, 8.04, 0.00, 9.07, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13880145765', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:24:00', '2025-12-05 07:24:00', '2025-12-06 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (565, 18, NULL, 'TEST202511287452', '2025-11-25 07:24:00', 'test_user18', 537.20, 531.07, 10.00, 0.89, 0.00, 5.24, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0735069903', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13833269879', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-26 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (566, 25, NULL, 'TEST202511201803', '2025-11-29 07:24:00', 'test_user3', 293.77, 274.22, 10.00, 13.73, 0.00, 5.82, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13865851871', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:24:00', NULL, '2025-12-07 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (567, 26, NULL, 'TEST202511219541', '2025-11-25 07:24:00', 'test_user2', 237.86, 217.15, 10.00, 14.56, 0.00, 6.15, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13889216226', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (568, 1, NULL, 'TEST202511098794', '2025-12-02 07:24:00', 'test_user12', 58.64, 50.77, 10.00, 3.27, 0.00, 4.60, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13863698475', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-30 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (569, 1, NULL, 'TEST202512055577', '2025-11-24 07:24:00', 'test_user12', 848.60, 825.70, 10.00, 19.79, 0.00, 3.11, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13847086182', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:25:32', '2025-11-25 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (570, 25, NULL, 'TEST202512065500', '2025-11-21 07:24:00', 'test_user13', 593.84, 589.81, 10.00, 1.63, 0.00, 2.40, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0164019749', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13844172131', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:25:32', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (571, 26, NULL, 'TEST202511193405', '2025-11-11 07:24:00', 'test_user20', 381.52, 372.78, 10.00, 2.59, 0.00, 6.15, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0451939565', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13870963098', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-06 07:24:00', '2025-12-02 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (572, 12, NULL, 'TEST202511275936', '2025-12-01 07:24:00', 'test_user21', 77.65, 53.07, 10.00, 19.92, 0.00, 4.66, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0603160984', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13888006169', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:24:00', '2025-11-25 07:24:00', '2025-11-26 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (573, 15, NULL, 'TEST202512084368', '2025-12-06 07:24:00', 'test_user4', 144.65, 138.43, 10.00, 1.82, 0.00, 4.40, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13899484192', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-24 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (574, 15, NULL, 'TEST202511272461', '2025-11-15 07:24:00', 'test_user2', 57.58, 52.19, 10.00, 4.48, 0.00, 0.91, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13895269726', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-07 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (575, 26, NULL, 'TEST202511219206', '2025-11-27 07:24:00', 'test_user23', 152.16, 134.89, 10.00, 13.01, 0.00, 4.26, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0132431265', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13890887957', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-30 07:24:00', '2025-11-23 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (576, 11, NULL, 'TEST202511242151', '2025-12-02 07:24:00', 'test_user17', 307.94, 298.04, 10.00, 3.59, 0.00, 6.31, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13891884213', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:24:00', '2025-11-21 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (577, 13, NULL, 'TEST202511205207', '2025-11-16 07:24:00', 'test_user21', 595.96, 587.51, 10.00, 2.45, 0.00, 6.00, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13866167332', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-24 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (578, 19, NULL, 'TEST202511183243', '2025-11-12 07:24:00', 'test_user14', 736.16, 724.67, 10.00, 9.13, 0.00, 2.36, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13802376526', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-24 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (579, 10, NULL, 'TEST202511157555', '2025-11-10 07:24:00', 'test_user12', 80.80, 55.19, 10.00, 17.91, 0.00, 7.70, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0119912733', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13800142199', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-09 07:24:00', '2025-11-29 07:24:00', '2025-12-02 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (580, 1, NULL, 'TEST202511184023', '2025-11-11 07:24:00', 'test_user24', 241.93, 218.86, 10.00, 16.92, 0.00, 6.15, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13886359133', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:24:00', '2025-12-03 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (581, 7, NULL, 'TEST202512014298', '2025-11-14 07:24:00', 'test_user12', 126.35, 114.80, 10.00, 3.96, 0.00, 7.59, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13855739404', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-05 07:24:00', '2025-11-21 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (582, 8, NULL, 'TEST202511253994', '2025-11-16 07:24:00', 'test_user17', 294.52, 272.75, 10.00, 16.30, 0.00, 5.47, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13817985567', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-24 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (583, 4, NULL, 'TEST202512033960', '2025-11-16 07:24:00', 'test_user13', 147.52, 126.17, 10.00, 12.62, 0.00, 8.73, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13843063158', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (584, 21, NULL, 'TEST202511275591', '2025-11-30 07:24:00', 'test_user17', 798.70, 790.45, 10.00, 0.89, 0.00, 7.36, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13870428562', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (585, 15, NULL, 'TEST202512059507', '2025-11-12 07:24:00', 'test_user11', 839.48, 822.38, 10.00, 13.17, 0.00, 3.93, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13854926480', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:24:00', '2025-12-03 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (586, 5, NULL, 'TEST202511154422', '2025-12-05 07:24:00', 'test_user22', 111.37, 108.38, 10.00, 0.34, 0.00, 2.65, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13874732158', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:24:00', '2025-11-28 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (587, 9, NULL, 'TEST202511175807', '2025-12-05 07:24:00', 'test_user20', 775.85, 764.84, 10.00, 1.66, 0.00, 9.35, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0639898882', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13860734420', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:24:00', NULL, '2025-11-24 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (588, 6, NULL, 'TEST202511230049', '2025-11-17 07:24:00', 'test_user12', 719.40, 709.82, 10.00, 2.65, 0.00, 6.93, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0201428359', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13896880426', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:24:00', '2025-11-24 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (589, 24, NULL, 'TEST202512014692', '2025-11-10 07:24:00', 'test_user16', 782.12, 774.18, 10.00, 7.16, 0.00, 0.78, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0942026108', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13889550056', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:24:00', NULL, '2025-12-05 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (590, 18, NULL, 'TEST202511234955', '2025-12-08 07:24:00', 'test_user25', 48.50, 46.41, 10.00, 0.73, 0.00, 1.36, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13836353730', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (591, 4, NULL, 'TEST202511300178', '2025-12-03 07:24:00', 'test_user7', 988.95, 969.01, 10.00, 12.65, 0.00, 7.29, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0689670473', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13864633273', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-28 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (592, 21, NULL, 'TEST202511284337', '2025-11-09 07:24:00', 'test_user3', 101.45, 83.52, 10.00, 8.16, 0.00, 9.77, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13828410058', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-11 07:24:00', '2025-11-15 07:24:00', '2025-11-28 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (593, 6, NULL, 'TEST202511170189', '2025-11-14 07:24:00', 'test_user24', 414.76, 398.55, 10.00, 6.33, 0.00, 9.88, 0.00, 2, 1, 4, 0, '顺丰快递', 'SF0293332013', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13895185141', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:24:00', '2025-11-15 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (594, 16, NULL, 'TEST202512014333', '2025-12-02 07:24:00', 'test_user12', 848.10, 830.77, 10.00, 10.91, 0.00, 6.42, 0.00, 2, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13841422166', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (595, 24, NULL, 'TEST202512024393', '2025-11-12 07:24:00', 'test_user14', 104.73, 77.38, 10.00, 17.81, 0.00, 9.54, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0943831520', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13895371182', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-03 07:24:00', NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (596, 4, NULL, 'TEST202511258133', '2025-12-06 07:24:00', 'test_user19', 176.96, 163.61, 10.00, 3.36, 0.00, 9.99, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0236943019', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13808385488', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-09 07:24:00', '2025-11-17 07:24:00', NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (597, 11, NULL, 'TEST202511293127', '2025-11-23 07:24:00', 'test_user17', 253.21, 230.62, 10.00, 16.59, 0.00, 6.00, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0221323938', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13891906427', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:24:00', NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (598, 11, NULL, 'TEST202511173512', '2025-11-27 07:24:00', 'test_user17', 828.10, 817.96, 10.00, 1.03, 0.00, 9.11, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13863783260', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:24:00', NULL, NULL);
INSERT INTO `oms_order` VALUES (654, 26, NULL, 'TEST202511245183', '2025-11-25 07:25:31', 'test_user4', 101.43, 109.81, 10.00, 5.79, 0.00, 0.89, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0019992384', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13844381134', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:25:31', NULL, '2025-12-07 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (655, 6, NULL, 'TEST202511263953', '2025-12-07 07:25:31', 'test_user20', 354.51, 434.03, 10.00, 0.26, 0.00, 7.62, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0920601821', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13882360523', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:25:31', NULL, '2025-11-19 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (656, 5, NULL, 'TEST202512077389', '2025-11-14 07:25:31', 'test_user14', 210.10, 89.39, 10.00, 8.67, 0.00, 9.30, 0.00, 1, 1, 4, 0, '顺丰快递', 'SF0387597595', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13847473011', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:25:31', NULL, '2025-12-02 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (657, 13, NULL, 'TEST202511162490', '2025-11-12 07:25:31', 'test_user1', 185.37, 221.47, 10.00, 18.05, 0.00, 4.84, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0779319680', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13840884531', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (658, 23, NULL, 'TEST202511221204', '2025-11-27 07:25:31', 'test_user26', 368.51, 143.07, 10.00, 0.39, 0.00, 5.40, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13879694756', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:25:31', '2025-11-17 07:25:31', '2025-11-25 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (659, 24, NULL, 'TEST202511254937', '2025-11-18 07:25:31', 'test_user4', 139.07, 297.51, 10.00, 18.81, 0.00, 2.18, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13816491502', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-02 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (660, 21, NULL, 'TEST202512052747', '2025-12-06 07:25:31', 'test_user1', 147.97, 533.84, 10.00, 5.01, 0.00, 3.50, 0.00, 2, 1, 4, 0, '顺丰快递', 'SF0132335560', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13830617329', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (661, 13, NULL, 'TEST202511282878', '2025-11-12 07:25:31', 'test_user11', 132.83, 355.40, 10.00, 11.14, 0.00, 9.53, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0555732421', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13874037070', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-28 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (662, 1, NULL, 'TEST202511235571', '2025-11-20 07:25:31', 'test_user6', 245.10, 207.04, 10.00, 8.00, 0.00, 0.57, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13821460834', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (663, 23, NULL, 'TEST202511136863', '2025-11-23 07:25:31', 'test_user23', 226.24, 107.76, 10.00, 10.40, 0.00, 2.54, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0176004110', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13896826455', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (664, 2, NULL, 'TEST202512063566', '2025-12-05 07:25:31', 'test_user13', 240.83, 268.68, 10.00, 0.84, 0.00, 8.97, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0053060928', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13808623166', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-30 07:25:31', NULL, '2025-12-02 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (665, 5, NULL, 'TEST202512085232', '2025-12-08 07:25:31', 'test_user16', 274.22, 265.60, 10.00, 16.21, 0.00, 7.60, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0441377696', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13835081136', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:25:31', '2025-11-15 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (666, 1, NULL, 'TEST202511200110', '2025-11-20 07:25:31', 'test_user7', 152.69, 191.90, 10.00, 16.06, 0.00, 1.63, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0587665837', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13878845402', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (667, 15, NULL, 'TEST202511101602', '2025-12-07 07:25:31', 'test_user24', 96.54, 410.57, 10.00, 6.53, 0.00, 4.69, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0393700459', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13863575299', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:25:31', '2025-11-15 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (668, 15, NULL, 'TEST202511179447', '2025-11-22 07:25:31', 'test_user14', 452.39, 270.20, 10.00, 15.75, 0.00, 6.17, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0717661495', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13884599512', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:25:31', '2025-11-19 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (669, 20, NULL, 'TEST202512079416', '2025-12-07 07:25:31', 'test_user16', 95.68, 403.52, 10.00, 5.22, 0.00, 1.84, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13846226596', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (670, 16, NULL, 'TEST202511289953', '2025-11-14 07:25:31', 'test_user24', 358.98, 213.66, 10.00, 15.65, 0.00, 9.32, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0338491528', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13879074698', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:25:31', '2025-11-15 07:25:31', '2025-12-08 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (671, 12, NULL, 'TEST202511138720', '2025-11-23 07:25:31', 'test_user22', 323.41, 168.22, 10.00, 10.83, 0.00, 9.99, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13885277280', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:25:31', '2025-11-29 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (672, 22, NULL, 'TEST202511257989', '2025-11-19 07:25:31', 'test_user16', 350.00, 150.96, 10.00, 4.19, 0.00, 4.42, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13819157725', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (673, 3, NULL, 'TEST202511105330', '2025-12-05 07:25:31', 'test_user21', 175.84, 523.95, 10.00, 19.69, 0.00, 0.78, 0.00, 1, 1, 4, 0, '圆通快递', 'SF0232250562', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13806228761', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-02 07:25:31', '2025-12-05 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (674, 22, NULL, 'TEST202511153833', '2025-11-21 07:25:31', 'test_user16', 447.47, 153.88, 10.00, 13.08, 0.00, 6.47, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13832257936', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:25:31', '2025-11-22 07:25:31', '2025-11-23 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (675, 1, NULL, 'TEST202511243377', '2025-12-01 07:25:31', 'test_user7', 131.70, 105.51, 10.00, 1.30, 0.00, 9.91, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13882093875', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-25 07:25:31', '2025-11-23 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (676, 12, NULL, 'TEST202511112198', '2025-11-28 07:25:31', 'test_user11', 197.19, 199.82, 10.00, 12.30, 0.00, 1.76, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0714588161', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13813521233', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (677, 10, NULL, 'TEST202511269522', '2025-12-03 07:25:31', 'test_user14', 380.82, 448.58, 10.00, 0.02, 0.00, 6.13, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0051855937', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13827062865', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-27 07:25:31', '2025-11-28 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (678, 17, NULL, 'TEST202511237298', '2025-11-16 07:25:31', 'test_user3', 158.50, 470.47, 10.00, 11.08, 0.00, 2.46, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0482822109', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13878367836', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-30 07:25:31', NULL, '2025-12-02 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (679, 22, NULL, 'TEST202511266279', '2025-11-17 07:25:31', 'test_user23', 306.90, 515.24, 10.00, 2.22, 0.00, 7.64, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0746740152', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13824027423', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:25:31', '2025-12-04 07:25:31', '2025-11-24 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (680, 21, NULL, 'TEST202512078332', '2025-11-21 07:25:31', 'test_user1', 380.71, 155.18, 10.00, 1.35, 0.00, 7.07, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0683078885', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13898409857', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (681, 20, NULL, 'TEST202512044828', '2025-11-15 07:25:31', 'test_user25', 186.99, 318.19, 10.00, 17.20, 0.00, 6.91, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13893055405', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (682, 26, NULL, 'TEST202511116107', '2025-11-17 07:25:31', 'test_user9', 409.14, 380.55, 10.00, 3.01, 0.00, 7.70, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13880496728', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:25:31', NULL, '2025-12-07 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (683, 6, NULL, 'TEST202512016748', '2025-11-30 07:25:31', 'test_user16', 70.17, 231.35, 10.00, 13.85, 0.00, 3.74, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0879960881', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13813042715', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (684, 4, NULL, 'TEST202512051593', '2025-11-09 07:25:31', 'test_user13', 512.84, 143.07, 10.00, 3.07, 0.00, 2.10, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13813211073', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:25:31', '2025-12-02 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (685, 2, NULL, 'TEST202511182049', '2025-12-03 07:25:31', 'test_user1', 304.15, 283.80, 10.00, 16.26, 0.00, 6.63, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13824272998', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (686, 3, NULL, 'TEST202512053892', '2025-11-19 07:25:31', 'test_user15', 389.92, 395.37, 10.00, 8.28, 0.00, 9.99, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13815775073', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-11 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (687, 21, NULL, 'TEST202512035914', '2025-12-04 07:25:31', 'test_user10', 84.88, 171.15, 10.00, 0.04, 0.00, 2.84, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0224509095', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13871173869', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (688, 4, NULL, 'TEST202512078378', '2025-12-06 07:25:31', 'test_user2', 482.45, 98.67, 10.00, 17.84, 0.00, 1.68, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0642807420', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13820414136', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-15 07:25:31', '2025-12-08 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (689, 12, NULL, 'TEST202512027025', '2025-11-19 07:25:31', 'test_user23', 149.31, 254.73, 10.00, 9.03, 0.00, 0.29, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13857368144', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-03 07:25:31', NULL, '2025-12-06 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (690, 20, NULL, 'TEST202511121786', '2025-11-26 07:25:31', 'test_user6', 338.15, 157.07, 10.00, 6.84, 0.00, 0.67, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0848033030', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13818878698', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:25:31', NULL, '2025-12-06 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (691, 2, NULL, 'TEST202511294997', '2025-11-26 07:25:31', 'test_user14', 92.83, 488.70, 10.00, 2.60, 0.00, 0.18, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13874943677', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-09 07:25:31', NULL, '2025-11-19 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (692, 23, NULL, 'TEST202511264701', '2025-11-29 07:25:31', 'test_user4', 147.55, 356.07, 10.00, 9.51, 0.00, 5.40, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0755751168', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13872074430', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:25:31', NULL, '2025-12-05 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (693, 7, NULL, 'TEST202511135068', '2025-11-23 07:25:31', 'test_user25', 191.38, 315.90, 10.00, 16.21, 0.00, 4.58, 0.00, 2, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13897567392', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (694, 23, NULL, 'TEST202512067718', '2025-12-04 07:25:31', 'test_user16', 413.80, 456.02, 10.00, 17.55, 0.00, 9.51, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0231767881', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13845392253', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:25:31', NULL, '2025-11-30 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (695, 19, NULL, 'TEST202511182751', '2025-12-08 07:25:31', 'test_user10', 545.71, 483.48, 10.00, 7.21, 0.00, 2.02, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0765684561', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13817937680', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:25:32', '2025-12-01 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (696, 1, NULL, 'TEST202511132200', '2025-11-26 07:25:31', 'test_user14', 510.93, 80.05, 10.00, 10.70, 0.00, 4.94, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0538456715', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13838686991', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (697, 22, NULL, 'TEST202511197543', '2025-11-19 07:25:31', 'test_user21', 436.93, 273.54, 10.00, 18.28, 0.00, 2.28, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0983292371', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13857079020', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-15 07:25:31', NULL, '2025-11-23 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (698, 17, NULL, 'TEST202511150517', '2025-11-10 07:25:31', 'test_user24', 197.53, 452.51, 10.00, 2.80, 0.00, 2.85, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13899144306', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:25:31', '2025-12-02 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (699, 5, NULL, 'TEST202511213714', '2025-11-15 07:25:31', 'test_user4', 344.34, 310.81, 10.00, 16.84, 0.00, 6.45, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13818692444', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:25:31', NULL, '2025-12-01 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (700, 10, NULL, 'TEST202511149491', '2025-11-11 07:25:31', 'test_user9', 470.86, 147.52, 10.00, 9.00, 0.00, 6.65, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0315963847', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13869619278', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:25:31', '2025-12-06 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (701, 11, NULL, 'TEST202512044866', '2025-12-08 07:25:31', 'test_user1', 382.03, 172.96, 10.00, 4.75, 0.00, 4.49, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13884688886', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:25:31', '2025-11-15 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (702, 22, NULL, 'TEST202511206480', '2025-12-06 07:25:31', 'test_user10', 520.37, 336.35, 10.00, 0.83, 0.00, 4.88, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0877508462', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13863811349', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:25:31', '2025-11-23 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (703, 25, NULL, 'TEST202512057744', '2025-11-13 07:25:31', 'test_user15', 240.04, 189.21, 10.00, 5.04, 0.00, 4.24, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0148191556', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13892946610', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:25:31', NULL, '2025-11-21 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (704, 25, NULL, 'TEST202511133881', '2025-11-18 07:25:31', 'test_user12', 61.65, 451.89, 10.00, 18.98, 0.00, 3.34, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13880861458', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (705, 5, NULL, 'TEST202512077090', '2025-11-29 07:25:31', 'test_user12', 71.89, 508.18, 10.00, 9.01, 0.00, 5.03, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13826827236', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:25:31', '2025-11-23 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (706, 24, NULL, 'TEST202511152595', '2025-12-01 07:25:31', 'test_user25', 490.28, 353.61, 10.00, 7.89, 0.00, 1.51, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13829240068', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:25:31', '2025-11-20 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (707, 15, NULL, 'TEST202511160545', '2025-11-26 07:25:31', 'test_user2', 71.10, 93.77, 10.00, 6.22, 0.00, 2.93, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13858984871', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-26 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (708, 12, NULL, 'TEST202512028056', '2025-12-03 07:25:31', 'test_user9', 168.67, 147.08, 10.00, 5.18, 0.00, 7.11, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13828178496', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-07 07:25:31', '2025-12-03 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (709, 24, NULL, 'TEST202511178921', '2025-12-01 07:25:31', 'test_user8', 478.84, 233.96, 10.00, 5.33, 0.00, 2.29, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0111676004', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13859506596', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:25:32', NULL, '2025-12-03 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (710, 12, NULL, 'TEST202511172387', '2025-11-30 07:25:31', 'test_user2', 320.76, 326.49, 10.00, 2.81, 0.00, 0.43, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0185025243', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13825705997', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:25:31', '2025-12-06 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (711, 4, NULL, 'TEST202511103864', '2025-11-15 07:25:31', 'test_user2', 95.82, 203.84, 10.00, 5.27, 0.00, 3.95, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13854179219', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-11 07:25:31', '2025-11-24 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (712, 26, NULL, 'TEST202511270187', '2025-11-27 07:25:31', 'test_user24', 289.56, 387.20, 10.00, 18.69, 0.00, 6.50, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13878447151', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:25:31', '2025-11-29 07:25:31', '2025-11-30 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (713, 14, NULL, 'TEST202511145644', '2025-11-14 07:25:31', 'test_user10', 114.06, 323.84, 10.00, 7.08, 0.00, 1.27, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13829930196', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:25:31', NULL, '2025-12-05 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (714, 25, NULL, 'TEST202511245558', '2025-11-12 07:25:31', 'test_user10', 83.21, 195.89, 10.00, 5.19, 0.00, 4.23, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0508273976', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13840954510', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:25:31', NULL, '2025-12-07 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (715, 21, NULL, 'TEST202511223506', '2025-11-23 07:25:31', 'test_user3', 294.70, 111.11, 10.00, 2.86, 0.00, 3.48, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0340304517', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13871175995', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:25:31', '2025-11-27 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (716, 4, NULL, 'TEST202512078505', '2025-11-10 07:25:31', 'test_user3', 548.16, 376.38, 10.00, 5.50, 0.00, 4.16, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0797118626', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13878541585', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:25:32', '2025-12-01 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (717, 5, NULL, 'TEST202511273186', '2025-12-04 07:25:31', 'test_user13', 264.43, 406.70, 10.00, 5.61, 0.00, 2.62, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13895520161', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:25:31', NULL, '2025-11-27 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (718, 11, NULL, 'TEST202511268882', '2025-11-13 07:25:31', 'test_user5', 146.79, 276.48, 10.00, 13.68, 0.00, 0.62, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13812351807', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:25:32', '2025-12-06 07:25:31', '2025-11-27 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (719, 1, NULL, 'TEST202511167129', '2025-11-11 07:25:31', 'test_user7', 151.16, 153.41, 10.00, 8.54, 0.00, 5.15, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13899094250', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:25:31', '2025-11-17 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (720, 4, NULL, 'TEST202512052209', '2025-11-12 07:25:31', 'test_user20', 85.74, 108.41, 10.00, 7.39, 0.00, 4.98, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13867408625', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-22 07:25:31', '2025-12-01 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (721, 19, NULL, 'TEST202511114652', '2025-11-26 07:25:31', 'test_user16', 310.52, 477.58, 10.00, 14.25, 0.00, 9.98, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0537613881', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13849182839', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-03 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (722, 15, NULL, 'TEST202511169930', '2025-11-09 07:25:31', 'test_user20', 402.17, 205.77, 10.00, 8.89, 0.00, 2.89, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13860704644', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-23 07:25:31', '2025-11-22 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (723, 2, NULL, 'TEST202511241972', '2025-12-06 07:25:31', 'test_user15', 114.06, 54.33, 10.00, 13.18, 0.00, 2.69, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13887838317', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:25:32', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (724, 3, NULL, 'TEST202511139329', '2025-11-30 07:25:31', 'test_user4', 446.72, 355.94, 10.00, 13.58, 0.00, 5.60, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13863314095', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:25:31', '2025-11-18 07:25:31', '2025-12-02 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (725, 6, NULL, 'TEST202511092680', '2025-11-10 07:25:31', 'test_user11', 141.51, 411.43, 10.00, 1.31, 0.00, 1.58, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0441458540', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13833640405', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-11 07:25:31', NULL, '2025-11-25 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (726, 11, NULL, 'TEST202511130674', '2025-11-21 07:25:31', 'test_user21', 385.54, 65.63, 10.00, 2.86, 0.00, 6.22, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13817596024', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:25:31', '2025-11-27 07:25:31', '2025-11-20 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (727, 15, NULL, 'TEST202511306806', '2025-11-19 07:25:31', 'test_user15', 423.48, 80.72, 10.00, 1.33, 0.00, 1.47, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13883112871', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:25:31', NULL, '2025-11-21 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (728, 25, NULL, 'TEST202511263428', '2025-11-29 07:25:31', 'test_user11', 75.53, 53.79, 10.00, 17.69, 0.00, 4.01, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0820621323', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13844899434', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-26 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (729, 25, NULL, 'TEST202511107995', '2025-11-22 07:25:31', 'test_user5', 320.95, 122.57, 10.00, 2.00, 0.00, 0.65, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13889723834', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:25:31', '2025-11-24 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (730, 1, NULL, 'TEST202512037532', '2025-11-28 07:25:31', 'test_user7', 73.08, 273.66, 10.00, 1.96, 0.00, 1.48, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0873080948', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13894993305', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:25:31', NULL, '2025-12-02 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (731, 6, NULL, 'TEST202511248388', '2025-11-27 07:25:31', 'test_user19', 56.95, 525.61, 10.00, 14.29, 0.00, 7.18, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13878585126', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:28:27', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (732, 14, NULL, 'TEST202511213821', '2025-11-19 07:25:31', 'test_user5', 422.10, 143.36, 10.00, 14.02, 0.00, 9.45, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0495763315', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13811901019', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (733, 13, NULL, 'TEST202512043076', '2025-11-09 07:25:31', 'test_user3', 302.78, 185.32, 10.00, 16.73, 0.00, 3.71, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13896931844', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (734, 1, NULL, 'TEST202512011143', '2025-12-06 07:25:31', 'test_user23', 54.72, 267.86, 10.00, 3.01, 0.00, 4.44, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0424958696', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13853665819', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:25:31', '2025-12-05 07:25:31', '2025-12-01 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (735, 23, NULL, 'TEST202511160552', '2025-11-09 07:25:31', 'test_user2', 118.62, 302.19, 10.00, 2.20, 0.00, 0.38, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13836551465', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-18 07:25:31', NULL, '2025-12-02 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (736, 10, NULL, 'TEST202511131382', '2025-11-11 07:25:31', 'test_user5', 244.19, 279.97, 10.00, 2.69, 0.00, 2.93, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13823934033', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (737, 18, NULL, 'TEST202511210046', '2025-11-17 07:25:31', 'test_user7', 126.06, 80.53, 10.00, 16.98, 0.00, 0.62, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13850611268', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-26 07:25:31', '2025-11-15 07:25:31', '2025-12-08 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (738, 13, NULL, 'TEST202511257250', '2025-11-09 07:25:31', 'test_user9', 234.76, 510.38, 10.00, 9.91, 0.00, 7.14, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0258362118', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13847633923', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:25:31', '2025-11-18 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (739, 25, NULL, 'TEST202512073424', '2025-11-21 07:25:31', 'test_user16', 526.78, 539.67, 10.00, 0.72, 0.00, 2.42, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0883247366', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13818994388', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:25:31', NULL, '2025-11-19 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (740, 13, NULL, 'TEST202511283387', '2025-11-24 07:25:31', 'test_user16', 69.23, 229.74, 10.00, 13.64, 0.00, 3.32, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13820146944', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:28:27', NULL, '2025-11-28 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (741, 14, NULL, 'TEST202511152913', '2025-11-19 07:25:31', 'test_user4', 422.56, 227.02, 10.00, 10.70, 0.00, 6.12, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0165432351', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13843524911', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-18 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (742, 15, NULL, 'TEST202511204412', '2025-11-23 07:25:31', 'test_user10', 257.39, 65.38, 10.00, 18.19, 0.00, 4.55, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0994464141', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13803954422', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-24 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (743, 20, NULL, 'TEST202511234193', '2025-11-15 07:25:31', 'test_user14', 219.34, 117.70, 10.00, 13.22, 0.00, 8.99, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13883666985', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (744, 7, NULL, 'TEST202512075289', '2025-12-03 07:25:31', 'test_user13', 485.27, 489.18, 10.00, 15.60, 0.00, 2.66, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13872935818', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-20 07:25:31', '2025-11-20 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (745, 20, NULL, 'TEST202511112786', '2025-11-18 07:25:31', 'test_user18', 288.24, 247.46, 10.00, 10.90, 0.00, 5.41, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0137341761', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13893368074', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (746, 16, NULL, 'TEST202512048968', '2025-12-07 07:25:31', 'test_user2', 389.67, 137.40, 10.00, 16.72, 0.00, 6.55, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0580886864', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13832741223', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-11 07:25:31', '2025-11-26 07:25:31', '2025-12-05 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (747, 17, NULL, 'TEST202512013884', '2025-11-10 07:25:31', 'test_user4', 331.02, 236.90, 10.00, 3.66, 0.00, 7.93, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13829346334', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-27 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (748, 17, NULL, 'TEST202512081836', '2025-11-24 07:25:31', 'test_user23', 422.49, 123.62, 10.00, 10.03, 0.00, 0.65, 0.00, 2, 1, 4, 0, '圆通快递', 'SF0648350640', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13883489302', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (749, 26, NULL, 'TEST202511168907', '2025-11-14 07:25:31', 'test_user5', 127.51, 189.38, 10.00, 18.57, 0.00, 8.07, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13851271807', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-15 07:25:31', '2025-12-02 07:25:31', '2025-11-23 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (750, 23, NULL, 'TEST202512050039', '2025-11-25 07:25:31', 'test_user17', 144.89, 63.94, 10.00, 11.40, 0.00, 7.67, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13824469431', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:25:31', '2025-11-19 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (751, 1, NULL, 'TEST202511287709', '2025-11-21 07:25:31', 'test_user20', 287.41, 100.72, 10.00, 1.65, 0.00, 1.09, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13867673116', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-18 07:25:31', '2025-11-19 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (752, 26, NULL, 'TEST202512039374', '2025-11-23 07:25:31', 'test_user5', 544.59, 282.50, 10.00, 7.15, 0.00, 3.92, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0058290590', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13891838236', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:25:31', '2025-11-28 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (753, 23, NULL, 'TEST202511136825', '2025-12-01 07:25:31', 'test_user22', 80.48, 469.80, 10.00, 0.30, 0.00, 5.57, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13849895386', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-30 07:28:27', '2025-11-26 07:25:31', '2025-11-19 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (754, 13, NULL, 'TEST202511198972', '2025-11-22 07:25:31', 'test_user13', 422.65, 182.17, 10.00, 1.72, 0.00, 6.36, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0875442021', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13891967895', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:25:31', '2025-12-05 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (755, 19, NULL, 'TEST202511234455', '2025-11-11 07:25:31', 'test_user19', 118.04, 348.39, 10.00, 11.51, 0.00, 0.88, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0147785738', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13870312445', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-02 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (756, 24, NULL, 'TEST202511144094', '2025-11-26 07:25:31', 'test_user16', 406.95, 452.03, 10.00, 17.57, 0.00, 9.81, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0281218780', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13859146946', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:25:31', NULL, '2025-11-20 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (757, 13, NULL, 'TEST202511274909', '2025-11-27 07:25:31', 'test_user9', 119.06, 412.01, 10.00, 4.11, 0.00, 8.57, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0245005748', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13843669727', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-27 07:25:31', '2025-11-28 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (758, 23, NULL, 'TEST202512024829', '2025-11-24 07:25:31', 'test_user21', 256.44, 423.66, 10.00, 9.96, 0.00, 2.48, 0.00, 2, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13806468530', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:25:31', NULL, '2025-12-05 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (759, 16, NULL, 'TEST202511271450', '2025-11-12 07:25:31', 'test_user15', 222.80, 79.75, 10.00, 5.21, 0.00, 1.25, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0990878832', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13887079599', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-21 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (760, 11, NULL, 'TEST202512036496', '2025-11-09 07:25:31', 'test_user20', 417.84, 283.83, 10.00, 2.63, 0.00, 2.53, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13820546094', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-07 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (761, 26, NULL, 'TEST202511184702', '2025-11-12 07:25:31', 'test_user8', 540.56, 85.29, 10.00, 8.19, 0.00, 8.36, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13835707705', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:25:31', '2025-11-18 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (762, 7, NULL, 'TEST202511307497', '2025-11-27 07:25:31', 'test_user23', 91.05, 455.87, 10.00, 16.25, 0.00, 6.27, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0199795690', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13852228265', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-18 07:25:31', NULL, '2025-12-02 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (763, 18, NULL, 'TEST202511303093', '2025-11-24 07:25:31', 'test_user20', 414.94, 277.35, 10.00, 1.68, 0.00, 0.55, 0.00, 1, 1, 4, 0, '顺丰快递', 'SF0533802420', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13862393736', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (764, 25, NULL, 'TEST202512030809', '2025-11-16 07:25:31', 'test_user22', 526.58, 174.06, 10.00, 7.62, 0.00, 1.61, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13874489417', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-09 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (765, 7, NULL, 'TEST202511202575', '2025-11-22 07:25:31', 'test_user13', 379.61, 468.48, 10.00, 4.14, 0.00, 5.25, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0131603384', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13801050243', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-03 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (766, 22, NULL, 'TEST202511206145', '2025-11-26 07:25:31', 'test_user6', 186.15, 395.96, 10.00, 12.85, 0.00, 1.38, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13869614372', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (767, 7, NULL, 'TEST202511142429', '2025-11-16 07:25:31', 'test_user22', 211.41, 141.53, 10.00, 18.94, 0.00, 1.85, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0723220213', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13803976446', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:25:31', NULL, '2025-12-02 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (768, 14, NULL, 'TEST202511255829', '2025-11-26 07:25:31', 'test_user16', 198.19, 377.40, 10.00, 7.70, 0.00, 9.60, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0069973815', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13828543804', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:25:31', '2025-11-25 07:25:31', '2025-12-01 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (769, 16, NULL, 'TEST202511109301', '2025-11-14 07:25:31', 'test_user22', 195.14, 51.51, 10.00, 2.88, 0.00, 7.12, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13892482351', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-24 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (770, 5, NULL, 'TEST202511230323', '2025-11-15 07:25:31', 'test_user16', 508.25, 437.18, 10.00, 2.45, 0.00, 2.89, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13816547617', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-23 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (771, 25, NULL, 'TEST202511271080', '2025-12-04 07:25:31', 'test_user11', 401.48, 199.27, 10.00, 7.68, 0.00, 0.23, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13823304556', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-18 07:25:31', NULL, '2025-11-19 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (772, 19, NULL, 'TEST202511278543', '2025-11-11 07:25:31', 'test_user3', 482.94, 85.99, 10.00, 15.25, 0.00, 5.95, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13813081753', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (773, 14, NULL, 'TEST202511222311', '2025-11-23 07:25:31', 'test_user12', 349.02, 357.68, 10.00, 5.65, 0.00, 5.67, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13852609308', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-09 07:25:31', '2025-12-08 07:25:31', '2025-11-23 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (774, 11, NULL, 'TEST202511250627', '2025-12-01 07:25:31', 'test_user25', 298.57, 387.20, 10.00, 17.61, 0.00, 3.80, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13846408686', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (775, 2, NULL, 'TEST202512062938', '2025-11-17 07:25:31', 'test_user6', 135.07, 159.81, 10.00, 11.75, 0.00, 2.79, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0818852063', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13867628410', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (776, 18, NULL, 'TEST202511243573', '2025-11-26 07:25:31', 'test_user10', 469.38, 73.65, 10.00, 14.40, 0.00, 4.59, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0558262297', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13876461120', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-18 07:25:31', '2025-11-29 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (777, 8, NULL, 'TEST202511253786', '2025-11-29 07:25:31', 'test_user14', 282.96, 434.26, 10.00, 8.90, 0.00, 9.19, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13895549833', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-04 07:25:31', '2025-11-21 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (778, 17, NULL, 'TEST202511210863', '2025-11-16 07:25:31', 'test_user18', 61.60, 123.35, 10.00, 13.28, 0.00, 8.80, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0390721648', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13877079902', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:25:31', '2025-11-26 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (779, 18, NULL, 'TEST202511099568', '2025-12-04 07:25:31', 'test_user22', 146.94, 315.40, 10.00, 1.45, 0.00, 7.69, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13852951107', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-05 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (780, 12, NULL, 'TEST202511148278', '2025-11-23 07:25:31', 'test_user18', 469.56, 151.00, 10.00, 9.85, 0.00, 8.57, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13800218545', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:25:31', '2025-12-08 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (781, 21, NULL, 'TEST202512043153', '2025-12-05 07:25:31', 'test_user5', 518.09, 125.80, 10.00, 18.99, 0.00, 2.92, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0653514647', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13838584992', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:25:31', '2025-12-02 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (782, 25, NULL, 'TEST202511186245', '2025-12-02 07:25:31', 'test_user1', 206.42, 276.14, 10.00, 6.46, 0.00, 2.58, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13882975668', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-01 07:25:31', '2025-12-01 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (783, 1, NULL, 'TEST202511279295', '2025-11-11 07:25:31', 'test_user12', 297.30, 101.57, 10.00, 0.64, 0.00, 8.50, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0113024753', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13822247871', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-25 07:25:31', '2025-11-29 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (784, 25, NULL, 'TEST202511193174', '2025-11-25 07:25:31', 'test_user18', 257.83, 78.76, 10.00, 0.81, 0.00, 0.30, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0594896411', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13847261659', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-03 07:25:32', '2025-11-17 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (785, 7, NULL, 'TEST202511246600', '2025-11-21 07:25:31', 'test_user23', 185.85, 453.75, 10.00, 4.45, 0.00, 6.89, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0181595133', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13825390430', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (786, 19, NULL, 'TEST202511235580', '2025-11-13 07:25:31', 'test_user6', 198.30, 500.28, 10.00, 12.26, 0.00, 3.63, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0387194409', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13879390868', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:25:31', '2025-12-02 07:25:31', '2025-11-20 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (787, 8, NULL, 'TEST202511306213', '2025-11-30 07:25:31', 'test_user7', 216.86, 525.00, 10.00, 14.98, 0.00, 8.94, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13888830481', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:25:31', '2025-12-04 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (788, 21, NULL, 'TEST202511214528', '2025-11-28 07:25:31', 'test_user15', 223.28, 104.90, 10.00, 10.19, 0.00, 2.17, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0316666075', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13885630516', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (789, 18, NULL, 'TEST202511227295', '2025-12-06 07:25:31', 'test_user26', 438.82, 504.19, 10.00, 4.18, 0.00, 3.20, 0.00, 2, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13805988741', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-26 07:25:31', NULL, '2025-12-06 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (790, 25, NULL, 'TEST202512030473', '2025-11-23 07:25:31', 'test_user18', 196.19, 250.66, 10.00, 2.59, 0.00, 4.43, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13847555489', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-29 07:25:31', '2025-12-08 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (791, 12, NULL, 'TEST202511233606', '2025-11-25 07:25:31', 'test_user6', 519.92, 93.05, 10.00, 12.22, 0.00, 7.97, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0561138354', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13838498155', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-24 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (792, 23, NULL, 'TEST202511273801', '2025-11-12 07:25:31', 'test_user20', 333.85, 356.85, 10.00, 7.31, 0.00, 9.86, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13824544313', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-03 07:25:31', NULL, '2025-11-25 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (793, 4, NULL, 'TEST202511120071', '2025-11-30 07:25:31', 'test_user11', 53.20, 457.67, 10.00, 1.15, 0.00, 8.42, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0626722782', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13851254786', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:25:31', '2025-11-18 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (794, 8, NULL, 'TEST202511228640', '2025-11-20 07:25:31', 'test_user18', 391.42, 274.57, 10.00, 3.94, 0.00, 6.39, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13856608993', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:25:32', '2025-11-19 07:25:31', '2025-12-01 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (795, 16, NULL, 'TEST202511134267', '2025-11-20 07:25:31', 'test_user17', 467.94, 204.83, 10.00, 0.81, 0.00, 2.74, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0947611942', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13859642687', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-01 07:25:31', '2025-11-30 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (796, 19, NULL, 'TEST202511234233', '2025-11-13 07:25:31', 'test_user16', 398.94, 404.34, 10.00, 9.00, 0.00, 1.23, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13823880403', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:25:31', '2025-11-15 07:25:31', '2025-11-24 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (797, 9, NULL, 'TEST202511124095', '2025-11-27 07:25:31', 'test_user11', 446.38, 425.46, 10.00, 7.53, 0.00, 6.29, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0956579732', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13807869215', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (798, 6, NULL, 'TEST202511307548', '2025-12-03 07:25:31', 'test_user24', 213.67, 490.77, 10.00, 8.51, 0.00, 4.84, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0184434067', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13870634278', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:25:31', NULL, '2025-11-26 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (799, 21, NULL, 'TEST202511180422', '2025-11-15 07:25:31', 'test_user5', 437.52, 217.08, 10.00, 6.91, 0.00, 7.26, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13807183507', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (800, 18, NULL, 'TEST202511168084', '2025-11-10 07:25:31', 'test_user21', 266.83, 476.48, 10.00, 19.28, 0.00, 2.60, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0184318481', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13861818216', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:25:31', NULL, '2025-11-25 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (801, 20, NULL, 'TEST202511250047', '2025-11-15 07:25:31', 'test_user18', 190.51, 264.00, 10.00, 5.94, 0.00, 2.01, 0.00, 1, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13858132829', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-26 07:25:31', '2025-11-20 07:25:31', '2025-12-01 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (802, 18, NULL, 'TEST202511235607', '2025-11-29 07:25:31', 'test_user8', 409.81, 428.50, 10.00, 12.52, 0.00, 8.60, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13851449958', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:25:31', '2025-12-01 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (803, 24, NULL, 'TEST202511144226', '2025-12-05 07:25:31', 'test_user17', 529.76, 480.59, 10.00, 8.55, 0.00, 5.53, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13826698928', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (804, 10, NULL, 'TEST202512063228', '2025-11-19 07:25:31', 'test_user9', 397.19, 287.10, 10.00, 5.76, 0.00, 0.17, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0496293713', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13898995144', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:25:32', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (805, 21, NULL, 'TEST202511162744', '2025-12-03 07:25:31', 'test_user5', 542.66, 270.69, 10.00, 5.02, 0.00, 9.31, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13886313785', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (806, 2, NULL, 'TEST202511234176', '2025-11-26 07:25:31', 'test_user15', 275.91, 368.12, 10.00, 16.51, 0.00, 2.20, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0991771396', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13824547495', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:25:31', '2025-11-18 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (807, 10, NULL, 'TEST202511106888', '2025-12-04 07:25:31', 'test_user16', 461.26, 239.63, 10.00, 8.57, 0.00, 0.06, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13876396922', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:25:31', NULL, '2025-11-26 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (808, 18, NULL, 'TEST202511294958', '2025-11-18 07:25:31', 'test_user15', 244.18, 158.11, 10.00, 18.32, 0.00, 9.31, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0895105161', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13897634286', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-14 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (809, 7, NULL, 'TEST202511254443', '2025-11-17 07:25:31', 'test_user23', 84.07, 399.99, 10.00, 5.91, 0.00, 3.77, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13820805897', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:25:31', '2025-12-01 07:25:31', '2025-11-25 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (810, 1, NULL, 'TEST202511209612', '2025-12-05 07:25:31', 'test_user26', 89.61, 259.18, 10.00, 17.08, 0.00, 0.16, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0374445199', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13816080111', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:25:31', NULL, '2025-11-26 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (811, 17, NULL, 'TEST202511262724', '2025-11-16 07:25:31', 'test_user3', 366.51, 497.44, 10.00, 11.51, 0.00, 1.92, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0991932496', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13843185736', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-27 07:25:31', '2025-11-14 07:25:31', '2025-11-20 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (812, 11, NULL, 'TEST202511269320', '2025-11-30 07:25:31', 'test_user10', 84.35, 162.26, 10.00, 18.33, 0.00, 9.09, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0063201765', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13851924298', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:25:31', '2025-11-21 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (813, 1, NULL, 'TEST202512055205', '2025-11-23 07:25:31', 'test_user7', 406.19, 448.78, 10.00, 17.01, 0.00, 8.61, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0838483419', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13843828334', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:25:31', '2025-11-14 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (814, 22, NULL, 'TEST202511215247', '2025-11-30 07:25:31', 'test_user22', 344.12, 271.85, 10.00, 9.08, 0.00, 9.38, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13867069303', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:25:31', '2025-11-24 07:25:31', '2025-11-27 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (815, 19, NULL, 'TEST202511122389', '2025-11-23 07:25:31', 'test_user16', 149.50, 172.74, 10.00, 12.61, 0.00, 4.15, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13894978216', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:25:31', '2025-11-27 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (816, 17, NULL, 'TEST202512049489', '2025-11-30 07:25:31', 'test_user7', 269.71, 262.64, 10.00, 16.16, 0.00, 7.65, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0690843847', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13814511016', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-29 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (817, 15, NULL, 'TEST202512015848', '2025-11-24 07:25:31', 'test_user5', 75.48, 435.73, 10.00, 14.09, 0.00, 2.08, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13855657280', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:25:32', '2025-11-29 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (818, 6, NULL, 'TEST202511101986', '2025-11-23 07:25:31', 'test_user4', 62.78, 427.40, 10.00, 13.95, 0.00, 2.22, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13846901712', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (819, 10, NULL, 'TEST202512037736', '2025-12-04 07:25:31', 'test_user9', 246.88, 520.02, 10.00, 10.38, 0.00, 7.75, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0411247043', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13885170123', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:25:31', NULL, '2025-11-21 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (820, 4, NULL, 'TEST202511206619', '2025-11-25 07:25:31', 'test_user12', 177.57, 515.56, 10.00, 17.80, 0.00, 6.57, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13803573031', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-03 07:25:31', '2025-11-28 07:25:31', '2025-11-23 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (821, 8, NULL, 'TEST202512030272', '2025-11-12 07:25:31', 'test_user17', 87.11, 288.73, 10.00, 3.29, 0.00, 3.91, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13837142455', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:25:31', '2025-11-15 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (822, 25, NULL, 'TEST202511288972', '2025-12-04 07:25:31', 'test_user11', 250.08, 422.80, 10.00, 10.55, 0.00, 4.01, 0.00, 1, 1, 4, 0, '圆通快递', 'SF0948349156', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13877514819', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-18 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (823, 24, NULL, 'TEST202511307228', '2025-11-17 07:25:31', 'test_user20', 299.02, 195.10, 10.00, 19.14, 0.00, 9.14, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0035716507', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13884437116', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:25:31', '2025-11-23 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (824, 8, NULL, 'TEST202511108537', '2025-11-10 07:25:31', 'test_user11', 304.10, 199.64, 10.00, 19.44, 0.00, 9.61, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13830032532', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (825, 23, NULL, 'TEST202511127946', '2025-11-25 07:25:31', 'test_user9', 141.50, 537.45, 10.00, 6.51, 0.00, 7.03, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0501816365', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13800583058', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:25:31', '2025-12-02 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (826, 14, NULL, 'TEST202511196613', '2025-11-17 07:25:31', 'test_user10', 479.29, 143.64, 10.00, 7.21, 0.00, 2.42, 0.00, 1, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13828285193', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (827, 15, NULL, 'TEST202511205222', '2025-11-20 07:25:31', 'test_user19', 545.59, 460.56, 10.00, 2.64, 0.00, 1.97, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0631657829', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13803477138', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-02 07:25:31', '2025-11-26 07:25:31', '2025-11-24 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (828, 5, NULL, 'TEST202511128572', '2025-12-01 07:25:31', 'test_user17', 377.80, 220.78, 10.00, 14.82, 0.00, 6.80, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13800402277', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (829, 17, NULL, 'TEST202511090435', '2025-11-22 07:25:31', 'test_user7', 138.48, 100.11, 10.00, 19.40, 0.00, 5.51, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0444121722', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13805977050', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (830, 22, NULL, 'TEST202511282342', '2025-11-22 07:25:31', 'test_user4', 529.33, 248.27, 10.00, 2.13, 0.00, 3.44, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13874193916', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:25:31', NULL, '2025-12-02 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (831, 17, NULL, 'TEST202511176897', '2025-11-18 07:25:31', 'test_user8', 204.28, 408.05, 10.00, 13.10, 0.00, 1.26, 0.00, 2, 1, 4, 0, '顺丰快递', 'SF0790102780', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13849078272', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:25:31', '2025-11-29 07:25:31', '2025-11-29 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (832, 25, NULL, 'TEST202511091689', '2025-11-29 07:25:31', 'test_user23', 412.84, 94.40, 10.00, 5.34, 0.00, 0.68, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0922520531', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13857227552', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-03 07:25:31', '2025-12-04 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (833, 3, NULL, 'TEST202511207503', '2025-12-04 07:25:31', 'test_user25', 275.34, 266.21, 10.00, 16.20, 0.00, 7.53, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13818745218', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-05 07:25:31', '2025-11-22 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (834, 19, NULL, 'TEST202512046350', '2025-11-23 07:25:31', 'test_user19', 389.77, 173.44, 10.00, 3.91, 0.00, 2.38, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0834281814', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13856909895', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:25:31', NULL, '2025-11-27 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (835, 17, NULL, 'TEST202511262754', '2025-11-16 07:25:31', 'test_user3', 366.28, 493.75, 10.00, 10.80, 0.00, 0.37, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13884985658', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-28 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (836, 19, NULL, 'TEST202511269484', '2025-11-27 07:25:31', 'test_user13', 327.14, 215.76, 10.00, 19.90, 0.00, 9.79, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13882922692', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (837, 13, NULL, 'TEST202511309896', '2025-11-11 07:25:31', 'test_user3', 333.66, 307.40, 10.00, 17.44, 0.00, 8.16, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13859483815', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-15 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (838, 9, NULL, 'TEST202511201659', '2025-11-22 07:25:31', 'test_user25', 198.40, 353.58, 10.00, 2.91, 0.00, 9.06, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0493160709', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13842872756', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:25:31', '2025-11-21 07:25:31', '2025-11-23 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (839, 23, NULL, 'TEST202512016831', '2025-12-06 07:25:31', 'test_user18', 208.22, 331.38, 10.00, 17.29, 0.00, 6.34, 0.00, 2, 1, 4, 0, '圆通快递', 'SF0230002175', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13874922915', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (840, 5, NULL, 'TEST202512025991', '2025-12-05 07:25:31', 'test_user9', 421.08, 443.47, 10.00, 14.16, 0.00, 1.80, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0468195713', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13836057518', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:25:31', NULL, '2025-11-19 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (841, 12, NULL, 'TEST202512019557', '2025-11-16 07:25:31', 'test_user1', 201.50, 256.46, 10.00, 3.11, 0.00, 5.39, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13847238871', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (842, 22, NULL, 'TEST202511275157', '2025-12-01 07:25:31', 'test_user11', 282.27, 107.82, 10.00, 3.69, 0.00, 5.76, 0.00, 1, 1, 4, 0, '顺丰快递', 'SF0160424751', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13826686531', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:25:31', NULL, '2025-12-04 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (843, 18, NULL, 'TEST202511140197', '2025-11-17 07:25:31', 'test_user19', 251.49, 518.77, 10.00, 9.57, 0.00, 5.81, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13860434688', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-28 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (844, 4, NULL, 'TEST202512026514', '2025-12-01 07:25:31', 'test_user17', 178.89, 230.82, 10.00, 0.70, 0.00, 0.89, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0507496839', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13894303912', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-03 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (845, 14, NULL, 'TEST202511239679', '2025-11-22 07:25:31', 'test_user8', 364.43, 162.31, 10.00, 4.73, 0.00, 5.09, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0051124683', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13855047995', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:25:31', '2025-11-26 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (846, 3, NULL, 'TEST202511233117', '2025-12-06 07:25:31', 'test_user1', 115.99, 359.79, 10.00, 14.04, 0.00, 6.51, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13863201058', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:25:31', '2025-12-04 07:25:31', '2025-11-19 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (847, 9, NULL, 'TEST202512013518', '2025-12-02 07:25:31', 'test_user26', 447.19, 80.96, 10.00, 18.53, 0.00, 4.46, 0.00, 1, 1, 4, 0, '圆通快递', 'SF0977574648', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13818035332', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:25:31', NULL, NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (848, 23, NULL, 'TEST202511256058', '2025-11-15 07:25:31', 'test_user19', 433.58, 392.49, 10.00, 2.47, 0.00, 5.62, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0757369302', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13815574796', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:25:31', '2025-11-22 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (849, 20, NULL, 'TEST202511147654', '2025-11-21 07:25:31', 'test_user11', 400.48, 203.16, 10.00, 8.57, 0.00, 2.25, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0499163979', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13899288911', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:25:31', '2025-12-01 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (850, 13, NULL, 'TEST202511282967', '2025-11-28 07:25:31', 'test_user12', 230.85, 278.67, 10.00, 4.03, 0.00, 6.36, 0.00, 2, 1, 4, 0, '圆通快递', 'SF0213556185', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13892259799', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:25:31', '2025-12-08 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (851, 16, NULL, 'TEST202511118126', '2025-11-13 07:25:31', 'test_user8', 506.34, 426.51, 10.00, 0.54, 0.00, 8.76, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0053380815', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13886689160', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:25:31', '2025-11-28 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (852, 24, NULL, 'TEST202511299128', '2025-11-19 07:25:31', 'test_user16', 145.37, 148.10, 10.00, 8.18, 0.00, 4.55, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0678962457', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13847103088', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:25:31', '2025-11-20 07:25:31', '2025-12-08 07:25:31', NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (853, 21, NULL, 'TEST202512060049', '2025-12-02 07:25:31', 'test_user22', 86.24, 504.98, 10.00, 6.65, 0.00, 9.32, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13811342005', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-27 07:25:31', '2025-11-24 07:25:31', NULL, NULL, '2025-12-08 07:25:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (909, 5, NULL, 'TEST202511222340', '2025-11-29 07:28:26', 'test_user15', 80.20, 372.24, 10.00, 0.82, 0.00, 2.73, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0188681085', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13800169841', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (910, 25, NULL, 'TEST202511210160', '2025-11-24 07:28:26', 'test_user10', 422.46, 374.41, 10.00, 0.19, 0.00, 1.00, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13825675479', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:28:27', '2025-11-27 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (911, 3, NULL, 'TEST202511259800', '2025-11-19 07:28:26', 'test_user14', 411.83, 59.99, 10.00, 18.58, 0.00, 5.85, 0.00, 1, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13830962396', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (912, 20, NULL, 'TEST202512053740', '2025-11-11 07:28:26', 'test_user13', 190.20, 530.26, 10.00, 19.23, 0.00, 9.25, 0.00, 2, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13859686402', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (913, 20, NULL, 'TEST202512061683', '2025-11-25 07:28:26', 'test_user16', 245.43, 158.40, 10.00, 18.23, 0.00, 9.07, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13875801504', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:28:26', '2025-12-04 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (914, 2, NULL, 'TEST202511295056', '2025-11-24 07:28:26', 'test_user15', 180.19, 367.74, 10.00, 7.92, 0.00, 0.75, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0360315942', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13830774333', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-22 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (915, 18, NULL, 'TEST202511227112', '2025-11-16 07:28:26', 'test_user24', 244.74, 166.77, 10.00, 19.99, 0.00, 2.96, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13882696105', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-17 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (916, 19, NULL, 'TEST202511209070', '2025-11-26 07:28:26', 'test_user18', 397.89, 264.41, 10.00, 1.13, 0.00, 9.97, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0570393937', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13887752391', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-18 07:28:27', '2025-11-18 07:28:26', '2025-12-02 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (917, 22, NULL, 'TEST202511110823', '2025-11-18 07:28:26', 'test_user18', 89.92, 251.51, 10.00, 15.51, 0.00, 6.69, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0533603484', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13896902837', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:28:27', '2025-11-21 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (918, 11, NULL, 'TEST202512010785', '2025-11-21 07:28:26', 'test_user16', 450.06, 139.60, 10.00, 9.91, 0.00, 9.40, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13849099035', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-18 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (919, 7, NULL, 'TEST202512074658', '2025-11-15 07:28:26', 'test_user6', 381.14, 387.79, 10.00, 7.82, 0.00, 9.28, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13851474840', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:28:26', NULL, '2025-12-08 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (920, 4, NULL, 'TEST202511129757', '2025-11-26 07:28:26', 'test_user6', 128.79, 118.49, 10.00, 4.24, 0.00, 6.50, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13885653005', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:28:26', '2025-11-18 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (921, 9, NULL, 'TEST202511099059', '2025-11-23 07:28:26', 'test_user17', 252.91, 127.48, 10.00, 11.15, 0.00, 3.22, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0497046852', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13837203411', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:28:26', '2025-11-16 07:28:26', '2025-11-29 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (922, 2, NULL, 'TEST202511217423', '2025-11-17 07:28:26', 'test_user26', 413.63, 381.87, 10.00, 2.74, 0.00, 6.93, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0429590628', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13861311354', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (923, 6, NULL, 'TEST202511205776', '2025-11-30 07:28:26', 'test_user26', 171.79, 166.02, 10.00, 8.59, 0.00, 4.51, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13869465512', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (924, 21, NULL, 'TEST202511267301', '2025-11-23 07:28:26', 'test_user11', 470.51, 543.09, 10.00, 8.16, 0.00, 0.81, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0822466524', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13878315562', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:28:26', '2025-12-02 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (925, 24, NULL, 'TEST202512066429', '2025-11-16 07:28:26', 'test_user26', 58.70, 109.64, 10.00, 10.88, 0.00, 3.63, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13820058149', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (926, 7, NULL, 'TEST202512057164', '2025-11-13 07:28:26', 'test_user8', 162.72, 201.17, 10.00, 16.71, 0.00, 2.70, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13878600266', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (927, 11, NULL, 'TEST202511259696', '2025-11-30 07:28:26', 'test_user14', 383.40, 444.27, 10.00, 18.85, 0.00, 3.46, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0503443225', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13858524516', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-11 07:28:26', '2025-12-05 07:28:26', '2025-12-02 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (928, 24, NULL, 'TEST202511254396', '2025-11-23 07:28:26', 'test_user23', 87.38, 418.81, 10.00, 9.28, 0.00, 1.06, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13863396471', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-26 07:28:26', '2025-11-24 07:28:26', '2025-12-07 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (929, 10, NULL, 'TEST202511303564', '2025-11-18 07:28:26', 'test_user25', 339.00, 100.81, 10.00, 15.48, 0.00, 5.66, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0835580824', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13800610856', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (930, 10, NULL, 'TEST202511209947', '2025-12-03 07:28:26', 'test_user3', 340.21, 331.65, 10.00, 1.50, 0.00, 6.86, 0.00, 1, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13832667380', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:28:26', NULL, '2025-11-30 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (931, 20, NULL, 'TEST202511148339', '2025-11-16 07:28:26', 'test_user19', 54.67, 519.96, 10.00, 13.43, 0.00, 5.38, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0791114828', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13898905753', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-18 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (932, 8, NULL, 'TEST202511132728', '2025-11-22 07:28:26', 'test_user23', 286.44, 444.76, 10.00, 10.58, 0.00, 2.76, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13823757997', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:28:26', '2025-11-29 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (933, 23, NULL, 'TEST202511144937', '2025-11-27 07:28:26', 'test_user1', 391.19, 206.86, 10.00, 10.43, 0.00, 6.66, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0918037478', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13847349334', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-16 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (934, 3, NULL, 'TEST202512044533', '2025-11-29 07:28:26', 'test_user22', 484.04, 451.78, 10.00, 8.27, 0.00, 6.57, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0074508533', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13824173212', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (935, 5, NULL, 'TEST202511249679', '2025-12-06 07:28:26', 'test_user10', 511.41, 309.08, 10.00, 16.45, 0.00, 5.57, 0.00, 1, 1, 4, 0, '顺丰快递', 'SF0828929365', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13873191563', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-21 07:28:26', '2025-12-06 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (936, 4, NULL, 'TEST202511240454', '2025-11-29 07:28:26', 'test_user21', 452.36, 379.49, 10.00, 17.61, 0.00, 4.27, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0391271853', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13873256181', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (937, 20, NULL, 'TEST202511173769', '2025-12-07 07:28:26', 'test_user19', 252.76, 502.91, 10.00, 6.25, 0.00, 8.45, 0.00, 1, 1, 4, 0, '顺丰快递', 'SF0899261655', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13816952822', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-30 07:28:26', '2025-11-23 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (938, 26, NULL, 'TEST202511228378', '2025-11-28 07:28:26', 'test_user14', 63.92, 357.18, 10.00, 19.77, 0.00, 0.98, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0276517337', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13830007246', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:28:26', '2025-11-24 07:28:26', '2025-11-25 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (939, 7, NULL, 'TEST202511150866', '2025-11-21 07:28:26', 'test_user4', 216.15, 203.11, 10.00, 10.68, 0.00, 7.52, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13875155732', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-02 07:28:26', '2025-11-15 07:28:26', '2025-12-06 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (940, 6, NULL, 'TEST202511204361', '2025-12-05 07:28:26', 'test_user9', 257.42, 70.12, 10.00, 19.13, 0.00, 6.63, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13809197716', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-19 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (941, 12, NULL, 'TEST202511232878', '2025-11-19 07:28:26', 'test_user23', 264.13, 333.11, 10.00, 10.93, 0.00, 0.33, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0712758173', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13885730803', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-25 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (942, 11, NULL, 'TEST202511267610', '2025-12-05 07:28:26', 'test_user16', 420.81, 496.62, 10.00, 4.83, 0.00, 5.27, 0.00, 2, 1, 4, 0, '圆通快递', 'SF0512633521', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13845419666', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-19 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (943, 11, NULL, 'TEST202511293212', '2025-11-20 07:28:26', 'test_user18', 220.69, 411.87, 10.00, 11.89, 0.00, 8.02, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13825437778', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:28:26', '2025-11-19 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (944, 10, NULL, 'TEST202511158107', '2025-11-30 07:28:26', 'test_user19', 145.38, 439.99, 10.00, 6.55, 0.00, 2.98, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0522685359', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13873162420', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (945, 5, NULL, 'TEST202512017144', '2025-11-30 07:28:26', 'test_user22', 518.95, 170.36, 10.00, 7.80, 0.00, 2.27, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0783107990', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13806894656', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (946, 6, NULL, 'TEST202512023628', '2025-11-23 07:28:26', 'test_user6', 495.51, 483.71, 10.00, 13.28, 0.00, 7.18, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13854220727', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:28:26', '2025-11-23 07:28:26', '2025-12-05 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (947, 24, NULL, 'TEST202511177985', '2025-11-27 07:28:26', 'test_user23', 484.33, 442.41, 10.00, 6.36, 0.00, 2.36, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0031862416', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13878625946', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:28:26', '2025-12-06 07:28:26', '2025-12-02 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (948, 8, NULL, 'TEST202511202734', '2025-11-11 07:28:26', 'test_user14', 407.24, 75.80, 10.00, 2.29, 0.00, 4.18, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13840014144', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:28:26', NULL, '2025-11-30 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (949, 20, NULL, 'TEST202511207338', '2025-12-05 07:28:26', 'test_user23', 99.51, 507.37, 10.00, 5.53, 0.00, 6.39, 0.00, 1, 1, 4, 0, '圆通快递', 'SF0368350508', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13889730201', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-02 07:28:26', '2025-12-07 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (950, 8, NULL, 'TEST202511185871', '2025-11-20 07:28:26', 'test_user24', 394.65, 437.99, 10.00, 16.24, 0.00, 7.32, 0.00, 1, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13824945993', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (951, 11, NULL, 'TEST202511148232', '2025-12-07 07:28:26', 'test_user19', 63.97, 70.51, 10.00, 2.43, 0.00, 4.83, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13857888271', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:28:26', '2025-12-04 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (952, 6, NULL, 'TEST202511204593', '2025-11-15 07:28:26', 'test_user12', 429.72, 307.39, 10.00, 5.91, 0.00, 9.34, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0542563923', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13861475928', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:28:26', '2025-11-25 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (953, 16, NULL, 'TEST202511228640', '2025-12-05 07:28:26', 'test_user19', 514.16, 314.63, 10.00, 17.23, 0.00, 7.19, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0406299583', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13869302376', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:28:26', '2025-12-02 07:28:26', '2025-12-07 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (954, 5, NULL, 'TEST202511188728', '2025-12-01 07:28:26', 'test_user9', 529.95, 476.20, 10.00, 7.65, 0.00, 3.54, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13868285762', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:28:27', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (955, 12, NULL, 'TEST202511259357', '2025-11-13 07:28:26', 'test_user9', 497.95, 278.79, 10.00, 12.00, 0.00, 6.28, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0867231595', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13804047678', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (956, 5, NULL, 'TEST202511257073', '2025-11-09 07:28:26', 'test_user7', 69.42, 298.83, 10.00, 7.43, 0.00, 3.66, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0553417699', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13863246116', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-09 07:28:26', '2025-11-25 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (957, 17, NULL, 'TEST202511133527', '2025-11-29 07:28:26', 'test_user5', 495.57, 493.04, 10.00, 15.14, 0.00, 1.27, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13883563039', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (958, 21, NULL, 'TEST202511215971', '2025-11-14 07:28:26', 'test_user6', 163.73, 313.00, 10.00, 18.95, 0.00, 1.60, 0.00, 2, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13848335385', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (959, 21, NULL, 'TEST202511215505', '2025-11-19 07:28:26', 'test_user26', 211.30, 364.19, 10.00, 3.48, 0.00, 9.85, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13800732343', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:28:27', '2025-12-02 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (960, 3, NULL, 'TEST202511165270', '2025-11-11 07:28:26', 'test_user10', 198.95, 231.05, 10.00, 18.34, 0.00, 4.98, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13882336562', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (961, 1, NULL, 'TEST202511106140', '2025-11-22 07:28:26', 'test_user7', 291.14, 358.37, 10.00, 12.74, 0.00, 3.34, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13886053763', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:28:26', '2025-11-26 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (962, 20, NULL, 'TEST202511241692', '2025-12-08 07:28:26', 'test_user11', 276.26, 93.21, 10.00, 1.49, 0.00, 1.14, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13839392211', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (963, 20, NULL, 'TEST202512019185', '2025-11-28 07:28:26', 'test_user23', 363.83, 304.13, 10.00, 13.17, 0.00, 7.67, 0.00, 2, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13891031414', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:28:26', '2025-11-19 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (964, 21, NULL, 'TEST202511139178', '2025-11-13 07:28:26', 'test_user2', 299.64, 222.36, 10.00, 4.51, 0.00, 0.94, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13850837548', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:28:26', '2025-12-01 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (965, 9, NULL, 'TEST202512064291', '2025-11-21 07:28:26', 'test_user25', 227.41, 544.33, 10.00, 17.58, 0.00, 4.28, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0504101875', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13839642316', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (966, 17, NULL, 'TEST202512081463', '2025-11-09 07:28:26', 'test_user19', 152.52, 469.38, 10.00, 11.57, 0.00, 3.77, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13836098043', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-18 07:28:26', '2025-11-19 07:28:26', '2025-12-01 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (967, 25, NULL, 'TEST202511228545', '2025-11-11 07:28:26', 'test_user17', 395.94, 303.07, 10.00, 9.10, 0.00, 7.57, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0582970915', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13833096378', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (968, 11, NULL, 'TEST202511268287', '2025-11-24 07:28:26', 'test_user24', 543.69, 176.33, 10.00, 6.02, 0.00, 7.48, 0.00, 2, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13884778847', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:28:26', NULL, '2025-12-03 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (969, 4, NULL, 'TEST202511215034', '2025-11-15 07:28:26', 'test_user21', 276.69, 494.32, 10.00, 1.66, 0.00, 7.49, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0164848904', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13866690838', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-20 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (970, 19, NULL, 'TEST202511250068', '2025-11-13 07:28:26', 'test_user19', 336.64, 405.05, 10.00, 16.61, 0.00, 0.23, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0015003450', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13815128316', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:28:27', '2025-11-29 07:28:26', '2025-12-07 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (971, 24, NULL, 'TEST202512031942', '2025-11-19 07:28:26', 'test_user12', 367.11, 470.45, 10.00, 6.04, 0.00, 9.87, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13888997733', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (972, 19, NULL, 'TEST202511234714', '2025-11-18 07:28:26', 'test_user21', 328.59, 251.47, 10.00, 6.86, 0.00, 5.07, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0622037474', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13899605835', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-02 07:28:27', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (973, 21, NULL, 'TEST202511292102', '2025-11-17 07:28:26', 'test_user3', 493.24, 111.03, 10.00, 19.02, 0.00, 3.88, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0885465117', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13803537548', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:28:26', '2025-11-29 07:28:26', '2025-12-08 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (974, 16, NULL, 'TEST202511150791', '2025-12-01 07:28:26', 'test_user2', 103.85, 215.69, 10.00, 6.68, 0.00, 6.75, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0099805327', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13820767975', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (975, 11, NULL, 'TEST202511232633', '2025-12-01 07:28:26', 'test_user22', 189.97, 528.83, 10.00, 18.97, 0.00, 8.69, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13851039807', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (976, 8, NULL, 'TEST202511185873', '2025-11-25 07:28:26', 'test_user23', 373.57, 345.11, 10.00, 0.19, 0.00, 2.78, 0.00, 1, 1, 4, 0, '顺丰快递', 'SF0165849820', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13832602755', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-02 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (977, 13, NULL, 'TEST202511120349', '2025-11-23 07:28:26', 'test_user13', 200.95, 82.68, 10.00, 8.42, 0.00, 9.10, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0142689440', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13816732423', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (978, 17, NULL, 'TEST202511184062', '2025-11-29 07:28:26', 'test_user1', 493.01, 233.62, 10.00, 3.56, 0.00, 7.89, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13895849355', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:28:26', '2025-12-02 07:28:26', '2025-12-08 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (979, 10, NULL, 'TEST202511165776', '2025-11-16 07:28:26', 'test_user18', 341.42, 512.38, 10.00, 17.51, 0.00, 6.02, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0659158618', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13867803018', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:28:26', '2025-11-26 07:28:26', '2025-12-06 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (980, 8, NULL, 'TEST202511246049', '2025-11-12 07:28:26', 'test_user15', 59.59, 247.74, 10.00, 18.40, 0.00, 4.13, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0648819842', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13888300081', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (981, 19, NULL, 'TEST202511173464', '2025-12-02 07:28:26', 'test_user16', 58.88, 177.24, 10.00, 4.38, 0.00, 3.32, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13803402821', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-15 07:28:27', NULL, '2025-11-19 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (982, 18, NULL, 'TEST202511175068', '2025-11-21 07:28:26', 'test_user11', 328.56, 319.54, 10.00, 0.48, 0.00, 5.03, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0901016934', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13827664627', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (983, 9, NULL, 'TEST202511106711', '2025-12-03 07:28:26', 'test_user14', 377.19, 385.60, 10.00, 7.86, 0.00, 9.51, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0121136457', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13884676429', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:28:27', '2025-11-23 07:28:26', '2025-12-02 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (984, 9, NULL, 'TEST202512057293', '2025-12-02 07:28:26', 'test_user7', 88.45, 362.73, 10.00, 17.93, 0.00, 6.07, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0602971050', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13833787470', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:28:26', NULL, '2025-11-21 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (985, 11, NULL, 'TEST202512053789', '2025-11-28 07:28:26', 'test_user15', 386.91, 391.34, 10.00, 7.84, 0.00, 9.12, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13886306997', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:28:26', '2025-12-01 07:28:26', '2025-12-01 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (986, 11, NULL, 'TEST202511182683', '2025-12-02 07:28:26', 'test_user7', 286.25, 347.95, 10.00, 11.24, 0.00, 0.22, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0636599170', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13887507458', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:28:27', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (987, 21, NULL, 'TEST202512027719', '2025-11-28 07:28:26', 'test_user5', 364.80, 340.40, 10.00, 0.30, 0.00, 3.33, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13831681089', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-04 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (988, 26, NULL, 'TEST202511167323', '2025-11-17 07:28:26', 'test_user12', 527.31, 291.06, 10.00, 10.93, 0.00, 2.87, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0900835751', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13818797749', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:28:26', '2025-12-03 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (989, 15, NULL, 'TEST202511117854', '2025-12-06 07:28:26', 'test_user6', 418.14, 62.95, 10.00, 18.41, 0.00, 5.26, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0519976487', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13830826957', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-01 07:28:26', '2025-11-26 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (990, 12, NULL, 'TEST202511139410', '2025-11-20 07:28:26', 'test_user4', 475.32, 474.50, 10.00, 13.86, 0.00, 9.18, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13892929296', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-29 07:28:26', '2025-11-24 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (991, 22, NULL, 'TEST202511309031', '2025-11-18 07:28:26', 'test_user19', 441.29, 458.81, 10.00, 14.81, 0.00, 2.49, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0378279517', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13828000613', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:28:26', '2025-11-28 07:28:26', '2025-11-20 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (992, 17, NULL, 'TEST202511244868', '2025-11-17 07:28:26', 'test_user26', 262.11, 145.07, 10.00, 13.56, 0.00, 8.20, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13875530620', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (993, 2, NULL, 'TEST202511122853', '2025-11-18 07:28:26', 'test_user20', 500.16, 173.88, 10.00, 10.76, 0.00, 9.46, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0860648280', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13808170647', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:28:26', NULL, '2025-12-02 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (994, 21, NULL, 'TEST202511309780', '2025-11-11 07:28:26', 'test_user3', 307.57, 203.05, 10.00, 19.70, 0.00, 0.07, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13812758207', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-06 07:28:26', '2025-11-26 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (995, 19, NULL, 'TEST202512029812', '2025-12-07 07:28:26', 'test_user6', 130.18, 119.69, 10.00, 4.32, 0.00, 6.61, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0763817945', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13845011204', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:28:26', NULL, '2025-12-01 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (996, 23, NULL, 'TEST202511256482', '2025-11-22 07:28:26', 'test_user23', 261.01, 294.97, 10.00, 3.67, 0.00, 4.48, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13813460192', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:28:26', '2025-12-01 07:28:26', '2025-11-28 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (997, 22, NULL, 'TEST202512034194', '2025-12-04 07:28:26', 'test_user16', 377.75, 314.55, 10.00, 13.58, 0.00, 8.08, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0826541185', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13824867827', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-03 07:28:26', '2025-12-05 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (998, 22, NULL, 'TEST202511197914', '2025-11-27 07:28:26', 'test_user26', 269.41, 203.12, 10.00, 4.29, 0.00, 1.55, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13890272640', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-21 07:28:26', '2025-11-18 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (999, 24, NULL, 'TEST202512023218', '2025-12-02 07:28:26', 'test_user26', 549.31, 57.30, 10.00, 1.54, 0.00, 3.42, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0327271328', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13860103675', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1000, 15, NULL, 'TEST202511280761', '2025-11-19 07:28:26', 'test_user10', 325.13, 392.04, 10.00, 15.39, 0.00, 7.96, 0.00, 2, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13899711030', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:28:26', '2025-11-28 07:28:26', '2025-12-03 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1001, 7, NULL, 'TEST202511271623', '2025-11-16 07:28:26', 'test_user18', 484.99, 217.82, 10.00, 1.37, 0.00, 3.34, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13833699781', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:28:26', NULL, '2025-11-30 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1002, 18, NULL, 'TEST202511106356', '2025-11-10 07:28:26', 'test_user10', 479.56, 167.96, 10.00, 12.04, 0.00, 3.03, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13841387738', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1003, 10, NULL, 'TEST202511131026', '2025-11-24 07:28:26', 'test_user26', 301.85, 365.71, 10.00, 12.92, 0.00, 3.36, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13822615802', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-29 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1004, 6, NULL, 'TEST202511188438', '2025-12-08 07:28:26', 'test_user5', 170.79, 422.06, 10.00, 19.92, 0.00, 7.47, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0342521681', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13858599263', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-18 07:28:26', NULL, '2025-11-29 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1005, 16, NULL, 'TEST202511126711', '2025-11-22 07:28:26', 'test_user18', 227.66, 427.70, 10.00, 14.22, 0.00, 2.89, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0036063484', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13802469937', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:28:26', '2025-11-21 07:28:26', '2025-11-21 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1006, 25, NULL, 'TEST202511245882', '2025-12-05 07:28:26', 'test_user14', 419.22, 145.15, 10.00, 14.72, 0.00, 1.10, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13882611198', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1007, 1, NULL, 'TEST202511278573', '2025-11-12 07:28:26', 'test_user3', 540.47, 336.44, 10.00, 18.43, 0.00, 8.89, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13840137643', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:28:26', NULL, '2025-12-07 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1008, 16, NULL, 'TEST202512014928', '2025-11-09 07:28:26', 'test_user18', 531.85, 426.55, 10.00, 17.49, 0.00, 1.13, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0742642483', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13800947593', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:28:26', '2025-12-07 07:28:26', '2025-12-06 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1009, 15, NULL, 'TEST202511179725', '2025-12-08 07:28:26', 'test_user18', 287.91, 221.49, 10.00, 5.75, 0.00, 4.08, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13863476493', '100000', '江苏省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:28:26', '2025-11-22 07:28:26', '2025-11-30 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1010, 17, NULL, 'TEST202511289008', '2025-12-02 07:28:26', 'test_user12', 326.06, 253.90, 10.00, 7.65, 0.00, 6.90, 0.00, 1, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13818702424', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-11 07:28:26', '2025-12-08 07:28:26', '2025-12-01 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1011, 6, NULL, 'TEST202511273290', '2025-11-13 07:28:26', 'test_user13', 254.38, 353.10, 10.00, 16.09, 0.00, 2.05, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0551761519', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13814253310', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-07 07:28:26', '2025-12-02 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1012, 11, NULL, 'TEST202512089475', '2025-11-10 07:28:26', 'test_user18', 269.50, 163.02, 10.00, 16.26, 0.00, 3.88, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0921421454', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13888656977', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:28:26', NULL, '2025-11-30 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1013, 24, NULL, 'TEST202511126662', '2025-11-23 07:28:26', 'test_user19', 333.96, 399.78, 10.00, 15.88, 0.00, 8.72, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13884791650', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1014, 4, NULL, 'TEST202512078765', '2025-12-03 07:28:26', 'test_user6', 239.64, 195.53, 10.00, 6.35, 0.00, 7.14, 0.00, 2, 1, 4, 0, '顺丰快递', 'SF0271243142', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13817973901', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:28:26', '2025-12-07 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1015, 2, NULL, 'TEST202512037572', '2025-11-30 07:28:26', 'test_user6', 450.10, 228.89, 10.00, 7.77, 0.00, 8.68, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13866260674', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-25 07:28:26', '2025-12-04 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1016, 7, NULL, 'TEST202511117924', '2025-12-01 07:28:26', 'test_user7', 494.83, 394.06, 10.00, 15.43, 0.00, 7.94, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0272518582', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13883945281', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-03 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1017, 7, NULL, 'TEST202511178069', '2025-12-01 07:28:26', 'test_user24', 142.12, 129.04, 10.00, 4.75, 0.00, 7.14, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13827215264', '100000', '江苏省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-01 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1018, 24, NULL, 'TEST202511153038', '2025-12-02 07:28:26', 'test_user4', 402.03, 125.41, 10.00, 12.84, 0.00, 7.57, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0408092681', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13846741585', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:28:27', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1019, 15, NULL, 'TEST202511153200', '2025-11-16 07:28:26', 'test_user6', 84.70, 414.67, 10.00, 8.77, 0.00, 0.05, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0983053579', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13824965212', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-15 07:28:26', NULL, '2025-11-24 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1020, 16, NULL, 'TEST202511246202', '2025-11-18 07:28:26', 'test_user17', 187.48, 296.69, 10.00, 12.84, 0.00, 7.30, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0164654469', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13827840681', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:28:26', '2025-11-20 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1021, 25, NULL, 'TEST202511185960', '2025-11-16 07:28:26', 'test_user25', 502.65, 405.21, 10.00, 16.72, 0.00, 0.50, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13823096942', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-26 07:28:26', '2025-11-29 07:28:26', '2025-11-22 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1022, 8, NULL, 'TEST202511219395', '2025-12-01 07:28:26', 'test_user26', 110.16, 369.06, 10.00, 16.59, 0.00, 2.34, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13814181125', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:28:26', '2025-12-02 07:28:26', '2025-12-04 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1023, 7, NULL, 'TEST202511236984', '2025-12-07 07:28:26', 'test_user26', 481.99, 222.13, 10.00, 2.59, 0.00, 6.14, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13885522590', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-25 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1024, 7, NULL, 'TEST202512058250', '2025-11-17 07:28:26', 'test_user21', 263.78, 448.14, 10.00, 13.97, 0.00, 1.05, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0009909524', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13867674719', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-06 07:28:26', '2025-11-28 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1025, 8, NULL, 'TEST202511169938', '2025-11-29 07:28:26', 'test_user18', 262.88, 92.24, 10.00, 2.90, 0.00, 4.72, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0732182957', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13851666769', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-26 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1026, 23, NULL, 'TEST202512016847', '2025-12-05 07:28:26', 'test_user18', 231.87, 433.96, 10.00, 14.97, 0.00, 4.38, 0.00, 2, 1, 2, 0, '圆通快递', 'SF0001976472', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13889857885', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:28:26', '2025-11-19 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1027, 25, NULL, 'TEST202511289463', '2025-12-01 07:28:26', 'test_user19', 373.60, 122.14, 10.00, 15.60, 0.00, 4.66, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13863815423', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:28:26', '2025-12-08 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1028, 15, NULL, 'TEST202511196521', '2025-12-02 07:28:26', 'test_user8', 248.15, 134.96, 10.00, 13.21, 0.00, 7.94, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13842818580', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-03 07:28:26', '2025-11-23 07:28:26', '2025-11-30 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1029, 7, NULL, 'TEST202512075199', '2025-11-26 07:28:26', 'test_user12', 397.85, 112.58, 10.00, 10.77, 0.00, 3.18, 0.00, 2, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13806190070', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-30 07:28:26', '2025-12-06 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1030, 11, NULL, 'TEST202512054232', '2025-11-23 07:28:26', 'test_user20', 331.26, 306.67, 10.00, 17.58, 0.00, 8.56, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13830291972', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1031, 17, NULL, 'TEST202512081881', '2025-11-16 07:28:26', 'test_user23', 434.72, 173.45, 10.00, 18.52, 0.00, 8.90, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13851394746', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-28 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1032, 14, NULL, 'TEST202512059274', '2025-11-24 07:28:26', 'test_user9', 491.43, 257.60, 10.00, 8.55, 0.00, 8.92, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0807137104', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13888779169', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:28:26', '2025-11-20 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1033, 19, NULL, 'TEST202511200246', '2025-12-07 07:28:26', 'test_user7', 106.46, 476.25, 10.00, 18.47, 0.00, 0.61, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0282069476', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13873533849', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-26 07:28:26', '2025-11-27 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1034, 21, NULL, 'TEST202512019233', '2025-11-25 07:28:26', 'test_user23', 307.81, 53.34, 10.00, 9.73, 0.00, 4.12, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13805618661', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:28:26', NULL, '2025-12-04 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1035, 19, NULL, 'TEST202511191594', '2025-12-03 07:28:26', 'test_user22', 398.17, 538.46, 10.00, 15.91, 0.00, 0.47, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0054973159', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13818537590', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:28:26', NULL, '2025-12-04 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1036, 15, NULL, 'TEST202511136469', '2025-11-26 07:28:26', 'test_user18', 234.04, 477.48, 10.00, 3.41, 0.00, 2.88, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13875306879', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:28:26', NULL, '2025-11-29 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1037, 9, NULL, 'TEST202511099211', '2025-12-04 07:28:26', 'test_user17', 298.04, 312.37, 10.00, 2.71, 0.00, 1.03, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13828088984', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-04 07:28:26', '2025-11-26 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1038, 8, NULL, 'TEST202511289089', '2025-12-05 07:28:26', 'test_user12', 310.32, 177.37, 10.00, 14.24, 0.00, 7.95, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13873079944', '100000', '广东省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-11 07:28:26', '2025-12-05 07:28:26', '2025-12-08 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1039, 11, NULL, 'TEST202511181442', '2025-12-02 07:28:26', 'test_user18', 547.01, 507.05, 10.00, 11.77, 0.00, 2.00, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13893485482', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-24 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1040, 9, NULL, 'TEST202511167254', '2025-12-02 07:28:26', 'test_user11', 450.18, 457.87, 10.00, 13.55, 0.00, 9.41, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0790245163', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13893185912', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-12 07:28:26', '2025-11-28 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1041, 5, NULL, 'TEST202511213756', '2025-11-21 07:28:26', 'test_user5', 383.17, 477.88, 10.00, 5.60, 0.00, 8.32, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13839339684', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-16 07:28:26', '2025-12-05 07:28:26', '2025-12-01 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1042, 19, NULL, 'TEST202511182999', '2025-12-02 07:28:26', 'test_user11', 142.85, 388.56, 10.00, 16.57, 0.00, 1.11, 0.00, 1, 1, 0, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13816630094', '100000', '北京市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1043, 4, NULL, 'TEST202512019017', '2025-11-23 07:28:26', 'test_user20', 547.28, 426.50, 10.00, 15.63, 0.00, 6.48, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13827333210', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:28:26', '2025-11-28 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1044, 24, NULL, 'TEST202511289705', '2025-11-18 07:28:26', 'test_user22', 183.77, 465.10, 10.00, 6.97, 0.00, 2.51, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13818566970', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:28:26', '2025-12-03 07:28:26', '2025-11-21 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1045, 15, NULL, 'TEST202511169551', '2025-11-19 07:28:26', 'test_user15', 544.85, 167.70, 10.00, 4.16, 0.00, 3.33, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13883323239', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1046, 19, NULL, 'TEST202511200373', '2025-12-03 07:28:26', 'test_user8', 221.05, 469.00, 10.00, 3.27, 0.00, 3.05, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0336444533', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13814841723', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-16 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1047, 11, NULL, 'TEST202512028328', '2025-11-17 07:28:26', 'test_user15', 154.16, 258.73, 10.00, 9.25, 0.00, 0.59, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13898669764', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-25 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1048, 2, NULL, 'TEST202512053668', '2025-11-18 07:28:26', 'test_user14', 292.09, 485.01, 10.00, 17.95, 0.00, 8.78, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13830113815', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1049, 16, NULL, 'TEST202511289279', '2025-11-15 07:28:26', 'test_user16', 101.22, 440.17, 10.00, 11.89, 0.00, 6.31, 0.00, 1, 1, 4, 0, '顺丰快递', 'SF0140185439', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13827635877', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-29 07:28:26', NULL, '2025-12-06 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1050, 16, NULL, 'TEST202511272181', '2025-11-23 07:28:26', 'test_user24', 481.51, 352.37, 10.00, 8.69, 0.00, 3.59, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0215598360', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13848361041', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:28:26', NULL, '2025-12-02 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1051, 13, NULL, 'TEST202511274391', '2025-11-25 07:28:26', 'test_user3', 89.96, 130.58, 10.00, 11.32, 0.00, 3.47, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13810274035', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1052, 22, NULL, 'TEST202511231192', '2025-11-18 07:28:26', 'test_user1', 382.08, 203.81, 10.00, 10.91, 0.00, 8.05, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0056931247', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13854895434', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-05 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1053, 16, NULL, 'TEST202511177873', '2025-11-25 07:28:26', 'test_user21', 318.31, 221.95, 10.00, 2.19, 0.00, 5.17, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13874346797', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:28:26', '2025-11-29 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1054, 17, NULL, 'TEST202511244980', '2025-12-01 07:28:26', 'test_user2', 437.87, 408.35, 10.00, 5.13, 0.00, 1.31, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0744008180', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13805073606', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-09 07:28:27', '2025-11-23 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1055, 23, NULL, 'TEST202512068019', '2025-11-21 07:28:26', 'test_user21', 294.71, 104.98, 10.00, 1.63, 0.00, 0.78, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0016530071', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13816271281', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:28:26', '2025-12-08 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1056, 21, NULL, 'TEST202511121702', '2025-11-15 07:28:26', 'test_user4', 173.81, 441.51, 10.00, 3.45, 0.00, 5.12, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13887166436', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-26 07:28:26', '2025-12-05 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1057, 21, NULL, 'TEST202512035291', '2025-11-23 07:28:26', 'test_user4', 50.86, 377.53, 10.00, 5.40, 0.00, 3.86, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0130529176', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13828612899', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-27 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1058, 22, NULL, 'TEST202511146259', '2025-11-25 07:28:26', 'test_user17', 229.05, 474.45, 10.00, 3.40, 0.00, 3.04, 0.00, 1, 1, 1, 0, '顺丰快递', 'SF0524824454', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13899496993', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-27 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1059, 24, NULL, 'TEST202511202970', '2025-12-01 07:28:26', 'test_user18', 315.76, 351.98, 10.00, 8.51, 0.00, 3.14, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13813280492', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:28:26', '2025-11-25 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1060, 20, NULL, 'TEST202512027673', '2025-12-02 07:28:26', 'test_user6', 475.11, 329.86, 10.00, 4.96, 0.00, 5.61, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0364681790', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13892579166', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:28:26', '2025-12-07 07:28:26', '2025-11-24 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1061, 4, NULL, 'TEST202511231862', '2025-11-19 07:28:26', 'test_user9', 135.73, 459.54, 10.00, 11.62, 0.00, 4.48, 0.00, 1, 1, 1, 0, '圆通快递', 'SF0581990258', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13813704472', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:28:26', '2025-11-29 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1062, 20, NULL, 'TEST202511181295', '2025-11-24 07:28:26', 'test_user16', 324.83, 542.66, 10.00, 5.55, 0.00, 4.32, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0872338638', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13802741217', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-24 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1063, 11, NULL, 'TEST202512028186', '2025-11-22 07:28:26', 'test_user13', 545.86, 295.01, 10.00, 9.50, 0.00, 9.05, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0383942859', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13895717497', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-30 07:28:26', '2025-11-24 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1064, 15, NULL, 'TEST202512084382', '2025-11-16 07:28:26', 'test_user5', 277.98, 458.64, 10.00, 14.37, 0.00, 1.41, 0.00, 2, 1, 2, 0, '顺丰快递', 'SF0050043745', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13843279582', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-15 07:28:26', NULL, '2025-11-24 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1065, 7, NULL, 'TEST202512015753', '2025-11-18 07:28:26', 'test_user3', 458.72, 430.51, 10.00, 7.05, 0.00, 4.81, 0.00, 1, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13889236931', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1066, 26, NULL, 'TEST202511115508', '2025-11-15 07:28:26', 'test_user2', 342.08, 439.37, 10.00, 2.82, 0.00, 3.70, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13876193566', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:28:27', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1067, 11, NULL, 'TEST202511267496', '2025-11-11 07:28:26', 'test_user15', 293.14, 445.19, 10.00, 9.86, 0.00, 0.94, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0479325011', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13860325671', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1068, 22, NULL, 'TEST202512042330', '2025-11-29 07:28:26', 'test_user20', 111.47, 210.75, 10.00, 4.77, 0.00, 2.29, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0926905842', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13871494017', '100000', '江苏省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:28:26', NULL, '2025-11-19 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1069, 6, NULL, 'TEST202511188366', '2025-12-06 07:28:26', 'test_user3', 513.36, 235.78, 10.00, 1.55, 0.00, 2.74, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0528923892', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13811464945', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-11 07:28:26', '2025-11-25 07:28:26', '2025-12-07 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1070, 16, NULL, 'TEST202511141949', '2025-11-28 07:28:26', 'test_user15', 139.89, 170.02, 10.00, 13.22, 0.00, 5.84, 0.00, 2, 1, 4, 0, '顺丰快递', 'SF0382101321', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13828800971', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1071, 9, NULL, 'TEST202511124241', '2025-11-15 07:28:26', 'test_user14', 191.78, 492.11, 10.00, 11.41, 0.00, 1.99, 0.00, 1, 1, 3, 0, '圆通快递', 'SF0849089703', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13856735401', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:28:26', '2025-11-25 07:28:26', '2025-11-30 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1072, 18, NULL, 'TEST202511278963', '2025-11-16 07:28:26', 'test_user9', 482.18, 244.88, 10.00, 7.11, 0.00, 6.09, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0900301924', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13845156163', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:28:27', NULL, '2025-12-01 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1073, 10, NULL, 'TEST202511131494', '2025-11-23 07:28:26', 'test_user5', 269.62, 381.78, 10.00, 0.00, 0.00, 0.10, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13852521755', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:28:26', '2025-11-19 07:28:26', '2025-11-27 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1074, 26, NULL, 'TEST202512065112', '2025-11-30 07:28:26', 'test_user8', 520.76, 461.25, 10.00, 5.76, 0.00, 9.72, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0626129042', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13877156057', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-25 07:28:27', '2025-11-22 07:28:26', '2025-11-29 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1075, 2, NULL, 'TEST202511217930', '2025-11-29 07:28:26', 'test_user5', 297.05, 523.26, 10.00, 5.01, 0.00, 4.12, 0.00, 1, 1, 2, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13877270478', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-02 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1076, 24, NULL, 'TEST202512057838', '2025-11-26 07:28:26', 'test_user16', 356.63, 193.72, 10.00, 11.95, 0.00, 1.25, 0.00, 2, 1, 3, 0, '圆通快递', 'SF0373315846', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13837329987', '100000', '浙江省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:28:26', '2025-12-05 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1077, 19, NULL, 'TEST202511218984', '2025-11-25 07:28:26', 'test_user19', 456.95, 531.98, 10.00, 7.56, 0.00, 9.99, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0466341158', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13871740716', '100000', '上海市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-02 07:28:26', '2025-12-07 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1078, 9, NULL, 'TEST202511115728', '2025-11-24 07:28:26', 'test_user5', 82.01, 475.30, 10.00, 1.22, 0.00, 7.53, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13830864771', '100000', '浙江省', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-20 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1079, 19, NULL, 'TEST202511165837', '2025-11-30 07:28:26', 'test_user18', 358.83, 83.49, 10.00, 9.64, 0.00, 2.09, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13829891636', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-13 07:28:26', NULL, '2025-11-22 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1080, 9, NULL, 'TEST202511158487', '2025-11-18 07:28:26', 'test_user25', 134.58, 58.30, 10.00, 11.51, 0.00, 8.28, 0.00, 1, 1, 3, 0, '顺丰快递', 'SF0843789046', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13808354559', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1081, 6, NULL, 'TEST202512068506', '2025-11-09 07:28:26', 'test_user25', 160.99, 172.77, 10.00, 11.24, 0.00, 0.72, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13848176637', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-02 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1082, 26, NULL, 'TEST202511252759', '2025-12-02 07:28:26', 'test_user2', 315.54, 270.02, 10.00, 12.14, 0.00, 7.14, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13800298582', '100000', '浙江省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-06 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1083, 14, NULL, 'TEST202512034668', '2025-12-03 07:28:26', 'test_user20', 227.83, 312.32, 10.00, 11.12, 0.00, 2.07, 0.00, 1, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13853052099', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-10 07:28:26', '2025-11-18 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1084, 21, NULL, 'TEST202512051937', '2025-11-29 07:28:26', 'test_user17', 346.09, 78.42, 10.00, 10.15, 0.00, 3.68, 0.00, 1, 1, 2, 0, '圆通快递', 'SF0391564557', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13853904620', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-29 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1085, 16, NULL, 'TEST202511238414', '2025-11-21 07:28:26', 'test_user18', 438.96, 504.10, 10.00, 4.15, 0.00, 3.12, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13844549038', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-05 07:28:26', NULL, '2025-11-22 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1086, 21, NULL, 'TEST202512026181', '2025-11-28 07:28:26', 'test_user13', 297.92, 84.48, 10.00, 17.15, 0.00, 0.79, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13801731089', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-08 07:28:26', '2025-11-14 07:28:26', '2025-12-01 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1087, 2, NULL, 'TEST202511121816', '2025-11-29 07:28:26', 'test_user8', 492.57, 333.83, 10.00, 3.66, 0.00, 2.11, 0.00, 2, 1, 4, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13832661623', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-23 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1088, 13, NULL, 'TEST202512060913', '2025-12-03 07:28:26', 'test_user5', 306.24, 95.21, 10.00, 18.29, 0.00, 3.02, 0.00, 2, 1, 4, 0, '圆通快递', 'SF0457526866', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13868152214', '100000', '广东省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-19 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1089, 24, NULL, 'TEST202512067081', '2025-11-23 07:28:26', 'test_user8', 243.62, 64.58, 10.00, 19.68, 0.00, 8.33, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13895210546', '100000', '广东省', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-18 07:28:26', '2025-11-20 07:28:26', '2025-11-25 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1090, 10, NULL, 'TEST202511132134', '2025-11-11 07:28:26', 'test_user13', 398.13, 89.68, 10.00, 6.16, 0.00, 3.02, 0.00, 2, 1, 0, 0, '圆通快递', 'SF0519990351', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13866262405', '100000', '江苏省', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-14 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1091, 23, NULL, 'TEST202512016989', '2025-12-06 07:28:26', 'test_user19', 272.24, 98.77, 10.00, 3.08, 0.00, 4.79, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0075006469', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13884481119', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:28:26', '2025-12-08 07:28:26', '2025-12-02 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1092, 23, NULL, 'TEST202512076207', '2025-11-22 07:28:26', 'test_user26', 62.74, 147.36, 10.00, 17.94, 0.00, 9.02, 0.00, 2, 1, 2, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13800449415', '100000', '北京市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-12-08 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1093, 24, NULL, 'TEST202512023537', '2025-11-26 07:28:26', 'test_user3', 298.89, 126.78, 10.00, 5.49, 0.00, 9.11, 0.00, 2, 1, 4, 0, '圆通快递', 'SF0488678721', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13897629831', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1094, 11, NULL, 'TEST202511269620', '2025-11-22 07:28:26', 'test_user14', 413.78, 84.77, 10.00, 3.30, 0.00, 6.16, 0.00, 2, 1, 1, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13817002148', '100000', '上海市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-27 07:28:27', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1095, 11, NULL, 'TEST202511286215', '2025-11-30 07:28:26', 'test_user1', 182.26, 172.49, 10.00, 8.63, 0.00, 4.22, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0294934474', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13809265788', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-03 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1096, 15, NULL, 'TEST202512059009', '2025-11-19 07:28:26', 'test_user5', 174.90, 388.72, 10.00, 12.76, 0.00, 1.57, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13857428747', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-15 07:28:26', '2025-12-02 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1097, 6, NULL, 'TEST202511119170', '2025-12-03 07:28:26', 'test_user23', 379.52, 374.56, 10.00, 5.37, 0.00, 3.95, 0.00, 1, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13873072328', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-17 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1098, 14, NULL, 'TEST202511231070', '2025-12-06 07:28:26', 'test_user26', 306.93, 384.14, 10.00, 16.00, 0.00, 9.94, 0.00, 2, 1, 3, 0, '顺丰快递', 'SF0399200102', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13864355839', '100000', '上海市', '杭州市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-11-30 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1099, 7, NULL, 'TEST202512057449', '2025-12-02 07:28:26', 'test_user11', 440.74, 398.83, 10.00, 2.88, 0.00, 6.26, 0.00, 2, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13840648350', '100000', '浙江省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-04 07:28:26', NULL, '2025-11-30 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1100, 24, NULL, 'TEST202511151671', '2025-11-20 07:28:26', 'test_user14', 118.05, 99.02, 10.00, 1.64, 0.00, 1.15, 0.00, 1, 1, 2, 0, '顺丰快递', 'SF0232057283', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13857571141', '100000', '上海市', '南京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, '2025-11-15 07:28:26', '2025-11-19 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1101, 26, NULL, 'TEST202511159631', '2025-11-23 07:28:26', 'test_user12', 210.89, 191.04, 10.00, 8.90, 0.00, 3.79, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户2', '13882043346', '100000', '北京市', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, NULL, NULL, '2025-12-08 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1102, 6, NULL, 'TEST202511272787', '2025-11-27 07:28:26', 'test_user6', 205.60, 483.78, 10.00, 8.08, 0.00, 4.18, 0.00, 2, 1, 1, 0, '圆通快递', 'SF0446851171', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13884502551', '100000', '江苏省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-07 07:28:26', '2025-11-28 07:28:26', NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1103, 2, NULL, 'TEST202511209502', '2025-12-07 07:28:26', 'test_user24', 377.07, 333.92, 10.00, 17.54, 0.00, 6.80, 0.00, 2, 1, 3, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13881474270', '100000', '上海市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-27 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1104, 2, NULL, 'TEST202511106384', '2025-11-10 07:28:26', 'test_user9', 425.98, 429.65, 10.00, 10.81, 0.00, 4.25, 0.00, 2, 1, 1, 0, '顺丰快递', 'SF0353122760', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户1', '13812543751', '100000', '广东省', '上海市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-15 07:28:26', NULL, '2025-11-25 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1105, 5, NULL, 'TEST202512041274', '2025-11-09 07:28:26', 'test_user7', 445.81, 176.91, 10.00, 17.88, 0.00, 7.09, 0.00, 2, 1, 1, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户3', '13863755347', '100000', '广东省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-14 07:28:26', NULL, '2025-11-22 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1106, 19, NULL, 'TEST202511209530', '2025-11-17 07:28:26', 'test_user25', 458.29, 188.69, 10.00, 18.74, 0.00, 8.54, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13836738305', '100000', '浙江省', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-12-01 07:28:26', '2025-12-08 07:28:26', '2025-11-23 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1107, 18, NULL, 'TEST202511278660', '2025-11-14 07:28:26', 'test_user6', 301.14, 475.60, 10.00, 14.98, 0.00, 1.92, 0.00, 2, 1, 4, 0, '顺丰快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户5', '13862319459', '100000', '北京市', '北京市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-22 07:28:26', '2025-11-21 07:28:26', '2025-11-28 07:28:26', NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1108, 9, NULL, 'TEST202511219490', '2025-12-07 07:28:26', 'test_user26', 115.75, 385.16, 10.00, 19.14, 0.00, 7.75, 0.00, 1, 1, 3, 0, '圆通快递', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试用户4', '13887072759', '100000', '北京市', '深圳市', '测试区', '测试街道测试地址', NULL, 0, 0, 0, '2025-11-28 07:28:26', NULL, NULL, NULL, '2025-12-08 07:28:26', NULL, NULL);
INSERT INTO `oms_order` VALUES (1164, 11, NULL, '202512080101000002', '2025-12-08 07:33:44', 'member', 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '顺丰快递', '11', 15, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2025-12-08 07:33:47', '2025-12-08 07:38:07', '2025-12-08 07:38:16', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (1165, 11, NULL, '202512080101000003', '2025-12-08 14:44:29', 'member', 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 4, 0, NULL, NULL, 15, 2699, 2699, '无优惠', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (1166, 11, NULL, '202512080101000004', '2025-12-08 17:29:28', 'member', 3788.00, 3699.00, 0.00, 89.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 3788, 3788, '单品促销', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2025-12-08 17:29:29', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (1167, 11, NULL, '202512080101000005', '2025-12-08 18:04:29', 'member', 5499.00, 4999.00, 0.00, 500.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 5499, 5499, '单品促销', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2025-12-08 18:04:33', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (1168, 11, NULL, '202512080101000006', '2025-12-08 18:05:13', 'member', 649.00, 599.00, 0.00, 50.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 649, 649, '满减优惠：满500.00元，减50.00元', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2025-12-08 18:05:15', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(20) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(20) NULL DEFAULT NULL COMMENT '商品分类id',
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(11) NULL DEFAULT 0,
  `gift_growth` int(11) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 697 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单中所包含的商品' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
INSERT INTO `oms_order_item` VALUES (21, 12, '201809150101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (22, 12, '201809150101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (23, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (24, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (25, 12, '201809150101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (26, 13, '201809150102000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (27, 13, '201809150102000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (28, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (29, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (30, 13, '201809150102000002', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (31, 14, '201809130101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (32, 14, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (33, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (34, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (35, 14, '201809130101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (36, 15, '201809130101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (37, 15, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (38, 15, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (39, 15, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (40, 15, '201809130101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (41, 16, '201809140101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (42, 16, '201809140101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (43, 16, '201809140101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (44, 16, '201809140101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (45, 16, '201809140101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (46, 27, '202002250100000001', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 100.00, 3, 163, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 100.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (47, 27, '202002250100000001', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (48, 28, '202002250100000002', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 100.00, 3, 163, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 100.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (49, 28, '202002250100000002', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (50, 29, '202002250100000003', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 100.00, 3, 163, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 100.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `oms_order_item` VALUES (51, 29, '202002250100000003', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_order_item` VALUES (52, 30, '202002250100000004', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_order_item` VALUES (53, 31, '202005160100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 2, 110, '201806070026001', 19, '满减优惠：满5000.00元，减500.00元', 250.00, 75.00, 0.28, 3462.72, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (54, 31, '202005160100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 2, 98, '201808270027001', 19, '打折优惠：满2件，打8.00折', 539.80, 0.00, 0.20, 2159.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (55, 31, '202005160100000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满500.00元，减50.00元', 50.00, 0.00, 0.05, 598.95, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (56, 32, '202005170100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (57, 32, '202005170100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (58, 33, '202005170100000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (59, 34, '202005170100000003', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (60, 35, '202005170100000004', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (61, 36, '202005170100000005', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 2, 110, '201806070026001', 19, '满减优惠：满5000.00元，减500.00元', 250.00, 0.00, 0.00, 3538.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (62, 36, '202005170100000005', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (63, 37, '202005170100000006', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (64, 37, '202005170100000006', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (65, 38, '202005170100000007', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (66, 39, '202005170100000008', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (67, 40, '202005180100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (68, 41, '202005180100000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 150.00, 0.00, 3338.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (69, 41, '202005180100000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (70, 42, '202005230100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 2, 98, '201808270027001', 19, '打折优惠：满2件，打8.00折', 539.80, 0.00, 0.00, 2159.20, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (71, 43, '202005230100000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 2, 98, '201808270027001', 19, '打折优惠：满2件，打8.00折', 539.80, 0.00, 0.00, 2159.20, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (72, 44, '202005240100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 2, 110, '201806070026001', 19, '满减优惠：满5000.00元，减500.00元', 250.00, 0.00, 0.00, 3538.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (73, 45, '202006070100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 2, 110, '201806070026001', 19, '满减优惠：满5000.00元，减500.00元', 250.00, 36.90, 0.00, 3501.10, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (74, 45, '202006070100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 26.30, 0.00, 2672.70, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (75, 46, '202006210100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 4.12, 0.00, 3483.88, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (76, 46, '202006210100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 2, 98, '201808270027001', 19, '打折优惠：满2件，打8.00折', 539.80, 2.94, 0.00, 2156.26, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (77, 47, '202006210100000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (78, 47, '202006210100000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (79, 48, '202006210100000003', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 150.00, 0.00, 3338.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (80, 49, '202006270100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (81, 50, '202210280100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (82, 51, '202210280100000002', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 紫色 支持移动联通电信5G 双卡双待手机', '苹果', '100038005189', 5999.00, 1, 201, '202210280037001', 19, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (83, 52, '202211090100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '无优惠', 0.00, 200.00, 0.00, 2799.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (84, 53, '202211090100000002', 38, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', '苹果', '100044025833', 3599.00, 1, 213, '202210280038001', 53, '无优惠', 0.00, 10.00, 0.00, 3589.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_order_item` VALUES (85, 54, '202211090100000003', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '苹果', '100038005189', 5999.00, 1, 201, '202210280037001', 19, '无优惠', 0.00, 600.00, 0.00, 5399.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (86, 55, '202211100100000001', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '苹果', '100038005189', 5999.00, 2, 201, '202210280037001', 19, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (87, 56, '202211110100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '无优惠', 0.00, 100.00, 0.00, 2899.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (88, 57, '202211110100000002', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '无优惠', 0.00, 0.00, 0.00, 2999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (89, 58, '202211110100000003', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '苹果', '100038005189', 5999.00, 1, 201, '202210280037001', 19, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (90, 59, '202211110100000004', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满500.00元，减50.00元', 50.00, 0.00, 0.00, 599.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (91, 60, '202211160100000001', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '苹果', '100038005189', 5999.00, 1, 201, '202210280037001', 19, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (92, 60, '202211160100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '无优惠', 0.00, 0.00, 0.00, 2999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (93, 60, '202211160100000001', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '小米', '100035246702', 2099.00, 1, 225, '202211040041001', 19, '无优惠', 0.00, 0.00, 0.00, 2099.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (94, 61, '202212210100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '无优惠', 0.00, 0.00, 0.00, 2999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (95, 62, '202212210100000002', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '苹果', '100038005189', 5999.00, 1, 201, '202210280037001', 19, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (96, 62, '202212210100000002', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '小米', '100035246702', 2099.00, 1, 225, '202211040041001', 19, '无优惠', 0.00, 0.00, 0.00, 2099.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (97, 63, '202212210100000003', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '无优惠', 0.00, 0.00, 0.00, 2999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (98, 64, '202212210100000004', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '小米', '100035246702', 2099.00, 1, 225, '202211040041001', 19, '无优惠', 0.00, 0.00, 0.00, 2099.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (99, 65, '202212210100000005', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '满减优惠：满2000.00元，减200.00元', 200.00, 58.80, 5.88, 2734.32, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (100, 65, '202212210100000005', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '小米', '100035246702', 2099.00, 1, 225, '202211040041001', 19, '无优惠', 0.00, 41.20, 4.12, 2053.68, 0, 0, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (101, 66, '202301100100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '小米', '100027789721', 2999.00, 2, 221, '202211040040001', 19, '满减优惠：满2000.00元，减200.00元', 100.00, 0.00, 0.00, 2899.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (102, 67, '202301100100000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (103, 68, '202301100100000003', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3999.00, 1, 111, '201806070026002', 19, '单品促销', 100.00, 0.00, 0.00, 3899.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (104, 69, '202305110100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '满减优惠：满2000.00元，减200.00元', 200.00, 117.60, 0.00, 2681.40, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (105, 69, '202305110100000001', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '小米', '100035246702', 2099.00, 1, 225, '202211040041001', 19, '无优惠', 0.00, 82.40, 0.00, 2016.60, 0, 0, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (106, 70, '202305110100000002', 38, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款', '苹果', '100044025833', 3599.00, 1, 213, '202210280038001', 53, '无优惠', 0.00, 0.00, 0.00, 3599.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_order_item` VALUES (107, 71, '202305110100000003', 39, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', '小米', '100023207945', 5999.00, 1, 217, '202210280039001', 54, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_order_item` VALUES (108, 72, '202305110100000004', 42, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', '华为', '100035295081', 4999.00, 1, 229, '202211040042001', 19, '无优惠', 0.00, 0.00, 0.00, 4999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (109, 72, '202305110100000004', 44, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', '三星', '100018768480', 369.00, 1, 235, '202211080044001', 55, '无优惠', 0.00, 0.00, 0.00, 369.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `oms_order_item` VALUES (110, 73, '202305110100000005', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '苹果', '100038005189', 5999.00, 1, 201, '202210280037001', 19, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (111, 74, '202305110100000006', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '满减优惠：满2000.00元，减200.00元', 200.00, 0.00, 0.00, 2799.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (112, 75, '202305110100000007', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '小米', '100035246702', 2099.00, 1, 225, '202211040041001', 19, '无优惠', 0.00, 0.00, 0.00, 2099.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (113, 76, '202305110100000008', 39, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', '小米', '100023207945', 5999.00, 1, 217, '202210280039001', 54, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_order_item` VALUES (114, 76, '202305110100000008', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '满减优惠：满2000.00元，减200.00元', 200.00, 100.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (115, 77, '202511270100000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '单品促销', 500.00, 0.00, 0.00, 4999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (116, 78, '202511270100000002', 30, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', 'HLA海澜之家简约动物印花短袖T恤', '海澜之家', 'HNTBJ2E042A', 88.00, 1, 181, '202004190030003', 8, '无优惠', 0.00, 0.00, 0.00, 88.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"M\"}]');
INSERT INTO `oms_order_item` VALUES (117, 78, '202511270100000002', 30, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', 'HLA海澜之家简约动物印花短袖T恤', '海澜之家', 'HNTBJ2E042A', 88.00, 1, 183, '202004190030005', 8, '无优惠', 0.00, 0.00, 0.00, 88.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"XL\"}]');
INSERT INTO `oms_order_item` VALUES (118, 79, '202511280100000001', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '苹果', '100038005189', 5999.00, 1, 201, '202210280037001', 19, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (119, 80, '202511280100000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 7, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 0.00, 0.00, 2024.25, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (120, 81, '202511280100000003', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '小米', '100027789721', 2999.00, 1, 221, '202211040040001', 19, '满减优惠：满2000.00元，减200.00元', 200.00, 0.00, 0.00, 2799.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (121, 82, '202511280100000004', 45, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄', 'OPPO', '10052147850350', 2299.00, 1, 239, '202211080045001', 19, '满减优惠：满2000.00元，减100.00元', 100.00, 0.00, 0.00, 2199.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (122, 87, '202511280100000009', 38, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款', '苹果', '100044025833', 3599.00, 1, 213, '202210280038001', 53, '无优惠', 0.00, 0.00, 0.00, 3599.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_order_item` VALUES (123, 88, '202511280100000010', 44, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', '三星', '100018768480', 369.00, 1, 235, '202211080044001', 55, '无优惠', 0.00, 0.00, 0.00, 369.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `oms_order_item` VALUES (124, 89, '202511280100000011', 44, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', '三星', '100018768480', 369.00, 1, 235, '202211080044001', 55, '无优惠', 0.00, 0.00, 0.00, 369.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `oms_order_item` VALUES (125, 90, '202511280100000012', 39, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', '小米', '100023207945', 5999.00, 1, 217, '202210280039001', 54, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_order_item` VALUES (126, 91, '202511280100000013', 44, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', '三星', '100018768480', 369.00, 1, 235, '202211080044001', 55, '无优惠', 0.00, 0.00, 0.00, 369.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `oms_order_item` VALUES (127, 92, '202511280100000014', 31, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', 'HLA海澜之家蓝灰花纹圆领针织布短袖T恤', '海澜之家', 'HNTBJ2E080A', 88.00, 1, 185, '202004190031001', 8, '无优惠', 0.00, 0.00, 0.00, 88.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"浅灰色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]');
INSERT INTO `oms_order_item` VALUES (128, 93, '202511300100000001', 53, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/77e9cc14d7724276b41e031a7a5f8649.webp', '小米 17 Pro Max', '小米', '7384748932', 5599.00, 1, 255, '83671982', 19, '无优惠', 0.00, 0.00, 0.00, 5599.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"森野绿\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `oms_order_item` VALUES (129, 94, '202511300100000002', 53, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/77e9cc14d7724276b41e031a7a5f8649.webp', '小米 17 Pro Max', '小米', '7384748932', 4999.00, 1, 252, '73849293', 19, '无优惠', 0.00, 0.00, 0.00, 4999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"冷艳紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (130, 95, '202512010100000001', 54, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/70e1b5fcc3b34a7ba202b5258af63a5d.jpg', 'REDMI K80至尊版', '小米', '1233421', 2399.00, 1, 260, '765334546', 19, '无优惠', 0.00, 0.00, 0.00, 2399.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"白岩灰\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (131, 95, '202512010100000001', 59, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/15ebce10b0064f8e89338814ccd6cf6b.png', 'iPhone 15', '苹果', '74565542', 4088.00, 1, 276, '54634523', 19, '无优惠', 0.00, 0.00, 0.00, 4088.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\" 粉色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `oms_order_item` VALUES (132, 96, '202512010100000002', 44, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', '三星', '100018768480', 369.00, 1, 235, '202211080044001', 55, '无优惠', 0.00, 0.00, 0.00, 369.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `oms_order_item` VALUES (133, 96, '202512010100000002', 45, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄', 'OPPO', '10052147850350', 2299.00, 1, 239, '202211080045001', 19, '满减优惠：满2000.00元，减100.00元', 100.00, 0.00, 0.00, 2199.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (134, 96, '202512010100000002', 71, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/80367ed4e74349279d9357df09d3d1e5.jpg', 'OPPO Find N5', 'OPPO', '10607003', 8499.00, 1, 309, '5432534', 19, '无优惠', 0.00, 0.00, 0.00, 8499.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"缎黑\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `oms_order_item` VALUES (135, 97, '202512010100000003', 72, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/6ef58c24e9ec4fa0b67b95ccb207f416.jpg', '华硕无畏 14 AI 旗舰版', 'ASUS', '3458434', 3419.00, 1, 315, '54363453', 54, '无优惠', 0.00, 10000.00, 0.00, -6581.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"版本\",\"value\":\"I5 16G 512\"}]');
INSERT INTO `oms_order_item` VALUES (136, 98, '202512010100000004', 57, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/1331b39fa74f41d5b9590bb5bfd4968a.jpg', 'iPhone 17 Pro Max ', '苹果', '45678765', 11399.00, 5, 270, '398755434', 19, '无优惠', 0.00, 10000.00, 0.00, 1399.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"星宇橙色\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `oms_order_item` VALUES (137, 99, '202512030100000001', 57, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/1331b39fa74f41d5b9590bb5bfd4968a.jpg', 'iPhone 17 Pro Max ', '苹果', '45678765', 11399.00, 1, 270, '398755434', 19, '无优惠', 0.00, 10000.00, 0.00, 1399.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"星宇橙色\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `oms_order_item` VALUES (138, 100, '202512030100000002', 75, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/90945326fee74154bb0fc8edaa6baeec.jpg', 'Al9 HX370', 'ASUS', '5423344', 8799.00, 1, 319, '212312154', 54, '无优惠', 0.00, 100000.00, 0.00, -91201.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"日蚀灰\"},{\"key\":\"版本\",\"value\":\"套餐一\"}]');
INSERT INTO `oms_order_item` VALUES (139, 101, '202512030100000003', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '单品促销', 89.00, 0.00, 0.00, 3699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (140, 102, '202512030100000004', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 100000.00, 0.00, -97301.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (141, 103, '202512030100000005', 53, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/77e9cc14d7724276b41e031a7a5f8649.webp', '小米 17 Pro Max', '小米', '7384748932', 4999.00, 1, 252, '73849293', 19, '无优惠', 0.00, 100000.00, 0.00, -95001.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"冷艳紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (142, 104, '202512030100000006', 70, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/69e0423508f64b2e82b4d134bc6c91e9.jpg', 'OPPO Find X9 Pro', 'OPPO', '3960654', 5299.00, 70, 305, '324324688', 19, '无优惠', 0.00, 1400.00, 0.00, 3899.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"追光红\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `oms_order_item` VALUES (143, 105, '202512040100000001', 42, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', '华为', '100035295081', 4999.00, 1, 229, '202211040042001', 19, '无优惠', 0.00, 0.00, 0.00, 4999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (148, 110, '202512050100000005', 52, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/afc5489db69840059ec3e107e7507139.jpg', 'Redmi K90 Pro Max', '小米', '271829273', 3900.00, 1, 243, '123123123', 19, '单品促销', 200.00, 0.00, 0.00, 3700.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"流白金\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (149, 111, '202512050100000006', 38, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款', '苹果', '100044025833', 3599.00, 1, 213, '202210280038001', 53, '无优惠', 0.00, 0.00, 0.00, 3599.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_order_item` VALUES (150, 112, '202512050100000007', 42, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', '华为', '100035295081', 4999.00, 1, 229, '202211040042001', 19, '无优惠', 0.00, 0.00, 0.00, 4999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (151, 113, '202512050100000008', 42, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', '华为', '100035295081', 4999.00, 1, 229, '202211040042001', 19, '无优惠', 0.00, 0.00, 0.00, 4999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (171, 134, '202512050101000029', 42, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', '华为', '100035295081', 4999.00, 1, 229, '202211040042001', 19, '无优惠', 0.00, 0.00, 0.00, 4999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (172, 135, '202512060101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '单品促销', 89.00, 0.00, 0.00, 3699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (173, 136, '202512060101000002', 42, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', '华为', '100035295081', 4999.00, 1, 229, '202211040042001', 19, '无优惠', 0.00, 0.00, 0.00, 4999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (176, 139, '202512060101000005', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满500.00元，减50.00元', 50.00, 0.00, 0.00, 599.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (178, 141, '202512060101000007', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '单品促销', 89.00, 0.00, 0.00, 3699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (179, 141, '202512060101000007', 38, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款', '苹果', '100044025833', 3599.00, 1, 213, '202210280038001', 53, '无优惠', 0.00, 0.00, 0.00, 3599.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_order_item` VALUES (180, 142, '202512060101000008', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '单品促销', 89.00, 0.00, 0.00, 3699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (181, 143, '202512080101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '单品促销', 89.00, 0.00, 0.00, 3699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (182, 144, 'TEST202511102037', 40, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品66', '测试品牌3', 'TEST080256', 198.43, 3, NULL, NULL, 6, NULL, 2.08, 2.35, 0.00, 242.41, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (183, 145, 'TEST202512087044', 74, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品67', '测试品牌2', 'TEST390641', 183.85, 1, NULL, NULL, 3, NULL, 7.97, 0.97, 0.00, 266.82, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (184, 146, 'TEST202512065019', 63, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品71', '测试品牌1', 'TEST587075', 178.99, 3, NULL, NULL, 8, NULL, 5.22, 1.31, 0.00, 926.41, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (185, 147, 'TEST202511178634', 36, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品30', '测试品牌3', 'TEST275560', 206.25, 1, NULL, NULL, 5, NULL, 0.31, 3.96, 0.00, 1093.61, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (186, 148, 'TEST202511225176', 21, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品29', '测试品牌5', 'TEST682658', 128.87, 5, NULL, NULL, 9, NULL, 4.08, 2.66, 0.00, 397.64, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (187, 149, 'TEST202511186696', 49, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品15', '测试品牌1', 'TEST170893', 96.67, 4, NULL, NULL, 10, NULL, 8.88, 2.66, 0.00, 507.13, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (188, 150, 'TEST202511109120', 74, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品28', '测试品牌5', 'TEST946963', 163.59, 5, NULL, NULL, 7, NULL, 4.57, 1.07, 0.00, 793.70, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (189, 151, 'TEST202512043364', 9, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品81', '测试品牌3', 'TEST968955', 32.20, 4, NULL, NULL, 10, NULL, 5.94, 1.24, 0.00, 392.71, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (190, 152, 'TEST202511273055', 30, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品13', '测试品牌4', 'TEST954230', 155.28, 4, NULL, NULL, 7, NULL, 0.27, 0.67, 0.00, 472.70, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (191, 153, 'TEST202511092149', 81, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品18', '测试品牌1', 'TEST014379', 147.84, 3, NULL, NULL, 10, NULL, 5.27, 3.97, 0.00, 360.82, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (192, 154, 'TEST202511100929', 54, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品46', '测试品牌4', 'TEST257525', 201.06, 1, NULL, NULL, 2, NULL, 7.58, 1.65, 0.00, 527.68, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (193, 155, 'TEST202511183365', 21, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品51', '测试品牌2', 'TEST728221', 151.44, 2, NULL, NULL, 7, NULL, 1.22, 3.52, 0.00, 246.15, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (194, 156, 'TEST202512023836', 66, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品1', '测试品牌4', 'TEST283961', 97.46, 2, NULL, NULL, 4, NULL, 8.00, 4.59, 0.00, 93.20, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (195, 157, 'TEST202511150430', 32, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品29', '测试品牌3', 'TEST900612', 157.31, 5, NULL, NULL, 7, NULL, 5.33, 2.89, 0.00, 378.02, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (196, 158, 'TEST202512052130', 61, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品41', '测试品牌2', 'TEST789538', 49.09, 4, NULL, NULL, 5, NULL, 4.61, 4.65, 0.00, 291.04, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (197, 159, 'TEST202512017600', 2, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品33', '测试品牌5', 'TEST392885', 53.73, 5, NULL, NULL, 10, NULL, 8.43, 2.31, 0.00, 542.80, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (198, 160, 'TEST202511181533', 17, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品38', '测试品牌4', 'TEST973156', 184.95, 3, NULL, NULL, 7, NULL, 8.73, 2.12, 0.00, 206.46, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (199, 161, 'TEST202511225216', 59, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品67', '测试品牌5', 'TEST088873', 158.69, 3, NULL, NULL, 1, NULL, 7.61, 3.70, 0.00, 547.15, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (200, 162, 'TEST202511132255', 82, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品32', '测试品牌5', 'TEST511666', 165.67, 2, NULL, NULL, 5, NULL, 1.72, 2.57, 0.00, 202.18, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (201, 163, 'TEST202512067827', 44, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品34', '测试品牌3', 'TEST020150', 162.45, 4, NULL, NULL, 5, NULL, 0.85, 0.11, 0.00, 280.34, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (202, 164, 'TEST202511108672', 43, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品75', '测试品牌5', 'TEST003015', 51.66, 1, NULL, NULL, 6, NULL, 5.90, 1.68, 0.00, 649.50, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (203, 165, 'TEST202511277591', 80, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品14', '测试品牌5', 'TEST310449', 143.81, 3, NULL, NULL, 1, NULL, 0.71, 0.83, 0.00, 527.78, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (204, 166, 'TEST202512087959', 10, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品67', '测试品牌4', 'TEST918439', 128.89, 2, NULL, NULL, 4, NULL, 8.54, 1.84, 0.00, 157.82, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (205, 167, 'TEST202511206171', 48, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品3', '测试品牌3', 'TEST983363', 145.66, 3, NULL, NULL, 2, NULL, 5.38, 0.87, 0.00, 357.95, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (206, 168, 'TEST202511276843', 79, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品44', '测试品牌4', 'TEST321547', 63.60, 2, NULL, NULL, 1, NULL, 2.38, 4.86, 0.00, 303.07, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (207, 169, 'TEST202512046982', 56, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品71', '测试品牌2', 'TEST853950', 93.64, 3, NULL, NULL, 4, NULL, 3.68, 3.33, 0.00, 83.26, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (208, 170, 'TEST202512047787', 3, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品62', '测试品牌4', 'TEST781041', 30.56, 1, NULL, NULL, 6, NULL, 2.18, 2.25, 0.00, 556.72, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (209, 171, 'TEST202511176905', 36, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品19', '测试品牌5', 'TEST429484', 147.50, 1, NULL, NULL, 7, NULL, 9.67, 3.94, 0.00, 202.26, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (210, 172, 'TEST202511144164', 80, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品29', '测试品牌5', 'TEST119308', 33.25, 2, NULL, NULL, 8, NULL, 1.70, 2.74, 0.00, 226.93, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (211, 173, 'TEST202512074101', 62, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品23', '测试品牌1', 'TEST748204', 91.73, 4, NULL, NULL, 8, NULL, 4.42, 4.53, 0.00, 145.43, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (212, 174, 'TEST202512072270', 77, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品59', '测试品牌4', 'TEST711489', 60.51, 1, NULL, NULL, 9, NULL, 0.36, 2.63, 0.00, 71.17, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (213, 175, 'TEST202511172902', 56, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品15', '测试品牌5', 'TEST875393', 157.66, 1, NULL, NULL, 2, NULL, 3.65, 2.43, 0.00, 153.99, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (214, 176, 'TEST202511162660', 14, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品9', '测试品牌1', 'TEST740238', 146.15, 1, NULL, NULL, 9, NULL, 8.14, 2.27, 0.00, 826.76, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (215, 177, 'TEST202512089346', 27, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品27', '测试品牌4', 'TEST235165', 62.22, 3, NULL, NULL, 3, NULL, 2.82, 3.80, 0.00, 639.14, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (216, 178, 'TEST202511277527', 54, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品59', '测试品牌3', 'TEST838236', 94.50, 3, NULL, NULL, 8, NULL, 8.12, 4.48, 0.00, 143.33, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (217, 179, 'TEST202512026355', 46, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品10', '测试品牌5', 'TEST330334', 179.93, 2, NULL, NULL, 8, NULL, 9.17, 1.86, 0.00, 144.67, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (218, 180, 'TEST202512046059', 66, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品55', '测试品牌5', 'TEST621453', 81.74, 5, NULL, NULL, 6, NULL, 0.62, 3.00, 0.00, 315.48, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (219, 181, 'TEST202512042117', 73, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品48', '测试品牌2', 'TEST610006', 59.04, 2, NULL, NULL, 3, NULL, 0.33, 2.16, 0.00, 268.48, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (220, 182, 'TEST202512043229', 66, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品83', '测试品牌3', 'TEST960408', 17.04, 2, NULL, NULL, 4, NULL, 9.56, 3.38, 0.00, 399.71, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (221, 183, 'TEST202511133135', 5, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品59', '测试品牌2', 'TEST697503', 91.26, 5, NULL, NULL, 5, NULL, 5.62, 1.91, 0.00, 431.05, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (222, 184, 'TEST202511298252', 15, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品82', '测试品牌2', 'TEST972551', 151.58, 4, NULL, NULL, 10, NULL, 0.64, 1.81, 0.00, 847.90, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (223, 185, 'TEST202512044824', 9, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品48', '测试品牌3', 'TEST898351', 195.67, 5, NULL, NULL, 10, NULL, 9.00, 3.29, 0.00, 791.47, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (224, 186, 'TEST202511139951', 3, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品23', '测试品牌2', 'TEST520687', 170.91, 3, NULL, NULL, 9, NULL, 0.65, 3.28, 0.00, 146.47, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (225, 187, 'TEST202511142138', 5, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品73', '测试品牌2', 'TEST439147', 121.97, 3, NULL, NULL, 8, NULL, 2.04, 4.15, 0.00, 174.63, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (226, 188, 'TEST202512080055', 28, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品9', '测试品牌3', 'TEST212035', 120.59, 1, NULL, NULL, 10, NULL, 5.36, 3.63, 0.00, 216.57, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (227, 189, 'TEST202512068415', 49, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品10', '测试品牌5', 'TEST919620', 16.05, 2, NULL, NULL, 9, NULL, 1.80, 1.43, 0.00, 701.94, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (228, 190, 'TEST202512062029', 25, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品59', '测试品牌4', 'TEST053262', 83.04, 4, NULL, NULL, 3, NULL, 1.78, 0.92, 0.00, 257.78, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (229, 191, 'TEST202511184373', 65, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品60', '测试品牌2', 'TEST069611', 134.28, 5, NULL, NULL, 7, NULL, 4.37, 1.54, 0.00, 116.08, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (230, 192, 'TEST202512078719', 35, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品35', '测试品牌5', 'TEST902738', 14.96, 3, NULL, NULL, 1, NULL, 7.77, 4.36, 0.00, 130.82, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (231, 193, 'TEST202511243589', 45, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品9', '测试品牌5', 'TEST254121', 116.33, 5, NULL, NULL, 9, NULL, 7.37, 0.14, 0.00, 699.64, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (232, 194, 'TEST202511131788', 5, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品47', '测试品牌4', 'TEST429626', 68.19, 1, NULL, NULL, 10, NULL, 2.87, 2.83, 0.00, 202.41, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (233, 195, 'TEST202512063018', 61, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品23', '测试品牌1', 'TEST982600', 98.10, 2, NULL, NULL, 10, NULL, 9.95, 0.59, 0.00, 592.71, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (234, 196, 'TEST202511282387', 50, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品77', '测试品牌5', 'TEST437424', 141.63, 5, NULL, NULL, 10, NULL, 6.53, 2.56, 0.00, 401.15, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (235, 197, 'TEST202511296836', 40, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品1', '测试品牌4', 'TEST099491', 134.19, 5, NULL, NULL, 2, NULL, 4.22, 3.02, 0.00, 981.27, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (236, 198, 'TEST202511115476', 50, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品7', '测试品牌3', 'TEST689134', 148.76, 3, NULL, NULL, 10, NULL, 4.27, 1.79, 0.00, 355.66, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (237, 199, 'TEST202511300153', 63, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品35', '测试品牌5', 'TEST769009', 97.85, 5, NULL, NULL, 2, NULL, 9.76, 2.47, 0.00, 198.46, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (238, 200, 'TEST202511205476', 40, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品59', '测试品牌1', 'TEST433209', 177.38, 5, NULL, NULL, 10, NULL, 9.11, 4.09, 0.00, 206.79, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (239, 201, 'TEST202511197332', 46, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品64', '测试品牌1', 'TEST629338', 128.49, 1, NULL, NULL, 6, NULL, 7.46, 4.74, 0.00, 517.13, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (240, 202, 'TEST202511157547', 75, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品36', '测试品牌3', 'TEST074610', 199.93, 3, NULL, NULL, 8, NULL, 2.93, 0.72, 0.00, 843.02, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (241, 203, 'TEST202511202645', 25, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品16', '测试品牌1', 'TEST716922', 93.17, 5, NULL, NULL, 4, NULL, 1.88, 3.78, 0.00, 347.86, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (242, 204, 'TEST202511225593', 28, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品25', '测试品牌3', 'TEST540201', 57.56, 3, NULL, NULL, 2, NULL, 9.37, 1.50, 0.00, 528.65, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (243, 205, 'TEST202512015138', 55, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品54', '测试品牌2', 'TEST425598', 70.95, 2, NULL, NULL, 4, NULL, 8.60, 1.71, 0.00, 210.95, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (244, 206, 'TEST202511155111', 52, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品28', '测试品牌4', 'TEST792858', 150.41, 1, NULL, NULL, 6, NULL, 3.67, 0.89, 0.00, 458.25, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (245, 207, 'TEST202511243356', 58, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品21', '测试品牌1', 'TEST943607', 72.05, 4, NULL, NULL, 7, NULL, 1.96, 4.84, 0.00, 173.47, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (246, 208, 'TEST202511117465', 79, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品59', '测试品牌4', 'TEST287193', 90.30, 1, NULL, NULL, 6, NULL, 1.88, 1.83, 0.00, 134.74, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (247, 209, 'TEST202511161356', 33, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品19', '测试品牌5', 'TEST142371', 174.08, 4, NULL, NULL, 10, NULL, 5.42, 4.86, 0.00, 124.07, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (248, 210, 'TEST202511201334', 42, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品65', '测试品牌3', 'TEST704965', 69.03, 2, NULL, NULL, 10, NULL, 5.11, 4.00, 0.00, 643.66, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (249, 211, 'TEST202511176575', 18, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品24', '测试品牌4', 'TEST117812', 51.41, 4, NULL, NULL, 8, NULL, 8.96, 0.57, 0.00, 118.31, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (250, 212, 'TEST202511119769', 55, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品10', '测试品牌3', 'TEST576611', 37.39, 5, NULL, NULL, 4, NULL, 9.54, 3.40, 0.00, 498.26, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (251, 213, 'TEST202511187283', 46, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品71', '测试品牌3', 'TEST427125', 80.97, 3, NULL, NULL, 4, NULL, 5.20, 2.01, 0.00, 69.46, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (252, 214, 'TEST202511237321', 77, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品37', '测试品牌3', 'TEST949507', 85.33, 1, NULL, NULL, 1, NULL, 1.15, 2.22, 0.00, 109.50, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (253, 215, 'TEST202511190004', 53, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品82', '测试品牌1', 'TEST164339', 161.64, 2, NULL, NULL, 3, NULL, 1.83, 1.35, 0.00, 245.88, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (254, 216, 'TEST202511248275', 48, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品24', '测试品牌4', 'TEST627035', 19.72, 2, NULL, NULL, 7, NULL, 2.32, 0.85, 0.00, 107.29, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (255, 217, 'TEST202512077978', 68, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品26', '测试品牌1', 'TEST440394', 209.02, 4, NULL, NULL, 3, NULL, 4.66, 2.37, 0.00, 553.13, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (256, 218, 'TEST202511124996', 18, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品65', '测试品牌2', 'TEST041576', 85.20, 4, NULL, NULL, 7, NULL, 9.75, 4.65, 0.00, 811.28, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (257, 219, 'TEST202511163723', 81, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品32', '测试品牌5', 'TEST697282', 128.06, 5, NULL, NULL, 6, NULL, 0.56, 3.49, 0.00, 289.51, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (258, 220, 'TEST202512011496', 48, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品30', '测试品牌1', 'TEST226610', 200.77, 1, NULL, NULL, 6, NULL, 6.61, 2.73, 0.00, 153.81, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (259, 221, 'TEST202511301097', 26, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品18', '测试品牌1', 'TEST910755', 57.24, 3, NULL, NULL, 6, NULL, 3.29, 0.20, 0.00, 417.14, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (260, 222, 'TEST202512038154', 11, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品65', '测试品牌3', 'TEST077546', 200.31, 3, NULL, NULL, 8, NULL, 2.78, 0.39, 0.00, 465.77, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (261, 223, 'TEST202512058070', 12, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品82', '测试品牌3', 'TEST655817', 152.39, 3, NULL, NULL, 9, NULL, 3.49, 1.35, 0.00, 387.52, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (262, 224, 'TEST202511279455', 56, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品15', '测试品牌5', 'TEST870588', 153.26, 5, NULL, NULL, 7, NULL, 5.87, 4.20, 0.00, 447.72, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (263, 225, 'TEST202512044943', 81, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品75', '测试品牌3', 'TEST155259', 23.51, 5, NULL, NULL, 2, NULL, 1.68, 1.86, 0.00, 381.84, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (264, 226, 'TEST202512028662', 14, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品73', '测试品牌5', 'TEST728861', 18.53, 1, NULL, NULL, 1, NULL, 9.45, 3.55, 0.00, 435.73, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (265, 227, 'TEST202511126304', 1, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品63', '测试品牌4', 'TEST496011', 54.59, 4, NULL, NULL, 5, NULL, 4.43, 4.11, 0.00, 483.09, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (266, 228, 'TEST202511158237', 72, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品83', '测试品牌2', 'TEST983807', 156.47, 4, NULL, NULL, 4, NULL, 6.40, 0.69, 0.00, 458.97, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (267, 229, 'TEST202512068976', 69, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品69', '测试品牌4', 'TEST902886', 106.63, 4, NULL, NULL, 1, NULL, 3.09, 1.44, 0.00, 544.31, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (268, 230, 'TEST202511155391', 1, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品76', '测试品牌3', 'TEST834462', 137.83, 4, NULL, NULL, 6, NULL, 6.44, 2.93, 0.00, 330.78, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (269, 231, 'TEST202511177893', 12, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品3', '测试品牌4', 'TEST600849', 166.64, 1, NULL, NULL, 3, NULL, 7.49, 0.46, 0.00, 342.14, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (270, 232, 'TEST202512060949', 23, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品3', '测试品牌2', 'TEST467339', 91.74, 4, NULL, NULL, 10, NULL, 9.81, 4.80, 0.00, 492.57, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (271, 233, 'TEST202511105435', 42, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品21', '测试品牌4', 'TEST910362', 83.09, 1, NULL, NULL, 4, NULL, 6.34, 0.07, 0.00, 326.46, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (272, 234, 'TEST202511256786', 50, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品43', '测试品牌4', 'TEST373813', 113.52, 3, NULL, NULL, 8, NULL, 5.03, 0.86, 0.00, 155.87, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (273, 235, 'TEST202512053444', 10, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品75', '测试品牌1', 'TEST900800', 40.54, 1, NULL, NULL, 9, NULL, 0.53, 3.62, 0.00, 120.26, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (274, 236, 'TEST202512021748', 24, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品83', '测试品牌1', 'TEST639193', 175.77, 2, NULL, NULL, 7, NULL, 5.53, 4.13, 0.00, 621.38, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (275, 237, 'TEST202511237586', 81, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品18', '测试品牌1', 'TEST158046', 72.46, 1, NULL, NULL, 6, NULL, 2.38, 3.46, 0.00, 645.38, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (276, 238, 'TEST202511295097', 79, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品71', '测试品牌2', 'TEST368660', 149.64, 2, NULL, NULL, 9, NULL, 9.98, 2.50, 0.00, 49.54, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (277, 239, 'TEST202511147124', 49, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品74', '测试品牌4', 'TEST701135', 107.08, 2, NULL, NULL, 2, NULL, 8.39, 3.54, 0.00, 11.61, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (278, 240, 'TEST202511116318', 78, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品55', '测试品牌3', 'TEST402290', 128.77, 4, NULL, NULL, 1, NULL, 8.63, 1.12, 0.00, 753.73, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (279, 241, 'TEST202511156158', 27, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品54', '测试品牌2', 'TEST300210', 164.25, 5, NULL, NULL, 5, NULL, 4.55, 4.40, 0.00, 141.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (280, 242, 'TEST202511222536', 51, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品36', '测试品牌2', 'TEST253223', 78.30, 5, NULL, NULL, 8, NULL, 7.28, 2.50, 0.00, 55.89, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (281, 243, 'TEST202511302501', 31, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品53', '测试品牌1', 'TEST468408', 34.80, 2, NULL, NULL, 8, NULL, 8.63, 1.05, 0.00, 476.53, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (282, 244, 'TEST202511127539', 82, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品73', '测试品牌3', 'TEST627670', 166.42, 1, NULL, NULL, 8, NULL, 8.73, 4.96, 0.00, 423.72, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (283, 245, 'TEST202511276863', 53, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品82', '测试品牌5', 'TEST040259', 52.45, 5, NULL, NULL, 1, NULL, 5.06, 1.68, 0.00, 298.61, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (284, 246, 'TEST202511146683', 37, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品73', '测试品牌1', 'TEST581333', 166.35, 1, NULL, NULL, 5, NULL, 8.98, 0.28, 0.00, 628.74, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (285, 247, 'TEST202511157405', 1, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品66', '测试品牌5', 'TEST218598', 78.39, 1, NULL, NULL, 3, NULL, 0.58, 2.78, 0.00, 341.43, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (286, 248, 'TEST202511273952', 4, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品6', '测试品牌2', 'TEST000446', 64.76, 2, NULL, NULL, 1, NULL, 9.84, 4.33, 0.00, 196.04, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (287, 249, 'TEST202511301888', 27, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品60', '测试品牌4', 'TEST925261', 167.84, 1, NULL, NULL, 5, NULL, 9.07, 0.43, 0.00, 284.45, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (288, 250, 'TEST202512083920', 18, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品22', '测试品牌4', 'TEST607402', 209.98, 1, NULL, NULL, 9, NULL, 9.02, 4.25, 0.00, 163.89, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (289, 251, 'TEST202511144354', 19, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品49', '测试品牌2', 'TEST564251', 16.29, 3, NULL, NULL, 3, NULL, 7.48, 0.28, 0.00, 14.18, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (290, 252, 'TEST202511159127', 79, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品58', '测试品牌4', 'TEST986285', 30.14, 3, NULL, NULL, 5, NULL, 4.73, 0.50, 0.00, 44.55, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (291, 253, 'TEST202512013411', 25, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品13', '测试品牌5', 'TEST971188', 48.85, 1, NULL, NULL, 8, NULL, 3.55, 3.30, 0.00, 103.68, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (292, 254, 'TEST202511257484', 21, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品55', '测试品牌3', 'TEST665419', 161.26, 4, NULL, NULL, 7, NULL, 9.30, 3.39, 0.00, 820.20, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (293, 255, 'TEST202512073902', 6, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品33', '测试品牌4', 'TEST584236', 145.00, 4, NULL, NULL, 1, NULL, 5.64, 2.80, 0.00, 278.47, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (294, 256, 'TEST202511174590', 80, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品21', '测试品牌2', 'TEST926748', 137.66, 3, NULL, NULL, 2, NULL, 4.71, 4.67, 0.00, 237.18, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (295, 257, 'TEST202511094810', 50, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品47', '测试品牌1', 'TEST397049', 197.75, 3, NULL, NULL, 7, NULL, 9.75, 3.93, 0.00, 149.84, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (296, 258, 'TEST202511184460', 30, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品62', '测试品牌4', 'TEST932671', 165.43, 1, NULL, NULL, 2, NULL, 2.71, 0.17, 0.00, 419.35, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (297, 259, 'TEST202511255189', 35, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品80', '测试品牌3', 'TEST839563', 125.42, 2, NULL, NULL, 2, NULL, 4.15, 3.82, 0.00, 504.43, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (298, 260, 'TEST202511300820', 22, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品41', '测试品牌4', 'TEST794627', 15.38, 4, NULL, NULL, 7, NULL, 1.12, 2.71, 0.00, 171.71, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (299, 261, 'TEST202512051636', 10, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品70', '测试品牌5', 'TEST756636', 52.80, 5, NULL, NULL, 4, NULL, 3.92, 4.43, 0.00, 295.18, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (300, 262, 'TEST202511244598', 22, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品41', '测试品牌4', 'TEST782063', 203.73, 3, NULL, NULL, 6, NULL, 4.06, 1.47, 0.00, 182.58, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (301, 263, 'TEST202511133447', 4, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品14', '测试品牌4', 'TEST819188', 33.28, 1, NULL, NULL, 3, NULL, 9.91, 0.69, 0.00, 195.92, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (302, 264, 'TEST202511286846', 56, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品73', '测试品牌2', 'TEST143238', 141.16, 5, NULL, NULL, 3, NULL, 8.47, 2.00, 0.00, 85.93, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (303, 265, 'TEST202511300387', 4, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品79', '测试品牌4', 'TEST180690', 29.67, 5, NULL, NULL, 5, NULL, 4.16, 3.60, 0.00, 370.50, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (304, 266, 'TEST202511215435', 2, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品20', '测试品牌1', 'TEST829703', 177.16, 4, NULL, NULL, 10, NULL, 6.38, 1.83, 0.00, 607.18, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (305, 267, 'TEST202511250853', 59, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品6', '测试品牌1', 'TEST777238', 70.99, 1, NULL, NULL, 1, NULL, 6.74, 1.09, 0.00, 195.59, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (306, 268, 'TEST202512049311', 18, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品1', '测试品牌2', 'TEST895889', 77.70, 1, NULL, NULL, 1, NULL, 0.31, 0.63, 0.00, 281.56, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (307, 269, 'TEST202511300555', 2, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品10', '测试品牌3', 'TEST258385', 155.25, 5, NULL, NULL, 2, NULL, 9.41, 2.01, 0.00, 289.34, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (308, 270, 'TEST202511224386', 83, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品69', '测试品牌1', 'TEST258777', 181.72, 3, NULL, NULL, 1, NULL, 4.89, 2.11, 0.00, 851.66, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (309, 271, 'TEST202511114160', 71, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品33', '测试品牌3', 'TEST874675', 37.71, 1, NULL, NULL, 10, NULL, 4.34, 1.94, 0.00, 55.87, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (310, 272, 'TEST202511292140', 15, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品69', '测试品牌4', 'TEST590896', 31.71, 4, NULL, NULL, 6, NULL, 3.15, 4.99, 0.00, 69.04, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (311, 273, 'TEST202511133666', 2, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品36', '测试品牌1', 'TEST984081', 163.08, 5, NULL, NULL, 1, NULL, 7.64, 2.93, 0.00, 422.87, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (312, 274, 'TEST202511127916', 28, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品26', '测试品牌3', 'TEST714953', 209.60, 5, NULL, NULL, 3, NULL, 6.24, 2.12, 0.00, 468.39, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (313, 275, 'TEST202511132176', 15, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品76', '测试品牌1', 'TEST388699', 184.98, 2, NULL, NULL, 5, NULL, 4.63, 0.31, 0.00, 540.69, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (314, 276, 'TEST202512059504', 32, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品53', '测试品牌5', 'TEST035285', 55.29, 1, NULL, NULL, 5, NULL, 1.83, 2.78, 0.00, 240.83, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (315, 277, 'TEST202511230962', 68, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品47', '测试品牌2', 'TEST218038', 198.12, 1, NULL, NULL, 5, NULL, 9.66, 2.82, 0.00, 1090.08, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (316, 278, 'TEST202511157208', 70, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品35', '测试品牌3', 'TEST611187', 78.19, 5, NULL, NULL, 4, NULL, 0.50, 1.27, 0.00, 272.29, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (317, 279, 'TEST202511193839', 61, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品17', '测试品牌5', 'TEST546745', 57.61, 3, NULL, NULL, 1, NULL, 5.30, 2.72, 0.00, 17.12, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (318, 280, 'TEST202511140320', 53, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品13', '测试品牌5', 'TEST901993', 188.36, 4, NULL, NULL, 1, NULL, 1.89, 3.37, 0.00, 64.83, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (319, 281, 'TEST202511113435', 54, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品17', '测试品牌1', 'TEST665589', 43.82, 5, NULL, NULL, 8, NULL, 1.36, 2.36, 0.00, 430.44, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (320, 282, 'TEST202512033433', 65, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品78', '测试品牌2', 'TEST829230', 43.32, 2, NULL, NULL, 3, NULL, 0.99, 4.06, 0.00, 432.65, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (321, 283, 'TEST202512088411', 57, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品20', '测试品牌1', 'TEST919685', 54.13, 2, NULL, NULL, 1, NULL, 2.64, 0.71, 0.00, 228.15, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (322, 284, 'TEST202511103272', 3, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品55', '测试品牌2', 'TEST178418', 48.86, 3, NULL, NULL, 6, NULL, 6.85, 3.14, 0.00, 174.74, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (323, 285, 'TEST202511296503', 43, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品76', '测试品牌5', 'TEST168236', 192.70, 1, NULL, NULL, 6, NULL, 6.78, 3.34, 0.00, 302.05, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (324, 286, 'TEST202511204094', 66, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品25', '测试品牌1', 'TEST719763', 57.21, 1, NULL, NULL, 4, NULL, 9.21, 2.06, 0.00, 160.03, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (325, 287, 'TEST202511148508', 37, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品34', '测试品牌4', 'TEST194681', 196.99, 1, NULL, NULL, 7, NULL, 9.73, 4.58, 0.00, 531.81, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (326, 288, 'TEST202512033356', 70, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品43', '测试品牌1', 'TEST660643', 46.50, 5, NULL, NULL, 2, NULL, 7.33, 1.76, 0.00, 587.78, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (327, 289, 'TEST202511202106', 81, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品55', '测试品牌2', 'TEST978146', 153.47, 4, NULL, NULL, 2, NULL, 5.90, 3.11, 0.00, 469.39, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (328, 290, 'TEST202512022837', 9, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品5', '测试品牌5', 'TEST518929', 169.07, 3, NULL, NULL, 8, NULL, 3.09, 2.02, 0.00, 91.24, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (329, 291, 'TEST202511285693', 2, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品25', '测试品牌3', 'TEST258852', 11.76, 2, NULL, NULL, 4, NULL, 7.50, 4.10, 0.00, 892.88, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (330, 292, 'TEST202511230893', 37, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品66', '测试品牌4', 'TEST778866', 11.83, 4, NULL, NULL, 6, NULL, 4.62, 3.78, 0.00, 457.69, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (331, 293, 'TEST202511125633', 33, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品67', '测试品牌5', 'TEST750091', 62.14, 1, NULL, NULL, 5, NULL, 2.60, 4.24, 0.00, 548.11, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (332, 294, 'TEST202511158535', 40, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品7', '测试品牌5', 'TEST618737', 44.29, 1, NULL, NULL, 5, NULL, 4.53, 3.96, 0.00, 549.91, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (333, 295, 'TEST202512010625', 31, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品78', '测试品牌3', 'TEST078852', 142.21, 1, NULL, NULL, 4, NULL, 5.94, 4.45, 0.00, 638.80, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (334, 296, 'TEST202511219432', 34, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品81', '测试品牌4', 'TEST223468', 58.52, 3, NULL, NULL, 10, NULL, 3.00, 2.71, 0.00, 474.07, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (335, 297, 'TEST202511162463', 56, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品9', '测试品牌3', 'TEST190325', 100.18, 4, NULL, NULL, 1, NULL, 2.72, 0.82, 0.00, 127.28, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (336, 298, 'TEST202511122183', 63, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品7', '测试品牌1', 'TEST387534', 124.72, 4, NULL, NULL, 9, NULL, 9.14, 0.75, 0.00, 140.86, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (337, 299, 'TEST202511215641', 2, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品23', '测试品牌2', 'TEST565552', 11.59, 2, NULL, NULL, 7, NULL, 4.29, 0.34, 0.00, 32.06, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (338, 300, 'TEST202512038002', 18, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品68', '测试品牌3', 'TEST781212', 124.58, 3, NULL, NULL, 9, NULL, 8.64, 3.31, 0.00, 617.89, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (339, 301, 'TEST202511233683', 78, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品69', '测试品牌2', 'TEST119775', 137.85, 5, NULL, NULL, 3, NULL, 8.25, 1.63, 0.00, 290.21, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (340, 302, 'TEST202512017324', 37, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品70', '测试品牌5', 'TEST003241', 69.69, 3, NULL, NULL, 6, NULL, 1.41, 0.76, 0.00, 142.94, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (341, 303, 'TEST202511126193', 8, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品64', '测试品牌3', 'TEST660342', 114.13, 4, NULL, NULL, 6, NULL, 8.81, 3.77, 0.00, 146.57, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (342, 304, 'TEST202511195438', 48, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品56', '测试品牌4', 'TEST103359', 141.55, 5, NULL, NULL, 10, NULL, 6.63, 2.78, 0.00, 328.57, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (343, 305, 'TEST202512023024', 4, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品30', '测试品牌4', 'TEST204796', 22.47, 4, NULL, NULL, 4, NULL, 4.08, 0.70, 0.00, 690.91, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (344, 306, 'TEST202511307827', 35, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品13', '测试品牌3', 'TEST028576', 143.07, 2, NULL, NULL, 3, NULL, 3.20, 4.87, 0.00, 760.18, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (345, 307, 'TEST202512023416', 37, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品24', '测试品牌1', 'TEST575787', 136.61, 3, NULL, NULL, 3, NULL, 1.40, 4.13, 0.00, 128.63, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (346, 308, 'TEST202511141212', 26, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品24', '测试品牌3', 'TEST562644', 83.21, 1, NULL, NULL, 7, NULL, 6.39, 1.79, 0.00, 340.02, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (347, 309, 'TEST202511248068', 62, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品74', '测试品牌2', 'TEST377105', 63.68, 2, NULL, NULL, 3, NULL, 6.10, 1.51, 0.00, 500.22, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (348, 310, 'TEST202511252764', 44, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品6', '测试品牌4', 'TEST678050', 21.73, 2, NULL, NULL, 2, NULL, 8.21, 3.74, 0.00, 81.62, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (349, 311, 'TEST202511191048', 66, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品51', '测试品牌4', 'TEST346273', 177.78, 1, NULL, NULL, 3, NULL, 8.42, 2.13, 0.00, 643.01, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (350, 312, 'TEST202511178299', 77, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品32', '测试品牌1', 'TEST407685', 153.45, 2, NULL, NULL, 7, NULL, 2.34, 0.87, 0.00, 141.92, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (351, 313, 'TEST202512033932', 13, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品62', '测试品牌2', 'TEST158567', 201.44, 2, NULL, NULL, 7, NULL, 4.67, 1.48, 0.00, 158.05, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (352, 314, 'TEST202512074896', 28, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品8', '测试品牌3', 'TEST094661', 20.78, 5, NULL, NULL, 8, NULL, 8.74, 0.36, 0.00, 484.30, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (353, 315, 'TEST202511302981', 11, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品20', '测试品牌4', 'TEST177230', 122.94, 2, NULL, NULL, 8, NULL, 9.50, 2.27, 0.00, 505.15, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (354, 316, 'TEST202511309706', 44, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品27', '测试品牌1', 'TEST228771', 16.57, 3, NULL, NULL, 3, NULL, 0.21, 1.16, 0.00, 254.51, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (355, 317, 'TEST202512062671', 59, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品9', '测试品牌3', 'TEST770074', 130.37, 4, NULL, NULL, 7, NULL, 3.51, 3.42, 0.00, 478.02, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (356, 318, 'TEST202511175029', 71, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品73', '测试品牌4', 'TEST379024', 110.99, 2, NULL, NULL, 5, NULL, 9.54, 2.50, 0.00, 629.33, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (357, 319, 'TEST202511138805', 48, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品65', '测试品牌1', 'TEST489405', 200.61, 2, NULL, NULL, 7, NULL, 2.40, 1.61, 0.00, 573.58, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (358, 320, 'TEST202511135376', 60, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品14', '测试品牌4', 'TEST871348', 76.84, 1, NULL, NULL, 3, NULL, 2.38, 1.73, 0.00, 15.20, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (359, 321, 'TEST202511292925', 7, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品26', '测试品牌2', 'TEST692723', 108.00, 2, NULL, NULL, 4, NULL, 8.30, 4.91, 0.00, 139.59, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (360, 322, 'TEST202511270996', 50, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品38', '测试品牌3', 'TEST004815', 131.92, 1, NULL, NULL, 4, NULL, 5.96, 4.80, 0.00, 51.88, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (361, 323, 'TEST202511103848', 76, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品1', '测试品牌2', 'TEST316201', 167.45, 5, NULL, NULL, 6, NULL, 9.18, 4.31, 0.00, 196.11, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (362, 324, 'TEST202511147010', 31, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品16', '测试品牌5', 'TEST758621', 48.75, 4, NULL, NULL, 9, NULL, 3.38, 0.21, 0.00, 352.85, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (363, 325, 'TEST202511273542', 54, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品57', '测试品牌3', 'TEST327812', 53.41, 1, NULL, NULL, 9, NULL, 9.82, 1.69, 0.00, 724.99, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (364, 326, 'TEST202511233335', 29, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品47', '测试品牌4', 'TEST158434', 108.52, 5, NULL, NULL, 5, NULL, 3.41, 1.62, 0.00, 828.70, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (365, 327, 'TEST202511297929', 17, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品83', '测试品牌2', 'TEST961475', 137.68, 2, NULL, NULL, 7, NULL, 1.89, 0.39, 0.00, 973.16, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (366, 328, 'TEST202511115848', 1, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品29', '测试品牌4', 'TEST502791', 87.74, 3, NULL, NULL, 1, NULL, 7.44, 3.44, 0.00, 20.85, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (367, 329, 'TEST202511105105', 31, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品68', '测试品牌5', 'TEST349904', 187.00, 2, NULL, NULL, 3, NULL, 9.82, 1.23, 0.00, 356.17, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (368, 330, 'TEST202511193019', 48, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品66', '测试品牌2', 'TEST924434', 177.64, 3, NULL, NULL, 6, NULL, 6.14, 1.75, 0.00, 607.44, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (369, 331, 'TEST202512017812', 63, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品25', '测试品牌2', 'TEST158780', 42.95, 2, NULL, NULL, 3, NULL, 1.74, 0.70, 0.00, 195.02, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (370, 332, 'TEST202511162721', 67, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品51', '测试品牌4', 'TEST444363', 60.37, 5, NULL, NULL, 9, NULL, 5.97, 1.79, 0.00, 198.70, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (371, 333, 'TEST202511233563', 56, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品44', '测试品牌4', 'TEST574918', 206.77, 1, NULL, NULL, 1, NULL, 5.22, 2.74, 0.00, 101.62, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (372, 334, 'TEST202511161901', 50, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品25', '测试品牌4', 'TEST512868', 116.87, 1, NULL, NULL, 1, NULL, 9.12, 1.86, 0.00, 188.51, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (373, 335, 'TEST202512075129', 20, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品50', '测试品牌2', 'TEST659731', 95.04, 1, NULL, NULL, 5, NULL, 8.52, 4.43, 0.00, 790.01, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (374, 336, 'TEST202511155490', 70, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品11', '测试品牌1', 'TEST228923', 165.39, 1, NULL, NULL, 7, NULL, 7.02, 2.66, 0.00, 167.17, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (375, 337, 'TEST202512010134', 17, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品40', '测试品牌4', 'TEST556183', 86.96, 2, NULL, NULL, 2, NULL, 8.50, 4.40, 0.00, 685.57, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (376, 338, 'TEST202512071497', 40, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品47', '测试品牌2', 'TEST121996', 117.34, 2, NULL, NULL, 10, NULL, 9.35, 3.72, 0.00, 436.23, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (377, 339, 'TEST202512032294', 80, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品66', '测试品牌1', 'TEST883253', 63.90, 4, NULL, NULL, 7, NULL, 3.10, 2.54, 0.00, 455.50, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (378, 340, 'TEST202511249963', 63, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品17', '测试品牌4', 'TEST247924', 194.73, 5, NULL, NULL, 7, NULL, 3.85, 0.59, 0.00, 564.05, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (379, 341, 'TEST202511158464', 72, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品66', '测试品牌2', 'TEST419139', 16.01, 5, NULL, NULL, 4, NULL, 1.89, 4.13, 0.00, 304.11, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (380, 342, 'TEST202511274505', 4, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品14', '测试品牌4', 'TEST851518', 62.93, 4, NULL, NULL, 1, NULL, 9.44, 2.84, 0.00, 81.06, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (381, 343, 'TEST202511242792', 56, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品28', '测试品牌4', 'TEST176385', 207.25, 3, NULL, NULL, 1, NULL, 0.53, 0.55, 0.00, 408.81, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (437, 399, 'TEST202511297299', 20, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品82', '测试品牌1', 'TEST047742', 139.53, 1, NULL, NULL, 6, NULL, 3.75, 1.39, 0.00, 251.08, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (438, 400, 'TEST202511246397', 55, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品68', '测试品牌1', 'TEST079892', 26.77, 1, NULL, NULL, 7, NULL, 6.91, 2.58, 0.00, 725.95, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (439, 401, 'TEST202512069619', 32, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品81', '测试品牌4', 'TEST675206', 53.82, 1, NULL, NULL, 7, NULL, 2.53, 0.93, 0.00, 132.79, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (440, 402, 'TEST202511248830', 1, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品12', '测试品牌4', 'TEST873746', 89.10, 2, NULL, NULL, 6, NULL, 9.06, 3.73, 0.00, 180.47, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (441, 403, 'TEST202511293559', 3, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品59', '测试品牌3', 'TEST017783', 173.31, 1, NULL, NULL, 7, NULL, 3.99, 4.52, 0.00, 496.19, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (442, 404, 'TEST202511122727', 45, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品80', '测试品牌2', 'TEST132053', 20.79, 5, NULL, NULL, 3, NULL, 4.10, 2.16, 0.00, 475.32, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (443, 405, 'TEST202511135583', 4, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品10', '测试品牌3', 'TEST963089', 94.19, 2, NULL, NULL, 9, NULL, 4.27, 3.45, 0.00, 307.76, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (444, 406, 'TEST202511155436', 33, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品53', '测试品牌5', 'TEST920448', 153.57, 5, NULL, NULL, 10, NULL, 4.47, 1.38, 0.00, 99.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (445, 407, 'TEST202511185738', 59, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品38', '测试品牌1', 'TEST346137', 71.05, 3, NULL, NULL, 6, NULL, 1.54, 0.99, 0.00, 66.25, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (446, 408, 'TEST202511278537', 52, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品1', '测试品牌1', 'TEST725329', 46.47, 4, NULL, NULL, 2, NULL, 4.53, 4.35, 0.00, 474.05, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (447, 409, 'TEST202512071637', 64, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品65', '测试品牌3', 'TEST574314', 36.79, 5, NULL, NULL, 4, NULL, 8.21, 0.54, 0.00, 35.79, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (448, 410, 'TEST202511107045', 13, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品41', '测试品牌1', 'TEST645617', 41.12, 5, NULL, NULL, 8, NULL, 1.73, 3.24, 0.00, 663.13, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (449, 411, 'TEST202511281617', 15, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品72', '测试品牌5', 'TEST417640', 146.13, 1, NULL, NULL, 8, NULL, 0.98, 1.81, 0.00, 389.10, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (450, 412, 'TEST202511308833', 77, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品10', '测试品牌5', 'TEST738151', 58.29, 5, NULL, NULL, 3, NULL, 2.19, 1.89, 0.00, 37.01, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (451, 413, 'TEST202511091468', 40, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品22', '测试品牌5', 'TEST684713', 157.78, 4, NULL, NULL, 10, NULL, 0.02, 0.28, 0.00, 129.84, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (452, 414, 'TEST202511119963', 23, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品58', '测试品牌4', 'TEST177259', 196.46, 1, NULL, NULL, 9, NULL, 8.69, 3.96, 0.00, 239.91, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (453, 415, 'TEST202511130230', 72, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品15', '测试品牌2', 'TEST892012', 131.45, 2, NULL, NULL, 10, NULL, 8.16, 0.72, 0.00, 450.37, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (454, 416, 'TEST202511160645', 63, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品3', '测试品牌5', 'TEST320279', 201.92, 5, NULL, NULL, 4, NULL, 0.23, 0.96, 0.00, 1031.35, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (455, 417, 'TEST202511203618', 65, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品20', '测试品牌5', 'TEST378913', 99.81, 1, NULL, NULL, 2, NULL, 6.51, 3.35, 0.00, 613.34, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (456, 418, 'TEST202512038861', 58, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品44', '测试品牌3', 'TEST142167', 26.93, 5, NULL, NULL, 8, NULL, 6.61, 0.56, 0.00, 485.53, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (457, 419, 'TEST202512075796', 10, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品70', '测试品牌5', 'TEST694790', 201.41, 4, NULL, NULL, 7, NULL, 0.64, 2.10, 0.00, 346.46, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (458, 420, 'TEST202511297579', 51, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品20', '测试品牌2', 'TEST173335', 156.38, 1, NULL, NULL, 6, NULL, 0.90, 4.71, 0.00, 292.52, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (459, 421, 'TEST202512062122', 56, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品14', '测试品牌4', 'TEST463942', 199.77, 2, NULL, NULL, 10, NULL, 5.22, 4.30, 0.00, 145.58, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (460, 422, 'TEST202512047195', 27, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品22', '测试品牌2', 'TEST944442', 148.41, 4, NULL, NULL, 1, NULL, 4.13, 4.45, 0.00, 170.49, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (461, 423, 'TEST202511213638', 19, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品83', '测试品牌2', 'TEST644117', 57.56, 2, NULL, NULL, 6, NULL, 0.80, 3.46, 0.00, 24.58, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (462, 424, 'TEST202511206975', 33, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品79', '测试品牌3', 'TEST904975', 185.59, 4, NULL, NULL, 8, NULL, 6.79, 0.86, 0.00, 648.33, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (463, 425, 'TEST202511120290', 39, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品49', '测试品牌3', 'TEST909112', 198.18, 5, NULL, NULL, 1, NULL, 3.82, 3.61, 0.00, 129.76, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (464, 426, 'TEST202511098935', 29, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品24', '测试品牌2', 'TEST000891', 190.08, 3, NULL, NULL, 8, NULL, 4.81, 0.09, 0.00, 209.96, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (465, 427, 'TEST202511302280', 3, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品48', '测试品牌4', 'TEST030473', 192.15, 3, NULL, NULL, 6, NULL, 5.12, 4.10, 0.00, 325.54, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (466, 428, 'TEST202511265232', 15, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品61', '测试品牌1', 'TEST409598', 149.39, 2, NULL, NULL, 2, NULL, 1.75, 1.56, 0.00, 60.08, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (467, 429, 'TEST202511187763', 81, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品20', '测试品牌2', 'TEST537012', 198.30, 1, NULL, NULL, 7, NULL, 0.00, 0.14, 0.00, 218.02, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (468, 430, 'TEST202511305961', 49, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品11', '测试品牌5', 'TEST022701', 104.31, 2, NULL, NULL, 1, NULL, 3.01, 2.01, 0.00, 124.86, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (469, 431, 'TEST202511132832', 35, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品3', '测试品牌5', 'TEST418160', 87.15, 4, NULL, NULL, 3, NULL, 0.49, 3.01, 0.00, 589.65, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (470, 432, 'TEST202511300623', 78, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品16', '测试品牌1', 'TEST903169', 59.43, 3, NULL, NULL, 9, NULL, 8.69, 3.38, 0.00, 878.06, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (471, 433, 'TEST202511286693', 77, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品5', '测试品牌3', 'TEST410136', 110.88, 2, NULL, NULL, 10, NULL, 8.48, 2.03, 0.00, 176.73, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (472, 434, 'TEST202512032741', 49, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品25', '测试品牌4', 'TEST839727', 200.74, 2, NULL, NULL, 4, NULL, 1.79, 3.69, 0.00, 218.80, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (473, 435, 'TEST202511272504', 30, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品7', '测试品牌2', 'TEST419078', 30.37, 2, NULL, NULL, 10, NULL, 0.17, 1.11, 0.00, 174.91, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (474, 436, 'TEST202511241483', 80, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品76', '测试品牌4', 'TEST584404', 197.94, 5, NULL, NULL, 10, NULL, 6.99, 3.86, 0.00, 557.31, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (475, 437, 'TEST202512071734', 27, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品2', '测试品牌1', 'TEST701715', 19.38, 1, NULL, NULL, 6, NULL, 1.44, 1.01, 0.00, 246.89, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (476, 438, 'TEST202511118420', 52, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品25', '测试品牌4', 'TEST145826', 192.90, 1, NULL, NULL, 10, NULL, 2.52, 2.32, 0.00, 374.25, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (477, 439, 'TEST202511251183', 41, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品13', '测试品牌2', 'TEST948150', 189.54, 4, NULL, NULL, 6, NULL, 7.02, 4.66, 0.00, 752.25, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (478, 440, 'TEST202511265577', 10, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品62', '测试品牌2', 'TEST417008', 31.71, 2, NULL, NULL, 2, NULL, 7.90, 2.76, 0.00, 206.20, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (479, 441, 'TEST202511199819', 27, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品59', '测试品牌3', 'TEST690165', 163.85, 4, NULL, NULL, 6, NULL, 5.27, 4.62, 0.00, 113.09, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (480, 442, 'TEST202511184136', 83, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品60', '测试品牌3', 'TEST808852', 63.82, 5, NULL, NULL, 8, NULL, 1.82, 2.73, 0.00, 126.14, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (481, 443, 'TEST202512018030', 71, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品33', '测试品牌3', 'TEST925229', 83.29, 1, NULL, NULL, 2, NULL, 7.46, 0.90, 0.00, 693.87, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (482, 444, 'TEST202511190393', 68, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品66', '测试品牌3', 'TEST071275', 190.58, 2, NULL, NULL, 8, NULL, 0.73, 4.90, 0.00, 451.71, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (483, 445, 'TEST202511226459', 23, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品82', '测试品牌1', 'TEST405118', 174.61, 5, NULL, NULL, 1, NULL, 4.54, 0.88, 0.00, 87.30, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (484, 446, 'TEST202511122325', 67, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品64', '测试品牌3', 'TEST953006', 92.12, 1, NULL, NULL, 8, NULL, 1.09, 1.66, 0.00, 367.52, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (485, 447, 'TEST202512060038', 21, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品25', '测试品牌4', 'TEST851367', 11.82, 3, NULL, NULL, 5, NULL, 6.76, 0.45, 0.00, 566.45, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (486, 448, 'TEST202511124598', 1, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品37', '测试品牌1', 'TEST570308', 75.19, 5, NULL, NULL, 7, NULL, 3.26, 3.90, 0.00, 358.02, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (487, 449, 'TEST202511106060', 49, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品8', '测试品牌4', 'TEST386031', 155.44, 3, NULL, NULL, 3, NULL, 6.07, 2.05, 0.00, 411.99, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (488, 450, 'TEST202511090685', 73, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品54', '测试品牌3', 'TEST961548', 25.58, 3, NULL, NULL, 3, NULL, 9.38, 4.09, 0.00, 467.76, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (489, 451, 'TEST202512068664', 69, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品27', '测试品牌1', 'TEST666760', 202.27, 5, NULL, NULL, 2, NULL, 3.20, 0.79, 0.00, 733.57, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (490, 452, 'TEST202512085948', 70, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品17', '测试品牌3', 'TEST781316', 106.36, 1, NULL, NULL, 9, NULL, 2.06, 1.94, 0.00, 266.89, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (491, 453, 'TEST202511236033', 27, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品18', '测试品牌1', 'TEST988643', 122.02, 5, NULL, NULL, 5, NULL, 9.61, 1.62, 0.00, 732.53, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (492, 454, 'TEST202512049355', 36, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品78', '测试品牌2', 'TEST086416', 71.69, 2, NULL, NULL, 5, NULL, 6.00, 2.65, 0.00, 751.19, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (493, 455, 'TEST202511138974', 64, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品72', '测试品牌5', 'TEST322064', 144.49, 2, NULL, NULL, 10, NULL, 6.26, 1.22, 0.00, 540.21, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (494, 456, 'TEST202511128765', 64, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品81', '测试品牌3', 'TEST832650', 113.45, 1, NULL, NULL, 9, NULL, 1.82, 1.21, 0.00, 538.99, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (495, 457, 'TEST202511136040', 76, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品66', '测试品牌2', 'TEST791651', 62.78, 5, NULL, NULL, 10, NULL, 8.20, 1.55, 0.00, 157.62, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (496, 458, 'TEST202511146315', 21, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品62', '测试品牌5', 'TEST561635', 197.58, 1, NULL, NULL, 3, NULL, 0.34, 2.71, 0.00, 361.46, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (497, 459, 'TEST202511176231', 16, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品60', '测试品牌1', 'TEST951804', 150.95, 4, NULL, NULL, 3, NULL, 1.33, 4.91, 0.00, 457.58, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (498, 460, 'TEST202512054380', 38, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品42', '测试品牌1', 'TEST085909', 26.50, 1, NULL, NULL, 6, NULL, 1.69, 1.33, 0.00, 373.30, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (499, 461, 'TEST202511242407', 9, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品50', '测试品牌4', 'TEST386198', 17.24, 1, NULL, NULL, 1, NULL, 9.49, 3.67, 0.00, 1001.35, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (500, 462, 'TEST202511235957', 13, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品82', '测试品牌3', 'TEST388368', 117.01, 3, NULL, NULL, 10, NULL, 1.98, 0.76, 0.00, 164.31, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (501, 463, 'TEST202512013730', 38, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品9', '测试品牌1', 'TEST388827', 115.58, 3, NULL, NULL, 8, NULL, 4.90, 0.51, 0.00, 233.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (502, 464, 'TEST202512069397', 35, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品29', '测试品牌3', 'TEST284480', 17.93, 2, NULL, NULL, 7, NULL, 9.90, 0.68, 0.00, 163.21, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (503, 465, 'TEST202511127231', 44, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品21', '测试品牌4', 'TEST562567', 175.41, 3, NULL, NULL, 8, NULL, 4.39, 4.62, 0.00, 414.66, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (504, 466, 'TEST202511197549', 76, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品20', '测试品牌3', 'TEST508782', 54.30, 3, NULL, NULL, 3, NULL, 4.61, 2.91, 0.00, 677.52, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (505, 467, 'TEST202511270246', 70, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品47', '测试品牌2', 'TEST578137', 39.23, 5, NULL, NULL, 6, NULL, 7.28, 0.05, 0.00, 370.80, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (506, 468, 'TEST202512069740', 75, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品48', '测试品牌1', 'TEST189945', 91.16, 3, NULL, NULL, 1, NULL, 0.14, 4.19, 0.00, 85.53, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (507, 469, 'TEST202511200555', 48, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品22', '测试品牌4', 'TEST216762', 65.71, 4, NULL, NULL, 9, NULL, 1.57, 0.78, 0.00, 64.73, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (508, 470, 'TEST202512033801', 39, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品5', '测试品牌5', 'TEST414229', 73.52, 2, NULL, NULL, 8, NULL, 8.34, 4.24, 0.00, 175.51, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (509, 471, 'TEST202512029446', 40, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品82', '测试品牌3', 'TEST469309', 188.55, 1, NULL, NULL, 7, NULL, 8.36, 1.88, 0.00, 451.53, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (510, 472, 'TEST202512077109', 48, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品53', '测试品牌3', 'TEST430427', 160.06, 3, NULL, NULL, 1, NULL, 8.72, 1.05, 0.00, 374.01, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (511, 473, 'TEST202512069022', 33, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品31', '测试品牌4', 'TEST041314', 75.63, 3, NULL, NULL, 6, NULL, 4.48, 2.20, 0.00, 1080.95, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (512, 474, 'TEST202512018938', 24, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品41', '测试品牌4', 'TEST549858', 197.84, 1, NULL, NULL, 5, NULL, 9.34, 2.12, 0.00, 202.89, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (513, 475, 'TEST202512061538', 61, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品51', '测试品牌5', 'TEST455960', 153.34, 2, NULL, NULL, 10, NULL, 9.92, 0.88, 0.00, 1137.40, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (514, 476, 'TEST202512054678', 18, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品8', '测试品牌5', 'TEST829537', 148.33, 5, NULL, NULL, 8, NULL, 9.55, 2.29, 0.00, 504.78, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (515, 477, 'TEST202512015714', 42, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品20', '测试品牌4', 'TEST707951', 107.51, 2, NULL, NULL, 2, NULL, 5.92, 3.20, 0.00, 158.60, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (516, 478, 'TEST202512020997', 62, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品10', '测试品牌2', 'TEST257445', 76.92, 5, NULL, NULL, 5, NULL, 7.96, 2.40, 0.00, 148.07, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (517, 479, 'TEST202511221189', 12, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品64', '测试品牌3', 'TEST847435', 199.57, 1, NULL, NULL, 2, NULL, 1.15, 0.77, 0.00, 425.67, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (518, 480, 'TEST202512073631', 78, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品61', '测试品牌5', 'TEST161619', 48.90, 3, NULL, NULL, 9, NULL, 8.12, 2.48, 0.00, 181.53, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (519, 481, 'TEST202512033627', 36, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品3', '测试品牌5', 'TEST179058', 76.84, 1, NULL, NULL, 7, NULL, 9.29, 3.24, 0.00, 236.75, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (520, 482, 'TEST202512015069', 18, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品11', '测试品牌5', 'TEST564477', 181.54, 3, NULL, NULL, 5, NULL, 2.26, 4.61, 0.00, 1068.70, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (521, 483, 'TEST202511116602', 57, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品58', '测试品牌3', 'TEST124195', 69.72, 1, NULL, NULL, 8, NULL, 1.72, 3.69, 0.00, 273.83, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (522, 484, 'TEST202511244767', 70, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品14', '测试品牌2', 'TEST057587', 81.44, 4, NULL, NULL, 10, NULL, 1.32, 3.38, 0.00, 1096.76, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (523, 485, 'TEST202511297379', 38, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品52', '测试品牌4', 'TEST905527', 63.00, 4, NULL, NULL, 3, NULL, 4.11, 1.57, 0.00, 431.32, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (524, 486, 'TEST202512060839', 62, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品36', '测试品牌5', 'TEST375683', 26.56, 2, NULL, NULL, 2, NULL, 0.71, 3.99, 0.00, 515.97, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (525, 487, 'TEST202512067878', 7, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品78', '测试品牌3', 'TEST345646', 99.55, 2, NULL, NULL, 7, NULL, 7.22, 3.06, 0.00, 759.63, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (526, 488, 'TEST202512027196', 44, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品59', '测试品牌5', 'TEST702390', 132.49, 5, NULL, NULL, 10, NULL, 8.26, 1.57, 0.00, 168.87, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (527, 489, 'TEST202512074715', 29, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品13', '测试品牌4', 'TEST168524', 143.43, 5, NULL, NULL, 2, NULL, 2.58, 4.19, 0.00, 399.79, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (528, 490, 'TEST202512057962', 58, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品60', '测试品牌3', 'TEST216990', 144.17, 4, NULL, NULL, 6, NULL, 4.09, 2.67, 0.00, 430.82, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (529, 491, 'TEST202511245215', 64, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品79', '测试品牌3', 'TEST379581', 123.98, 4, NULL, NULL, 9, NULL, 0.88, 4.54, 0.00, 341.62, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (530, 492, 'TEST202512014349', 41, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品38', '测试品牌4', 'TEST601779', 136.93, 2, NULL, NULL, 10, NULL, 5.74, 0.32, 0.00, 691.46, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (531, 493, 'TEST202511236831', 22, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品72', '测试品牌3', 'TEST978658', 82.51, 5, NULL, NULL, 3, NULL, 8.49, 1.79, 0.00, 87.36, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (532, 494, 'TEST202512042724', 83, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品47', '测试品牌5', 'TEST322003', 51.74, 1, NULL, NULL, 8, NULL, 5.72, 2.89, 0.00, 64.33, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (533, 495, 'TEST202512056749', 9, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品13', '测试品牌3', 'TEST681151', 36.53, 4, NULL, NULL, 8, NULL, 6.44, 0.59, 0.00, 863.59, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (534, 496, 'TEST202511249271', 65, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品2', '测试品牌4', 'TEST832743', 175.20, 4, NULL, NULL, 7, NULL, 5.07, 2.48, 0.00, 385.37, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (535, 497, 'TEST202511211536', 47, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品78', '测试品牌1', 'TEST284806', 82.60, 5, NULL, NULL, 8, NULL, 6.87, 1.47, 0.00, 118.08, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (536, 498, 'TEST202511252005', 43, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品11', '测试品牌1', 'TEST998236', 164.77, 5, NULL, NULL, 1, NULL, 6.33, 0.06, 0.00, 296.22, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (537, 499, 'TEST202511154493', 31, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品43', '测试品牌3', 'TEST891852', 208.76, 2, NULL, NULL, 5, NULL, 5.48, 1.41, 0.00, 1015.97, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (538, 500, 'TEST202511095230', 57, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品36', '测试品牌1', 'TEST069944', 38.94, 3, NULL, NULL, 2, NULL, 1.31, 1.27, 0.00, 705.05, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (539, 501, 'TEST202512063296', 35, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品21', '测试品牌5', 'TEST231629', 44.92, 1, NULL, NULL, 4, NULL, 2.99, 1.98, 0.00, 73.37, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (540, 502, 'TEST202511129705', 69, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品40', '测试品牌5', 'TEST121263', 185.58, 1, NULL, NULL, 5, NULL, 3.96, 2.49, 0.00, 29.26, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (541, 503, 'TEST202511100677', 12, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品57', '测试品牌5', 'TEST837861', 62.63, 5, NULL, NULL, 3, NULL, 7.00, 4.18, 0.00, 271.31, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (542, 504, 'TEST202512025820', 24, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品59', '测试品牌4', 'TEST193594', 207.28, 2, NULL, NULL, 8, NULL, 9.31, 1.32, 0.00, 664.37, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (543, 505, 'TEST202511280807', 59, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品79', '测试品牌3', 'TEST143938', 197.95, 2, NULL, NULL, 6, NULL, 7.77, 1.70, 0.00, 491.42, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (544, 506, 'TEST202511098592', 82, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品38', '测试品牌2', 'TEST253550', 70.16, 4, NULL, NULL, 9, NULL, 8.40, 3.79, 0.00, 67.38, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (545, 507, 'TEST202511278203', 54, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品77', '测试品牌4', 'TEST702258', 95.80, 1, NULL, NULL, 10, NULL, 4.04, 1.54, 0.00, 409.86, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (546, 508, 'TEST202511290748', 53, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品82', '测试品牌5', 'TEST057764', 68.95, 2, NULL, NULL, 7, NULL, 1.88, 0.43, 0.00, 145.49, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (547, 509, 'TEST202511273976', 69, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品71', '测试品牌5', 'TEST475769', 200.77, 2, NULL, NULL, 9, NULL, 2.17, 2.70, 0.00, 168.21, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (548, 510, 'TEST202511207774', 82, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品2', '测试品牌1', 'TEST686312', 208.03, 5, NULL, NULL, 5, NULL, 7.67, 1.85, 0.00, 514.68, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (549, 511, 'TEST202511265410', 45, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品64', '测试品牌2', 'TEST835265', 109.05, 5, NULL, NULL, 4, NULL, 9.20, 2.50, 0.00, 235.24, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (550, 512, 'TEST202511233412', 65, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品26', '测试品牌1', 'TEST035841', 130.92, 5, NULL, NULL, 8, NULL, 0.72, 0.33, 0.00, 143.87, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (551, 513, 'TEST202511095222', 53, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品83', '测试品牌1', 'TEST176229', 169.41, 3, NULL, NULL, 9, NULL, 0.88, 3.82, 0.00, 401.97, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (552, 514, 'TEST202511103383', 63, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品25', '测试品牌2', 'TEST359583', 18.36, 1, NULL, NULL, 6, NULL, 2.39, 3.09, 0.00, 30.71, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (553, 515, 'TEST202511158961', 76, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品43', '测试品牌5', 'TEST680397', 184.69, 2, NULL, NULL, 1, NULL, 0.73, 1.66, 0.00, 181.34, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (554, 516, 'TEST202512021153', 68, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品33', '测试品牌3', 'TEST334344', 43.80, 5, NULL, NULL, 8, NULL, 9.86, 4.12, 0.00, 138.61, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (555, 517, 'TEST202512036819', 16, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品77', '测试品牌1', 'TEST612012', 174.79, 2, NULL, NULL, 10, NULL, 8.80, 2.81, 0.00, 83.99, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (556, 518, 'TEST202511197685', 30, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品23', '测试品牌2', 'TEST507812', 160.51, 2, NULL, NULL, 10, NULL, 9.75, 0.30, 0.00, 418.92, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (557, 519, 'TEST202512066065', 25, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品36', '测试品牌2', 'TEST990347', 47.45, 5, NULL, NULL, 3, NULL, 4.27, 1.70, 0.00, 88.26, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (558, 520, 'TEST202511164039', 16, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品57', '测试品牌5', 'TEST038724', 160.33, 4, NULL, NULL, 10, NULL, 8.52, 1.96, 0.00, 541.51, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (559, 521, 'TEST202511109039', 2, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品46', '测试品牌4', 'TEST775953', 175.98, 5, NULL, NULL, 7, NULL, 6.25, 1.36, 0.00, 461.81, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (560, 522, 'TEST202511170930', 54, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品30', '测试品牌5', 'TEST048048', 166.48, 4, NULL, NULL, 5, NULL, 1.55, 1.51, 0.00, 88.76, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (561, 523, 'TEST202511109255', 37, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品21', '测试品牌5', 'TEST787116', 55.30, 4, NULL, NULL, 2, NULL, 5.66, 1.52, 0.00, 231.40, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (562, 524, 'TEST202512014505', 37, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品54', '测试品牌5', 'TEST619490', 83.68, 5, NULL, NULL, 9, NULL, 1.12, 0.61, 0.00, 24.78, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (563, 525, 'TEST202511304194', 16, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品79', '测试品牌1', 'TEST983706', 94.52, 1, NULL, NULL, 6, NULL, 2.23, 2.46, 0.00, 503.48, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (564, 526, 'TEST202511297341', 79, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品27', '测试品牌4', 'TEST952498', 92.73, 2, NULL, NULL, 9, NULL, 4.33, 3.62, 0.00, 256.05, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (565, 527, 'TEST202511177834', 20, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品71', '测试品牌3', 'TEST098011', 191.98, 2, NULL, NULL, 6, NULL, 9.71, 1.06, 0.00, 46.85, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (566, 528, 'TEST202511095017', 83, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品62', '测试品牌4', 'TEST230671', 27.60, 4, NULL, NULL, 5, NULL, 1.38, 1.30, 0.00, 759.44, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (567, 529, 'TEST202512019077', 49, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品1', '测试品牌2', 'TEST165136', 35.13, 1, NULL, NULL, 3, NULL, 0.38, 1.63, 0.00, 488.81, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (568, 530, 'TEST202511309892', 48, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品82', '测试品牌1', 'TEST911758', 20.72, 3, NULL, NULL, 6, NULL, 9.18, 0.41, 0.00, 56.27, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (569, 531, 'TEST202511296287', 11, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品48', '测试品牌3', 'TEST730198', 46.53, 4, NULL, NULL, 1, NULL, 1.59, 2.99, 0.00, 579.03, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (570, 532, 'TEST202511183577', 24, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品12', '测试品牌5', 'TEST775358', 82.07, 3, NULL, NULL, 3, NULL, 0.61, 2.05, 0.00, 172.84, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (571, 533, 'TEST202511210343', 80, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品37', '测试品牌2', 'TEST242189', 66.84, 4, NULL, NULL, 7, NULL, 0.16, 1.11, 0.00, 176.65, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (572, 534, 'TEST202512043002', 82, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品1', '测试品牌1', 'TEST343455', 111.75, 3, NULL, NULL, 1, NULL, 6.64, 0.98, 0.00, 484.19, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (573, 535, 'TEST202512057643', 68, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品2', '测试品牌4', 'TEST219926', 35.30, 5, NULL, NULL, 5, NULL, 5.01, 0.26, 0.00, 669.03, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (574, 536, 'TEST202511249690', 79, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品67', '测试品牌1', 'TEST497602', 197.72, 2, NULL, NULL, 2, NULL, 3.28, 0.40, 0.00, 564.68, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (575, 537, 'TEST202512070726', 4, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品52', '测试品牌5', 'TEST003739', 30.75, 3, NULL, NULL, 3, NULL, 6.07, 1.79, 0.00, 956.78, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (576, 538, 'TEST202511297749', 78, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品32', '测试品牌1', 'TEST395520', 139.47, 1, NULL, NULL, 4, NULL, 3.92, 0.18, 0.00, 197.07, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (577, 539, 'TEST202511140659', 47, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品3', '测试品牌3', 'TEST364104', 79.30, 4, NULL, NULL, 2, NULL, 8.88, 4.78, 0.00, 244.95, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (578, 540, 'TEST202511271702', 21, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品7', '测试品牌4', 'TEST911410', 145.65, 4, NULL, NULL, 3, NULL, 2.79, 3.23, 0.00, 43.16, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (579, 541, 'TEST202511173525', 78, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品52', '测试品牌2', 'TEST602561', 36.51, 5, NULL, NULL, 9, NULL, 8.24, 2.44, 0.00, 484.82, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (580, 542, 'TEST202511271505', 78, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品47', '测试品牌1', 'TEST378484', 180.87, 1, NULL, NULL, 2, NULL, 1.85, 2.84, 0.00, 384.67, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (581, 543, 'TEST202511294826', 69, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品74', '测试品牌5', 'TEST212637', 37.92, 1, NULL, NULL, 9, NULL, 2.26, 2.44, 0.00, 379.58, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (582, 544, 'TEST202511117631', 37, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品13', '测试品牌3', 'TEST825664', 161.12, 2, NULL, NULL, 3, NULL, 2.87, 3.61, 0.00, 602.86, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (583, 545, 'TEST202511133507', 56, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品50', '测试品牌5', 'TEST153778', 169.08, 3, NULL, NULL, 2, NULL, 4.13, 2.44, 0.00, 245.10, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (584, 546, 'TEST202511284961', 14, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品14', '测试品牌2', 'TEST192247', 198.60, 1, NULL, NULL, 9, NULL, 8.97, 4.50, 0.00, 380.46, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (585, 547, 'TEST202511252780', 19, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品12', '测试品牌1', 'TEST790646', 173.73, 4, NULL, NULL, 2, NULL, 5.89, 2.47, 0.00, 88.59, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (586, 548, 'TEST202511234200', 10, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品38', '测试品牌5', 'TEST164000', 31.50, 1, NULL, NULL, 10, NULL, 3.87, 1.10, 0.00, 84.76, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (587, 549, 'TEST202511300966', 27, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品41', '测试品牌3', 'TEST161375', 54.23, 4, NULL, NULL, 5, NULL, 3.61, 2.34, 0.00, 433.49, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (588, 550, 'TEST202511171033', 57, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品63', '测试品牌4', 'TEST259285', 47.28, 1, NULL, NULL, 3, NULL, 5.97, 1.74, 0.00, 867.61, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (589, 551, 'TEST202512061612', 56, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品22', '测试品牌2', 'TEST525717', 180.41, 4, NULL, NULL, 9, NULL, 2.46, 3.27, 0.00, 528.18, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (590, 552, 'TEST202512073977', 67, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品81', '测试品牌3', 'TEST432490', 159.68, 3, NULL, NULL, 10, NULL, 5.54, 4.19, 0.00, 122.48, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (591, 553, 'TEST202512075524', 2, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品60', '测试品牌3', 'TEST504802', 197.07, 1, NULL, NULL, 1, NULL, 5.39, 3.40, 0.00, 906.36, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (592, 554, 'TEST202511257654', 2, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品39', '测试品牌2', 'TEST860769', 122.38, 2, NULL, NULL, 5, NULL, 5.69, 2.47, 0.00, 377.17, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (593, 555, 'TEST202511196998', 35, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品3', '测试品牌5', 'TEST489057', 149.81, 1, NULL, NULL, 1, NULL, 1.30, 2.61, 0.00, 238.07, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (594, 556, 'TEST202512036295', 80, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品18', '测试品牌1', 'TEST207180', 118.51, 1, NULL, NULL, 9, NULL, 8.69, 4.30, 0.00, 838.09, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (595, 557, 'TEST202511101246', 30, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品11', '测试品牌3', 'TEST384692', 63.54, 1, NULL, NULL, 2, NULL, 0.41, 4.25, 0.00, 36.18, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (596, 558, 'TEST202511201885', 79, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品46', '测试品牌5', 'TEST775548', 56.62, 5, NULL, NULL, 5, NULL, 9.59, 1.54, 0.00, 396.10, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (597, 559, 'TEST202511299703', 3, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品80', '测试品牌4', 'TEST533385', 134.59, 3, NULL, NULL, 8, NULL, 9.76, 3.85, 0.00, 378.84, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (598, 560, 'TEST202512059831', 57, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品46', '测试品牌4', 'TEST896088', 79.77, 1, NULL, NULL, 3, NULL, 9.98, 1.45, 0.00, 317.06, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (599, 561, 'TEST202511248724', 64, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品46', '测试品牌3', 'TEST589917', 130.95, 2, NULL, NULL, 5, NULL, 5.15, 1.04, 0.00, 619.52, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (600, 562, 'TEST202511242158', 62, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品14', '测试品牌4', 'TEST518306', 167.15, 2, NULL, NULL, 6, NULL, 4.38, 3.27, 0.00, 1014.63, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (601, 563, 'TEST202512061929', 22, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品68', '测试品牌2', 'TEST949486', 194.02, 4, NULL, NULL, 1, NULL, 7.45, 3.63, 0.00, 490.73, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (602, 564, 'TEST202512054844', 61, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品25', '测试品牌2', 'TEST508269', 152.53, 1, NULL, NULL, 1, NULL, 1.58, 3.12, 0.00, 348.14, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (603, 565, 'TEST202511287452', 72, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品21', '测试品牌4', 'TEST483118', 105.44, 5, NULL, NULL, 3, NULL, 4.49, 2.44, 0.00, 20.28, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (604, 566, 'TEST202511201803', 67, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品79', '测试品牌2', 'TEST894047', 94.59, 3, NULL, NULL, 9, NULL, 1.74, 0.93, 0.00, 316.83, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (605, 567, 'TEST202511219541', 13, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品27', '测试品牌1', 'TEST793834', 113.93, 2, NULL, NULL, 6, NULL, 9.74, 1.47, 0.00, 682.42, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (606, 568, 'TEST202511098794', 55, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品61', '测试品牌4', 'TEST994094', 24.32, 2, NULL, NULL, 7, NULL, 1.92, 4.83, 0.00, 199.98, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (607, 569, 'TEST202512055577', 14, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品55', '测试品牌5', 'TEST088519', 209.65, 4, NULL, NULL, 7, NULL, 9.90, 0.24, 0.00, 123.20, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (608, 570, 'TEST202512065500', 21, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品49', '测试品牌2', 'TEST258471', 145.96, 4, NULL, NULL, 1, NULL, 5.22, 1.87, 0.00, 235.27, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (609, 571, 'TEST202511193405', 13, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品41', '测试品牌5', 'TEST473991', 92.88, 4, NULL, NULL, 1, NULL, 0.84, 1.99, 0.00, 524.09, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (610, 572, 'TEST202511275936', 27, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品5', '测试品牌2', 'TEST451039', 67.65, 1, NULL, NULL, 6, NULL, 6.17, 1.78, 0.00, 718.26, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (611, 573, 'TEST202512084368', 12, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品76', '测试品牌1', 'TEST013705', 134.65, 1, NULL, NULL, 6, NULL, 3.06, 0.05, 0.00, 218.83, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (612, 574, 'TEST202511272461', 58, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品52', '测试品牌1', 'TEST251197', 47.58, 1, NULL, NULL, 4, NULL, 2.72, 1.31, 0.00, 521.50, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (613, 575, 'TEST202511219206', 83, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品75', '测试品牌3', 'TEST754395', 71.08, 2, NULL, NULL, 5, NULL, 2.23, 4.53, 0.00, 670.08, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (614, 576, 'TEST202511242151', 28, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品76', '测试品牌3', 'TEST076217', 148.97, 2, NULL, NULL, 2, NULL, 9.81, 2.38, 0.00, 510.33, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (615, 577, 'TEST202511205207', 38, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品1', '测试品牌4', 'TEST395996', 195.32, 3, NULL, NULL, 5, NULL, 8.92, 0.61, 0.00, 425.04, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (616, 578, 'TEST202511183243', 67, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品4', '测试品牌4', 'TEST847622', 181.54, 4, NULL, NULL, 2, NULL, 5.40, 1.16, 0.00, 54.48, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (617, 579, 'TEST202511157555', 41, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品29', '测试品牌2', 'TEST373735', 14.16, 5, NULL, NULL, 9, NULL, 3.12, 0.01, 0.00, 115.45, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (618, 580, 'TEST202511184023', 52, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品1', '测试品牌1', 'TEST760170', 77.31, 3, NULL, NULL, 1, NULL, 8.00, 4.97, 0.00, 729.40, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (619, 581, 'TEST202512014298', 61, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品81', '测试品牌4', 'TEST520016', 116.35, 1, NULL, NULL, 9, NULL, 1.93, 1.36, 0.00, 120.17, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (620, 582, 'TEST202511253994', 3, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品79', '测试品牌4', 'TEST309866', 142.26, 2, NULL, NULL, 10, NULL, 3.75, 0.85, 0.00, 144.24, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (621, 583, 'TEST202512033960', 31, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品42', '测试品牌2', 'TEST470984', 45.84, 3, NULL, NULL, 9, NULL, 9.37, 0.27, 0.00, 126.77, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (622, 584, 'TEST202511275591', 28, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品17', '测试品牌1', 'TEST568844', 157.74, 5, NULL, NULL, 8, NULL, 6.31, 0.00, 0.00, 181.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (623, 585, 'TEST202512059507', 31, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品19', '测试品牌1', 'TEST406709', 207.37, 4, NULL, NULL, 7, NULL, 9.10, 3.59, 0.00, 206.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (624, 586, 'TEST202511154422', 12, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品24', '测试品牌5', 'TEST083373', 101.37, 1, NULL, NULL, 9, NULL, 8.99, 0.48, 0.00, 653.45, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (625, 587, 'TEST202511175807', 62, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品71', '测试品牌1', 'TEST554832', 153.17, 5, NULL, NULL, 5, NULL, 3.88, 3.30, 0.00, 259.84, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (626, 588, 'TEST202511230049', 14, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品54', '测试品牌4', 'TEST817683', 177.35, 4, NULL, NULL, 2, NULL, 5.22, 0.91, 0.00, 127.46, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (627, 589, 'TEST202512014692', 73, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品70', '测试品牌3', 'TEST324669', 193.03, 4, NULL, NULL, 3, NULL, 5.10, 3.80, 0.00, 61.13, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (628, 590, 'TEST202511234955', 49, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品56', '测试品牌3', 'TEST965356', 19.25, 2, NULL, NULL, 6, NULL, 6.78, 3.91, 0.00, 77.96, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (629, 591, 'TEST202511300178', 41, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品33', '测试品牌3', 'TEST281374', 195.79, 5, NULL, NULL, 3, NULL, 6.80, 3.75, 0.00, 313.41, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (630, 592, 'TEST202511284337', 29, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品72', '测试品牌2', 'TEST624872', 91.45, 1, NULL, NULL, 6, NULL, 4.45, 2.34, 0.00, 136.20, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (631, 593, 'TEST202511170189', 7, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品43', '测试品牌2', 'TEST201377', 202.38, 2, NULL, NULL, 2, NULL, 0.88, 0.09, 0.00, 114.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (632, 594, 'TEST202512014333', 70, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品2', '测试品牌3', 'TEST684227', 167.62, 5, NULL, NULL, 1, NULL, 7.11, 1.65, 0.00, 459.83, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (633, 595, 'TEST202512024393', 35, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品24', '测试品牌1', 'TEST983365', 94.73, 1, NULL, NULL, 6, NULL, 3.44, 0.06, 0.00, 33.46, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (634, 596, 'TEST202511258133', 34, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品63', '测试品牌3', 'TEST342257', 41.74, 4, NULL, NULL, 4, NULL, 4.86, 1.78, 0.00, 325.18, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (635, 597, 'TEST202511293127', 71, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品46', '测试品牌2', 'TEST397667', 81.07, 3, NULL, NULL, 9, NULL, 5.10, 4.97, 0.00, 176.81, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (636, 598, 'TEST202511173512', 67, 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/test.jpg', '测试商品28', '测试品牌2', 'TEST311087', 163.62, 5, NULL, NULL, 3, NULL, 4.39, 2.49, 0.00, 150.91, 0, 0, '[{\"key\":\"颜色\",\"value\":\"测试色\"},{\"key\":\"容量\",\"value\":\"测试容量\"}]');
INSERT INTO `oms_order_item` VALUES (692, 1164, '202512080101000002', 39, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', '小米', '100023207945', 5999.00, 1, 217, '202210280039001', 54, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_order_item` VALUES (693, 1165, '202512080101000003', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (694, 1166, '202512080101000004', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 3788.00, 1, 110, '201806070026001', 19, '单品促销', 89.00, 0.00, 0.00, 3699.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (695, 1167, '202512080101000005', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '单品促销', 500.00, 0.00, 0.00, 4999.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (696, 1168, '202512080101000006', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满500.00元，减50.00元', 50.00, 0.00, 0.00, 599.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `create_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `order_status` int(1) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单操作历史记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------
INSERT INTO `oms_order_operate_history` VALUES (5, 12, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (6, 13, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (7, 12, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` VALUES (8, 13, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` VALUES (9, 22, '后台管理员', '2018-10-15 16:31:48', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (10, 22, '后台管理员', '2018-10-15 16:35:08', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (11, 22, '后台管理员', '2018-10-15 16:35:59', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (12, 17, '后台管理员', '2018-10-15 16:43:40', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (13, 25, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (14, 26, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (15, 23, '后台管理员', '2018-10-16 14:41:28', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (16, 13, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (17, 18, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (18, 26, '后台管理员', '2018-10-30 14:37:44', 4, '订单关闭:关闭订单');
INSERT INTO `oms_order_operate_history` VALUES (19, 25, '后台管理员', '2018-10-30 15:07:01', 0, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (20, 25, '后台管理员', '2018-10-30 15:08:13', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` VALUES (21, 25, '后台管理员', '2018-10-30 15:08:31', 0, '修改备注信息：xxx');
INSERT INTO `oms_order_operate_history` VALUES (22, 25, '后台管理员', '2018-10-30 15:08:39', 4, '订单关闭:2222');
INSERT INTO `oms_order_operate_history` VALUES (23, 12, '后台管理员', '2019-11-09 16:50:28', 4, '修改备注信息：111');
INSERT INTO `oms_order_operate_history` VALUES (24, 30, '后台管理员', '2020-02-25 16:52:37', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` VALUES (25, 30, '后台管理员', '2020-02-25 16:52:51', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` VALUES (26, 30, '后台管理员', '2020-02-25 16:54:03', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (27, 35, '后台管理员', '2020-05-17 15:30:24', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (28, 37, '后台管理员', '2020-05-17 19:35:00', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (29, 39, '后台管理员', '2020-05-17 19:42:08', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (30, 41, '后台管理员', '2020-05-18 20:23:04', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (31, 47, '后台管理员', '2020-06-21 15:13:44', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (32, 48, '后台管理员', '2020-06-21 15:15:49', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (33, 52, '后台管理员', '2022-11-09 15:16:13', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (34, 60, '后台管理员', '2022-11-16 10:42:50', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (35, 62, '后台管理员', '2022-12-21 15:50:24', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (36, 63, '后台管理员', '2023-01-10 10:08:34', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (37, 65, '后台管理员', '2023-01-10 10:08:34', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (38, 69, '后台管理员', '2023-05-11 15:30:08', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (39, 70, '后台管理员', '2023-05-11 15:31:22', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (40, 72, '后台管理员', '2023-05-11 15:33:43', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (41, 74, '后台管理员', '2023-05-11 15:36:00', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (42, 75, '后台管理员', '2023-05-11 15:36:11', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (43, 76, '后台管理员', '2023-05-11 15:37:34', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (44, 78, '后台管理员', '2025-11-27 21:02:44', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (45, 79, '后台管理员', '2025-11-28 08:10:15', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (46, 81, '后台管理员', '2025-11-28 09:25:35', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (47, 88, '后台管理员', '2025-11-28 09:28:25', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (48, 94, '后台管理员', '2025-11-30 20:52:41', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (49, 97, '后台管理员', '2025-12-01 20:02:28', 1, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (50, 102, '后台管理员', '2025-12-03 08:46:01', 1, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (51, 104, '后台管理员', '2025-12-03 10:33:07', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (52, 102, '后台管理员', '2025-12-03 10:33:38', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (53, 110, '后台管理员', '2025-12-05 14:13:09', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (54, 111, '后台管理员', '2025-12-05 14:13:28', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (55, 113, '后台管理员', '2025-12-05 14:46:48', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (56, 135, '后台管理员', '2025-12-06 08:10:25', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (57, 139, '后台管理员', '2025-12-06 12:47:28', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (58, 143, '后台管理员', '2025-12-08 03:55:16', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (59, 1164, '后台管理员', '2025-12-08 07:38:07', 2, '完成发货');

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `company_address_id` bigint(20) NULL DEFAULT NULL COMMENT '收货地址表id',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '退货商品id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货人电话',
  `status` int(1) NULL DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
  `product_count` int(11) NULL DEFAULT NULL COMMENT '退货数量',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `product_real_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `proof_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单退货申请' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------
INSERT INTO `oms_order_return_apply` VALUES (3, 12, 1, 26, '201809150101000001', '2018-10-17 14:34:57', 'test', 0.00, '大梨', '18000000000', 2, '2022-11-11 10:16:18', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '111', 'admin', 'admin', '2022-11-11 10:16:26', NULL);
INSERT INTO `oms_order_return_apply` VALUES (4, 12, 2, 27, '201809150101000001', '2018-10-17 14:40:21', 'test', 3585.98, '大梨', '18000000000', 1, '2018-10-18 13:54:10', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '已经处理了', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (5, 12, 3, 28, '201809150101000001', '2018-10-17 14:44:18', 'test', 3585.98, '大梨', '18000000000', 2, '2018-10-18 13:55:28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '已经处理了', 'admin', 'admin', '2018-10-18 13:55:58', '已经处理了');
INSERT INTO `oms_order_return_apply` VALUES (8, 13, NULL, 28, '201809150102000002', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 3, '2018-10-18 13:57:12', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '理由不够充分', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (9, 14, 2, 26, '201809130101000001', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 15:44:56', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '呵呵', 'admin', 'admin', '2018-10-24 15:46:35', '收货了');
INSERT INTO `oms_order_return_apply` VALUES (10, 14, NULL, 27, '201809130101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 15:46:57', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '就是不退', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (11, 14, 2, 28, '201809130101000001', '2018-10-17 14:44:18', 'test', 591.05, '大梨', '18000000000', 1, '2018-10-24 17:09:04', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '可以退款', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (12, 15, 3, 26, '201809130102000002', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 17:22:54', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '退货了', 'admin', 'admin', '2018-10-24 17:23:06', '收货了');
INSERT INTO `oms_order_return_apply` VALUES (13, 15, NULL, 27, '201809130102000002', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 17:23:30', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '无法退货', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (15, 16, NULL, 26, '201809140101000001', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (16, 16, NULL, 27, '201809140101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (17, 16, NULL, 28, '201809140101000001', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (18, 17, NULL, 26, '201809150101000003', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (19, 17, NULL, 27, '201809150101000003', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (20, 17, NULL, 28, '201809150101000003', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (21, 18, NULL, 26, '201809150102000004', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (22, 18, NULL, 27, '201809150102000004', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (23, 18, NULL, 28, '201809150102000004', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (24, 19, NULL, 26, '201809130101000003', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (25, 19, NULL, 27, '201809130101000003', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (26, 19, NULL, 28, '201809130101000003', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 3, '2025-12-03 10:35:18', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, 'admin', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货类型',
  `sort` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货原因表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------
INSERT INTO `oms_order_return_reason` VALUES (1, '质量问题', 1, 1, '2018-10-17 10:00:45');
INSERT INTO `oms_order_return_reason` VALUES (2, '尺码太大', 1, 1, '2018-10-17 10:01:03');
INSERT INTO `oms_order_return_reason` VALUES (3, '颜色不喜欢', 1, 1, '2018-10-17 10:01:13');
INSERT INTO `oms_order_return_reason` VALUES (4, '7天无理由退货', 1, 1, '2018-10-17 10:01:47');
INSERT INTO `oms_order_return_reason` VALUES (5, '价格问题', 1, 0, '2018-10-17 10:01:57');
INSERT INTO `oms_order_return_reason` VALUES (12, '发票问题', 0, 1, '2018-10-19 16:28:36');
INSERT INTO `oms_order_return_reason` VALUES (13, '其他问题', 0, 1, '2018-10-19 16:28:51');
INSERT INTO `oms_order_return_reason` VALUES (14, '物流问题', 0, 1, '2018-10-19 16:29:01');
INSERT INTO `oms_order_return_reason` VALUES (15, '售后问题', 0, 1, '2018-10-19 16:29:11');

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int(11) NULL DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(11) NULL DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(11) NULL DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(11) NULL DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int(11) NULL DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------
INSERT INTO `oms_order_setting` VALUES (1, 60, 120, 15, 7, 7);

-- ----------------------------
-- Table structure for oms_refund_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_refund_order`;
CREATE TABLE `oms_refund_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '退款订单ID',
  `order_id` bigint(20) NOT NULL COMMENT '关联订单ID（关联oms_order.id）',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `refund_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '退款单号（唯一）',
  `member_id` bigint(20) NOT NULL COMMENT '用户ID',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `refund_amount` decimal(10, 2) NOT NULL COMMENT '退款总金额',
  `refund_status` int(1) NOT NULL DEFAULT 0 COMMENT '退款状态：0-待审核；1-退款中；2-已退款；3-已拒绝；4-退款失败',
  `refund_reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款原因（关联oms_order_return_reason）',
  `refund_reason_id` bigint(20) NULL DEFAULT NULL COMMENT '退款原因ID',
  `payment_method` int(1) NULL DEFAULT NULL COMMENT '退款支付方式：0-原路退回；1-余额；2-银行卡',
  `return_apply_id` bigint(20) NULL DEFAULT NULL COMMENT '关联退货申请ID（oms_order_return_apply.id，无退货则为null）',
  `audit_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核备注',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `refund_time` datetime NULL DEFAULT NULL COMMENT '退款完成时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_refund_sn`(`refund_sn` ASC) USING BTREE,
  INDEX `idx_refund_status`(`refund_status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退款订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_refund_order
-- ----------------------------
INSERT INTO `oms_refund_order` VALUES (1, 72, '202305110100000004', 'REF17649529269494f2c54', 11, 'member', 5368.00, 1, NULL, NULL, NULL, NULL, '', '2025-12-06 01:36:27', NULL, '2025-12-06 00:42:07', '2025-12-06 01:36:27');
INSERT INTO `oms_refund_order` VALUES (2, 113, '202512050100000008', 'REF1764958795394dd498d', 11, 'member', 4999.00, 1, NULL, NULL, NULL, NULL, '111', '2025-12-06 02:20:08', NULL, '2025-12-06 02:19:55', '2025-12-06 02:20:08');
INSERT INTO `oms_refund_order` VALUES (3, 135, '202512060101000001', 'REF1764979859364377ba9', 11, 'member', 3699.00, 3, NULL, NULL, NULL, NULL, '不行', '2025-12-06 08:14:38', NULL, '2025-12-06 08:10:59', '2025-12-06 08:14:38');
INSERT INTO `oms_refund_order` VALUES (4, 135, '202512060101000001', 'REF17649800962165bce2e', 11, 'member', 3699.00, 1, NULL, NULL, NULL, NULL, '1', '2025-12-06 08:15:13', NULL, '2025-12-06 08:14:56', '2025-12-06 08:15:13');
INSERT INTO `oms_refund_order` VALUES (5, 139, '202512060101000005', 'REF1764996461197a92c3a', 11, 'member', 599.00, 1, NULL, NULL, NULL, NULL, '', '2025-12-06 12:47:49', NULL, '2025-12-06 12:47:41', '2025-12-06 12:47:49');

-- ----------------------------
-- Table structure for oms_refund_payment_log
-- ----------------------------
DROP TABLE IF EXISTS `oms_refund_payment_log`;
CREATE TABLE `oms_refund_payment_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `refund_id` bigint(20) NOT NULL COMMENT '关联退款订单ID',
  `refund_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '退款单号',
  `payment_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原支付单号',
  `pay_platform` int(1) NULL DEFAULT NULL COMMENT '支付平台：0-支付宝；1-微信；2-银联',
  `trade_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付渠道退款流水号',
  `payment_amount` decimal(10, 2) NOT NULL COMMENT '退款支付金额',
  `status` int(1) NOT NULL COMMENT '支付状态：0-处理中；1-成功；2-失败',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_refund_id`(`refund_id` ASC) USING BTREE,
  INDEX `idx_trade_no`(`trade_no` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退款支付日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_refund_payment_log
-- ----------------------------

-- ----------------------------
-- Table structure for oms_statistics_daily
-- ----------------------------
DROP TABLE IF EXISTS `oms_statistics_daily`;
CREATE TABLE `oms_statistics_daily`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL COMMENT '统计日期',
  `order_count` int(11) NULL DEFAULT 0 COMMENT '订单数量',
  `order_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '订单金额',
  `paid_order_count` int(11) NULL DEFAULT 0 COMMENT '已支付订单数',
  `paid_order_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '已支付订单金额',
  `refund_order_count` int(11) NULL DEFAULT 0 COMMENT '退款订单数',
  `refund_order_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '退款订单金额',
  `new_member_count` int(11) NULL DEFAULT 0 COMMENT '新增会员数',
  `active_member_count` int(11) NULL DEFAULT 0 COMMENT '活跃会员数',
  `product_view_count` int(11) NULL DEFAULT 0 COMMENT '商品浏览量',
  `product_sale_count` int(11) NULL DEFAULT 0 COMMENT '商品销量',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_stat_date`(`stat_date` ASC) USING BTREE,
  INDEX `idx_stat_date`(`stat_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '每日统计数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_statistics_daily
-- ----------------------------

-- ----------------------------
-- Table structure for oms_statistics_hourly
-- ----------------------------
DROP TABLE IF EXISTS `oms_statistics_hourly`;
CREATE TABLE `oms_statistics_hourly`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL COMMENT '统计日期',
  `stat_hour` tinyint(4) NOT NULL COMMENT '统计小时(0-23)',
  `order_count` int(11) NULL DEFAULT 0 COMMENT '订单数量',
  `order_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '订单金额',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_stat_date_hour`(`stat_date` ASC, `stat_hour` ASC) USING BTREE,
  INDEX `idx_stat_date`(`stat_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '每小时统计数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_statistics_hourly
-- ----------------------------

-- ----------------------------
-- Table structure for oms_statistics_product
-- ----------------------------
DROP TABLE IF EXISTS `oms_statistics_product`;
CREATE TABLE `oms_statistics_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL COMMENT '统计日期',
  `product_id` bigint(20) NOT NULL COMMENT '商品ID',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称',
  `sale_count` int(11) NULL DEFAULT 0 COMMENT '销量',
  `sale_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '销售额',
  `view_count` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_stat_date_product`(`stat_date` ASC, `product_id` ASC) USING BTREE,
  INDEX `idx_stat_date`(`stat_date` ASC) USING BTREE,
  INDEX `idx_product_id`(`product_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品统计数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_statistics_product
-- ----------------------------

-- ----------------------------
-- Table structure for oms_statistics_region
-- ----------------------------
DROP TABLE IF EXISTS `oms_statistics_region`;
CREATE TABLE `oms_statistics_region`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL COMMENT '统计日期',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '城市',
  `order_count` int(11) NULL DEFAULT 0 COMMENT '订单数量',
  `order_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '订单金额',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_stat_date_region`(`stat_date` ASC, `province` ASC, `city` ASC) USING BTREE,
  INDEX `idx_stat_date`(`stat_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '地区统计数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_statistics_region
-- ----------------------------

-- ----------------------------
-- Table structure for pms_album
-- ----------------------------
DROP TABLE IF EXISTS `pms_album`;
CREATE TABLE `pms_album`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_count` int(11) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '相册表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_album
-- ----------------------------

-- ----------------------------
-- Table structure for pms_album_pic
-- ----------------------------
DROP TABLE IF EXISTS `pms_album_pic`;
CREATE TABLE `pms_album_pic`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NULL DEFAULT NULL,
  `pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '画册图片表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_album_pic
-- ----------------------------

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_letter` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母',
  `sort` int(11) NULL DEFAULT NULL,
  `factory_status` int(1) NULL DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int(1) NULL DEFAULT NULL,
  `product_count` int(11) NULL DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(11) NULL DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专区大图',
  `brand_story` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '品牌故事',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家地址',
  `longitude` decimal(10, 7) NULL DEFAULT NULL COMMENT '经度',
  `latitude` decimal(10, 7) NULL DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES (2, '三星', 'S', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/57201b47N7bf15715.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_banner_01.png', '三星集团（英文：SAMSUNG、韩文：삼성）是韩国最大的跨国企业集团，三星集团包括众多的国际下属企业，旗下子公司有：三星电子、三星物产、三星人寿保险等，业务涉及电子、金融、机械、化学等众多领域。', NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES (3, '华为', 'H', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5abf6f26N31658aa2.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/huawei_banner_01.png', '荣耀品牌成立于2013年,是华为旗下手机双品牌之一。荣耀以“创新、品质、服务”为核心战略,为全球年轻人提供潮酷的全场景智能化体验,打造年轻人向往的先锋文化和潮流生活方式', NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES (6, '小米', 'M', 500, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5565f5a2N0b8169ae.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/xiaomi_banner_01.png', '小米公司正式成立于2010年4月，是一家专注于高端智能手机、互联网电视自主研发的创新型科技企业。主要由前谷歌、微软、摩托、金山等知名公司的顶尖人才组建。', NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES (21, 'OPPO', 'O', 0, 1, 1, 88, 500, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_banner_01.png', 'OPPO于2008年推出第一款“笑脸手机”，由此开启探索和引领至美科技之旅。今天，OPPO凭借以Find和R系列手机为核心的智能终端产品，以及OPPO+等互联网服务，让全球消费者尽享至美科技。', NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES (51, '苹果', 'A', 200, 1, 1, 55, 200, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/a0d61296991e472fb17d008f583f7a2f.jpeg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/apple_banner_01.png', '苹果公司(Apple Inc. )是美国的一家高科技公司。 由史蒂夫·乔布斯、斯蒂夫·沃兹尼亚克和罗·韦恩(Ron Wayne)等人于1976年4月1日创立,并命名为美国苹果电脑公司(Apple Computer Inc. ),2007年1月9日更名为苹果公司,总部位于加利福尼亚州的...', NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES (61, 'ASUS', 'A', 1000, 1, 1, NULL, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/b9064fe243a84b4097418a8172605c77.jpg', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/86d3929a30bb451d953b053e75deb532.jpg', '从一块主板的精益求精，到全品类终端的匠心传承，华硕用三十余年践行“坚若磐石”的承诺。无论是承载运算核心的主板、保障高效办公的笔记本，还是赋能数字生活的智能设备，每一款华硕产品都藏着突破技术边界的执着——稳定耐用是底色，创新体验是锋芒，让每一次使用都成为安心与信赖的见证。', NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES (62, '惠普', 'H', 900, 1, 1, NULL, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/25c3606f560f493a90e80c664d1b2674.jpg', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/cae655c05abc4f259a46d2d9ff2c0e5f.jpg', '以八十余载科技积淀为底气，惠普用创新与责任定义品质。从稳打稳印的商用打印机到高效智能的个人 PC，每款产品都经严苛测试淬炼耐用本色，融入环保材料践行可持续理念。以用户需求为核心，用精准适配与贴心服务，让办公高效无忧、生活充满创造力，成为全球用户信赖的科技伙伴。', NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES (63, '戴尔', 'D', 700, 1, 1, NULL, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/280c96dcaf66462b8544580ca2fdbd03.jpg', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/90e71fb0047446eeb94365ff6dbb4c2b.jpg', '八十载科技深耕，惠普以严苛品控筑牢底气。商用本高效可靠，打印机稳准输出，适配每一个专业场景。惠普潮玩科技上线！轻薄本随拎随走，光影屏颜值拉满，办公、追剧、创作，青春活力一键拉满。选择惠普，就是选择安心。从硬件到服务全程护航，稳定耐用是标配，多元需求都能精准适配。', NULL, NULL, NULL);
INSERT INTO `pms_brand` VALUES (64, '联想', 'L', 0, 1, 1, NULL, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/6413461da5014166ad8c69de519bf7b1.jpg', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/a62c9df790544f6eae74d2a6ada247b9.jpg', '以“智能，为每一个可能”为初心，联想用科技实力适配多元生活场景。从360度翻转的Yoga二合一设备到AI赋能的轻薄本，从硬核散热的拯救者游戏本到通过军规测试的ThinkPad，每款产品都藏着双重匠心——既以OLED高清屏、本地AI算力突破体验边界，又用再生材质与严苛品控筑牢可靠根基。让办公更高效、创作更自由、娱乐更沉浸，智能科技便在你我指尖。', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pms_brand_store
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand_store`;
CREATE TABLE `pms_brand_store`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `brand_id` bigint(20) NOT NULL COMMENT '品牌ID',
  `brand_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '品牌名称',
  `store_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店名',
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '浙江省',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '杭州市',
  `district` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '西湖区',
  `detail_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `latitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `longitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `open_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '09:00-21:00' COMMENT '营业时间',
  `score` decimal(2, 1) NULL DEFAULT 4.5 COMMENT '用户评分',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '0停用 1启用',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_brand`(`brand_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '品牌商家' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_brand_store
-- ----------------------------
INSERT INTO `pms_brand_store` VALUES (16, 61, 'ASUS', 'ASUS维修店1', '10559431473', '浙江省', '杭州市', '西湖区', 'XX路1号', 30.290000, 120.160000, '09:00-21:00', 4.4, 1, '2025-12-08 17:02:43', '2025-12-08 17:02:43');
INSERT INTO `pms_brand_store` VALUES (17, 61, 'ASUS', 'ASUS维修店2', '19709160652', '浙江省', '杭州市', '西湖区', 'XX路2号', 30.300000, 120.170000, '09:00-21:00', 5.0, 1, '2025-12-08 17:02:43', '2025-12-08 17:02:43');
INSERT INTO `pms_brand_store` VALUES (18, 61, 'ASUS', 'ASUS维修店3', '19439171923', '浙江省', '杭州市', '西湖区', 'XX路3号', 30.310000, 120.180000, '09:00-21:00', 4.7, 1, '2025-12-08 17:02:43', '2025-12-08 17:02:43');
INSERT INTO `pms_brand_store` VALUES (41, 6, '小米', '小米授权服务中心（苏州观前街店）', '0512-65839210', '江苏省', '苏州市', '姑苏区', '观前街 164-166 号（每周二售后公休）', NULL, NULL, '09:00-21:00', 4.6, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (42, 6, '小米', '小米授权服务中心（南京江宁万达店）', '025-86187345', '江苏省', '南京市', '江宁区', '竹山路 68 号万达广场 1 层 1088 号', NULL, NULL, '09:00-21:00', 4.5, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (43, 6, '小米', '小米授权服务中心（徐州云龙万达店）', '0516-83220020', '江苏省', '徐州市', '云龙区', '和平大道 58 号万达广场 1 层 1120 号', NULL, NULL, '09:00-21:00', 4.5, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (44, 3, '华为', '华为授权服务中心（苏州人民路店）', '0512-67709818', '江苏省', '苏州市', '姑苏区', '人民路 1250 号（地铁1号线乐桥站7号口旁）', NULL, NULL, '09:00-21:00', 4.6, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (45, 3, '华为', '华为授权服务中心（南京德基广场店）', '025-84786321', '江苏省', '南京市', '玄武区', '中山路 18 号德基广场 B1 层 B120 铺', NULL, NULL, '09:00-21:00', 4.7, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (46, 3, '华为', '华为授权服务中心（无锡滨湖万达店）', '0510-85789632', '江苏省', '无锡市', '滨湖区', '梁溪路 35 号万达广场 2 层 2056 号', NULL, NULL, '09:00-21:00', 4.6, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (47, 51, '苹果', 'Apple 授权服务中心（南京茂业天地店）', '025-86648971', '江苏省', '南京市', '秦淮区', '建康路 2 号南京茂业天地 F1 层', NULL, NULL, '09:00-21:00', 4.7, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (48, 51, '苹果', 'Apple 授权服务中心（苏州美罗百货店）', '0512-67708321', '江苏省', '苏州市', '姑苏区', '观前街 1 号美罗百货 B1 层数码专区', NULL, NULL, '09:00-21:00', 4.6, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (49, 51, '苹果', 'Apple 授权服务中心（无锡恒隆广场店）', '0510-82706543', '江苏省', '无锡市', '梁溪区', '人民中路 139 号恒隆广场 4 层 402 号', NULL, NULL, '09:00-21:00', 4.7, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (50, 21, 'OPPO', 'OPPO 官方授权服务体验中心（南京金象城店）', '025-85637219', '江苏省', '南京市', '浦口区', '泰山街道江山路 6 号金象城 J-1F-02 号', NULL, NULL, '09:00-21:00', 4.5, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (51, 21, 'OPPO', 'OPPO 官方授权服务体验中心（南通海安万达店）', '13348080200', '江苏省', '南通市', '海安市', '黄海大道西 8 号万达广场 1F 层 1030 号', NULL, NULL, '09:00-21:00', 4.5, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (52, 21, 'OPPO', 'OPPO 官方授权服务体验中心（苏州领华数码城店）', '0512-65827791', '江苏省', '苏州市', '姑苏区', '竹辉路 688 号领华数码城 1 层 116 铺', NULL, NULL, '09:00-21:00', 4.5, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (53, 2, '三星', '三星授权服务中心（南京珠江路店）', '025-83247691', '江苏省', '南京市', '玄武区', '珠江路 435 号东来科技大厦 1 楼', NULL, NULL, '09:00-21:00', 4.5, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (54, 2, '三星', '三星授权服务中心（苏州工业园区店）', '0512-62873456', '江苏省', '苏州市', '工业园区', '金鸡湖路 199 号苏州中心广场 B1 层', NULL, NULL, '09:00-21:00', 4.6, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (55, 2, '三星', '三星授权服务中心（常州南大街店）', '0519-86683472', '江苏省', '常州市', '钟楼区', '南大街 108 号金鹰嘉宏购物广场 4 层', NULL, NULL, '09:00-21:00', 4.5, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (56, 62, '惠普', '惠普专卖店售后维修中心（南京商茂广场店）', '025-84669231', '江苏省', '南京市', '秦淮区', '中山南路 49 号商茂广场 2 楼', NULL, NULL, '09:00-21:00', 4.5, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (57, 62, '惠普', '惠普授权服务中心（苏州竹山路店）', '0512-66387459', '江苏省', '苏州市', '江宁区', '竹山路东山宾馆西北侧约 110 米', NULL, NULL, '09:00-21:00', 4.4, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (58, 62, '惠普', '惠普授权服务中心（无锡八佰伴店）', '0510-85897632', '江苏省', '无锡市', '梁溪区', '中山路 168 号八佰伴 5 层数码专区', NULL, NULL, '09:00-21:00', 4.5, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (59, 63, '戴尔', '戴尔电脑授权专卖维修店（南京华海大厦店）', '025-83698745', '江苏省', '南京市', '玄武区', '珠江路 435 号华海大厦 1F13-14 号', NULL, NULL, '09:00-21:00', 4.5, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (60, 63, '戴尔', '戴尔授权服务中心（苏州印象汇店）', '0512-67689321', '江苏省', '苏州市', '吴中区', '现代大道 1699 号印象汇 2 层 02-05 号', NULL, NULL, '09:00-21:00', 4.5, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (61, 63, '戴尔', '戴尔授权服务中心（常州新北万达店）', '0519-85632791', '江苏省', '常州市', '新北区', '通江中路 88 号万达广场 3 层 3021 号', NULL, NULL, '09:00-21:00', 4.5, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (62, 64, '联想', '联想客户服务中心（南京华海大厦店）', '025-83692145', '江苏省', '南京市', '玄武区', '太平北路 104 号华海大厦 1F5-1-3 店', NULL, NULL, '09:00-21:00', 4.5, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (63, 64, '联想', '联想授权服务中心（苏州金鹰店）', '0512-65728943', '江苏省', '苏州市', '虎丘区', '狮山路 336 号狮山金鹰购物中心 4 层', NULL, NULL, '09:00-21:00', 4.5, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');
INSERT INTO `pms_brand_store` VALUES (64, 64, '联想', '联想客户服务中心（无锡苏宁广场店）', '0510-82709654', '江苏省', '无锡市', '梁溪区', '人民中路 111 号苏宁广场 B1 层数码区', NULL, NULL, '09:00-21:00', 4.5, 1, '2025-12-08 17:20:25', '2025-12-08 17:20:25');

-- ----------------------------
-- Table structure for pms_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment`;
CREATE TABLE `pms_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `star` int(3) NULL DEFAULT NULL COMMENT '评价星数：0->5',
  `member_ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价的ip',
  `create_time` datetime NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  `product_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买时的商品属性',
  `collect_couont` int(11) NULL DEFAULT NULL,
  `read_count` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传图片地址，以逗号隔开',
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论用户头像',
  `replay_count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评价表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_comment
-- ----------------------------
INSERT INTO `pms_comment` VALUES (1, 28, 'member', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 5, '0:0:0:0:0:0:0:1', '2025-12-08 03:42:08', 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', 0, 0, '1111', '', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 0);
INSERT INTO `pms_comment` VALUES (2, 26, 'member', '华为 HUAWEI P20 ', 5, '0:0:0:0:0:0:0:1', '2025-12-08 03:55:36', 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', 0, 0, '111', '', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 0);
INSERT INTO `pms_comment` VALUES (3, 26, 'member', '华为 HUAWEI P20 ', 5, '0:0:0:0:0:0:0:1', '2025-12-08 03:56:01', 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', 0, 0, '211212', 'blob:http://localhost:8060/d40c2635-61c8-42a7-b2c0-fe4efab477f8', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 0);
INSERT INTO `pms_comment` VALUES (4, 26, 'member', '华为 HUAWEI P20 ', 4, '0:0:0:0:0:0:0:1', '2025-12-08 03:58:41', 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', 0, 0, '1212', '', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 0);
INSERT INTO `pms_comment` VALUES (5, 26, 'member', '华为 HUAWEI P20 ', 1, '0:0:0:0:0:0:0:1', '2025-12-08 04:29:43', 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', 0, 0, '差评', '', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 0);
INSERT INTO `pms_comment` VALUES (6, 26, 'member', '华为 HUAWEI P20 ', 5, '0:0:0:0:0:0:0:1', '2025-12-08 04:31:05', 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', 0, 0, '1212', 'blob:http://localhost:8060/20755efb-f3a2-46fc-861a-1de1ca334c5b', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 0);
INSERT INTO `pms_comment` VALUES (7, 28, 'member', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 5, '0:0:0:0:0:0:0:1', '2025-12-08 04:34:52', 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', 0, 0, '555', 'blob:http://localhost:8060/ffc09475-50f2-42d6-8d44-02f76cb28073', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 1);

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL COMMENT '评论人员类型；0->会员；1->管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品评价回复表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_comment_replay
-- ----------------------------
INSERT INTO `pms_comment_replay` VALUES (1, 7, 'admin', NULL, '1212', '2025-12-08 04:46:41', 1);

-- ----------------------------
-- Table structure for pms_feight_template
-- ----------------------------
DROP TABLE IF EXISTS `pms_feight_template`;
CREATE TABLE `pms_feight_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `charge_type` int(1) NULL DEFAULT NULL COMMENT '计费类型:0->按重量；1->按件数',
  `first_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '首重kg',
  `first_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '首费（元）',
  `continue_weight` decimal(10, 2) NULL DEFAULT NULL,
  `continme_fee` decimal(10, 2) NULL DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目的地（省、市）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运费模版' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_feight_template
-- ----------------------------

-- ----------------------------
-- Table structure for pms_member_price
-- ----------------------------
DROP TABLE IF EXISTS `pms_member_price`;
CREATE TABLE `pms_member_price`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `member_level_id` bigint(20) NULL DEFAULT NULL,
  `member_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员价格',
  `member_level_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 570 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品会员价格表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_member_price
-- ----------------------------
INSERT INTO `pms_member_price` VALUES (26, 7, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (27, 8, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (28, 9, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (29, 10, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (30, 11, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (31, 12, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (32, 13, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (33, 14, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (37, 18, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (44, 7, 2, 480.00, NULL);
INSERT INTO `pms_member_price` VALUES (45, 7, 3, 450.00, NULL);
INSERT INTO `pms_member_price` VALUES (52, 22, 1, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (53, 22, 2, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (54, 22, 3, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (58, 24, 1, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (59, 24, 2, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (60, 24, 3, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (112, 23, 1, 88.00, '黄金会员');
INSERT INTO `pms_member_price` VALUES (113, 23, 2, 88.00, '白金会员');
INSERT INTO `pms_member_price` VALUES (114, 23, 3, 66.00, '钻石会员');
INSERT INTO `pms_member_price` VALUES (246, 36, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (247, 36, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (248, 36, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (249, 35, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (250, 35, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (251, 35, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (258, 30, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (259, 30, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (260, 30, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (261, 31, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (262, 31, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (263, 31, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (264, 32, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (265, 32, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (266, 32, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (270, 33, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (271, 33, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (272, 33, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (273, 34, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (274, 34, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (275, 34, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (285, 27, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (286, 27, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (287, 27, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (294, 28, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (295, 28, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (296, 28, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (315, 37, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (316, 37, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (317, 37, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (381, 38, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (382, 38, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (383, 38, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (384, 39, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (385, 39, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (386, 39, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (387, 41, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (388, 41, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (389, 41, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (390, 42, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (391, 42, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (392, 42, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (393, 43, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (394, 43, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (395, 43, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (396, 44, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (397, 44, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (398, 44, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (399, 45, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (400, 45, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (401, 45, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (402, 40, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (403, 40, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (404, 40, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (432, 46, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (433, 46, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (434, 46, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (435, 47, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (436, 47, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (437, 47, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (438, 48, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (439, 48, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (440, 48, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (441, 49, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (442, 49, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (443, 49, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (444, 50, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (445, 50, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (446, 50, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (447, 51, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (448, 51, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (449, 51, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (459, 52, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (460, 52, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (461, 52, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (465, 53, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (466, 53, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (467, 53, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (468, 54, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (469, 54, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (470, 54, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (471, 55, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (472, 55, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (473, 55, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (474, 56, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (475, 56, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (476, 56, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (477, 57, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (478, 57, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (479, 57, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (480, 58, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (481, 58, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (482, 58, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (483, 59, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (484, 59, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (485, 59, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (486, 60, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (487, 60, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (488, 60, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (489, 61, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (490, 61, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (491, 61, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (492, 62, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (493, 62, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (494, 62, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (495, 63, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (496, 63, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (497, 63, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (498, 64, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (499, 64, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (500, 64, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (501, 65, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (502, 65, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (503, 65, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (504, 66, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (505, 66, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (506, 66, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (507, 67, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (508, 67, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (509, 67, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (510, 68, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (511, 68, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (512, 68, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (513, 69, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (514, 69, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (515, 69, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (522, 70, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (523, 70, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (524, 70, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (525, 71, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (526, 71, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (527, 71, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (528, 72, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (529, 72, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (530, 72, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (531, 73, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (532, 73, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (533, 73, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (537, 75, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (538, 75, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (539, 75, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (540, 76, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (541, 76, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (542, 76, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (543, 77, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (544, 77, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (545, 77, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (546, 78, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (547, 78, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (548, 78, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (549, 79, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (550, 79, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (551, 79, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (552, 80, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (553, 80, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (554, 80, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (555, 81, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (556, 81, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (557, 81, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (558, 82, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (559, 82, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (560, 82, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (561, 29, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (562, 29, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (563, 29, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (564, 26, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (565, 26, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (566, 26, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (567, 83, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (568, 83, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (569, 83, 3, NULL, '钻石会员');

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) NULL DEFAULT NULL,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  `feight_template_id` bigint(20) NULL DEFAULT NULL,
  `product_attribute_category_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货号',
  `delete_status` int(1) NULL DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int(1) NULL DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int(1) NULL DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int(1) NULL DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int(1) NULL DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `sale` int(11) NULL DEFAULT NULL COMMENT '销量',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销价格',
  `gift_growth` int(11) NULL DEFAULT 0 COMMENT '赠送的成长值',
  `gift_point` int(11) NULL DEFAULT 0 COMMENT '赠送的积分',
  `use_point_limit` int(11) NULL DEFAULT NULL COMMENT '限制使用的积分数',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '市场价',
  `stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `low_stock` int(11) NULL DEFAULT NULL COMMENT '库存预警值',
  `unit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品重量，默认为克',
  `preview_status` int(1) NULL DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
  `service_ids` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `album_pics` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `detail_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品详情网页内容',
  `detail_mobile_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '移动端网页详情',
  `promotion_start_time` datetime NULL DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime NULL DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int(11) NULL DEFAULT NULL COMMENT '活动限购数量',
  `promotion_type` int(1) NULL DEFAULT NULL COMMENT '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `product_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product
-- ----------------------------
INSERT INTO `pms_product` VALUES (1, 49, 7, 0, 0, '银色星芒刺绣网纱底裤', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/img/20251128/web.png', 'No86577', 1, 1, 1, 1, 1, 100, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '七匹狼', '外套');
INSERT INTO `pms_product` VALUES (2, 49, 7, 0, 0, '银色星芒刺绣网纱底裤2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86578', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤2', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '<p>银色星芒刺绣网纱底裤</p>', '<p>银色星芒刺绣网纱底裤</p>', NULL, NULL, NULL, 0, '七匹狼', '外套');
INSERT INTO `pms_product` VALUES (3, 1, 7, 0, 0, '银色星芒刺绣网纱底裤3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86579', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤3', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (4, 1, 7, 0, 0, '银色星芒刺绣网纱底裤4', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86580', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤4', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (5, 1, 7, 0, 0, '银色星芒刺绣网纱底裤5', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86581', 1, 0, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤5', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (6, 1, 7, 0, 0, '银色星芒刺绣网纱底裤6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86582', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤6', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (7, 1, 7, 0, 1, '女式超柔软拉毛运动开衫', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (8, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (9, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (10, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (11, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (12, 1, 7, 0, 1, '女式超柔软拉毛运动开衫2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (13, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (14, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (18, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (22, 6, 7, 0, 1, 'test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '', 1, 1, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'test', '', 0.00, 100, 0, '', 0.00, 1, '1,2', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '外套');
INSERT INTO `pms_product` VALUES (23, 6, 19, 0, 1, '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 'NO.1098', 1, 1, 1, 1, 0, 0, 0, 99.00, NULL, 99, 99, 1000, '毛衫测试11', 'xxx', 109.00, 100, 0, '件', 1000.00, 1, '1,2,3', '毛衫测试', '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '毛衫测试', '毛衫测试', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/155x54.bmp\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录bg1080.jpg\" width=\"500\" height=\"500\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录界面.jpg\" width=\"500\" height=\"500\" /></p>', '', NULL, NULL, 0, 2, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (24, 6, 7, 0, NULL, 'xxx', '', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'xxx', '', 0.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '外套');
INSERT INTO `pms_product` VALUES (26, 3, 19, 0, 3, '华为 HUAWEI P20 ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '6946605', 0, 1, 1, 1, 0, 100, 100, 3788.00, 3659.00, 3788, 3788, 0, 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '', 4288.00, 1000, 0, '件', 0.00, 1, '2,3,1', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ab46a3cN616bdc41.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf5fN2522b9dc.jpg,https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/1036f5308cf5432dae61b648fe4d9603.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg\" /></p>', '<p><img src=\"//img20.360buyimg.com/vc/jfs/t1/81293/35/5822/369414/5d3fe77cE619c5487/6e775a52850feea5.jpg!q70.dpg.webp\" alt=\"\" width=\"750\" height=\"776\" /></p>\n<p><img src=\"//img20.360buyimg.com/vc/jfs/t1/45300/25/11592/3658871/5d85ef66E92a8a911/083e47d8f662c582.jpg!q70.dpg.webp\" alt=\"\" width=\"596\" height=\"16383\" /></p>', '2023-01-10 15:49:38', '2023-01-31 00:00:00', 0, 1, '华为', '手机通讯');
INSERT INTO `pms_product` VALUES (27, 6, 19, 0, 3, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '7437788', 0, 1, 1, 1, 0, 0, 99, 2699.00, NULL, 2699, 2699, 0, '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 2699.00, 100, 0, '', 0.00, 0, '1', '', '', '', '', '', '<p style=\"text-align: center;\"><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/95935/9/19330/159477/5e9ecc13E5b8db8ae/8e954021a0835fb7.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99224/22/19596/137593/5e9ecc13E34ef2113/2b362b90d8378ee1.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/93131/25/19321/107691/5e9ecc13E41e8addf/202a5f84d9129878.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/101843/19/19533/66831/5e9ecc13Ecb7f9d53/4fdd807266583c1e.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99629/36/19016/59882/5e9ecc13E1f5beef5/1e5af3528f366e70.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/72343/29/8945/84548/5d6e5c67Ea07b1125/702791816b90eb3d.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/65403/35/9017/129532/5d6e5c68E3f2d0546/9ec771eb6e04a75a.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/58261/33/9380/106603/5d6e5c68E05a99177/2b5b9e29eed05b08.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51968/40/9688/113552/5d6e5c68E5052b312/8969d83124cb78a4.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75491/9/9101/146883/5d6e5c68E3db89775/c1aa57e78ded4e44.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75063/11/9107/127874/5d6e5c68E0b1dfc61/10dd6000ce213375.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/47452/25/9579/108279/5d6e5c68Ea9002f3b/865b5d32ffd9da75.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82146/26/9077/87075/5d6e5c68Ef63bccc8/556de5665a35a3f2.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82804/21/9019/124404/5d6e5c69E06a8f575/0f861f8c4636c546.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/46044/10/9734/107686/5d6e5c69Edd5e66c7/a8c7b9324e271dbd.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/40729/32/13755/45997/5d6e5c69Eafee3664/6a3457a4efdb79c5.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/76254/34/9039/96195/5d6e5c69E3c71c809/49033c0b7024c208.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/79825/20/9065/90864/5d6e5c69E1e62ef89/a4d3ce383425a666.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/49939/21/9618/106207/5d6e5c6aEf7b1d4fd/0f5e963c66be3d0c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/64035/7/9001/115159/5d6e5c6aE6919dfdf/39dfe4840157ad81.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/53389/3/9616/99637/5d6e5c6aEa33b9f35/b8f6aa26e72616a3.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/63219/6/9026/81576/5d6e5c6aEa9c74b49/b4fa364437531012.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/42146/27/13902/80437/5d6e5c6bE30c31ce9/475d4d54c7334313.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/45317/28/9596/78175/5d6e5c6bEce31e4b7/5675858b6933565c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/60080/1/9112/138722/5d6e5c6bEefd9fc62/7ece7460a36d2fcc.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51525/13/9549/36018/5d6e5c73Ebbccae6c/99bc2770dccc042b.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/61948/20/9088/72918/5d6e5c73Eab7aef5c/6f21e2f85cf478fa.jpg!q70.dpg.webp\" /></p>', '<p style=\"text-align: center;\"><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/95935/9/19330/159477/5e9ecc13E5b8db8ae/8e954021a0835fb7.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99224/22/19596/137593/5e9ecc13E34ef2113/2b362b90d8378ee1.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/93131/25/19321/107691/5e9ecc13E41e8addf/202a5f84d9129878.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/101843/19/19533/66831/5e9ecc13Ecb7f9d53/4fdd807266583c1e.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99629/36/19016/59882/5e9ecc13E1f5beef5/1e5af3528f366e70.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/72343/29/8945/84548/5d6e5c67Ea07b1125/702791816b90eb3d.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/65403/35/9017/129532/5d6e5c68E3f2d0546/9ec771eb6e04a75a.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/58261/33/9380/106603/5d6e5c68E05a99177/2b5b9e29eed05b08.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51968/40/9688/113552/5d6e5c68E5052b312/8969d83124cb78a4.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75491/9/9101/146883/5d6e5c68E3db89775/c1aa57e78ded4e44.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75063/11/9107/127874/5d6e5c68E0b1dfc61/10dd6000ce213375.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/47452/25/9579/108279/5d6e5c68Ea9002f3b/865b5d32ffd9da75.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82146/26/9077/87075/5d6e5c68Ef63bccc8/556de5665a35a3f2.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82804/21/9019/124404/5d6e5c69E06a8f575/0f861f8c4636c546.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/46044/10/9734/107686/5d6e5c69Edd5e66c7/a8c7b9324e271dbd.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/40729/32/13755/45997/5d6e5c69Eafee3664/6a3457a4efdb79c5.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/76254/34/9039/96195/5d6e5c69E3c71c809/49033c0b7024c208.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/79825/20/9065/90864/5d6e5c69E1e62ef89/a4d3ce383425a666.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/49939/21/9618/106207/5d6e5c6aEf7b1d4fd/0f5e963c66be3d0c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/64035/7/9001/115159/5d6e5c6aE6919dfdf/39dfe4840157ad81.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/53389/3/9616/99637/5d6e5c6aEa33b9f35/b8f6aa26e72616a3.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/63219/6/9026/81576/5d6e5c6aEa9c74b49/b4fa364437531012.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/42146/27/13902/80437/5d6e5c6bE30c31ce9/475d4d54c7334313.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/45317/28/9596/78175/5d6e5c6bEce31e4b7/5675858b6933565c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/60080/1/9112/138722/5d6e5c6bEefd9fc62/7ece7460a36d2fcc.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51525/13/9549/36018/5d6e5c73Ebbccae6c/99bc2770dccc042b.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/61948/20/9088/72918/5d6e5c73Eab7aef5c/6f21e2f85cf478fa.jpg!q70.dpg.webp\" /></p>', NULL, NULL, 0, 3, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (28, 6, 19, 0, 3, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '7437789', 0, 1, 1, 1, 0, 0, 98, 649.00, NULL, 649, 649, 0, '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '', 649.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '<div><img src=\"//img12.360buyimg.com/imgzone/jfs/t1/67362/12/14546/708984/5dc28512Eefdd817d/c82503af0da6c038.gif\" /><img src=\"//img13.360buyimg.com/imgzone/jfs/t1/61488/17/14551/995918/5dc28512E821c228d/41e52005ea5b1f36.gif\" /><img src=\"//img14.360buyimg.com/imgzone/jfs/t1/72961/36/14769/305883/5dc28512E65d77261/3df6be29e3d489d1.gif\" />\n<p>&nbsp;</p>\n</div>', NULL, NULL, 0, 4, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (29, 51, 19, 0, 3, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', '7437799', 0, 1, 1, 1, 0, 0, 97, 5499.00, 4799.00, 5499, 5499, 0, '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '', 5499.00, 100, 0, '', 0.00, 0, '1,2,3', '', '', '', '', '', '', '<div><img src=\"//img10.360buyimg.com/cms/jfs/t1/20020/38/9725/228440/5c7f9208Eeaf4bf87/13a713066f71791d.jpg!q70.dpg.webp\" /> <img src=\"//img12.360buyimg.com/cms/jfs/t1/12128/39/9607/265349/5c7f9209Ecff29b88/08620ba570705634.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/22731/40/9578/345163/5c7f9209E9ba056e5/a8a557060b84447e.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/29506/38/9439/299492/5c7f9209E0e51eb29/15dedd95416f3c68.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/26766/28/9574/257101/5c7f9209Eaca1b317/c7caa047b1566cf1.jpg!q70.dpg.webp\" /> <img src=\"//img13.360buyimg.com/cms/jfs/t1/11059/8/10473/286531/5c7f9208E05da0120/9034ad8799ad9553.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/25641/2/9557/268826/5c7f9208Efbf0dc50/399580629e05e733.jpg!q70.dpg.webp\" /> <img src=\"//img13.360buyimg.com/cms/jfs/t1/28964/25/9527/305902/5c7f9208E275ffb9c/8464934d67e69b7a.jpg!q70.dpg.webp\" /></div>', '2020-05-04 15:12:54', '2020-05-30 00:00:00', 0, 1, '苹果', '手机通讯');
INSERT INTO `pms_product` VALUES (30, 50, 8, 0, 1, 'HLA海澜之家简约动物印花短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', 'HNTBJ2E042A', 1, 1, 1, 1, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品微弹舒适新款短T男生 6月6日-6月20日，满300减30，参与互动赢百元礼券，立即分享赢大奖', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤');
INSERT INTO `pms_product` VALUES (31, 50, 8, 0, 1, 'HLA海澜之家蓝灰花纹圆领针织布短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', 'HNTBJ2E080A', 1, 1, 0, 0, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品短袖T恤男HNTBJ2E080A 蓝灰花纹80 175/92A/L80A 蓝灰花纹80 175/92A/L', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤');
INSERT INTO `pms_product` VALUES (32, 50, 8, 0, 1, 'HLA海澜之家短袖T恤男基础款', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg', 'HNTBJ2E153A', 1, 1, 0, 0, 0, 0, 0, 68.00, NULL, 0, 0, 0, 'HLA海澜之家短袖T恤男基础款简约圆领HNTBJ2E153A藏青(F3)175/92A(50)', '', 68.00, 100, 0, '', 0.00, 0, '1,2', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤');
INSERT INTO `pms_product` VALUES (33, 6, 35, 0, 12, '小米（MI）小米电视4A ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg', '4609652', 1, 1, 0, 0, 0, 0, 0, 2499.00, NULL, 0, 0, 0, '小米（MI）小米电视4A 55英寸 L55M5-AZ/L55M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 2499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '电视');
INSERT INTO `pms_product` VALUES (34, 6, 35, 0, 12, '小米（MI）小米电视4A 65英寸', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg', '4609660', 1, 1, 0, 0, 0, 0, 0, 3999.00, NULL, 0, 0, 0, ' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 3999.00, 100, 0, '', 0.00, 0, '1,2', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '电视');
INSERT INTO `pms_product` VALUES (35, 58, 29, 0, 11, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '6799342', 1, 1, 0, 0, 0, 0, 0, 369.00, NULL, 0, 0, 0, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', '', 369.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋');
INSERT INTO `pms_product` VALUES (36, 58, 29, 0, 11, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '6799345', 1, 1, 1, 1, 0, 0, 0, 499.00, NULL, 0, 0, 0, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '', 499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋');
INSERT INTO `pms_product` VALUES (37, 51, 19, 0, 3, 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', '100038005189', 0, 1, 0, 0, 0, 200, 0, 5999.00, NULL, 0, 0, 0, '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '', 5999.00, 1000, 0, '', 208.00, 0, '1,2,3', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', '', '', '', '<div style=\"margin: 0 auto;\"><img style=\"max-width: 390px;\" src=\"//img13.360buyimg.com/cms/jfs/t1/58071/39/19839/119559/63190110Edac0cea7/b62a84f1b8775fef.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img20.360buyimg.com/cms/jfs/t1/138903/36/29400/86115/63190110E0a98c819/d2efbef39eeb2995.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img30.360buyimg.com/cms/jfs/t1/176347/20/28995/115695/63190110Ef5d766f9/aee3d2d866522f66.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/120515/39/28721/142961/63190110Eec31e31a/3486d6a065a18ddc.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img13.360buyimg.com/cms/jfs/t1/30161/12/17674/81508/63190110E1385cf61/f05a2a43f4d304ff.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/100037/16/31071/62177/6319010fE871efe01/b01a6f981c268e38.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/90843/33/25852/74752/63190110E373559f4/74b6b52a3fb08c66.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/181914/22/28400/126094/63190110Edefb838c/802a16e758be2b1d.jpg!q70.dpg.webp\" /></div>', NULL, NULL, 0, 0, '苹果', '手机通讯');
INSERT INTO `pms_product` VALUES (38, 51, 53, 0, 3, 'Apple iPad 10.9英寸平板电脑 2022年款', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', '100044025833', 0, 1, 0, 0, 0, 0, 0, 3599.00, NULL, 0, 0, 0, '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '', 3599.00, 1000, 0, '', 0.00, 0, '1,2,3', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_002.jpg', '', '', '', '<div style=\"margin: 0 auto;\"><img style=\"max-width: 390px;\" src=\"//img12.360buyimg.com/cms/jfs/t1/75040/28/21026/295081/634ed154E981e4d10/2ceef91d6f2b2273.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img13.360buyimg.com/cms/jfs/t1/191028/1/28802/401291/634ed15eEb234dc40/5ab89f83531e1023.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/32758/24/18599/330590/634ed15eEc3db173c/c52953dc8008a576.jpg!q70.dpg.webp\" /></div>', NULL, NULL, 0, 0, '苹果', '平板电脑');
INSERT INTO `pms_product` VALUES (39, 6, 54, 0, 13, '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '100023207945', 0, 1, 0, 1, 0, 0, 0, 5599.00, NULL, 0, 0, 0, '【双十一大促来袭】指定型号至高优惠1000，以旧换新至高补贴1000元，晒单赢好礼', '', 5599.00, 500, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_002.jpg', '', '', '', '<div class=\"ssd-module-mobile-wrap\">\n<div class=\"ssd-module M16667778180631\" data-id=\"M16667778180631\"><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_05.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_06.png\" /></div>\n<div class=\"ssd-module M16667778180631\" data-id=\"M16667778180631\">&nbsp;</div>\n<div class=\"ssd-module M16534569204241\" data-id=\"M16534569204241\">&nbsp;</div>\n<div class=\"ssd-module M16667778416884\" data-id=\"M16667778416884\">\n<div class=\"ssd-widget-text W16667778440496\">&nbsp;</div>\n</div>\n<div class=\"ssd-module M165303211067557\" data-id=\"M165303211067557\">&nbsp;</div>\n<div class=\"ssd-module M16530320459861\" data-id=\"M16530320459861\">&nbsp;</div>\n<div class=\"ssd-module M16530320460062\" data-id=\"M16530320460062\">&nbsp;</div>\n<div class=\"ssd-module M16530320460153\" data-id=\"M16530320460153\">&nbsp;</div>\n<div class=\"ssd-module M16530320460366\" data-id=\"M16530320460366\">&nbsp;</div>\n<div class=\"ssd-module M16530320460477\" data-id=\"M16530320460477\">&nbsp;</div>\n<div class=\"ssd-module M16530320460578\" data-id=\"M16530320460578\">&nbsp;</div>\n<div class=\"ssd-module M16530320460699\" data-id=\"M16530320460699\">&nbsp;</div>\n<div class=\"ssd-module M165303204608110\" data-id=\"M165303204608110\">&nbsp;</div>\n<div class=\"ssd-module M165303204609511\" data-id=\"M165303204609511\">&nbsp;</div>\n<div class=\"ssd-module M165303204611213\" data-id=\"M165303204611213\">&nbsp;</div>\n<div class=\"ssd-module M165303204612714\" data-id=\"M165303204612714\">&nbsp;</div>\n<div class=\"ssd-module M165303204614115\" data-id=\"M165303204614115\">&nbsp;</div>\n<div class=\"ssd-module M165303204615516\" data-id=\"M165303204615516\">&nbsp;</div>\n<div class=\"ssd-module M165303204617417\" data-id=\"M165303204617417\">&nbsp;</div>\n<div class=\"ssd-module M165303204618818\" data-id=\"M165303204618818\">&nbsp;</div>\n<div class=\"ssd-module M165303204620219\" data-id=\"M165303204620219\">&nbsp;</div>\n<div class=\"ssd-module M165303204621620\" data-id=\"M165303204621620\">&nbsp;</div>\n<div class=\"ssd-module M165303204622921\" data-id=\"M165303204622921\">&nbsp;</div>\n<div class=\"ssd-module M165303204624522\" data-id=\"M165303204624522\">&nbsp;</div>\n<div class=\"ssd-module M165303204626024\" data-id=\"M165303204626024\">&nbsp;</div>\n<div class=\"ssd-module M165303204627525\" data-id=\"M165303204627525\">&nbsp;</div>\n<div class=\"ssd-module M165303204629127\" data-id=\"M165303204629127\">&nbsp;</div>\n<div class=\"ssd-module M165303204632330\" data-id=\"M165303204632330\">&nbsp;</div>\n<div class=\"ssd-module M165303204634031\" data-id=\"M165303204634031\">&nbsp;</div>\n<div class=\"ssd-module M165303204635832\" data-id=\"M165303204635832\">&nbsp;</div>\n<div class=\"ssd-module M165303204637533\" data-id=\"M165303204637533\">&nbsp;</div>\n<div class=\"ssd-module M165303204639334\" data-id=\"M165303204639334\">&nbsp;</div>\n<div class=\"ssd-module M165303204642235\" data-id=\"M165303204642235\">&nbsp;</div>\n<div class=\"ssd-module M165303204647936\" data-id=\"M165303204647936\">&nbsp;</div>\n<div class=\"ssd-module M165303204651037\" data-id=\"M165303204651037\">&nbsp;</div>\n<div class=\"ssd-module M165303204653838\" data-id=\"M165303204653838\">&nbsp;</div>\n<div class=\"ssd-module M165303204656239\" data-id=\"M165303204656239\">&nbsp;</div>\n<div class=\"ssd-module M165303204659141\" data-id=\"M165303204659141\">&nbsp;</div>\n<div class=\"ssd-module M165303204661943\" data-id=\"M165303204661943\">&nbsp;</div>\n<div class=\"ssd-module M165303204665844\" data-id=\"M165303204665844\">&nbsp;</div>\n<div class=\"ssd-module M165303204668045\" data-id=\"M165303204668045\">&nbsp;</div>\n<div class=\"ssd-module M165303204670146\" data-id=\"M165303204670146\">&nbsp;</div>\n<div class=\"ssd-module M165303204672147\" data-id=\"M165303204672147\">&nbsp;</div>\n<div class=\"ssd-module M165303204674348\" data-id=\"M165303204674348\">&nbsp;</div>\n<div class=\"ssd-module M165303204676749\" data-id=\"M165303204676749\">&nbsp;</div>\n<div class=\"ssd-module M165303204681352\" data-id=\"M165303204681352\">&nbsp;</div>\n<div class=\"ssd-module M165303204683553\" data-id=\"M165303204683553\">&nbsp;</div>\n<div class=\"ssd-module M165303204685855\" data-id=\"M165303204685855\">&nbsp;</div>\n<div class=\"ssd-module M165303204688356\" data-id=\"M165303204688356\">&nbsp;</div>\n</div>', NULL, NULL, 0, 0, '小米', '笔记本');
INSERT INTO `pms_product` VALUES (40, 6, 19, 0, 3, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '100027789721', 0, 1, 0, 1, 0, 0, 0, 2999.00, NULL, 0, 0, 0, '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '', 2999.00, 500, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_02.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_05.png\" /></p>', NULL, NULL, 0, 4, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (41, 6, 19, 0, 3, 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', '100035246702', 0, 1, 0, 0, 0, 0, 0, 2099.00, NULL, 0, 0, 0, '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '', 2099.00, 1000, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_02.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_05.png\" /></p>', NULL, NULL, 0, 0, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (42, 3, 19, 0, 3, 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', '100035295081', 0, 1, 0, 0, 0, 0, 0, 4999.00, NULL, 0, 0, 0, '【华为Mate50新品上市】内置66W华为充电套装，超光变XMAGE影像,北斗卫星消息，鸿蒙操作系统3.0！立即抢购！华为新品可持续计划，猛戳》 ', '', 4999.00, 1000, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_02.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_05.png\" /></p>', NULL, NULL, 0, 0, '华为', '手机通讯');
INSERT INTO `pms_product` VALUES (43, 1, 39, 0, 14, '万和（Vanward)燃气热水器天然气家用四重防冻直流变频节能全新升级增压水伺服恒温高抗风', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_13L_01.png', '10044060351752', 1, 1, 0, 0, 0, 0, 0, 1799.00, NULL, 0, 0, 0, '【家电11.11享低价，抢到手价不高于1199】【发布种草秀享好礼！同价11.11买贵补差】爆款超一级能效零冷水】 ', '', 1799.00, 1000, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_16L_01.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_05.png\" /></p>', NULL, NULL, 0, 0, '万和', '厨卫大电');
INSERT INTO `pms_product` VALUES (44, 2, 55, 0, 15, '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '100018768480', 0, 1, 0, 0, 0, 0, 0, 369.00, NULL, 0, 0, 0, '【满血无缓存！进店抽百元E卡，部分型号白条三期免息】兼具速度与可靠性！读速高达3500MB/s，全功率模式！点击 ', '', 369.00, 1000, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_01.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_snipaste_03.png\" /></p>', NULL, NULL, 0, 0, '三星', '硬盘');
INSERT INTO `pms_product` VALUES (45, 21, 19, 0, 3, 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', '10052147850350', 0, 1, 0, 0, 0, 0, 0, 2299.00, 999.00, 0, 0, 0, '【11.11提前购机享价保，好货不用等，系统申请一键价保补差!】【Reno8Pro爆款优惠】 ', '', 2299.00, 1000, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_02.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_05.png\" /></p>', '2022-11-09 16:15:50', '2022-11-25 00:00:00', 0, 4, 'OPPO', '手机通讯');
INSERT INTO `pms_product` VALUES (46, 6, 19, 0, 3, 'TEST', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/ba9b182da1dd4afd9ac0a2b2577d938a.jpg', '1', 1, 0, 1, 1, 0, 0, 0, 1.00, NULL, 0, 0, 0, '1', '1', 1.00, 1, 0, '件', 1.00, 0, '1,2,3', '1', '1', '', '1', '1', '', '', NULL, NULL, 0, 0, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (47, 6, 30, 0, 4, '1111', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/dd5a5857dcec43d2ac899b2e2ed32489.PNG', '111', 1, 0, 0, 0, 0, 0, 0, 110.00, NULL, 0, 0, 0, '1111', '11', 110.00, 10, 0, '11', 110.00, 1, '1', '', '', '', '', '', '<p>111</p>', '', NULL, NULL, 0, 0, '小米', '手机配件');
INSERT INTO `pms_product` VALUES (48, 51, 30, 0, 4, '11', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/661c59cc982140a6ae95e125c4abbd70.PNG', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '11', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', '', '', '', '<p>111</p>', '', NULL, NULL, 0, 0, '苹果', '手机配件');
INSERT INTO `pms_product` VALUES (49, 51, 55, 0, 3, '111', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/76f292b19db946c0b14f197f036445a3.PNG', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 11, 11, 11, '111', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', '', '', '', '<p>111</p>', '<p>1111</p>', NULL, NULL, 0, 0, '苹果', '硬盘');
INSERT INTO `pms_product` VALUES (50, 60, 19, 0, 15, '11', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/d316374d6fd04f9a850f1201b75cbcd3.png', '1', 1, 1, 0, 1, 0, 0, 0, 11.00, NULL, 0, 0, 0, '11', '11', 111.00, 11, 0, '1', 11.00, 0, '', '11', '11', '', '11', '11', '', '', '2025-11-29 22:05:21', '2025-11-29 22:05:22', 0, 1, '11', '手机通讯');
INSERT INTO `pms_product` VALUES (51, 61, 54, 0, 13, '111', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/164399bf132e4d8eae06506d5e92f39e.jpg', '111', 1, 1, 1, 1, 0, 0, 0, 11.00, NULL, 0, 0, 0, '11', '11', 11.00, 11, 0, '1', 11.00, 0, '1,2,3', '11', '11', '', '11', '11', '', '', NULL, NULL, 0, 0, 'ASUS', '笔记本');
INSERT INTO `pms_product` VALUES (52, 6, 19, 0, 3, 'Redmi K90 Pro Max', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/afc5489db69840059ec3e107e7507139.jpg', '271829273', 0, 1, 1, 1, 0, 0, 0, 3999.00, 3799.00, 1000, 100, 0, 'REDMI K90 Pro Max红米手机官方旗舰店游戏拍照学生小米手机红米手机手机redmik90promax', '核心配置：第五代骁龙 8 至尊版 + 独显芯片 D2，6.9 英寸 2K OLED 直屏（144Hz 高刷 + 小米龙晶玻璃），7560mAh 电池 + 100W 有线 + 50W 无线快充，5 倍光学变焦三摄（支持 OIS），IP68 防水。\n亮点：BOSE 调校三扬声器 + 背部低音炮，《原神》《星穹铁道》高画质满帧运行，影音游戏沉浸感拉满；7560mAh 巨量电池满足重度游戏 7 小时续航，是 2025 年小米阵营 “参数怪兽” 代表。', 4500.00, 100, 0, '件', 1000.00, 0, '1,2,3', '红米', '【新品上市】', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/3ce3c7bd83424b5e865c7c371034b296.png,https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/df340f89ddef4389a842b973cba18bd1.png,https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/74f2c83e33d6440195fb73c475fff963.png', '【新品上市】REDMI K90 Pro Max红米手机官方旗舰店游戏拍照学生小米手机红米手机手机redmik90promax', '核心配置：第五代骁龙 8 至尊版 + 独显芯片 D2，6.9 英寸 2K OLED 直屏（144Hz 高刷 + 小米龙晶玻璃），7560mAh 电池 + 100W 有线 + 50W 无线快充，5 倍光学变焦三摄（支持 OIS），IP68 防水。 亮点：BOSE 调校三扬声器 + 背部低音炮，《原神》《星穹铁道》高画质满帧运行，影音游戏沉浸感拉满；7560mAh 巨量电池满足重度游戏 7 小时续航，是 2025 年小米阵营 “参数怪兽” 代表。', '', '', '2025-12-01 00:00:00', '2025-12-08 00:00:00', 0, 1, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (53, 6, 19, 0, 3, '小米 17 Pro Max', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/77e9cc14d7724276b41e031a7a5f8649.webp', '7384748932', 0, 1, 1, 1, 0, 0, 0, 4999.00, NULL, 0, 0, 0, 'MIUI/小米 Xiaomi 17 Pro新款5G手机 官方旗舰店官网同款正品徕卡影像大电池快充', '', 5400.00, 100, 0, '件', 1000.00, 0, '1,2,3', '小米', '高性能高端推荐', '', 'MIUI/小米 Xiaomi 17 Pro新款5G手机 官方旗舰店官网同款正品徕卡影像大电池快充', '', '', '', NULL, NULL, 0, 0, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (54, 6, 19, 0, 3, 'REDMI K80至尊版', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/70e1b5fcc3b34a7ba202b5258af63a5d.jpg', '1233421', 0, 1, 0, 1, 0, 0, 0, 2399.00, NULL, 0, 0, 0, '【至高享3期免息】REDMI K80至尊版红米手机小米手机小米官方旗舰店新品红米k80至尊学生游戏电竞旗舰手机', '天玑 9400 + 处理器 + 独显芯片 D2，日常使用 4 年不卡顿；同价位唯一 7410mAh 巨量电池 + IP68 防水，学生党 / 职场新人 “闭眼入” 首选。', 2599.00, 100, 0, '件', 1000.00, 0, '2,3', '红米', '性价比最高推荐', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (55, 6, 19, 0, 3, 'Redmi Turbo4 Pro', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/95b1b2bad5c44be6beb32a896d556c69.jpg', '563452312', 0, 1, 0, 1, 0, 0, 0, 1649.00, NULL, 0, 0, 0, '【政府补贴至高15%】MIUI/小米 Redmi Turbo 4 红米5G手机官方旗舰店官网同款大电池长续航正品新款新品', '', 1799.00, 100, 0, '件', 1000.00, 0, '2,1,3', '小米', '价格亲民', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (56, 6, 19, 0, 3, 'REDMI K80', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/c80480f1486a42b2aa996b4623309b3d.png', '876542345', 0, 1, 0, 1, 0, 0, 0, 2299.00, NULL, 0, 0, 0, '购机享3期免息】REDMI K80红米k80手机官方旗舰店游戏拍照学生国补智能手机小米手机红米手机redmik80', '', 2599.00, 100, 0, '件', 1000.00, 0, '2,3,1', '红米', '价格亲民', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (57, 51, 19, 0, 3, 'iPhone 17 Pro Max ', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/1331b39fa74f41d5b9590bb5bfd4968a.jpg', '45678765', 0, 1, 0, 1, 0, 1000, 0, 11399.00, NULL, 0, 0, 0, '顺丰速发【24期免息】Apple/苹果 iPhone 17 Pro Max 新款全网通5G手机 国行全新官方正品旗舰店16直降5', '', 11399.00, 100, 0, '件', 1000.00, 0, '1,2,3', 'iphone', '高性能高端', '', '', '', '', '', NULL, NULL, 0, 0, '苹果', '手机通讯');
INSERT INTO `pms_product` VALUES (58, 51, 19, 0, 3, '苹果16promax', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/3163dc98df0844cbb5ae4ec809e7aba7.png', '34563212', 0, 1, 0, 1, 0, 0, 0, 7288.00, NULL, 0, 0, 0, '【资源机】Apple/苹果 iPhone 16 Pro Max 全网通5G 双卡双待 美版无锁 现货 原装机器 256G/512G', '', 7288.00, 100, 0, '件', 1000.00, 0, '3,2,1', '苹果', '', '', '', '', '', '', NULL, NULL, 0, 0, '苹果', '手机通讯');
INSERT INTO `pms_product` VALUES (59, 51, 19, 0, 3, 'iPhone 15', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/15ebce10b0064f8e89338814ccd6cf6b.png', '74565542', 0, 1, 0, 0, 0, 0, 0, 4088.00, NULL, 0, 0, 0, 'Apple/苹果 iPhone 15苹果15灵动岛iPhone15国行双卡正品5G手机国行双卡双待分期免息', '', 4088.00, 100, 0, '件', 1000.00, 0, '3,2,1', '苹果', '性价比最高推荐', '', '', '', '', '', NULL, NULL, 0, 0, '苹果', '手机通讯');
INSERT INTO `pms_product` VALUES (60, 51, 19, 0, 3, 'iPhone 14', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/778e6230a18641a380ce55e4f374ed20.png', '85675472', 0, 1, 0, 0, 0, 0, 0, 3850.00, NULL, 0, 0, 0, 'Apple/苹果 iPhone 14苹果14iPhone14国行双卡正品5G手机国行双卡双待分期免息', '', 2750.00, 100, 0, '件', 1000.00, 0, '2,1,3', '苹果', '价格亲民', '', '', '', '', '', NULL, NULL, 0, 0, '苹果', '手机通讯');
INSERT INTO `pms_product` VALUES (61, 6, 19, 0, 3, 'iPhone 13', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/8382f35fa65c465aacf5f6752db440ad.jpg', '7543252', 0, 1, 0, 0, 0, 0, 0, 1500.00, NULL, 0, 0, 0, '【二手】Apple/苹果 iPhone 13国行苹果13双卡13mini单卡99新手机 二手商品 多人评价\"服务态度很好\" 超1千人加购', '', 1470.00, 100, 0, '件', 1000.00, 0, '2,1', '苹果', '价格亲民', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (62, 2, 19, 0, 3, 'Galaxy S24+', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/9c105663ef844c5698c6bc6b8c82ea2e.jpg', '53535432', 0, 1, 1, 0, 0, 0, 0, 4527.00, NULL, 0, 0, 0, '【国家补贴500元】Samsung/三星 Galaxy S24+旗舰超视觉夜拍大屏AI智能5G拍照游戏手机', '', 6999.00, 100, 0, '件', 1000.00, 0, '2,3,1', '三星', '新品推荐', '', '', '', '', '', NULL, NULL, 0, 0, '三星', '手机通讯');
INSERT INTO `pms_product` VALUES (63, 2, 19, 0, 3, 'Galaxy Z Flip7', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/bbbe2c30c5b44beaa1bdf6e635b358bb.jpg', '65743342', 0, 1, 0, 1, 0, 0, 0, 6999.00, NULL, 0, 0, 0, '【256GB升级512GB】Samsung /三星 Galaxy Z Flip7折叠屏手机 4.1英寸智能外屏 5000万像素', '', 7999.00, 100, 0, '件', 100.00, 0, '1,3,2', '三星', '高性能高端推荐', '', '', '', '', '', NULL, NULL, 0, 0, '三星', '手机通讯');
INSERT INTO `pms_product` VALUES (64, 2, 19, 0, 3, 'Galaxy S24 Ultra SM-S9280', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/97942426c08e492bbc0aeffcd27a2109.jpg', '43243232', 0, 1, 0, 1, 0, 0, 0, 4490.00, NULL, 0, 0, 0, 'Samsung/三星 Galaxy S24 Ultra SM-S9280新款s24ultra大屏AI手机', '', 4500.00, 100, 0, '件', 1000.00, 0, '2,1,3', '三星', '高性价比', '', '', '', '', '', NULL, NULL, 0, 0, '三星', '手机通讯');
INSERT INTO `pms_product` VALUES (65, 2, 19, 0, 3, 'Galaxy A56', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/9ee89637431349bf84f52d9baf2344ab.jpg', '3545322', 0, 1, 0, 0, 0, 0, 0, 2700.00, NULL, 0, 0, 0, 'Samsung/三星 Galaxy A56 5G智能拍照设计轻薄时尚游戏手机', '', 2599.00, 100, 0, '件', 1000.00, 0, '2,1,3', '三星', '价格亲民', '', '', '', '', '', NULL, NULL, 0, 0, '三星', '手机通讯');
INSERT INTO `pms_product` VALUES (66, 3, 19, 0, 3, '华为Mate 70 Pro+', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/bc8e233c976b406596d9a73ad14d839f.jpg', '23479523', 0, 1, 1, 1, 0, 0, 0, 7099.00, NULL, 0, 0, 0, '【24期免息】HUAWEI/华为Mate 70 Pro+ 手机智能手机旗舰店官网官方正品鸿蒙智能手机', '', 7999.00, 100, 0, '件', 1000.00, 0, '2,1,3', '华为', '新品', '', '', '', '', '', NULL, NULL, 0, 0, '华为', '手机通讯');
INSERT INTO `pms_product` VALUES (67, 3, 19, 0, 3, '华为Pura70Pro', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/7576bd8928884f86be0107fc4bc445d1.jpg', '43253245', 0, 1, 0, 1, 0, 0, 0, 6999.00, NULL, 0, 0, 0, '【国家补贴15%】HUAWEI 华为Pura70Pro 手机华为超高速风驰闪拍 北斗卫星消息华为官方旗舰店正品华为p702127', '', 7100.00, 100, 0, '件', 1000.00, 0, '1,2,3', '华为', '性价比最高推荐', '', '', '', '', '', NULL, NULL, 0, 0, '华为', '手机通讯');
INSERT INTO `pms_product` VALUES (68, 3, 19, 0, 3, 'HUAWEI Mate X5', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/0fb5f6d842b0467e8bd7b465abf1981c.jpg', '7456323', 0, 1, 0, 1, 0, 0, 0, 9999.00, NULL, 0, 0, 0, 'HUAWEI Mate X5 四曲折叠机身昆仑玻璃灵犀通信华为官方旗舰店智能手机双屏折叠屏大屏商务', '', 10999.00, 100, 0, '件', 1000.00, 0, '2,1,3', '华为', '高性能高端推荐', '', '', '', '', '', NULL, NULL, 0, 0, '华为', '手机通讯');
INSERT INTO `pms_product` VALUES (69, 3, 19, 0, 3, 'HUAWEI/华为Mate60', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/ca30c66e6be74e9e917abd72131777e2.jpg', '76545642', 0, 1, 0, 0, 0, 0, 0, 1499.00, NULL, 0, 0, 0, '【官方补贴】HUAWEI/华为Mate60 5G手机2025年新款华为手机官方旗舰正品店智能学生老人手机mate70pro/x60', '', 1599.00, 100, 0, '件', 1000.00, 0, '2,1,3', '华为', '价格亲民', '', '', '', '', '', NULL, NULL, 0, 0, '华为', '手机通讯');
INSERT INTO `pms_product` VALUES (70, 21, 19, 0, 3, 'OPPO Find X9 Pro', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/69e0423508f64b2e82b4d134bc6c91e9.jpg', '3960654', 0, 1, 1, 1, 0, 0, 0, 5299.00, NULL, 0, 0, 0, '新品上市 OPPO Find X9 Pro正品新款【孙颖莎同款】 哈苏 2 亿超清长焦镜头oppo手机官方旗舰店oppofindx9pro', '', 5299.00, 5699, 0, '件', 1000.00, 0, '2,1,3', 'oppo', '新品', '', '', '', '', '', NULL, NULL, 0, 0, 'OPPO', '手机通讯');
INSERT INTO `pms_product` VALUES (71, 21, 19, 0, 3, 'OPPO Find N5', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/80367ed4e74349279d9357df09d3d1e5.jpg', '10607003', 0, 1, 0, 1, 0, 0, 0, 8999.00, NULL, 0, 0, 0, 'OPPO Find N5折叠旗舰新款超薄机身骁龙8至尊版findn5oppo5G手机官方旗舰店正品AI智能拍照手机', '', 10999.00, 100, 0, '件', 1000.00, 0, '2,1,3', 'oppo', '高性能', '', '', '', '', '', NULL, NULL, 0, 0, 'OPPO', '手机通讯');
INSERT INTO `pms_product` VALUES (72, 61, 54, 0, 13, '华硕无畏 14 AI 旗舰版', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/6ef58c24e9ec4fa0b67b95ccb207f416.jpg', '3458434', 0, 1, 1, 1, 0, 0, 0, 3419.00, NULL, 0, 0, 0, '华硕无畏14 英特尔酷睿Ultra5 14英寸 2.5k护眼屏轻薄笔记本电脑大学生商务办公', '', 4499.00, 100, 0, '台', 1000.00, 0, '1,2,3', 'asus', '新品', '', '', '', '', '', NULL, NULL, 0, 0, 'ASUS', '笔记本');
INSERT INTO `pms_product` VALUES (73, 61, 54, 0, 13, '华硕灵耀16 Air', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/b0993158875a48b1b9893ee4674efe0e.jpg', '73749829', 0, 1, 0, 1, 0, 0, 0, 9999.00, NULL, 0, 0, 0, '【高端旗舰】华硕灵耀16 Air AMD锐龙Al9 HX370 2.8K 120Hz OLED 16英寸1.1cm高颜值超轻薄商务笔记本电脑', '', 10999.00, 100, 0, '台', 1111.00, 0, '2,3,1', 'asus', '高端', '', '', '', '', '', NULL, NULL, 0, 0, 'ASUS', '笔记本');
INSERT INTO `pms_product` VALUES (75, 61, 54, 0, 13, 'Al9 HX370', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/90945326fee74154bb0fc8edaa6baeec.jpg', '5423344', 0, 1, 0, 1, 0, 0, 0, 8799.00, NULL, 0, 0, 0, '【畅玩3A游戏】华硕天选6 Pro AMD锐龙版R9 16英寸高性能电竞游戏本RTX5060学生笔记本电脑官方正品', '', 9799.00, 100, 0, '台', 1000.00, 0, '1,2,3', 'asus', '高性能', '', '', '', '', '', NULL, NULL, 0, 0, 'ASUS', '笔记本');
INSERT INTO `pms_product` VALUES (76, 61, 54, 0, 13, '华硕a豆14 Air 悦享版', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/c990fbe6abe74b89859231761c7f490b.jpg', '856986', 0, 1, 0, 1, 0, 0, 0, 4799.00, NULL, 0, 0, 0, '【智能焕新大促】华硕a豆14 Air 悦享版2025锐龙版办公笔记本电脑', '', 6799.00, 100, 0, '件', 1000.00, 0, '1,2,3', 'asus', '亲民', '', '', '', '', '', NULL, NULL, 0, 0, 'ASUS', '笔记本');
INSERT INTO `pms_product` VALUES (77, 62, 54, 0, 13, '暗影精灵11', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/f9221430deef4b68b1ea510389f3ea82.jpg', '70696856', 0, 1, 0, 1, 0, 0, 0, 7899.00, NULL, 0, 0, 0, '【政府补贴3%】HP惠普 暗影精灵11 可选14代酷睿i9HX RTX5070游戏本笔记本电脑惠普电脑官方正品', '', 9099.00, 100, 0, '台', 1000.00, 0, '2,1,3', '惠普', '', '', '', '', '', '', NULL, NULL, 0, 0, '惠普', '笔记本');
INSERT INTO `pms_product` VALUES (78, 62, 54, 0, 13, '战99 ZBook Power G11', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/7dd4176e77214527838a162c9d52d682.jpg', '4050607', 0, 1, 0, 1, 0, 0, 0, 8799.00, NULL, 0, 0, 0, 'HP/惠普战99 ZBook Power G10/G11十三代酷睿/Ultra处理器Deepseek商务办公AI设计绘图建模笔记本电脑', '', 9783.00, 100, 0, '台', 1000.00, 0, '1,2,3', '惠普', '', '', '', '', '', '', NULL, NULL, 0, 0, '惠普', '笔记本');
INSERT INTO `pms_product` VALUES (79, 63, 54, 0, 13, '戴尔 15', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/bf7ba9cfc98a4aa7a7fd2c0db61759ad.png', '5435636', 0, 1, 0, 1, 0, 0, 0, 2799.00, NULL, 0, 0, 0, '【全国可补 焕新补贴15%】Dell/戴尔 15 英特尔酷睿学生商务办公网课15.6英寸轻薄便携本官方旗舰官网2025新', '', 5299.00, 100, 0, '台', 1000.00, 0, '1,2,3', '戴尔', '', '', '', '', '', '', NULL, NULL, 0, 0, '戴尔', '笔记本');
INSERT INTO `pms_product` VALUES (80, 63, 54, 0, 13, '戴尔 灵越16 Plus', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/dd83bd51160e47d58ae4bbe8e61005bc.jpg', '756463443', 0, 1, 0, 1, 0, 0, 0, 4099.00, NULL, 0, 0, 0, '【政府补贴20%】DELL/戴尔 灵越16 Plus 英特尔酷睿i7/core7笔记本电脑轻薄本商务便携电脑灵越7000轻薄本', '', 5499.00, 100, 0, '台', 1000.00, 0, '1,2,3', '戴尔', '', '', '', '', '', '', NULL, NULL, 0, 0, '戴尔', '笔记本');
INSERT INTO `pms_product` VALUES (81, 64, 54, 0, 13, '联想拯救者Y7000P', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/1b89927bf9ee406b956ca3db6232fd6e.jpg', '5609465', 0, 1, 0, 1, 0, 0, 0, 8999.00, NULL, 0, 0, 0, '【百补+政府补贴】联想拯救者Y7000P 酷睿Ultra7 255HX RTX5060 AI高静游戏本电竞笔记本电脑学生笔记本电脑', '', 9999.00, 100, 0, '台', 1000.00, 0, '2,1,3', '联想', '', '', '', '', '', '', NULL, NULL, 0, 0, '联想', '笔记本');
INSERT INTO `pms_product` VALUES (82, 64, 54, 0, 13, '联想拯救者R9000P', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/21d14371680847c3970b15b5c2e12c34.png', '9089087', 0, 1, 0, 1, 0, 0, 0, 9449.00, NULL, 0, 0, 0, '【人气游戏本】联想拯救者R9000P/R7000P 2025 AI元启 可选 RTX5060 RTX5070 电竞游戏本笔记本电脑旗舰正品', '', 10499.00, 100, 0, '台', 1000.00, 0, '1,2,3', '联想', '', '', '', '', '', '', NULL, NULL, 0, 0, '联想', '笔记本');
INSERT INTO `pms_product` VALUES (83, 61, 19, 0, 3, '11', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/f62db814dbfb477b858368b7058500b1.png', '11', 0, 1, 0, 0, 0, 0, 0, 1.00, NULL, 0, 0, 0, '11', '111', 1.00, 1, 0, '11', 10.00, 0, '', '1', '1', '', '11', '1', '', '', NULL, NULL, 0, 0, 'ASUS', '手机通讯');

-- ----------------------------
-- Table structure for pms_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute`;
CREATE TABLE `pms_product_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_type` int(1) NULL DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int(1) NULL DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `filter_type` int(1) NULL DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
  `search_type` int(1) NULL DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `related_status` int(1) NULL DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
  `hand_add_status` int(1) NULL DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int(1) NULL DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性参数表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_attribute
-- ----------------------------
INSERT INTO `pms_product_attribute` VALUES (1, 1, '尺寸', 2, 1, 'M,X,XL,2XL,3XL,4XL', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (7, 1, '颜色', 2, 1, '黑色,红色,白色,粉色', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (13, 0, '上市年份', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (14, 0, '上市年份1', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (15, 0, '上市年份2', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (16, 0, '上市年份3', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (17, 0, '上市年份4', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (18, 0, '上市年份5', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (19, 0, '适用对象', 1, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (20, 0, '适用对象1', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (21, 0, '适用对象3', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (24, 1, '商品编号', 1, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (25, 1, '适用季节', 1, 1, '春季,夏季,秋季,冬季', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (32, 2, '适用人群', 0, 1, '老年,青年,中年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (33, 2, '风格', 0, 1, '嘻哈风格,基础大众,商务正装', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (35, 2, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (37, 1, '适用人群', 1, 1, '儿童,青年,中年,老年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (38, 1, '上市时间', 1, 1, '2017年秋,2017年冬,2018年春,2018年夏', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (39, 1, '袖长', 1, 1, '短袖,长袖,中袖', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (40, 2, '尺码', 0, 1, '29,30,31,32,33,34', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (41, 2, '适用场景', 0, 1, '居家,运动,正装', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (42, 2, '上市时间', 0, 1, '2018年春,2018年夏', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (43, 3, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (44, 3, '容量', 0, 1, '16G,32G,64G,128G,256G,512G,1T', 0, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (45, 3, '屏幕尺寸', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (46, 3, '网络', 0, 1, '3G,4G,5G,WLAN', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (47, 3, '系统', 0, 1, 'Android,IOS', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (48, 3, '电池容量', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (49, 11, '颜色', 0, 1, '红色,蓝色,绿色', 0, 1, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (50, 11, '尺寸', 0, 1, '38,39,40', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (51, 11, '风格', 0, 1, '夏季,秋季', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (52, 12, '尺寸', 0, 1, '50英寸,65英寸,70英寸', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (53, 12, '内存', 0, 1, '8G,16G,32G', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (54, 12, '商品编号', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (55, 12, '商品毛重', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (56, 12, '商品产地', 0, 1, '中国大陆,其他', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (57, 12, '电视类型', 0, 1, '大屏,教育电视,4K超清', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (58, 13, '颜色', 0, 0, '', 0, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (59, 13, '版本', 0, 1, '套餐一,套餐二', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (60, 13, '屏幕尺寸', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (61, 13, '屏幕分辨率', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (62, 13, 'CPU型号', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (63, 14, '系列', 0, 0, '', 0, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (64, 14, '上市时间', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (65, 14, '毛重', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (66, 14, '额定功率', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (67, 15, '颜色', 0, 0, '', 0, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (68, 15, '版本', 0, 1, '512GB,1TB', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (69, 15, '系列', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (70, 15, '型号', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (71, 15, '闪存类型', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (72, 15, '顺序读速', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (73, 15, '顺序写入', 0, 0, '', 0, 0, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for pms_product_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_category`;
CREATE TABLE `pms_product_attribute_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attribute_count` int(11) NULL DEFAULT 0 COMMENT '属性数量',
  `param_count` int(11) NULL DEFAULT 0 COMMENT '参数数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品属性分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_attribute_category
-- ----------------------------
INSERT INTO `pms_product_attribute_category` VALUES (3, '手机数码-手机通讯', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (4, '配件', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (13, '电脑办公-笔记本', 2, 3);
INSERT INTO `pms_product_attribute_category` VALUES (15, '电脑办公-硬盘', 2, 5);

-- ----------------------------
-- Table structure for pms_product_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_value`;
CREATE TABLE `pms_product_attribute_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_attribute_id` bigint(20) NULL DEFAULT NULL,
  `value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 729 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储产品参数信息的表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_attribute_value
-- ----------------------------
INSERT INTO `pms_product_attribute_value` VALUES (1, 9, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (2, 10, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (3, 11, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (4, 12, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (5, 13, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (6, 14, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (7, 18, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (8, 7, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (9, 7, 1, 'XL');
INSERT INTO `pms_product_attribute_value` VALUES (10, 7, 1, 'XXL');
INSERT INTO `pms_product_attribute_value` VALUES (11, 22, 7, 'x,xx');
INSERT INTO `pms_product_attribute_value` VALUES (12, 22, 24, 'no110');
INSERT INTO `pms_product_attribute_value` VALUES (13, 22, 25, '春季');
INSERT INTO `pms_product_attribute_value` VALUES (14, 22, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (15, 22, 38, '2018年春');
INSERT INTO `pms_product_attribute_value` VALUES (16, 22, 39, '长袖');
INSERT INTO `pms_product_attribute_value` VALUES (124, 23, 7, '米白色,浅黄色');
INSERT INTO `pms_product_attribute_value` VALUES (125, 23, 24, 'no1098');
INSERT INTO `pms_product_attribute_value` VALUES (126, 23, 25, '春季');
INSERT INTO `pms_product_attribute_value` VALUES (127, 23, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (128, 23, 38, '2018年春');
INSERT INTO `pms_product_attribute_value` VALUES (129, 23, 39, '长袖');
INSERT INTO `pms_product_attribute_value` VALUES (130, 1, 13, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (131, 1, 14, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (132, 1, 15, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (133, 1, 16, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (134, 1, 17, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (135, 1, 18, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (136, 1, 19, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (137, 1, 20, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (138, 1, 21, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (139, 2, 13, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (140, 2, 14, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (141, 2, 15, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (142, 2, 16, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (143, 2, 17, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (144, 2, 18, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (145, 2, 19, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (146, 2, 20, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (147, 2, 21, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (243, 30, 7, '蓝色,白色');
INSERT INTO `pms_product_attribute_value` VALUES (244, 30, 24, 'HNTBJ2E042A');
INSERT INTO `pms_product_attribute_value` VALUES (245, 30, 25, '夏季');
INSERT INTO `pms_product_attribute_value` VALUES (246, 30, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (247, 30, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (248, 30, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (249, 31, 7, '浅灰色,深灰色');
INSERT INTO `pms_product_attribute_value` VALUES (250, 31, 24, 'HNTBJ2E080A');
INSERT INTO `pms_product_attribute_value` VALUES (251, 31, 25, '夏季');
INSERT INTO `pms_product_attribute_value` VALUES (252, 31, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (253, 31, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (254, 31, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (255, 32, 7, '黑色,白色');
INSERT INTO `pms_product_attribute_value` VALUES (256, 32, 24, 'HNTBJ2E153A');
INSERT INTO `pms_product_attribute_value` VALUES (257, 32, 25, '夏季');
INSERT INTO `pms_product_attribute_value` VALUES (258, 32, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (259, 32, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (260, 32, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (265, 33, 54, '4609652');
INSERT INTO `pms_product_attribute_value` VALUES (266, 33, 55, '28.6kg');
INSERT INTO `pms_product_attribute_value` VALUES (267, 33, 56, '中国大陆');
INSERT INTO `pms_product_attribute_value` VALUES (268, 33, 57, '大屏');
INSERT INTO `pms_product_attribute_value` VALUES (269, 34, 54, '4609660');
INSERT INTO `pms_product_attribute_value` VALUES (270, 34, 55, '30.8kg');
INSERT INTO `pms_product_attribute_value` VALUES (271, 34, 56, '中国大陆');
INSERT INTO `pms_product_attribute_value` VALUES (272, 34, 57, '4K超清');
INSERT INTO `pms_product_attribute_value` VALUES (288, 27, 43, '黑色,蓝色');
INSERT INTO `pms_product_attribute_value` VALUES (289, 27, 45, '5.8');
INSERT INTO `pms_product_attribute_value` VALUES (290, 27, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (291, 27, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (292, 27, 48, '3000ml');
INSERT INTO `pms_product_attribute_value` VALUES (303, 28, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (304, 28, 45, '5.0');
INSERT INTO `pms_product_attribute_value` VALUES (305, 28, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (306, 28, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (307, 28, 48, '2800ml');
INSERT INTO `pms_product_attribute_value` VALUES (338, 37, 43, '午夜色,星光色,紫色,蓝色');
INSERT INTO `pms_product_attribute_value` VALUES (339, 37, 45, '6.1英寸');
INSERT INTO `pms_product_attribute_value` VALUES (340, 37, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (341, 37, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (342, 37, 48, '3000毫安');
INSERT INTO `pms_product_attribute_value` VALUES (443, 38, 43, '银色,蓝色');
INSERT INTO `pms_product_attribute_value` VALUES (444, 38, 45, '10.9英寸');
INSERT INTO `pms_product_attribute_value` VALUES (445, 38, 46, 'WLAN');
INSERT INTO `pms_product_attribute_value` VALUES (446, 38, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (447, 38, 48, '6000毫安');
INSERT INTO `pms_product_attribute_value` VALUES (448, 39, 58, '新小米Pro 14英寸 2.8K屏,新Redmi Pro 15英寸 3.2K屏');
INSERT INTO `pms_product_attribute_value` VALUES (449, 39, 60, '15.6英寸');
INSERT INTO `pms_product_attribute_value` VALUES (450, 39, 61, '3200*2000');
INSERT INTO `pms_product_attribute_value` VALUES (451, 39, 62, 'R5 6600H');
INSERT INTO `pms_product_attribute_value` VALUES (452, 41, 43, '墨羽,银迹');
INSERT INTO `pms_product_attribute_value` VALUES (453, 41, 45, '6.67英寸');
INSERT INTO `pms_product_attribute_value` VALUES (454, 41, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (455, 41, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (456, 41, 48, '5500mAh');
INSERT INTO `pms_product_attribute_value` VALUES (457, 42, 43, '曜金黑,冰霜银');
INSERT INTO `pms_product_attribute_value` VALUES (458, 42, 45, '6.7英寸');
INSERT INTO `pms_product_attribute_value` VALUES (459, 42, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (460, 42, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (461, 42, 48, '4460mAh');
INSERT INTO `pms_product_attribute_value` VALUES (462, 43, 63, 'JSQ25-565W13【13升】【恒温旗舰款】,JSQ30-565W16【16升】【恒温旗舰款】');
INSERT INTO `pms_product_attribute_value` VALUES (463, 43, 64, '2021-05');
INSERT INTO `pms_product_attribute_value` VALUES (464, 43, 65, '15.5kg');
INSERT INTO `pms_product_attribute_value` VALUES (465, 43, 66, '30w');
INSERT INTO `pms_product_attribute_value` VALUES (466, 44, 67, '新品980｜NVMe PCIe3.0*4,980 PRO｜NVMe PCIe 4.0');
INSERT INTO `pms_product_attribute_value` VALUES (467, 44, 69, '980');
INSERT INTO `pms_product_attribute_value` VALUES (468, 44, 70, 'MZ-V8V500BW');
INSERT INTO `pms_product_attribute_value` VALUES (469, 44, 71, 'TLC');
INSERT INTO `pms_product_attribute_value` VALUES (470, 44, 72, '3100MB/s');
INSERT INTO `pms_product_attribute_value` VALUES (471, 44, 73, '2600MB/s');
INSERT INTO `pms_product_attribute_value` VALUES (472, 45, 43, '鸢尾紫,晴空蓝');
INSERT INTO `pms_product_attribute_value` VALUES (473, 45, 45, '6.43英寸');
INSERT INTO `pms_product_attribute_value` VALUES (474, 45, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (475, 45, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (476, 45, 48, '4500mAh');
INSERT INTO `pms_product_attribute_value` VALUES (477, 40, 43, '黑色,蓝色');
INSERT INTO `pms_product_attribute_value` VALUES (478, 40, 45, '6.73英寸');
INSERT INTO `pms_product_attribute_value` VALUES (479, 40, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (480, 40, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (481, 40, 48, '5160mAh');
INSERT INTO `pms_product_attribute_value` VALUES (527, 46, 45, '12');
INSERT INTO `pms_product_attribute_value` VALUES (528, 46, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (529, 46, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (530, 46, 48, '1212');
INSERT INTO `pms_product_attribute_value` VALUES (531, 49, 43, '11,111');
INSERT INTO `pms_product_attribute_value` VALUES (532, 49, 45, '11');
INSERT INTO `pms_product_attribute_value` VALUES (533, 49, 46, '3G');
INSERT INTO `pms_product_attribute_value` VALUES (534, 49, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (535, 49, 48, '11');
INSERT INTO `pms_product_attribute_value` VALUES (536, 50, 69, '11');
INSERT INTO `pms_product_attribute_value` VALUES (537, 50, 70, '11');
INSERT INTO `pms_product_attribute_value` VALUES (538, 50, 71, '11');
INSERT INTO `pms_product_attribute_value` VALUES (539, 50, 72, '11');
INSERT INTO `pms_product_attribute_value` VALUES (540, 50, 73, '11');
INSERT INTO `pms_product_attribute_value` VALUES (541, 51, 60, '11');
INSERT INTO `pms_product_attribute_value` VALUES (542, 51, 61, '11');
INSERT INTO `pms_product_attribute_value` VALUES (543, 51, 62, '11');
INSERT INTO `pms_product_attribute_value` VALUES (559, 52, 43, '流白金,黑色,丹宁色');
INSERT INTO `pms_product_attribute_value` VALUES (560, 52, 45, '6.9英寸');
INSERT INTO `pms_product_attribute_value` VALUES (561, 52, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (562, 52, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (563, 52, 48, '7560mAh');
INSERT INTO `pms_product_attribute_value` VALUES (569, 53, 43, '冷艳紫,森野绿');
INSERT INTO `pms_product_attribute_value` VALUES (570, 53, 45, '6.9 英寸');
INSERT INTO `pms_product_attribute_value` VALUES (571, 53, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (572, 53, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (573, 53, 48, '7500mAh');
INSERT INTO `pms_product_attribute_value` VALUES (574, 54, 43, '白岩灰,月岩白,冰锋蓝');
INSERT INTO `pms_product_attribute_value` VALUES (575, 54, 45, '6.83 英寸');
INSERT INTO `pms_product_attribute_value` VALUES (576, 54, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (577, 54, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (578, 54, 48, '7410mAh');
INSERT INTO `pms_product_attribute_value` VALUES (579, 55, 43, '暗隐黑,祥云白');
INSERT INTO `pms_product_attribute_value` VALUES (580, 55, 45, '6.83 英寸');
INSERT INTO `pms_product_attribute_value` VALUES (581, 55, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (582, 55, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (583, 55, 48, '7550mAh');
INSERT INTO `pms_product_attribute_value` VALUES (584, 56, 43, '玄夜黑,雪岩白');
INSERT INTO `pms_product_attribute_value` VALUES (585, 56, 45, '6.83 英寸');
INSERT INTO `pms_product_attribute_value` VALUES (586, 56, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (587, 56, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (588, 56, 48, '6550mAh');
INSERT INTO `pms_product_attribute_value` VALUES (589, 57, 43, '深夜蓝,星宇橙色');
INSERT INTO `pms_product_attribute_value` VALUES (590, 57, 45, '6.9英寸');
INSERT INTO `pms_product_attribute_value` VALUES (591, 57, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (592, 57, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (593, 57, 48, '4823mAh');
INSERT INTO `pms_product_attribute_value` VALUES (594, 58, 43, '原色钛金属,白色钛金属');
INSERT INTO `pms_product_attribute_value` VALUES (595, 58, 45, '6.9英寸');
INSERT INTO `pms_product_attribute_value` VALUES (596, 58, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (597, 58, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (598, 58, 48, ' 4685mAh');
INSERT INTO `pms_product_attribute_value` VALUES (599, 59, 43, ' 粉色,绿色');
INSERT INTO `pms_product_attribute_value` VALUES (600, 59, 45, '6.1英寸');
INSERT INTO `pms_product_attribute_value` VALUES (601, 59, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (602, 59, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (603, 59, 48, '3349mAh');
INSERT INTO `pms_product_attribute_value` VALUES (604, 60, 43, '午夜色,星光色');
INSERT INTO `pms_product_attribute_value` VALUES (605, 60, 45, '6.1 英寸');
INSERT INTO `pms_product_attribute_value` VALUES (606, 60, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (607, 60, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (608, 60, 48, '3279mAh');
INSERT INTO `pms_product_attribute_value` VALUES (609, 61, 43, '午夜色');
INSERT INTO `pms_product_attribute_value` VALUES (610, 61, 45, '6.1 英寸');
INSERT INTO `pms_product_attribute_value` VALUES (611, 61, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (612, 61, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (613, 61, 48, '3095mAh');
INSERT INTO `pms_product_attribute_value` VALUES (614, 62, 43, '秘矿紫,浅珀黄');
INSERT INTO `pms_product_attribute_value` VALUES (615, 62, 45, '6.7英寸');
INSERT INTO `pms_product_attribute_value` VALUES (616, 62, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (617, 62, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (618, 62, 48, '4900mAh');
INSERT INTO `pms_product_attribute_value` VALUES (619, 63, 43, '暗影蓝,秘影黑');
INSERT INTO `pms_product_attribute_value` VALUES (620, 63, 45, '6.9英寸');
INSERT INTO `pms_product_attribute_value` VALUES (621, 63, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (622, 63, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (623, 63, 48, ' 4300mAh');
INSERT INTO `pms_product_attribute_value` VALUES (624, 64, 43, '钛灰, 钛羽黄');
INSERT INTO `pms_product_attribute_value` VALUES (625, 64, 45, '6.8英寸');
INSERT INTO `pms_product_attribute_value` VALUES (626, 64, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (627, 64, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (628, 64, 48, '5000mAh');
INSERT INTO `pms_product_attribute_value` VALUES (629, 65, 43, '雅柔灰');
INSERT INTO `pms_product_attribute_value` VALUES (630, 65, 45, '6.5英寸');
INSERT INTO `pms_product_attribute_value` VALUES (631, 65, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (632, 65, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (633, 65, 48, '5000mAh');
INSERT INTO `pms_product_attribute_value` VALUES (634, 66, 43, '墨韵黑,飞天青');
INSERT INTO `pms_product_attribute_value` VALUES (635, 66, 45, '6.9英寸');
INSERT INTO `pms_product_attribute_value` VALUES (636, 66, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (637, 66, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (638, 66, 48, '5700mAh');
INSERT INTO `pms_product_attribute_value` VALUES (639, 67, 43, '羽砂黑,雪域白');
INSERT INTO `pms_product_attribute_value` VALUES (640, 67, 45, '6.8英寸');
INSERT INTO `pms_product_attribute_value` VALUES (641, 67, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (642, 67, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (643, 67, 48, '5050mAh');
INSERT INTO `pms_product_attribute_value` VALUES (644, 68, 43, '羽砂白');
INSERT INTO `pms_product_attribute_value` VALUES (645, 68, 45, '6.4英寸');
INSERT INTO `pms_product_attribute_value` VALUES (646, 68, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (647, 68, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (648, 68, 48, ' 5060mAh');
INSERT INTO `pms_product_attribute_value` VALUES (649, 69, 43, '月影白,典雅黑');
INSERT INTO `pms_product_attribute_value` VALUES (650, 69, 45, '6.74英寸');
INSERT INTO `pms_product_attribute_value` VALUES (651, 69, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (652, 69, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (653, 69, 48, '4700mAh');
INSERT INTO `pms_product_attribute_value` VALUES (664, 70, 43, '追光红,绒砂钛');
INSERT INTO `pms_product_attribute_value` VALUES (665, 70, 45, '6.78英寸');
INSERT INTO `pms_product_attribute_value` VALUES (666, 70, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (667, 70, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (668, 70, 48, '7500mAh');
INSERT INTO `pms_product_attribute_value` VALUES (669, 71, 43, '缎黑,玉白,暮紫');
INSERT INTO `pms_product_attribute_value` VALUES (670, 71, 45, '8.12英寸');
INSERT INTO `pms_product_attribute_value` VALUES (671, 71, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (672, 71, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (673, 71, 48, '5600mAh');
INSERT INTO `pms_product_attribute_value` VALUES (674, 72, 58, '银色');
INSERT INTO `pms_product_attribute_value` VALUES (675, 72, 60, '14英寸');
INSERT INTO `pms_product_attribute_value` VALUES (676, 72, 61, '1920*1200');
INSERT INTO `pms_product_attribute_value` VALUES (677, 72, 62, 'i5+13420H');
INSERT INTO `pms_product_attribute_value` VALUES (678, 73, 58, '雪域白');
INSERT INTO `pms_product_attribute_value` VALUES (679, 73, 60, '16英寸');
INSERT INTO `pms_product_attribute_value` VALUES (680, 73, 61, '2880x1620像素');
INSERT INTO `pms_product_attribute_value` VALUES (681, 73, 62, 'Al9 HX370');
INSERT INTO `pms_product_attribute_value` VALUES (682, 75, 58, '日蚀灰');
INSERT INTO `pms_product_attribute_value` VALUES (683, 75, 60, '16英寸');
INSERT INTO `pms_product_attribute_value` VALUES (684, 75, 61, '2560x1600像素');
INSERT INTO `pms_product_attribute_value` VALUES (685, 75, 62, 'NVIDIA GeForce RTX 5060');
INSERT INTO `pms_product_attribute_value` VALUES (686, 76, 58, '香草罗勒');
INSERT INTO `pms_product_attribute_value` VALUES (687, 76, 60, '14英寸');
INSERT INTO `pms_product_attribute_value` VALUES (688, 76, 61, '1920*1080像素');
INSERT INTO `pms_product_attribute_value` VALUES (689, 76, 62, 'i5-1335U');
INSERT INTO `pms_product_attribute_value` VALUES (690, 77, 58, '玄影版');
INSERT INTO `pms_product_attribute_value` VALUES (691, 77, 60, '16英寸');
INSERT INTO `pms_product_attribute_value` VALUES (692, 77, 61, '2.5k');
INSERT INTO `pms_product_attribute_value` VALUES (693, 77, 62, 'i7-14650HX+RTX5060');
INSERT INTO `pms_product_attribute_value` VALUES (694, 78, 58, 'U7-155H');
INSERT INTO `pms_product_attribute_value` VALUES (695, 78, 60, '15.6英寸');
INSERT INTO `pms_product_attribute_value` VALUES (696, 78, 61, '2.5K');
INSERT INTO `pms_product_attribute_value` VALUES (697, 78, 62, 'U5-125H/RTX4050 6G独显');
INSERT INTO `pms_product_attribute_value` VALUES (698, 79, 58, '铂金银');
INSERT INTO `pms_product_attribute_value` VALUES (699, 79, 60, '15.6英寸');
INSERT INTO `pms_product_attribute_value` VALUES (700, 79, 61, '1920*1080像素');
INSERT INTO `pms_product_attribute_value` VALUES (701, 79, 62, '英特尔® UHD显卡+英特尔® 酷睿™ 3 处理器 100U');
INSERT INTO `pms_product_attribute_value` VALUES (702, 80, 58, '灵越7000|爆款推荐');
INSERT INTO `pms_product_attribute_value` VALUES (703, 80, 60, '14英寸');
INSERT INTO `pms_product_attribute_value` VALUES (704, 80, 61, '1920*1080');
INSERT INTO `pms_product_attribute_value` VALUES (705, 80, 62, 'Core5 210H');
INSERT INTO `pms_product_attribute_value` VALUES (706, 81, 58, '碳晶黑');
INSERT INTO `pms_product_attribute_value` VALUES (707, 81, 60, '16英寸');
INSERT INTO `pms_product_attribute_value` VALUES (708, 81, 61, '2.5k');
INSERT INTO `pms_product_attribute_value` VALUES (709, 81, 62, 'Ultra 7 255HX');
INSERT INTO `pms_product_attribute_value` VALUES (710, 82, 58, '碳晶黑');
INSERT INTO `pms_product_attribute_value` VALUES (711, 82, 60, '16英寸');
INSERT INTO `pms_product_attribute_value` VALUES (712, 82, 61, '2.5k');
INSERT INTO `pms_product_attribute_value` VALUES (713, 82, 62, 'R9 8945HX/RTX5060');
INSERT INTO `pms_product_attribute_value` VALUES (714, 29, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (715, 29, 45, '4.7');
INSERT INTO `pms_product_attribute_value` VALUES (716, 29, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (717, 29, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (718, 29, 48, '1960ml');
INSERT INTO `pms_product_attribute_value` VALUES (719, 26, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (720, 26, 45, '5.0');
INSERT INTO `pms_product_attribute_value` VALUES (721, 26, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (722, 26, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (723, 26, 48, '3000');
INSERT INTO `pms_product_attribute_value` VALUES (724, 83, 43, '红色');
INSERT INTO `pms_product_attribute_value` VALUES (725, 83, 45, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (726, 83, 46, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (727, 83, 47, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (728, 83, 48, NULL);

-- ----------------------------
-- Table structure for pms_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category`;
CREATE TABLE `pms_product_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上机分类的编号：0表示一级分类',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(1) NULL DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int(11) NULL DEFAULT NULL,
  `product_unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nav_status` int(1) NULL DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int(1) NULL DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int(11) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_category
-- ----------------------------
INSERT INTO `pms_product_category` VALUES (2, 0, '手机', 0, 100, '件', 1, 1, 1, NULL, '手机', '手机');
INSERT INTO `pms_product_category` VALUES (7, 1, '外套', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac4780cN6087feb5.jpg', '外套', '外套');
INSERT INTO `pms_product_category` VALUES (8, 1, 'T恤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac47ffaN8a7b2e14.png', 'T恤', 'T恤');
INSERT INTO `pms_product_category` VALUES (9, 1, '休闲裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac47845N7374a31d.jpg', '休闲裤', '休闲裤');
INSERT INTO `pms_product_category` VALUES (10, 1, '牛仔裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac47841Nff658599.jpg', '牛仔裤', '牛仔裤');
INSERT INTO `pms_product_category` VALUES (11, 1, '衬衫', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac48007Nb30b2118.jpg', '衬衫', '衬衫分类');
INSERT INTO `pms_product_category` VALUES (13, 12, '家电子分类1', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES (14, 12, '家电子分类2', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES (19, 2, '手机通讯', 1, 0, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac48d27N3f5bb821.jpg', '手机通讯', '手机通讯');
INSERT INTO `pms_product_category` VALUES (29, 1, '男鞋', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (30, 2, '手机配件', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac48672N11cf61fe.jpg', '手机配件', '手机配件');
INSERT INTO `pms_product_category` VALUES (31, 2, '摄影摄像', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5a1679f2Nc2f659b6.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (32, 2, '影音娱乐', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5a167859N01d8198b.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (33, 2, '数码配件', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5a1676e9N1ba70a81.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (34, 2, '智能设备', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (35, 3, '电视', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f71eN25360979.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (36, 3, '空调', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f6f6Ndfe746aa.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (37, 3, '洗衣机', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f6eaN9ec936de.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (38, 3, '冰箱', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f6c5Ne56d7e26.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (39, 3, '厨卫大电', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f369N6a55ff3f.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (40, 3, '厨房小电', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (41, 3, '生活电器', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (42, 3, '个护健康', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (43, 4, '厨房卫浴', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb12cN5ab932bb.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (44, 4, '灯饰照明', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb115Na5705672.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (45, 4, '五金工具', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a28e743Nf6d99998.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (46, 4, '卧室家具', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb096N6326e0bd.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (47, 4, '客厅家具', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb080N38c2e7b7.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (48, 5, '全新整车', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/ebe31b9cc535e122.png', '', '');
INSERT INTO `pms_product_category` VALUES (49, 5, '车载电器', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1fb8d2N53bbd2ba.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (50, 5, '维修保养', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1fb8baNbe801af8.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (51, 5, '汽车装饰', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a28ae20N34461e66.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (52, 0, '电脑', 0, 0, '件', 1, 1, 1, '', '电脑', '电脑');
INSERT INTO `pms_product_category` VALUES (53, 52, '平板电脑', 1, 0, '件', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/pad_category_01.jpg', '平板电脑', '平板电脑');
INSERT INTO `pms_product_category` VALUES (54, 52, '笔记本', 1, 0, '件', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/computer_category_01.jpg', '笔记本', '笔记本');
INSERT INTO `pms_product_category` VALUES (55, 52, '硬盘', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/ssd_category_01.jpg', '硬盘', '');

-- ----------------------------
-- Table structure for pms_product_category_attribute_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
CREATE TABLE `pms_product_category_attribute_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  `product_attribute_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_category_attribute_relation
-- ----------------------------
INSERT INTO `pms_product_category_attribute_relation` VALUES (1, 24, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (5, 26, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (7, 28, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (9, 25, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (10, 25, 25);

-- ----------------------------
-- Table structure for pms_product_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_full_reduction`;
CREATE TABLE `pms_product_full_reduction`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `full_price` decimal(10, 2) NULL DEFAULT NULL,
  `reduce_price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品满减表(只针对同商品)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_full_reduction
-- ----------------------------
INSERT INTO `pms_product_full_reduction` VALUES (1, 7, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (2, 8, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (3, 9, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (4, 10, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (5, 11, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (6, 12, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (7, 13, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (8, 14, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (9, 18, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (10, 7, 200.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (11, 7, 300.00, 100.00);
INSERT INTO `pms_product_full_reduction` VALUES (14, 22, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (16, 24, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (34, 23, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (78, 36, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (79, 35, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (83, 30, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (84, 31, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (85, 32, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (87, 33, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (88, 34, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (93, 27, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (96, 28, 500.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (97, 28, 1000.00, 120.00);
INSERT INTO `pms_product_full_reduction` VALUES (104, 37, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (126, 38, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (127, 39, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (128, 41, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (129, 42, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (130, 43, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (131, 44, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (132, 45, 2000.00, 100.00);
INSERT INTO `pms_product_full_reduction` VALUES (133, 40, 2000.00, 200.00);
INSERT INTO `pms_product_full_reduction` VALUES (152, 46, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (153, 47, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (154, 48, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (155, 49, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (156, 50, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (157, 51, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (161, 52, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (163, 53, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (164, 54, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (165, 55, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (166, 56, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (167, 57, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (168, 58, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (169, 59, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (170, 60, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (171, 61, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (172, 62, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (173, 63, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (174, 64, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (175, 65, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (176, 66, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (177, 67, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (178, 68, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (179, 69, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (182, 70, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (183, 71, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (184, 72, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (185, 73, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (187, 75, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (188, 76, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (189, 77, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (190, 78, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (191, 79, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (192, 80, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (193, 81, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (194, 82, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (195, 29, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (196, 26, 3000.00, 300.00);
INSERT INTO `pms_product_full_reduction` VALUES (197, 26, 5000.00, 500.00);
INSERT INTO `pms_product_full_reduction` VALUES (198, 83, 0.00, 0.00);

-- ----------------------------
-- Table structure for pms_product_ladder
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_ladder`;
CREATE TABLE `pms_product_ladder`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL COMMENT '满足的商品数量',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折扣',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '折后价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 196 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品阶梯价格表(只针对同商品)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_ladder
-- ----------------------------
INSERT INTO `pms_product_ladder` VALUES (1, 7, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (2, 8, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (3, 9, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (4, 10, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (5, 11, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (6, 12, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (7, 13, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (8, 14, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (12, 18, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (14, 7, 4, 0.60, 0.00);
INSERT INTO `pms_product_ladder` VALUES (15, 7, 5, 0.50, 0.00);
INSERT INTO `pms_product_ladder` VALUES (18, 22, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (20, 24, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (38, 23, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (83, 36, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (84, 35, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (88, 30, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (89, 31, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (90, 32, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (92, 33, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (93, 34, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (99, 27, 2, 0.80, 0.00);
INSERT INTO `pms_product_ladder` VALUES (100, 27, 3, 0.75, 0.00);
INSERT INTO `pms_product_ladder` VALUES (103, 28, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (110, 37, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (133, 38, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (134, 39, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (135, 41, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (136, 42, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (137, 43, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (138, 44, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (139, 45, 1, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (140, 40, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (150, 46, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (151, 47, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (152, 48, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (153, 49, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (154, 50, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (155, 51, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (159, 52, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (161, 53, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (162, 54, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (163, 55, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (164, 56, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (165, 57, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (166, 58, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (167, 59, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (168, 60, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (169, 61, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (170, 62, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (171, 63, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (172, 64, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (173, 65, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (174, 66, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (175, 67, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (176, 68, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (177, 69, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (180, 70, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (181, 71, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (182, 72, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (183, 73, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (185, 75, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (186, 76, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (187, 77, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (188, 78, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (189, 79, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (190, 80, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (191, 81, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (192, 82, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (193, 29, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (194, 26, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (195, 83, 0, 0.00, 0.00);

-- ----------------------------
-- Table structure for pms_product_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_operate_log`;
CREATE TABLE `pms_product_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `price_old` decimal(10, 2) NULL DEFAULT NULL,
  `price_new` decimal(10, 2) NULL DEFAULT NULL,
  `sale_price_old` decimal(10, 2) NULL DEFAULT NULL,
  `sale_price_new` decimal(10, 2) NULL DEFAULT NULL,
  `gift_point_old` int(11) NULL DEFAULT NULL COMMENT '赠送的积分',
  `gift_point_new` int(11) NULL DEFAULT NULL,
  `use_point_limit_old` int(11) NULL DEFAULT NULL,
  `use_point_limit_new` int(11) NULL DEFAULT NULL,
  `operate_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_vertify_record
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_vertify_record`;
CREATE TABLE `pms_product_vertify_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `vertify_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `status` int(1) NULL DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品审核记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_vertify_record
-- ----------------------------
INSERT INTO `pms_product_vertify_record` VALUES (1, 1, '2018-04-27 16:36:41', 'test', 1, '验证通过');
INSERT INTO `pms_product_vertify_record` VALUES (2, 2, '2018-04-27 16:36:41', 'test', 1, '验证通过');

-- ----------------------------
-- Table structure for pms_repair
-- ----------------------------
DROP TABLE IF EXISTS `pms_repair`;
CREATE TABLE `pms_repair`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '会员ID',
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单ID',
  `order_item_id` bigint(20) NULL DEFAULT NULL COMMENT '订单商品ID',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品ID',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `brand_id` bigint(20) NULL DEFAULT NULL COMMENT '品牌ID',
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `repair_type` int(1) NULL DEFAULT NULL COMMENT '报修方式：0->邮寄到商家；1->线下到店',
  `repair_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '报修描述',
  `repair_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报修图片，以逗号隔开',
  `contact_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮寄地址（邮寄方式时使用）',
  `user_longitude` decimal(10, 7) NULL DEFAULT NULL COMMENT '用户经度（线下到店时使用）',
  `user_latitude` decimal(10, 7) NULL DEFAULT NULL COMMENT '用户纬度（线下到店时使用）',
  `user_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址（线下到店时使用）',
  `shop_longitude` decimal(10, 7) NULL DEFAULT NULL COMMENT '商家经度',
  `shop_latitude` decimal(10, 7) NULL DEFAULT NULL COMMENT '商家纬度',
  `shop_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家地址',
  `distance` decimal(10, 2) NULL DEFAULT NULL COMMENT '距离（米）',
  `walking_time` int(11) NULL DEFAULT NULL COMMENT '步行时间（分钟）',
  `cycling_time` int(11) NULL DEFAULT NULL COMMENT '骑车时间（分钟）',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态：0->待处理；1->已受理；2->维修中；3->已完成；4->已取消',
  `status_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态描述',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_id`(`member_id` ASC) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品报修表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_repair
-- ----------------------------
INSERT INTO `pms_repair` VALUES (1, 11, 'member', 1168, 696, 28, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', NULL, '小米', 1, '12', '', '周', '18136256911', NULL, NULL, NULL, '', 122.2802410, 43.6316180, '和平大道 58 号万达广场 1 层 1120 号', NULL, NULL, NULL, 3, '1', '2025-12-08 18:10:43', '2025-12-08 18:15:00');

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku编码',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT 0 COMMENT '库存',
  `low_stock` int(11) NULL DEFAULT NULL COMMENT '预警库存',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '展示图片',
  `sale` int(11) NULL DEFAULT NULL COMMENT '销量',
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单品促销价格',
  `lock_stock` int(11) NULL DEFAULT 0 COMMENT '锁定库存',
  `last_operate_time` datetime NULL DEFAULT NULL COMMENT '最后库存操作时间',
  `last_operate_type` tinyint(4) NULL DEFAULT NULL COMMENT '最后操作类型：1=锁定库存 2=释放库存 3=扣减真实库存',
  `last_operate_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后操作关联ID（订单ID/取消任务ID）',
  `sp_data` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性，json格式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 328 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sku的库存' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_sku_stock
-- ----------------------------
INSERT INTO `pms_sku_stock` VALUES (98, 27, '201808270027001', 2699.00, 85, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (99, 27, '201808270027002', 2999.00, 100, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (100, 27, '201808270027003', 2699.00, 100, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (101, 27, '201808270027004', 2999.00, 100, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (102, 28, '201808270028001', 649.00, 97, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (103, 28, '201808270028002', 699.00, 99, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (104, 28, '201808270028003', 649.00, 100, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (105, 28, '201808270028004', 699.00, 100, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (106, 29, '201808270029001', 5499.00, 98, NULL, NULL, NULL, 4999.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (107, 29, '201808270029002', 6299.00, 100, NULL, NULL, NULL, 5799.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (108, 29, '201808270029003', 5499.00, 100, NULL, NULL, NULL, 4999.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (109, 29, '201808270029004', 6299.00, 100, NULL, NULL, NULL, 5799.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (110, 26, '201806070026001', 3788.00, 481, NULL, NULL, NULL, 3699.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (111, 26, '201806070026002', 3999.00, 499, NULL, NULL, NULL, 3899.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (112, 26, '201806070026003', 3788.00, 500, NULL, NULL, NULL, 3699.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (113, 26, '201806070026004', 3999.00, 500, NULL, NULL, NULL, 3899.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (163, 36, '202002210036001', 100.00, 100, 25, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (164, 36, '202002210036002', 120.00, 98, 20, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (165, 36, '202002210036003', 100.00, 100, 20, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (166, 36, '202002210036004', 100.00, 100, 20, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (167, 36, '202002210036005', 100.00, 100, 20, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (168, 36, '202002210036006', 100.00, 100, 20, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (169, 36, '202002210036007', 100.00, 100, 20, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (170, 36, '202002210036008', 100.00, 100, 20, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (171, 35, '202002250035001', 200.00, 100, 50, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (172, 35, '202002250035002', 240.00, 100, 50, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (173, 35, '202002250035003', 200.00, 100, 50, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (174, 35, '202002250035004', 200.00, 100, 50, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (175, 35, '202002250035005', 200.00, 100, 50, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (176, 35, '202002250035006', 200.00, 100, 50, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (177, 35, '202002250035007', 200.00, 100, 50, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (178, 35, '202002250035008', 200.00, 100, 50, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (179, 30, '202004190030001', 88.00, 100, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (180, 30, '202004190030002', 88.00, 100, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"XL\"}]');
INSERT INTO `pms_sku_stock` VALUES (181, 30, '202004190030003', 88.00, 99, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"M\"}]');
INSERT INTO `pms_sku_stock` VALUES (182, 30, '202004190030004', 88.00, 100, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (183, 30, '202004190030005', 88.00, 99, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"XL\"}]');
INSERT INTO `pms_sku_stock` VALUES (184, 30, '202004190030006', 88.00, 100, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"M\"}]');
INSERT INTO `pms_sku_stock` VALUES (185, 31, '202004190031001', 88.00, 79, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"浅灰色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (186, 31, '202004190031002', 88.00, 80, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"浅灰色\"},{\"key\":\"尺寸\",\"value\":\"XL\"}]');
INSERT INTO `pms_sku_stock` VALUES (187, 31, '202004190031003', 88.00, 80, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"深灰色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (188, 31, '202004190031004', 88.00, 80, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"深灰色\"},{\"key\":\"尺寸\",\"value\":\"XL\"}]');
INSERT INTO `pms_sku_stock` VALUES (189, 32, '202004190032001', 99.00, 100, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (190, 32, '202004190032002', 99.00, 100, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"尺寸\",\"value\":\"M\"}]');
INSERT INTO `pms_sku_stock` VALUES (191, 32, '202004190032003', 99.00, 100, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (192, 32, '202004190032004', 99.00, 100, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"M\"}]');
INSERT INTO `pms_sku_stock` VALUES (193, 33, '202004190033001', 2499.00, 500, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"尺寸\",\"value\":\"50英寸\"},{\"key\":\"内存\",\"value\":\"8G\"}]');
INSERT INTO `pms_sku_stock` VALUES (194, 33, '202004190033002', 2499.00, 500, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"尺寸\",\"value\":\"50英寸\"},{\"key\":\"内存\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (195, 33, '202004190033003', 2499.00, 500, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"尺寸\",\"value\":\"65英寸\"},{\"key\":\"内存\",\"value\":\"8G\"}]');
INSERT INTO `pms_sku_stock` VALUES (196, 33, '202004190033004', 2499.00, 500, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"尺寸\",\"value\":\"65英寸\"},{\"key\":\"内存\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (197, 34, '202004190034001', 3999.00, 500, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"尺寸\",\"value\":\"65英寸\"},{\"key\":\"内存\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (198, 34, '202004190034002', 3999.00, 500, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"尺寸\",\"value\":\"65英寸\"},{\"key\":\"内存\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (199, 34, '202004190034003', 3999.00, 500, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"尺寸\",\"value\":\"70英寸\"},{\"key\":\"内存\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (200, 34, '202004190034004', 3999.00, 500, 10, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"尺寸\",\"value\":\"70英寸\"},{\"key\":\"内存\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (201, 37, '202210280037001', 5999.00, 194, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (202, 37, '202210280037002', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (203, 37, '202210280037003', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (204, 37, '202210280037004', 5999.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"星光色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (205, 37, '202210280037005', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"星光色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (206, 37, '202210280037006', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"星光色\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (207, 37, '202210280037007', 5999.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"紫色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (208, 37, '202210280037008', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"紫色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (209, 37, '202210280037009', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"紫色\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (210, 37, '202210280037010', 5999.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (211, 37, '202210280037011', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (212, 37, '202210280037012', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (213, 38, '202210280038001', 3599.00, 195, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (214, 38, '202210280038002', 4799.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (215, 38, '202210280038003', 3599.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_002.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (216, 38, '202210280038004', 4799.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_002.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (217, 39, '202210280039001', 5999.00, 497, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `pms_sku_stock` VALUES (218, 39, '202210280039002', 5599.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R5 16G 512\"}]');
INSERT INTO `pms_sku_stock` VALUES (219, 39, '202210280039003', 5499.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_002.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"新Redmi Pro 15英寸 3.2K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `pms_sku_stock` VALUES (220, 39, '202210280039004', 4999.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_002.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"新Redmi Pro 15英寸 3.2K屏\"},{\"key\":\"版本\",\"value\":\"R5 16G 512\"}]');
INSERT INTO `pms_sku_stock` VALUES (221, 40, '202211040040001', 2999.00, 90, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (222, 40, '202211040040002', 3499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (223, 40, '202211040040003', 2999.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_02.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (224, 40, '202211040040004', 3499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_02.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (225, 41, '202211040041001', 2099.00, 195, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (226, 41, '202211040041002', 2299.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (227, 41, '202211040041003', 2099.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_02.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"银迹\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (228, 41, '202211040041004', 2299.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_02.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"银迹\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (229, 42, '202211040042001', 4999.00, 94, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (230, 42, '202211040042002', 5499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (231, 42, '202211040042003', 4999.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_02.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"冰霜银\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (232, 42, '202211040042004', 5499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_02.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"冰霜银\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (233, 43, '202211040043001', 1649.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_13L_01.png', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"系列\",\"value\":\"JSQ25-565W13【13升】【恒温旗舰款】\"}]');
INSERT INTO `pms_sku_stock` VALUES (234, 43, '202211040043002', 1799.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_13L_01.png', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"系列\",\"value\":\"JSQ30-565W16【16升】【恒温旗舰款】\"}]');
INSERT INTO `pms_sku_stock` VALUES (235, 44, '202211080044001', 369.00, 95, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `pms_sku_stock` VALUES (236, 44, '202211080044002', 649.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"1TB\"}]');
INSERT INTO `pms_sku_stock` VALUES (237, 44, '202211080044003', 549.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_01.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"980 PRO｜NVMe PCIe 4.0\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `pms_sku_stock` VALUES (238, 44, '202211080044004', 899.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_01.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"980 PRO｜NVMe PCIe 4.0\"},{\"key\":\"版本\",\"value\":\"1TB\"}]');
INSERT INTO `pms_sku_stock` VALUES (239, 45, '202211080045001', 2299.00, 248, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (240, 45, '202211080045002', 2499.00, 250, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (241, 45, '202211080045003', 2299.00, 250, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_02.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"晴空蓝\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (242, 45, '202211080045004', 2499.00, 250, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_02.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"晴空蓝\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (243, 52, '123123123', 3900.00, 99, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/17e673e5ebb24925a5bbf32343c092a3.png', NULL, 3700.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"流白金\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (244, 52, '123132123', 4200.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/17e673e5ebb24925a5bbf32343c092a3.png', NULL, 4000.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"流白金\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (245, 52, '112132123', 4900.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/17e673e5ebb24925a5bbf32343c092a3.png', NULL, 4700.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"流白金\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (246, 52, '112132123', 4200.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/92df32c96b9c4cb2a02e83b1c3cdc06a.png', NULL, 3700.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (247, 52, '176132123', 3999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/92df32c96b9c4cb2a02e83b1c3cdc06a.png', NULL, 4000.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (248, 52, '112542123', 4900.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/92df32c96b9c4cb2a02e83b1c3cdc06a.png', NULL, 4700.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (249, 52, '112746123', 3900.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/edc5cdb4ae424341b2228328c574ebe3.png', NULL, 3700.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"丹宁色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (250, 52, '110932123', 4200.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/edc5cdb4ae424341b2228328c574ebe3.png', NULL, 4000.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"丹宁色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (251, 52, '128732123', 4900.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/edc5cdb4ae424341b2228328c574ebe3.png', NULL, 4700.00, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"丹宁色\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (252, 53, '73849293', 4999.00, 99, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/7f284bd2e3044191b837a6141139184f.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"冷艳紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (253, 53, '27362739', 5599.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/7f284bd2e3044191b837a6141139184f.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"冷艳紫\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (254, 53, '37482938', 4999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/e77fcba5e76345c99e29ccbb012261d9.webp', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"森野绿\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (255, 53, '83671982', 5599.00, 99, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/e77fcba5e76345c99e29ccbb012261d9.webp', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"森野绿\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (256, 54, '325234543', 2399.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/62db3a5e58634001b166c514750c6162.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"冰锋蓝\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (257, 54, '243325435', 2799.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/62db3a5e58634001b166c514750c6162.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"冰锋蓝\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (258, 54, '785687232', 2399.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/80290e0d3251481c84a0339e65469d82.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"月岩白\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (259, 54, '324575743', 2799.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/80290e0d3251481c84a0339e65469d82.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"月岩白\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (260, 54, '765334546', 2399.00, 99, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/9bbc53d8759344c1be8044f544e394c9.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"白岩灰\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (261, 54, '345787923', 2799.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/9bbc53d8759344c1be8044f544e394c9.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"白岩灰\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (262, 55, '356779865', 1500.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/1f2782ee8eec4bf1b1df350a50100635.png', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"暗隐黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (263, 55, '567897654', 1700.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/1f2782ee8eec4bf1b1df350a50100635.png', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"暗隐黑\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (264, 55, '354678923', 1500.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/c176e5b9811c482b9659bcb269bf575b.png', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"祥云白\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (265, 55, '343278976', 1700.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/c176e5b9811c482b9659bcb269bf575b.png', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"祥云白\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (266, 56, '35464353', 2099.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/1ef50b97a3cd4f6a97a499b72d72b818.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"玄夜黑\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (267, 56, '43356723', 2399.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/1ef50b97a3cd4f6a97a499b72d72b818.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"玄夜黑\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (268, 56, '54676542', 2099.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/b7e9ea6aaacf4f41a6f72905613925ff.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"雪岩白\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (269, 56, '43567623', 2399.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/b7e9ea6aaacf4f41a6f72905613925ff.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"雪岩白\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (270, 57, '398755434', 11399.00, 94, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/c499ac971f1341618afeb58283f19fb5.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"星宇橙色\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (271, 57, '354675643', 11399.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/d62c6125308f4a6aa2bb1f586451e41c.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"深夜蓝\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (272, 58, '89875644', 7288.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/70f0d9c2037e46e98570929cd74110e4.png', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"原色钛金属\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (273, 58, '23647565', 7388.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/70f0d9c2037e46e98570929cd74110e4.png', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"原色钛金属\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (274, 58, '45675542', 7288.00, 0, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/2f1fd4801f4f44f5bed26b80a84b27d1.png', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"白色钛金属\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (275, 58, '35462532', 7388.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/2f1fd4801f4f44f5bed26b80a84b27d1.png', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"白色钛金属\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (276, 59, '54634523', 4088.00, 99, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/48a0ebbb5ce64385a2b42cd3a840273d.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\" 粉色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (277, 59, '342453456', 4088.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/c55ebf7c7edb438d853370624dd882bb.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"绿色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (278, 60, '202512010060001', 2750.00, 0, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/39ae529246d4434ebd6488c436f23f8e.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (279, 60, '202512010060002', 3050.00, 0, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/39ae529246d4434ebd6488c436f23f8e.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (280, 60, '202512010060003', 2750.00, 0, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/3ed6060aab534ff39f5f271d8e556037.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"星光色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (281, 60, '202512010060004', 3050.00, 0, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/3ed6060aab534ff39f5f271d8e556037.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"星光色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (282, 61, '202512010061001', NULL, 0, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/41f2533c7de347eb9292301378f41124.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (283, 62, '73484122', 4527.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/3fe9b41a70c54befb12045672b1c926d.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"秘矿紫\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (284, 62, '43734839', 6999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/3fe9b41a70c54befb12045672b1c926d.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"秘矿紫\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (285, 62, '34783830', 4527.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/7da9fae487ef405786e0035e8cf93148.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"浅珀黄\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (286, 62, '32478324', 6999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/7da9fae487ef405786e0035e8cf93148.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"浅珀黄\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (287, 63, '5463454', 6999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/f613a80ce9034bf5ae6e51b03458e689.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"暗影蓝\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (288, 63, '2354235', 7999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/f613a80ce9034bf5ae6e51b03458e689.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"暗影蓝\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (289, 63, '2342353', 6999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/69ee530d3ad94e8b8dc45130ba399e86.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"秘影黑\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (290, 63, '2343243', 7999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/69ee530d3ad94e8b8dc45130ba399e86.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"秘影黑\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (291, 64, '43252354', 4490.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/facfb321a9c3431f86dc173f0b7b8957.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"钛灰\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (292, 64, '32423543', 4700.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/facfb321a9c3431f86dc173f0b7b8957.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"钛灰\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (293, 64, '32534253', 4490.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/16ac9ee10a674822be3bd51ad12cd73b.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\" 钛羽黄\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (294, 64, '34324532', 4700.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/16ac9ee10a674822be3bd51ad12cd73b.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\" 钛羽黄\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (295, 65, '21321323', 2800.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/bd26113c0aa24d46874775c9f7a39df9.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"雅柔灰\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (296, 66, '131234', 7999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/3ac34a109ad54d43b9820390c67407cf.png', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"飞天青\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (297, 66, '242134', 7999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/5e8a31b15d2d4e9bb8a0f5e1865a46e5.png', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"墨韵黑\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (298, 67, '123412', 6999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/1aee5b0c27c54fe68118abe1b8f52730.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"羽砂黑\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (299, 67, '231242', 6999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/42a50fb1ba434f04beebf2f45387022e.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"雪域白\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (300, 68, '1892392', 9999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/65c8cdb201d64a40b29da9dfe3895f60.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"羽砂白\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (301, 69, '2342345', 1499.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/ece12ffc0a604b7095dc4493d96d8f18.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"月影白\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (302, 69, '2412343', 1699.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/ece12ffc0a604b7095dc4493d96d8f18.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"月影白\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (303, 69, '4324234', 1499.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/4c920495e7844323975cd0aed97cd0d1.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"典雅黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (304, 69, '1234732', 1699.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/4c920495e7844323975cd0aed97cd0d1.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"典雅黑\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (305, 70, '324324688', 5299.00, 30, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/37763b93ffaf429f926c53c1cf52145d.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"追光红\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (306, 70, '324324685', 5699.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/37763b93ffaf429f926c53c1cf52145d.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"追光红\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (307, 70, '324324684', 5299.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/79ca6124e8974432846a4c796f1513e0.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"绒砂钛\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (308, 70, '324324683', 5699.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/79ca6124e8974432846a4c796f1513e0.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"绒砂钛\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (309, 71, '5432534', 8499.00, 99, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/33a7fad38fc24aa1a4c0d6084af329a5.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"缎黑\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (310, 71, '2345243', 10999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/33a7fad38fc24aa1a4c0d6084af329a5.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"缎黑\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (311, 71, '5223454', 8499.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/765f3f51e4444d749d0c68b664e5298e.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"玉白\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (312, 71, '2347784', 10999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/765f3f51e4444d749d0c68b664e5298e.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"玉白\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (313, 71, '2315856', 8499.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/a41b82f3b8124b3989b49a8af61886f8.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"暮紫\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (314, 71, '2475677', 10999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/a41b82f3b8124b3989b49a8af61886f8.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"暮紫\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (315, 72, '54363453', 3419.00, 99, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/2c2d910f53814eee8fc6178d84b67019.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"版本\",\"value\":\"I5 16G 512\"}]');
INSERT INTO `pms_sku_stock` VALUES (316, 73, '31232343', 9999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/6219507e72dd4e5b82ca41a8dcf5e972.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"雪域白\"},{\"key\":\"版本\",\"value\":\"套餐一\"}]');
INSERT INTO `pms_sku_stock` VALUES (318, 75, '202512010075001', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"日蚀灰+16英寸+2560x1600像素+165Hz+NVIDIA GeForce RTX 5060+AMD 锐龙 9 9955HX\"},{\"key\":\"版本\",\"value\":\"套餐一\"}]');
INSERT INTO `pms_sku_stock` VALUES (319, 75, '212312154', 8799.00, 99, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"日蚀灰\"},{\"key\":\"版本\",\"value\":\"套餐一\"}]');
INSERT INTO `pms_sku_stock` VALUES (320, 76, '897698089', 4799.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/caef7b8516a7457abf8489a091cc0763.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"香草罗勒\"},{\"key\":\"版本\",\"value\":\"套餐一\"}]');
INSERT INTO `pms_sku_stock` VALUES (321, 77, '5078964', 7899.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/c976d31e53a44283bdd2d10d5cfdf78f.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"玄影版\"},{\"key\":\"版本\",\"value\":\"套餐一\"}]');
INSERT INTO `pms_sku_stock` VALUES (322, 78, '38439451', 8799.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/9e1f5d560a614b61a492028d331a0af5.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"U7-155H\"},{\"key\":\"版本\",\"value\":\"套餐一\"}]');
INSERT INTO `pms_sku_stock` VALUES (323, 79, '343242300', 2799.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/445ef1f7ed7d47e89c64886d2e6aff55.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"铂金银\"},{\"key\":\"版本\",\"value\":\"套餐一\"}]');
INSERT INTO `pms_sku_stock` VALUES (324, 80, '32432409', 4099.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/f32076850cbc43cca91e3b91ccd4baa0.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"灵越7000|爆款推荐\"},{\"key\":\"版本\",\"value\":\"套餐一\"}]');
INSERT INTO `pms_sku_stock` VALUES (325, 81, '1267853', 8999.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/c416eed0bcb84995b2acdf1a1c267ce4.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"碳晶黑\"},{\"key\":\"版本\",\"value\":\"套餐一\"}]');
INSERT INTO `pms_sku_stock` VALUES (326, 82, '4356677', 9449.00, 100, NULL, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/c440bc294b6f456081bc461c00a18b05.jpg', NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"碳晶黑\"},{\"key\":\"版本\",\"value\":\"套餐一\"}]');
INSERT INTO `pms_sku_stock` VALUES (327, 83, '1212', 1212.00, 1212, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"key\":\"颜色\",\"value\":\"红色\"}]');

-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(1) NULL DEFAULT NULL COMMENT '优惠券类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform` int(1) NULL DEFAULT NULL COMMENT '使用平台：0->全部；1->移动；2->PC',
  `count` int(11) NULL DEFAULT NULL COMMENT '数量',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `per_limit` int(11) NULL DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '使用门槛；0表示无门槛',
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `use_type` int(1) NULL DEFAULT NULL COMMENT '使用类型：0->全场通用；1->指定分类；2->指定商品',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `publish_count` int(11) NULL DEFAULT NULL COMMENT '发行数量',
  `use_count` int(11) NULL DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int(11) NULL DEFAULT NULL COMMENT '领取数量',
  `enable_time` datetime NULL DEFAULT NULL COMMENT '可以领取的日期',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠码',
  `member_level` int(1) NULL DEFAULT NULL COMMENT '可领取的会员类型：0->无限时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------
INSERT INTO `sms_coupon` VALUES (27, 0, '全品类通用券', 0, 83, 100000.00, 10, 1.00, '2025-12-03 00:00:00', '2025-12-05 00:00:00', 0, NULL, 100, 0, 17, '2025-12-01 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (28, 0, '手机分类专用券', 0, 995, 100.00, 5, 1000.00, '2022-11-08 00:00:00', '2023-11-30 00:00:00', 1, NULL, 1000, 0, 5, '2022-11-08 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (29, 0, '苹果手机专用券', 0, 998, 600.00, 1, 4000.00, '2022-11-08 00:00:00', '2023-11-30 00:00:00', 2, NULL, 1000, 0, 2, '2022-11-08 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (30, 0, '小米手机专用券', 0, 998, 200.00, 1, 2000.00, '2022-11-08 00:00:00', '2023-11-30 00:00:00', 2, NULL, 1000, 0, 2, '2022-11-08 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (31, 0, '限时优惠券', 0, 999, 20.00, 5, 500.00, '2022-12-01 00:00:00', '2022-12-22 00:00:00', 0, NULL, 1000, 0, 1, '2022-12-23 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (32, 0, '209专用', 0, 0, 50000.00, 1, 0.00, '2025-12-01 00:00:00', '2025-12-02 00:00:00', 2, NULL, 1, 0, 1, '2025-12-01 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (33, 2, '11', 0, 0, 10000.00, 1, 0.00, '2025-12-03 00:00:00', '2025-12-16 00:00:00', 2, NULL, 1, 0, 1, '2025-12-03 00:00:00', NULL, NULL);

-- ----------------------------
-- Table structure for sms_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_history`;
CREATE TABLE `sms_coupon_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `coupon_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '领取人昵称',
  `get_type` int(1) NULL DEFAULT NULL COMMENT '获取类型：0->后台赠送；1->主动获取',
  `create_time` datetime NULL DEFAULT NULL,
  `use_status` int(1) NULL DEFAULT NULL COMMENT '使用状态：0->未使用；1->已使用；2->已过期',
  `use_time` datetime NULL DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单编号',
  `order_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_id`(`member_id` ASC) USING BTREE,
  INDEX `idx_coupon_id`(`coupon_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券使用、领取历史表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_coupon_history
-- ----------------------------
INSERT INTO `sms_coupon_history` VALUES (37, 30, 1, '7806895974110001', 'windir', 1, '2022-11-09 15:14:29', 1, '2022-11-09 15:14:58', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (38, 27, 1, '7872472849240001', 'windir', 1, '2022-11-09 15:25:25', 1, '2022-11-09 15:25:38', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (39, 29, 1, '7876204111480001', 'windir', 1, '2022-11-09 15:26:02', 1, '2022-11-09 15:26:11', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (40, 27, 1, '7911945030190001', 'windir', 1, '2022-11-09 15:31:59', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (41, 28, 1, '8194868687790001', 'windir', 1, '2022-11-09 16:19:09', 1, '2022-11-11 16:12:42', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (42, 28, 1, '1239565720390001', 'test', 1, '2022-12-21 16:46:36', 1, '2022-12-21 16:53:07', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (43, 31, 1, '6030247208280001', 'test', 1, '2022-12-23 09:51:42', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (44, 28, 1, '6050939443480001', 'test', 1, '2022-12-23 09:55:09', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (45, 27, 1, '4182437014580001', 'test', 1, '2023-01-10 17:10:24', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (46, 27, 11, '9011281751500011', 'member', 1, '2023-05-11 15:28:33', 0, '2025-12-03 11:05:22', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (47, 28, 11, '9011495851370011', 'member', 1, '2023-05-11 15:28:35', 1, '2023-05-11 15:37:16', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (48, 30, 11, '9011677197430011', 'member', 1, '2023-05-11 15:28:37', 1, '2023-05-11 15:28:56', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (49, 27, 11, '9046676666610011', 'member', 1, '2023-05-11 15:34:27', 1, '2025-12-03 10:32:36', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (50, 28, 11, '9046909751910011', 'member', 1, '2023-05-11 15:34:29', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (51, 29, 11, '9047077722990011', 'member', 1, '2023-05-11 15:34:31', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (52, 27, 11, '9075818288630011', 'member', 1, '2023-05-11 15:39:18', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (53, 27, 12, '9012388619150012', NULL, 1, '2025-12-01 19:55:24', 1, '2025-12-01 19:56:27', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (54, 32, 12, '9040883461830012', NULL, 1, '2025-12-01 20:00:09', 1, '2025-12-01 20:00:17', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (55, 33, 13, '2073289886600013', NULL, 1, '2025-12-03 08:12:13', 1, '2025-12-03 08:12:26', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (56, 27, 13, '2099781289750013', NULL, 1, '2025-12-03 08:16:38', 1, '2025-12-03 08:17:08', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (57, 27, 13, '2262504075220013', NULL, 1, '2025-12-03 08:43:45', 1, '2025-12-03 08:44:12', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (58, 27, 13, '2263681404750013', NULL, 1, '2025-12-03 08:43:57', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (59, 27, 11, '2318721755160011', 'member', 1, '2025-12-03 08:53:07', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (60, 27, 11, '2323952843110011', 'member', 1, '2025-12-03 08:54:00', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (61, 27, 11, '2327164291880011', 'member', 1, '2025-12-03 08:54:32', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (62, 27, 11, '2327434241670011', 'member', 1, '2025-12-03 08:54:34', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (63, 27, 11, '2327616014200011', 'member', 1, '2025-12-03 08:54:36', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (64, 27, 11, '2327766214640011', 'member', 1, '2025-12-03 08:54:38', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (65, 27, 11, '2327921842580011', 'member', 1, '2025-12-03 08:54:39', 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sms_coupon_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_category_relation`;
CREATE TABLE `sms_coupon_product_category_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  `product_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品分类名称',
  `parent_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券和产品分类关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_coupon_product_category_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_category_relation` VALUES (11, 28, 19, '手机通讯', '手机数码');

-- ----------------------------
-- Table structure for sms_coupon_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_relation`;
CREATE TABLE `sms_coupon_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券和产品的关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_coupon_product_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_relation` VALUES (18, 29, 37, 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '100038005189');
INSERT INTO `sms_coupon_product_relation` VALUES (19, 29, 29, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '7437799');
INSERT INTO `sms_coupon_product_relation` VALUES (21, 30, 41, 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量 墨羽 12GB+256GB 5G智能手机 小米 红米', '100035246702');
INSERT INTO `sms_coupon_product_relation` VALUES (22, 30, 40, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '100027789721');
INSERT INTO `sms_coupon_product_relation` VALUES (23, 27, 72, '华硕无畏 14 AI 旗舰版', '3458434');
INSERT INTO `sms_coupon_product_relation` VALUES (24, 32, 57, 'iPhone 17 Pro Max ', '45678765');
INSERT INTO `sms_coupon_product_relation` VALUES (25, 33, 57, 'iPhone 17 Pro Max ', '45678765');

-- ----------------------------
-- Table structure for sms_flash_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion`;
CREATE TABLE `sms_flash_promotion`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '秒杀时间段名称',
  `start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `status` int(1) NULL DEFAULT NULL COMMENT '上下线状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_flash_promotion
-- ----------------------------
INSERT INTO `sms_flash_promotion` VALUES (14, '数码囤货季・半价开抢', '2025-12-01', '2025-12-31', 1, '2022-11-09 14:56:48');

-- ----------------------------
-- Table structure for sms_flash_promotion_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_log`;
CREATE TABLE `sms_flash_promotion_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `member_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subscribe_time` datetime NULL DEFAULT NULL COMMENT '会员订阅时间',
  `send_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购通知记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_flash_promotion_log
-- ----------------------------

-- ----------------------------
-- Table structure for sms_flash_promotion_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;
CREATE TABLE `sms_flash_promotion_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flash_promotion_id` bigint(20) NULL DEFAULT NULL,
  `flash_promotion_session_id` bigint(20) NULL DEFAULT NULL COMMENT '编号',
  `product_id` bigint(20) NULL DEFAULT NULL,
  `flash_promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '限时购价格',
  `flash_promotion_count` int(11) NULL DEFAULT NULL COMMENT '限时购数量',
  `flash_promotion_limit` int(11) NULL DEFAULT NULL COMMENT '每人限购数量',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品限时购与商品关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_flash_promotion_product_relation
-- ----------------------------
INSERT INTO `sms_flash_promotion_product_relation` VALUES (1, 2, 1, 26, 3000.00, 10, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (2, 2, 1, 27, 2000.00, 10, 1, 20);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (3, 2, 1, 28, 599.00, 19, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (4, 2, 1, 29, 4999.00, 10, 1, 100);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (9, 2, 2, 26, 2999.00, 100, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (10, 2, 2, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (11, 2, 2, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (12, 2, 2, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (13, 2, 2, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (14, 2, 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (15, 2, 3, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (16, 2, 4, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (17, 2, 4, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (18, 2, 5, 36, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (19, 2, 6, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (20, 2, 6, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (21, 14, 1, 26, 1.00, 100, 100, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (22, 14, 1, 27, 1.00, 100, 100, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (23, 14, 1, 28, 1.00, 100, 100, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (24, 14, 1, 29, 1.00, 100, 100, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (29, 14, 3, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (30, 14, 3, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (31, 14, 3, 36, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (32, 14, 3, 37, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (33, 14, 4, 37, 5699.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (34, 14, 4, 38, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (35, 14, 4, 39, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (36, 14, 4, 40, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (37, 14, 5, 41, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (38, 14, 5, 42, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (39, 14, 5, 43, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (40, 14, 5, 44, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (41, 14, 5, 45, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (42, 14, 6, 26, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (43, 14, 6, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (44, 14, 6, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (45, 14, 6, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (46, 14, 6, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (52, 14, 2, 57, 0.00, 1, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (53, 14, 2, 58, 0.00, 1, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (54, 14, 2, 59, 0.00, 1, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (55, 14, 7, 66, 0.00, 1, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (56, 14, 7, 67, 0.00, 1, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (57, 14, 7, 68, 0.00, 1, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (58, 14, 7, 69, 0.00, 1, 1, NULL);

-- ----------------------------
-- Table structure for sms_flash_promotion_session
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_session`;
CREATE TABLE `sms_flash_promotion_session`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场次名称',
  `start_time` time NULL DEFAULT NULL COMMENT '每日开始时间',
  `end_time` time NULL DEFAULT NULL COMMENT '每日结束时间',
  `status` int(1) NULL DEFAULT NULL COMMENT '启用状态：0->不启用；1->启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购场次表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_flash_promotion_session
-- ----------------------------
INSERT INTO `sms_flash_promotion_session` VALUES (1, '8:00', '08:00:00', '10:00:00', 1, '2018-11-16 13:22:17');
INSERT INTO `sms_flash_promotion_session` VALUES (2, '10:00', '10:00:00', '12:00:00', 1, '2018-11-16 13:22:34');
INSERT INTO `sms_flash_promotion_session` VALUES (3, '12:00', '12:00:00', '14:00:00', 1, '2018-11-16 13:22:37');
INSERT INTO `sms_flash_promotion_session` VALUES (4, '14:00', '14:00:00', '16:00:00', 1, '2018-11-16 13:22:41');
INSERT INTO `sms_flash_promotion_session` VALUES (5, '16:00', '16:00:00', '18:00:00', 1, '2018-11-16 13:22:45');
INSERT INTO `sms_flash_promotion_session` VALUES (6, '18:00', '18:00:00', '20:00:00', 1, '2018-11-16 13:21:34');
INSERT INTO `sms_flash_promotion_session` VALUES (7, '20:00', '20:00:00', '22:00:00', 1, '2018-11-16 13:22:55');

-- ----------------------------
-- Table structure for sms_home_advertise
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_advertise`;
CREATE TABLE `sms_home_advertise`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL COMMENT '轮播位置：0->PC首页轮播；1->app首页轮播',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL COMMENT '上下线状态：0->下线；1->上线',
  `click_count` int(11) NULL DEFAULT NULL COMMENT '点击数',
  `order_count` int(11) NULL DEFAULT NULL COMMENT '下单数',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页轮播广告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_home_advertise
-- ----------------------------
INSERT INTO `sms_home_advertise` VALUES (12, '小米推荐广告', 1, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/84f044ee93394b06b6fbc6237913a013.jpg', '2022-11-30 17:04:03', '2025-12-19 17:04:05', 1, 0, 0, '/pages/brand/brandDetail?id=6', NULL, 0);
INSERT INTO `sms_home_advertise` VALUES (13, '华为推荐广告', 1, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/46c1098ed2e0462abef921de2b77ef38.jpg', '2025-11-08 17:10:27', '2025-12-18 17:10:28', 1, 0, 0, '/pages/brand/brandDetail?id=3', NULL, 0);
INSERT INTO `sms_home_advertise` VALUES (14, '苹果推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/apple_banner_01.png', '2022-11-08 17:12:54', '2023-11-08 17:12:55', 1, 0, 0, '/pages/brand/brandDetail?id=51', NULL, 0);
INSERT INTO `sms_home_advertise` VALUES (16, 'OPPO推荐广告', 1, 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/851e81a90f2a4cbca1fec7163241535e.png', '2022-11-08 17:20:10', '2023-11-08 17:20:11', 1, 0, 0, '/pages/brand/brandDetail?id=21', NULL, 0);

-- ----------------------------
-- Table structure for sms_home_brand
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_brand`;
CREATE TABLE `sms_home_brand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) NULL DEFAULT NULL,
  `brand_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(1) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页推荐品牌表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_home_brand
-- ----------------------------
INSERT INTO `sms_home_brand` VALUES (6, 6, '小米', 1, 300);
INSERT INTO `sms_home_brand` VALUES (33, 51, '苹果', 1, 199);
INSERT INTO `sms_home_brand` VALUES (34, 2, '三星', 1, 195);
INSERT INTO `sms_home_brand` VALUES (35, 3, '华为', 1, 200);
INSERT INTO `sms_home_brand` VALUES (39, 21, 'OPPO', 1, 197);
INSERT INTO `sms_home_brand` VALUES (48, 61, 'ASUS', 1, 0);
INSERT INTO `sms_home_brand` VALUES (49, 62, '惠普', 1, 0);
INSERT INTO `sms_home_brand` VALUES (52, 63, '戴尔', 1, 0);
INSERT INTO `sms_home_brand` VALUES (53, 64, '联想', 1, 0);

-- ----------------------------
-- Table structure for sms_home_new_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_new_product`;
CREATE TABLE `sms_home_new_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(1) NULL DEFAULT NULL,
  `sort` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新鲜好物表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_home_new_product
-- ----------------------------
INSERT INTO `sms_home_new_product` VALUES (28, 53, '小米 17 Pro Max', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (29, 39, '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (30, 57, 'iPhone 17 Pro Max ', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (31, 63, 'Galaxy Z Flip7', 1, 0);

-- ----------------------------
-- Table structure for sms_home_recommend_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_product`;
CREATE TABLE `sms_home_recommend_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(1) NULL DEFAULT NULL,
  `sort` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人气推荐商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_home_recommend_product
-- ----------------------------
INSERT INTO `sms_home_recommend_product` VALUES (15, 82, '联想拯救者R9000P', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (16, 69, 'HUAWEI/华为Mate60', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (17, 57, 'iPhone 17 Pro Max ', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (18, 45, 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄', 1, 0);

-- ----------------------------
-- Table structure for sms_home_recommend_subject
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_subject`;
CREATE TABLE `sms_home_recommend_subject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  `subject_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(1) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页推荐专题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_home_recommend_subject
-- ----------------------------
INSERT INTO `sms_home_recommend_subject` VALUES (14, 1, 'polo衬衫的也时尚', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (15, 2, '大牌手机低价秒', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (16, 3, '晓龙845新品上市', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (19, 6, '品牌手机降价', 1, 0);

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `status` int(1) NULL DEFAULT 1 COMMENT '帐号启用状态：0->禁用；1->启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES (1, 'test', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 'test@qq.com', '测试账号', NULL, '2018-09-29 13:55:30', '2018-09-29 13:55:39', 1);
INSERT INTO `ums_admin` VALUES (3, 'admin', '$2a$10$.E1FokumK5GIXWgKlg.Hc.i/0/2.qdAwYFL1zc5QHdyzpXOr38RZO', 'https://zjk629.oss-cn-hangzhou.aliyuncs.com/images/8c0a1453a313f351f2d913a18f6ab452_10519_180_205.png', 'admin@163.com', '系统管理员', '系统管理员', '2018-10-08 13:32:47', '2019-04-20 12:45:16', 1);
INSERT INTO `ums_admin` VALUES (4, 'macro', '$2a$10$Bx4jZPR7GhEpIQfefDQtVeS58GfT5n6mxs/b4nLLK65eMFa16topa', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_01.png', 'macro@qq.com', 'macro', 'macro专用', '2019-10-06 15:53:51', '2020-02-03 14:55:55', 1);
INSERT INTO `ums_admin` VALUES (6, 'productAdmin', '$2a$10$6/.J.p.6Bhn7ic4GfoB5D.pGd7xSiD1a9M6ht6yO0fxzlKJPjRAGm', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_03.png', 'product@qq.com', '商品管理员', '只有商品权限', '2020-02-07 16:15:08', NULL, 1);
INSERT INTO `ums_admin` VALUES (7, 'orderAdmin', '$2a$10$UqEhA9UZXjHHA3B.L9wNG.6aerrBjC6WHTtbv1FdvYPUI.7lkL6E.', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_04.png', 'order@qq.com', '订单管理员', '只有订单管理权限', '2020-02-07 16:15:50', NULL, 1);
INSERT INTO `ums_admin` VALUES (8, 'test123', '$2a$10$M1qJguEzwoAN0la7PB8UO.HOGe1xZGku7xw1iTaUUpY0ZVRCxrxoO', 'string', 'abc@qq.com', 'string', 'string', '2022-08-07 14:45:42', NULL, 1);
INSERT INTO `ums_admin` VALUES (9, 'test256', '$2a$10$kTMBrt8mkXcO8T4eHThFWOf3KuNK6tqevkiAf4YbtXtaCJ6ocYkJa', 'string', 'abc@qq.com', 'string', 'string', '2022-08-07 14:52:57', NULL, 1);
INSERT INTO `ums_admin` VALUES (10, 'test1267', '$2a$10$VUywDhXVPY13YZxMD/uPWeDqkzSozN7o8u/3MX6sBig2NK2VaTJZ2', NULL, 'test1267@qq.com', 'test1267', 'test1267', '2023-01-04 16:13:34', NULL, 1);

-- ----------------------------
-- Table structure for ums_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE `ums_admin_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_agent` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器登录类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 444 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户登录日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_admin_login_log
-- ----------------------------
INSERT INTO `ums_admin_login_log` VALUES (1, 3, '2018-12-23 14:27:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (2, 3, '2019-04-07 16:04:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (3, 3, '2019-04-08 21:47:52', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (4, 3, '2019-04-08 21:48:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (5, 3, '2019-04-18 22:18:40', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (6, 3, '2019-04-20 12:45:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (7, 3, '2019-05-19 14:52:12', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (8, 3, '2019-05-25 15:00:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (9, 3, '2019-06-19 20:11:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (10, 3, '2019-06-30 10:33:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (11, 3, '2019-06-30 10:34:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (12, 3, '2019-06-30 10:35:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (13, 3, '2019-07-27 17:11:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (14, 3, '2019-07-27 17:13:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (15, 3, '2019-07-27 17:15:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (16, 3, '2019-07-27 17:17:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (17, 3, '2019-07-27 17:18:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (18, 3, '2019-07-27 21:21:52', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (19, 3, '2019-07-27 21:34:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (20, 3, '2019-07-27 21:35:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (21, 3, '2019-07-27 21:35:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (22, 3, '2019-07-27 21:40:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (23, 3, '2019-08-18 16:00:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (24, 3, '2019-08-18 16:01:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (25, 3, '2019-08-18 16:47:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (26, 3, '2019-10-06 15:54:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (27, 3, '2019-10-06 16:03:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (28, 3, '2019-10-06 16:04:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (29, 3, '2019-10-06 16:06:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (30, 3, '2019-10-06 16:14:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (31, 1, '2019-10-06 16:15:09', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (32, 1, '2019-10-06 16:16:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (33, 3, '2019-10-06 16:16:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (34, 3, '2019-10-06 16:16:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (35, 3, '2019-10-07 15:20:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (36, 3, '2019-10-07 15:40:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (37, 3, '2019-10-07 16:34:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (38, 3, '2019-10-09 21:19:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (39, 4, '2019-10-09 21:30:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (40, 4, '2019-10-09 21:31:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (41, 4, '2019-10-09 21:32:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (42, 4, '2019-10-09 21:33:27', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (43, 4, '2019-10-09 21:33:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (44, 3, '2019-10-20 16:02:53', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (45, 3, '2019-10-23 21:20:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (46, 3, '2019-10-27 21:41:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (47, 3, '2019-11-09 16:44:57', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (48, 3, '2019-11-09 16:46:56', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (49, 3, '2019-11-09 16:49:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (50, 3, '2019-11-23 14:17:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (51, 6, '2019-11-23 14:52:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (52, 3, '2019-11-23 15:07:24', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (53, 3, '2019-11-30 21:25:30', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (54, 3, '2019-11-30 21:27:54', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (55, 3, '2019-12-28 15:23:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (56, 3, '2020-01-01 15:21:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (57, 3, '2020-01-04 16:00:54', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (58, 3, '2020-02-01 15:05:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (59, 3, '2020-02-01 15:36:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (60, 3, '2020-02-01 15:36:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (61, 3, '2020-02-01 15:37:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (62, 3, '2020-02-01 15:37:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (63, 3, '2020-02-01 15:38:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (64, 3, '2020-02-01 15:38:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (65, 3, '2020-02-01 15:39:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (66, 3, '2020-02-01 15:41:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (67, 3, '2020-02-01 15:43:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (68, 3, '2020-02-01 15:44:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (69, 3, '2020-02-01 15:45:10', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (70, 3, '2020-02-01 15:46:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (71, 3, '2020-02-01 15:48:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (72, 3, '2020-02-01 16:00:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (73, 3, '2020-02-01 16:07:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (74, 3, '2020-02-01 16:08:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (75, 3, '2020-02-02 15:28:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (76, 3, '2020-02-02 15:44:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (77, 3, '2020-02-02 15:45:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (78, 3, '2020-02-02 15:52:32', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (79, 3, '2020-02-02 15:53:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (80, 3, '2020-02-02 15:54:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (81, 3, '2020-02-02 16:01:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (82, 3, '2020-02-02 16:05:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (83, 3, '2020-02-02 16:06:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (84, 3, '2020-02-02 16:17:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (85, 3, '2020-02-02 16:18:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (86, 3, '2020-02-02 16:19:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (87, 3, '2020-02-02 16:19:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (88, 3, '2020-02-02 16:22:27', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (89, 3, '2020-02-02 16:23:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (90, 3, '2020-02-02 16:23:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (91, 3, '2020-02-02 16:24:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (92, 3, '2020-02-02 16:25:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (93, 3, '2020-02-02 16:26:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (94, 3, '2020-02-02 16:26:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (95, 3, '2020-02-02 16:27:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (96, 3, '2020-02-02 16:31:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (97, 3, '2020-02-02 16:31:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (98, 3, '2020-02-02 16:31:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (99, 3, '2020-02-02 16:31:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (100, 3, '2020-02-02 16:33:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (101, 3, '2020-02-02 16:33:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (102, 3, '2020-02-02 16:34:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (103, 3, '2020-02-02 16:38:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (104, 3, '2020-02-02 16:39:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (105, 3, '2020-02-02 16:42:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (106, 3, '2020-02-02 16:46:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (107, 3, '2020-02-02 16:50:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (108, 3, '2020-02-02 16:51:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (109, 3, '2020-02-02 16:51:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (110, 3, '2020-02-02 16:52:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (111, 3, '2020-02-02 17:01:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (112, 3, '2020-02-03 10:43:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (113, 3, '2020-02-03 10:45:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (114, 3, '2020-02-03 10:46:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (115, 3, '2020-02-03 10:54:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (116, 3, '2020-02-03 14:24:47', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (117, 3, '2020-02-03 14:25:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (118, 5, '2020-02-03 15:22:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (119, 5, '2020-02-03 15:23:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (120, 5, '2020-02-03 15:24:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (121, 3, '2020-02-03 15:24:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (122, 5, '2020-02-03 15:27:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (123, 3, '2020-02-03 15:27:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (124, 3, '2020-02-03 15:29:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (125, 5, '2020-02-03 15:33:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (126, 3, '2020-02-03 15:33:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (127, 1, '2020-02-03 15:34:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (128, 3, '2020-02-03 15:34:47', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (129, 3, '2020-02-04 14:14:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (130, 3, '2020-02-05 10:33:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (131, 3, '2020-02-05 10:36:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (132, 3, '2020-02-05 16:34:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (133, 4, '2020-02-05 16:58:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (134, 3, '2020-02-05 16:59:03', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (135, 3, '2020-02-06 10:25:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (136, 3, '2020-02-07 14:34:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (137, 3, '2020-02-07 14:36:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (138, 1, '2020-02-07 14:43:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (139, 3, '2020-02-07 15:18:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (140, 3, '2020-02-07 15:20:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (141, 3, '2020-02-07 15:22:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (142, 3, '2020-02-07 15:22:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (143, 3, '2020-02-07 15:55:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (144, 3, '2020-02-07 15:56:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (145, 3, '2020-02-07 15:58:49', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (146, 6, '2020-02-07 16:16:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (147, 7, '2020-02-07 16:16:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (148, 3, '2020-02-07 16:18:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (149, 7, '2020-02-07 16:20:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (150, 3, '2020-02-07 16:20:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (151, 3, '2020-02-07 16:32:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (152, 3, '2020-02-07 19:32:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (153, 3, '2020-02-07 19:32:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (154, 3, '2020-02-07 19:33:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (155, 3, '2020-02-07 19:33:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (156, 3, '2020-02-07 19:33:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (157, 3, '2020-02-07 19:35:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (158, 3, '2020-02-07 19:37:10', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (159, 3, '2020-02-07 19:37:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (160, 3, '2020-02-07 19:37:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (161, 3, '2020-02-07 19:45:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (162, 3, '2020-02-07 19:47:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (163, 3, '2020-02-07 20:02:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (164, 6, '2020-02-07 20:10:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (165, 6, '2020-02-07 20:11:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (166, 6, '2020-02-07 20:13:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (167, 6, '2020-02-07 20:17:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (168, 3, '2020-02-07 20:17:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (169, 6, '2020-02-07 20:18:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (170, 3, '2020-02-10 10:28:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (171, 3, '2020-02-10 10:45:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (172, 3, '2020-02-10 10:57:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (173, 3, '2020-02-10 10:59:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (174, 3, '2020-02-10 11:04:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (175, 3, '2020-02-10 11:05:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (176, 3, '2020-02-10 11:06:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (177, 3, '2020-02-10 11:07:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (178, 3, '2020-02-10 11:08:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (179, 3, '2020-02-10 11:10:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (180, 6, '2020-02-10 14:25:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (181, 6, '2020-02-10 14:29:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (182, 3, '2020-02-10 16:09:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (183, 3, '2020-02-20 14:39:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (184, 8, '2020-02-20 17:14:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (185, 8, '2020-02-20 17:17:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (186, 8, '2020-02-20 17:17:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (187, 8, '2020-02-21 10:26:56', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (188, 8, '2020-02-21 10:28:54', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (189, 8, '2020-02-21 10:32:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (190, 8, '2020-02-21 10:33:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (191, 8, '2020-02-21 10:35:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (192, 8, '2020-02-21 10:36:49', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (193, 3, '2020-02-21 11:10:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (194, 3, '2020-02-25 16:11:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (195, 3, '2020-02-25 16:46:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (196, 3, '2020-03-07 16:33:59', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (197, 6, '2020-03-07 16:35:38', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (198, 3, '2020-03-07 17:00:09', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (199, 3, '2020-03-14 14:32:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (200, 8, '2020-03-14 14:32:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (201, 3, '2020-03-14 14:33:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (202, 8, '2020-03-14 14:34:57', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (203, 3, '2020-03-14 14:35:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (204, 8, '2020-03-14 14:36:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (205, 3, '2020-03-14 14:36:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (206, 8, '2020-03-14 14:37:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (207, 3, '2020-03-14 14:37:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (208, 8, '2020-03-14 14:38:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (209, 3, '2020-03-14 14:38:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (210, 8, '2020-03-14 14:39:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (211, 3, '2020-03-14 14:39:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (212, 3, '2020-03-15 14:23:54', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (213, 3, '2020-03-22 14:33:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (214, 3, '2020-03-22 14:59:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (215, 3, '2020-03-22 15:04:32', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (216, 3, '2020-03-29 16:14:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (217, 3, '2020-03-29 17:17:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (218, 3, '2020-04-06 16:54:49', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (219, 3, '2020-04-12 15:01:40', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (220, 3, '2020-04-19 09:50:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (221, 3, '2020-05-04 10:45:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (222, 3, '2020-05-05 11:02:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (223, 3, '2020-05-16 15:17:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (224, 3, '2020-05-17 14:58:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (225, 3, '2020-05-18 15:47:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (226, 3, '2020-05-23 16:51:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (227, 3, '2020-05-23 16:54:53', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (228, 3, '2020-05-23 17:00:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (229, 3, '2020-05-24 10:38:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (230, 3, '2020-06-07 09:39:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (231, 3, '2020-06-14 14:23:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (232, 3, '2020-06-14 17:11:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (233, 3, '2020-06-20 14:53:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (234, 3, '2020-06-21 14:57:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (235, 3, '2020-06-27 10:41:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (236, 3, '2020-07-05 15:54:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (237, 3, '2020-07-11 10:40:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (238, 3, '2020-07-11 10:45:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (239, 3, '2020-07-19 11:00:16', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (240, 3, '2020-07-19 11:46:27', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (241, 3, '2020-07-19 11:53:47', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (242, 3, '2020-07-19 14:17:37', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (243, 3, '2020-07-19 14:44:24', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (244, 3, '2020-07-19 14:44:58', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (245, 3, '2020-07-19 14:48:27', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (246, 3, '2020-07-19 14:48:57', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (247, 3, '2020-07-19 14:49:30', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (248, 3, '2020-07-19 14:50:18', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (249, 3, '2020-07-19 14:51:51', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (250, 3, '2020-07-19 14:55:27', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (251, 3, '2020-07-19 14:58:14', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (252, 6, '2020-07-19 15:04:21', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (253, 3, '2020-07-19 15:38:49', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (254, 6, '2020-07-19 16:26:24', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (255, 3, '2020-08-08 10:39:12', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (256, 3, '2020-08-09 11:06:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (257, 3, '2020-08-10 20:41:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (258, 3, '2020-08-15 10:12:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (259, 1, '2020-08-19 21:23:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (260, 1, '2020-08-19 21:25:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (261, 3, '2020-09-05 16:14:50', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (262, 3, '2020-09-05 16:15:37', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (263, 3, '2020-09-12 16:07:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (264, 6, '2020-09-12 16:08:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (265, 1, '2020-09-12 16:08:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (266, 6, '2020-09-12 16:09:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (267, 1, '2020-09-12 16:09:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (268, 3, '2020-09-13 14:22:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (269, 3, '2020-09-13 14:23:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (270, 3, '2020-09-13 14:24:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (271, 3, '2020-09-13 14:32:32', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (272, 1, '2020-09-19 15:43:31', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (273, 3, '2020-09-19 15:43:58', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (274, 3, '2020-09-19 15:49:44', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (275, 6, '2020-09-19 15:50:12', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (276, 6, '2020-09-19 15:50:18', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (277, 1, '2020-09-19 15:50:41', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (278, 6, '2020-09-19 15:52:28', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (279, 1, '2020-09-19 15:53:01', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (280, 1, '2020-09-19 15:53:48', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (281, 6, '2020-09-19 15:54:37', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (282, 3, '2020-09-20 11:13:50', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (283, 1, '2020-10-08 14:26:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (284, 1, '2020-10-08 14:30:49', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (285, 3, '2021-04-11 10:27:43', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (286, 1, '2021-04-11 10:29:19', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (287, 3, '2021-04-11 10:30:40', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (288, 3, '2021-04-11 10:37:50', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (289, 3, '2021-12-08 10:44:09', '192.168.3.4', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (290, 3, '2022-04-15 15:04:51', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (291, 1, '2022-05-10 15:25:58', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (292, 1, '2022-05-10 15:31:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (293, 1, '2022-05-10 15:32:18', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (294, 1, '2022-05-10 15:34:17', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (295, 1, '2022-05-10 15:34:38', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (296, 1, '2022-05-10 15:54:50', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (297, 1, '2022-05-10 16:31:20', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (298, 1, '2022-05-10 16:33:45', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (299, 1, '2022-05-10 16:39:07', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (300, 1, '2022-05-18 14:53:41', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (301, 3, '2022-06-07 17:28:29', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (302, 3, '2022-06-08 09:48:32', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (303, 3, '2022-06-08 10:34:20', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (304, 3, '2022-06-08 17:09:29', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (305, 3, '2022-06-08 17:10:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (306, 6, '2022-06-08 17:10:55', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (307, 3, '2022-06-08 17:23:05', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (308, 3, '2022-06-08 17:30:51', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (309, 3, '2022-06-08 17:31:42', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (310, 3, '2022-06-08 17:31:48', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (311, 3, '2022-06-08 21:03:56', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (312, 3, '2022-06-09 10:41:31', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (313, 3, '2022-06-09 15:18:46', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (314, 3, '2022-06-10 15:43:15', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (315, 3, '2022-06-10 15:52:27', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (316, 3, '2022-06-15 14:41:59', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (317, 3, '2022-06-23 16:24:09', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (318, 3, '2022-06-23 16:41:33', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (319, 3, '2022-06-23 16:42:50', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (320, 3, '2022-06-23 16:42:51', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (321, 3, '2022-06-23 16:42:52', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (322, 3, '2022-06-23 16:42:53', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (323, 3, '2022-06-23 16:43:07', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (324, 3, '2022-06-23 16:44:56', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (325, 3, '2022-06-23 16:45:42', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (326, 3, '2022-06-23 16:50:08', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (327, 3, '2022-06-24 15:19:04', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (328, 3, '2022-06-24 15:25:52', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (329, 3, '2022-06-24 15:40:29', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (330, 3, '2022-06-25 15:13:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (331, 3, '2022-06-25 15:25:12', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (332, 3, '2022-06-27 16:38:37', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (333, 3, '2022-07-24 10:10:06', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (334, 1, '2022-07-25 17:15:55', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (335, 3, '2022-07-27 09:41:32', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (336, 1, '2022-07-28 16:56:10', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (337, 1, '2022-07-28 16:56:25', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (338, 8, '2022-08-07 14:46:00', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (339, 9, '2022-08-07 14:53:32', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (340, 9, '2022-08-07 14:53:46', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (341, 9, '2022-08-07 14:56:19', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (342, 1, '2022-08-09 10:53:55', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (343, 1, '2022-08-09 10:54:36', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (344, 1, '2022-08-09 11:00:06', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (345, 1, '2022-08-09 11:02:04', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (346, 1, '2022-08-09 15:48:14', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (347, 1, '2022-08-16 16:35:24', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (348, 1, '2022-08-17 15:03:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (349, 1, '2022-08-20 16:49:19', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (350, 1, '2022-08-23 14:54:06', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (351, 1, '2022-08-31 17:16:35', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (352, 3, '2022-10-14 15:31:42', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (353, 3, '2022-10-14 15:42:39', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (354, 3, '2022-10-14 15:44:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (355, 3, '2022-10-14 15:46:23', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (356, 3, '2022-10-14 15:46:35', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (357, 3, '2022-10-14 16:06:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (358, 3, '2022-10-14 16:24:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (359, 3, '2022-10-17 16:44:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (360, 3, '2022-10-17 16:49:42', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (361, 3, '2022-10-17 16:49:53', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (362, 3, '2022-10-17 17:03:10', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (363, 3, '2022-10-17 17:03:22', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (364, 3, '2022-10-17 21:00:48', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (365, 3, '2022-10-24 16:32:31', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (366, 3, '2022-10-26 16:31:17', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (367, 3, '2022-10-26 16:50:48', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (368, 3, '2022-10-26 16:52:28', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (369, 3, '2022-10-27 17:21:28', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (370, 3, '2022-10-28 10:52:22', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (371, 3, '2022-11-04 16:09:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (372, 3, '2022-11-08 10:27:27', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (373, 3, '2022-11-09 10:42:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (374, 3, '2022-11-10 15:03:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (375, 3, '2022-11-11 10:11:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (376, 3, '2022-11-14 16:33:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (377, 3, '2022-11-15 10:54:02', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (378, 3, '2022-11-15 15:16:35', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (379, 3, '2022-11-15 15:17:41', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (380, 3, '2022-11-15 15:17:47', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (381, 1, '2022-11-15 15:19:56', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (382, 3, '2022-11-15 15:20:12', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (383, 3, '2022-11-15 15:22:22', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (384, 3, '2022-11-16 10:39:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (385, 1, '2022-11-24 20:02:12', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (386, 3, '2022-11-28 15:24:02', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (387, 3, '2022-11-30 09:34:28', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (388, 3, '2022-12-05 09:43:58', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (389, 3, '2022-12-09 17:18:09', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (390, 3, '2022-12-15 14:53:39', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (391, 3, '2022-12-15 16:11:54', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (392, 3, '2022-12-20 15:55:18', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (393, 3, '2022-12-21 14:49:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (394, 3, '2022-12-23 09:49:50', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (395, 3, '2023-01-04 10:17:44', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (396, 3, '2023-01-04 15:28:47', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (397, 3, '2023-01-05 10:13:43', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (398, 3, '2023-01-06 09:49:23', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (399, 3, '2023-01-06 10:04:19', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (400, 3, '2023-01-06 10:07:06', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (401, 3, '2023-01-06 16:21:31', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (402, 3, '2023-01-09 16:50:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (403, 3, '2023-01-10 10:05:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (404, 3, '2023-01-10 17:09:44', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (405, 3, '2023-01-11 10:17:17', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (406, 3, '2023-01-13 09:35:37', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (407, 3, '2023-01-13 09:40:51', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (408, 3, '2023-01-31 10:46:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (409, 3, '2023-02-08 17:11:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (410, 3, '2023-02-09 15:46:41', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (411, 3, '2023-02-10 17:23:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (412, 3, '2023-05-11 15:29:54', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (413, 3, '2025-11-26 21:11:58', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (414, 3, '2025-11-27 13:47:45', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (415, 3, '2025-11-28 08:08:34', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (416, 3, '2025-11-28 11:00:43', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (417, 3, '2025-11-28 13:53:57', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (418, 3, '2025-11-29 09:22:32', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (419, 3, '2025-11-29 20:47:09', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (420, 3, '2025-11-29 22:04:11', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (421, 3, '2025-11-30 15:36:51', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (422, 3, '2025-12-01 00:12:54', '192.168.42.225', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (423, 3, '2025-12-01 13:47:16', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (424, 3, '2025-12-03 08:10:57', '192.168.42.225', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (425, 3, '2025-12-03 11:54:34', '192.168.42.225', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (426, 3, '2025-12-04 15:39:08', '192.168.214.225', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (427, 3, '2025-12-04 15:43:01', '192.168.214.225', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (428, 3, '2025-12-04 15:45:32', '192.168.214.225', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (429, 3, '2025-12-05 09:12:24', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (430, 3, '2025-12-05 11:29:53', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (431, 3, '2025-12-05 13:29:24', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (432, 3, '2025-12-05 13:59:31', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (433, 3, '2025-12-06 01:17:30', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (434, 3, '2025-12-06 01:36:21', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (435, 3, '2025-12-06 02:03:48', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (436, 3, '2025-12-06 02:07:26', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (437, 3, '2025-12-06 08:10:03', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (438, 3, '2025-12-06 08:16:43', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (439, 3, '2025-12-06 08:28:08', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (440, 3, '2025-12-06 09:13:01', '10.20.216.11', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (441, 3, '2025-12-08 02:56:13', '192.168.203.225', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (442, 3, '2025-12-08 04:39:42', '192.168.203.225', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (443, 3, '2025-12-08 14:01:24', '10.20.216.11', NULL, NULL);

-- ----------------------------
-- Table structure for ums_admin_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_permission_relation`;
CREATE TABLE `ums_admin_permission_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL,
  `permission_id` bigint(20) NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和权限关系表(除角色中定义的权限以外的加减权限)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_admin_permission_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_admin_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role_relation`;
CREATE TABLE `ums_admin_role_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和角色关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_admin_role_relation
-- ----------------------------
INSERT INTO `ums_admin_role_relation` VALUES (26, 3, 5);
INSERT INTO `ums_admin_role_relation` VALUES (27, 6, 1);
INSERT INTO `ums_admin_role_relation` VALUES (28, 7, 2);
INSERT INTO `ums_admin_role_relation` VALUES (29, 1, 5);
INSERT INTO `ums_admin_role_relation` VALUES (30, 4, 5);
INSERT INTO `ums_admin_role_relation` VALUES (31, 8, 1);

-- ----------------------------
-- Table structure for ums_growth_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_growth_change_history`;
CREATE TABLE `ums_growth_change_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `change_type` int(1) NULL DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) NULL DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成长值变化历史记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_growth_change_history
-- ----------------------------
INSERT INTO `ums_growth_change_history` VALUES (1, 1, '2018-08-29 17:16:35', 0, 1000, 'test', '测试使用', 1);

-- ----------------------------
-- Table structure for ums_integration_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_change_history`;
CREATE TABLE `ums_integration_change_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `change_type` int(1) NULL DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) NULL DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分变化历史记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_integration_change_history
-- ----------------------------
INSERT INTO `ums_integration_change_history` VALUES (1, 11, '2025-12-08 01:21:58', 0, 10, '系统', '每日签到奖励', 2);

-- ----------------------------
-- Table structure for ums_integration_consume_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_consume_setting`;
CREATE TABLE `ums_integration_consume_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deduction_per_amount` int(11) NULL DEFAULT NULL COMMENT '每一元需要抵扣的积分数量',
  `max_percent_per_order` int(11) NULL DEFAULT NULL COMMENT '每笔订单最高抵用百分比',
  `use_unit` int(11) NULL DEFAULT NULL COMMENT '每次使用积分最小单位100',
  `coupon_status` int(1) NULL DEFAULT NULL COMMENT '是否可以和优惠券同用；0->不可以；1->可以',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分消费设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_integration_consume_setting
-- ----------------------------
INSERT INTO `ums_integration_consume_setting` VALUES (1, 100, 50, 100, 1);

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_level_id` bigint(20) NULL DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `status` int(1) NULL DEFAULT NULL COMMENT '帐号启用状态:0->禁用；1->启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` int(1) NULL DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所做城市',
  `job` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '用户来源',
  `integration` int(11) NULL DEFAULT NULL COMMENT '积分',
  `growth` int(11) NULL DEFAULT NULL COMMENT '成长值',
  `luckey_count` int(11) NULL DEFAULT NULL COMMENT '剩余抽奖次数',
  `history_integration` int(11) NULL DEFAULT NULL COMMENT '历史积分数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `idx_phone`(`phone` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member
-- ----------------------------
INSERT INTO `ums_member` VALUES (1, 4, 'test', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'test', '18061581849', 1, '2018-08-02 10:35:44', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_03.png', 1, '2009-06-01', '上海', '学生', 'test', NULL, 3900, 1000, NULL, NULL);
INSERT INTO `ums_member` VALUES (3, 4, 'windy', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'windy', '18061581848', 1, '2018-08-03 16:46:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (4, 4, 'zhengsan', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'zhengsan', '18061581847', 1, '2018-11-12 14:12:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (5, 4, 'lisi', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lisi', '18061581841', 1, '2018-11-12 14:12:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (6, 4, 'wangwu', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'wangwu', '18061581842', 1, '2018-11-12 14:13:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (7, 4, 'lion', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lion', '18061581845', 1, '2018-11-12 14:21:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (8, 4, 'shari', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'shari', '18061581844', 1, '2018-11-12 14:22:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (9, 4, 'aewen', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'aewen', '18061581843', 1, '2018-11-12 14:22:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (10, 4, 'guest', '$2a$10$WQiD4RzEs1iJVWU.2HVu8OdSlExJHWKmwndaw3SUfMyqfKZmXe1vq', NULL, '18911111111', 1, '2020-03-14 14:52:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (11, 4, 'member', '$2a$10$Q08uzqvtPj61NnpYQZsVvOnyilJ3AU4VdngAcJFGvPhEeqhhC.hhS', 'member', '18961511111', 1, '2023-05-11 15:22:38', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 1, '2009-06-01', '上海', '学生', 'member', NULL, 5000, 1000, NULL, NULL);
INSERT INTO `ums_member` VALUES (12, 4, '111', '$2a$10$ha87Uf5zx3UkIJYhK2cUwO0BJ32StcnNxJR.mGwXGCnp3SBCMB/xm', NULL, '18312129802', 1, '2025-11-27 18:27:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (13, 4, '123', '$2a$10$WSgATOGx4VBD0qQv7/Gd7euJwd2M4r/XubA.XcnqBCFiyuLCqG8Sq', NULL, '18312129209', 1, '2025-11-27 18:28:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (14, 4, '1234', '$2a$10$TZOFivSMF8D2e5.amdP6IeVBDlVB7bDVH2TddG6GKdcEFh/kJmGOq', NULL, '18312129291', 1, '2025-11-27 18:29:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (15, 4, '12345', '$2a$10$Ffol4EVbs5qCwAcRQ566XuFkaCqtgyGbZKlG0CMYJx6bPAtZ/uTV2', NULL, '18312129201', 1, '2025-11-27 18:31:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (16, 4, '123456', '$2a$10$8L4WHNxgyAyKf21VM2BHmueJM3FI5moedK.7ZhDFof8v80sMaQaca', NULL, '18312129012', 1, '2025-11-27 18:33:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (17, NULL, 'test_user1', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/FjXGqecxjZ6T5N8K8e', '测试用户1', '13800001000', 1, '2025-10-25 07:24:00', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 1, '1993-12-08', '南京市', '测试职业', '这是一个测试用户', 1, 988, 3, 0, 143);
INSERT INTO `ums_member` VALUES (18, NULL, 'test_user2', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/FjXGqecxjZ6T5N8K8e', '测试用户2', '13800002000', 1, '2025-11-18 07:24:00', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 1, '1994-12-08', '北京市', '测试职业', '这是一个测试用户', 1, 603, 361, 0, 1611);
INSERT INTO `ums_member` VALUES (19, NULL, 'test_user3', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/FjXGqecxjZ6T5N8K8e', '测试用户3', '13800003000', 1, '2025-10-18 07:24:00', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 2, '1973-12-08', '深圳市', '测试职业', '这是一个测试用户', 1, 685, 78, 0, 1452);
INSERT INTO `ums_member` VALUES (20, NULL, 'test_user4', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/FjXGqecxjZ6T5N8K8e', '测试用户4', '13800004000', 1, '2025-11-29 07:24:00', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 1, '1980-12-08', '上海市', '测试职业', '这是一个测试用户', 1, 731, 333, 0, 271);
INSERT INTO `ums_member` VALUES (21, NULL, 'test_user5', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/FjXGqecxjZ6T5N8K8e', '测试用户5', '13800005000', 1, '2025-10-29 07:24:00', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 2, '1969-12-08', '杭州市', '测试职业', '这是一个测试用户', 1, 327, 395, 0, 1933);
INSERT INTO `ums_member` VALUES (22, NULL, 'test_user6', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/FjXGqecxjZ6T5N8K8e', '测试用户6', '13800006000', 1, '2025-11-11 07:24:00', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 1, '1978-12-08', '北京市', '测试职业', '这是一个测试用户', 1, 875, 407, 0, 905);
INSERT INTO `ums_member` VALUES (23, NULL, 'test_user7', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/FjXGqecxjZ6T5N8K8e', '测试用户7', '13800007000', 1, '2025-10-20 07:24:00', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 2, '1998-12-08', '杭州市', '测试职业', '这是一个测试用户', 1, 44, 36, 0, 465);
INSERT INTO `ums_member` VALUES (24, NULL, 'test_user8', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/FjXGqecxjZ6T5N8K8e', '测试用户8', '13800008000', 1, '2025-10-13 07:24:00', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 0, '1994-12-08', '上海市', '测试职业', '这是一个测试用户', 1, 65, 80, 0, 1219);
INSERT INTO `ums_member` VALUES (25, NULL, 'test_user9', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/FjXGqecxjZ6T5N8K8e', '测试用户9', '13800009000', 1, '2025-11-05 07:24:00', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 2, '1994-12-08', '深圳市', '测试职业', '这是一个测试用户', 1, 225, 445, 0, 1552);
INSERT INTO `ums_member` VALUES (26, NULL, 'test_user10', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/FjXGqecxjZ6T5N8K8e', '测试用户10', '13800010000', 1, '2025-11-26 07:24:00', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 2, '1967-12-08', '杭州市', '测试职业', '这是一个测试用户', 1, 212, 109, 0, 920);

-- ----------------------------
-- Table structure for ums_member_feedback
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_feedback`;
CREATE TABLE `ums_member_feedback`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `member_id` bigint(20) NOT NULL COMMENT '会员ID',
  `member_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `type` int(11) NULL DEFAULT 0 COMMENT '反馈类型：0-咨询，1-建议，2-投诉，3-其他',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈内容',
  `images` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈图片，多个用逗号分隔',
  `status` int(11) NULL DEFAULT 0 COMMENT '处理状态：0-待处理，1-处理中，2-已处理，3-已关闭',
  `reply` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '管理员回复',
  `reply_time` datetime NULL DEFAULT NULL COMMENT '回复时间',
  `reply_admin_id` bigint(20) NULL DEFAULT NULL COMMENT '回复管理员ID',
  `reply_admin_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复管理员名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_id`(`member_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员反馈表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_feedback
-- ----------------------------
INSERT INTO `ums_member_feedback` VALUES (1, 11, 'member', 0, '111', 'blob:http://localhost:8060/ee0f30ea-635e-47dc-a107-3b22862c4155', 2, '1212', '2025-12-08 03:18:05', 3, 'admin', '2025-12-08 03:04:58', '2025-12-08 03:18:05');

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `growth_point` int(11) NULL DEFAULT NULL,
  `default_status` int(1) NULL DEFAULT NULL COMMENT '是否为默认等级：0->不是；1->是',
  `free_freight_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int(11) NULL DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` int(1) NULL DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_sign_in` int(1) NULL DEFAULT NULL COMMENT '是否有签到特权',
  `priviledge_comment` int(1) NULL DEFAULT NULL COMMENT '是否有评论获奖励特权',
  `priviledge_promotion` int(1) NULL DEFAULT NULL COMMENT '是否有专享活动特权',
  `priviledge_member_price` int(1) NULL DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` int(1) NULL DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员等级表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------
INSERT INTO `ums_member_level` VALUES (1, '黄金会员', 1000, 0, 199.00, 5, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (2, '白金会员', 5000, 0, 99.00, 10, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (3, '钻石会员', 15000, 0, 69.00, 15, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (4, '普通会员', 1, 1, 199.00, 20, 1, 1, 1, 1, 0, 0, NULL);

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_type` int(1) NULL DEFAULT NULL COMMENT '登录类型：0->PC；1->android;2->ios;3->小程序',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员登录记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_member_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_member_tag_relation`;
CREATE TABLE `ums_member_member_tag_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `tag_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和标签关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_member_tag_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_product_category_relation`;
CREATE TABLE `ums_member_product_category_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员与产品分类关系表（用户喜欢的分类）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_product_category_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人名称',
  `phone_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `default_status` int(1) NULL DEFAULT NULL COMMENT '是否为默认',
  `post_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `region` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址(街道)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员收货地址表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------
INSERT INTO `ums_member_receive_address` VALUES (1, 1, '大梨', '18033441849', 0, '518000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `ums_member_receive_address` VALUES (3, 1, '大梨', '18033441849', 0, '518000', '广东省', '深圳市', '福田区', '清水河街道');
INSERT INTO `ums_member_receive_address` VALUES (4, 1, '大梨', '18033441849', 1, '518000', '广东省', '深圳市', '福田区', '东晓街道');
INSERT INTO `ums_member_receive_address` VALUES (5, 11, '小李', '18961511111', 1, '518000', '广东省', '深圳市', '福田区', '东晓街道');
INSERT INTO `ums_member_receive_address` VALUES (6, 11, '小李', '18961511111', NULL, '518000', '广东省', '深圳市', '福田区', '清水河街道');
INSERT INTO `ums_member_receive_address` VALUES (7, 13, '1', '18136256911', 1, '211400', '江苏省', '', '', '南京');
INSERT INTO `ums_member_receive_address` VALUES (8, 12, '周家坤', '18136256911', 1, '211400', '江苏省', '', '', '南京市');
INSERT INTO `ums_member_receive_address` VALUES (9, 12, 'jyb', '18136256911', 1, '211400', '江苏省', '南京市', '栖霞区', '江苏省南京市栖霞区仙林街道文澜路82号高科荣域');
INSERT INTO `ums_member_receive_address` VALUES (10, 12, 'jyb', '18136256911', 1, '211400', '江苏省', '南京市', '栖霞区', '江苏省南京市栖霞区仙林街道文澜路82号高科荣域');
INSERT INTO `ums_member_receive_address` VALUES (11, 12, 'jyb', '18136256911', 1, '211400', '江苏省', '南京市', '栖霞区', '江苏省南京市栖霞区仙林街道文澜路82号高科荣域');
INSERT INTO `ums_member_receive_address` VALUES (12, 12, 'jyb', '18136256911', 1, '211400', '江苏省', '南京市', '栖霞区', '江苏省南京市栖霞区仙林街道文澜路82号高科荣域');
INSERT INTO `ums_member_receive_address` VALUES (13, 12, 'jyb', '18136256911', 1, '211400', '江苏省', '南京市', '栖霞区', '江苏省南京市栖霞区仙林街道文澜路82号高科荣域');
INSERT INTO `ums_member_receive_address` VALUES (14, 12, 'jyb', '18136256911', 1, '211400', '江苏省', '南京市', '栖霞区', '江苏省南京市栖霞区仙林街道文澜路82号高科荣域');
INSERT INTO `ums_member_receive_address` VALUES (15, 12, 'jyb', '18136256911', 1, '211400', '江苏省', '南京市', '栖霞区', '江苏省南京市栖霞区仙林街道文澜路82号高科荣域');
INSERT INTO `ums_member_receive_address` VALUES (16, 12, 'jyb', '18136256911', 1, '211400', '江苏省', '南京市', '栖霞区', '江苏省南京市栖霞区仙林街道文澜路82号高科荣域');
INSERT INTO `ums_member_receive_address` VALUES (17, 12, '111', '18312129012', 1, '12121', '江苏省', '南京市', '栖霞区', '江苏省南京市栖霞区仙林街道文澜路82号高科荣域');
INSERT INTO `ums_member_receive_address` VALUES (18, 12, '111', '18312129012', 1, '12121', '江苏省', '南京市', '栖霞区', '江苏省南京市栖霞区仙林街道文澜路82号高科荣域');
INSERT INTO `ums_member_receive_address` VALUES (19, 12, '21', '18312129012', NULL, '1212', '江苏省', '南京市', '栖霞区', '江苏省南京市栖霞区仙林街道文澜路82号高科荣域');
INSERT INTO `ums_member_receive_address` VALUES (20, 12, 'zzh', '18136256911', NULL, '211400', '江苏省', '南京市', '栖霞区', '江苏省南京市栖霞区仙林街道文澜路82号高科荣域');

-- ----------------------------
-- Table structure for ums_member_rule_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_rule_setting`;
CREATE TABLE `ums_member_rule_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `continue_sign_day` int(11) NULL DEFAULT NULL COMMENT '连续签到天数',
  `continue_sign_point` int(11) NULL DEFAULT NULL COMMENT '连续签到赠送数量',
  `consume_per_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '每消费多少元获取1个点',
  `low_order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '最低获取点数的订单金额',
  `max_point_per_order` int(11) NULL DEFAULT NULL COMMENT '每笔订单最高获取点数',
  `type` int(1) NULL DEFAULT NULL COMMENT '类型：0->积分规则；1->成长值规则',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员积分成长规则表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_rule_setting
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_sign_in
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_sign_in`;
CREATE TABLE `ums_member_sign_in`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NOT NULL COMMENT '会员ID',
  `sign_date` date NOT NULL COMMENT '签到日期',
  `integration` int(11) NOT NULL DEFAULT 10 COMMENT '签到获得的积分',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_member_date`(`member_id` ASC, `sign_date` ASC) USING BTREE COMMENT '会员每日只能签到一次',
  INDEX `idx_member_id`(`member_id` ASC) USING BTREE,
  INDEX `idx_sign_date`(`sign_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员签到记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_sign_in
-- ----------------------------
INSERT INTO `ums_member_sign_in` VALUES (1, 11, '2025-12-08', 10, '2025-12-08 01:21:58');

-- ----------------------------
-- Table structure for ums_member_statistics_info
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_statistics_info`;
CREATE TABLE `ums_member_statistics_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `consume_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '累计消费金额',
  `order_count` int(11) NULL DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int(11) NULL DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int(11) NULL DEFAULT NULL COMMENT '评价数',
  `return_order_count` int(11) NULL DEFAULT NULL COMMENT '退货数量',
  `login_count` int(11) NULL DEFAULT NULL COMMENT '登录次数',
  `attend_count` int(11) NULL DEFAULT NULL COMMENT '关注数量',
  `fans_count` int(11) NULL DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int(11) NULL DEFAULT NULL,
  `collect_subject_count` int(11) NULL DEFAULT NULL,
  `collect_topic_count` int(11) NULL DEFAULT NULL,
  `collect_comment_count` int(11) NULL DEFAULT NULL,
  `invite_friend_count` int(11) NULL DEFAULT NULL,
  `recent_order_time` datetime NULL DEFAULT NULL COMMENT '最后一次下订单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员统计信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_statistics_info
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_tag
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_tag`;
CREATE TABLE `ums_member_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finish_order_count` int(11) NULL DEFAULT NULL COMMENT '自动打标签完成订单数量',
  `finish_order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '自动打标签完成订单金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_tag
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_task
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_task`;
CREATE TABLE `ums_member_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `growth` int(11) NULL DEFAULT NULL COMMENT '赠送成长值',
  `intergration` int(11) NULL DEFAULT NULL COMMENT '赠送积分',
  `type` int(1) NULL DEFAULT NULL COMMENT '任务类型：0->新手任务；1->日常任务',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_task
-- ----------------------------

-- ----------------------------
-- Table structure for ums_menu
-- ----------------------------
DROP TABLE IF EXISTS `ums_menu`;
CREATE TABLE `ums_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父级ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `level` int(4) NULL DEFAULT NULL COMMENT '菜单级数',
  `sort` int(4) NULL DEFAULT NULL COMMENT '菜单排序',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端名称',
  `icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端图标',
  `hidden` int(1) NULL DEFAULT NULL COMMENT '前端隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_menu
-- ----------------------------
INSERT INTO `ums_menu` VALUES (1, 0, '2020-02-02 14:50:36', '商品', 0, 0, 'pms', 'product', 0);
INSERT INTO `ums_menu` VALUES (2, 1, '2020-02-02 14:51:50', '商品列表', 1, 0, 'product', 'product-list', 0);
INSERT INTO `ums_menu` VALUES (3, 1, '2020-02-02 14:52:44', '添加商品', 1, 0, 'addProduct', 'product-add', 0);
INSERT INTO `ums_menu` VALUES (4, 1, '2020-02-02 14:53:51', '商品分类', 1, 0, 'productCate', 'product-cate', 0);
INSERT INTO `ums_menu` VALUES (5, 1, '2020-02-02 14:54:51', '商品类型', 1, 0, 'productAttr', 'product-attr', 0);
INSERT INTO `ums_menu` VALUES (6, 1, '2020-02-02 14:56:29', '品牌管理', 1, 0, 'brand', 'product-brand', 0);
INSERT INTO `ums_menu` VALUES (7, 0, '2020-02-02 16:54:07', '订单', 0, 0, 'oms', 'order', 0);
INSERT INTO `ums_menu` VALUES (8, 7, '2020-02-02 16:55:18', '订单列表', 1, 0, 'order', 'product-list', 0);
INSERT INTO `ums_menu` VALUES (9, 7, '2020-02-02 16:56:46', '订单设置', 1, 0, 'orderSetting', 'order-setting', 0);
INSERT INTO `ums_menu` VALUES (10, 7, '2020-02-02 16:57:39', '退货申请处理', 1, 0, 'returnApply', 'order-return', 0);
INSERT INTO `ums_menu` VALUES (11, 7, '2020-02-02 16:59:40', '退货原因设置', 1, 0, 'returnReason', 'order-return-reason', 0);
INSERT INTO `ums_menu` VALUES (12, 0, '2020-02-04 16:18:00', '营销', 0, 0, 'sms', 'sms', 0);
INSERT INTO `ums_menu` VALUES (13, 12, '2020-02-04 16:19:22', '秒杀活动列表', 1, 0, 'flash', 'sms-flash', 0);
INSERT INTO `ums_menu` VALUES (14, 12, '2020-02-04 16:20:16', '优惠券列表', 1, 0, 'coupon', 'sms-coupon', 0);
INSERT INTO `ums_menu` VALUES (16, 12, '2020-02-07 16:22:38', '品牌推荐', 1, 0, 'homeBrand', 'product-brand', 0);
INSERT INTO `ums_menu` VALUES (17, 12, '2020-02-07 16:23:14', '新品推荐', 1, 0, 'homeNew', 'sms-new', 0);
INSERT INTO `ums_menu` VALUES (18, 12, '2020-02-07 16:26:38', '人气推荐', 1, 0, 'homeHot', 'sms-hot', 0);
INSERT INTO `ums_menu` VALUES (19, 12, '2020-02-07 16:28:16', '专题推荐', 1, 0, 'homeSubject', 'sms-subject', 0);
INSERT INTO `ums_menu` VALUES (20, 12, '2020-02-07 16:28:42', '广告列表', 1, 0, 'homeAdvertise', 'sms-ad', 0);
INSERT INTO `ums_menu` VALUES (21, 0, '2020-02-07 16:29:13', '权限', 0, 0, 'ums', 'ums', 0);
INSERT INTO `ums_menu` VALUES (22, 21, '2020-02-07 16:29:51', '用户列表', 1, 0, 'admin', 'ums-admin', 0);
INSERT INTO `ums_menu` VALUES (23, 21, '2020-02-07 16:30:13', '角色列表', 1, 0, 'role', 'ums-role', 0);
INSERT INTO `ums_menu` VALUES (24, 21, '2020-02-07 16:30:53', '菜单列表', 1, 0, 'menu', 'ums-menu', 0);
INSERT INTO `ums_menu` VALUES (25, 21, '2020-02-07 16:31:13', '资源列表', 1, 0, 'resource', 'ums-resource', 0);
INSERT INTO `ums_menu` VALUES (26, 0, '2025-12-08 14:19:59', '反馈', 0, 0, 'feedback', 'product-comment', 0);
INSERT INTO `ums_menu` VALUES (27, 26, '2025-12-08 14:19:59', '客服反馈管理', 1, 0, 'customerServiceFeedback', 'feedback', 0);
INSERT INTO `ums_menu` VALUES (28, 26, '2025-12-08 14:19:59', '商品评价管理', 1, 0, 'productCommentList', 'product-comment', 0);
INSERT INTO `ums_menu` VALUES (29, 26, '2025-12-08 14:19:59', '商品报修管理', 1, 0, 'productRepairList', 'repair', 0);

-- ----------------------------
-- Table structure for ums_permission
-- ----------------------------
DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE `ums_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父级权限id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限值',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `type` int(1) NULL DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `uri` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端资源路径',
  `status` int(1) NULL DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_permission
-- ----------------------------
INSERT INTO `ums_permission` VALUES (1, 0, '商品', NULL, NULL, 0, NULL, 1, '2018-09-29 16:15:14', 0);
INSERT INTO `ums_permission` VALUES (2, 1, '商品列表', 'pms:product:read', NULL, 1, '/pms/product/index', 1, '2018-09-29 16:17:01', 0);
INSERT INTO `ums_permission` VALUES (3, 1, '添加商品', 'pms:product:create', NULL, 1, '/pms/product/add', 1, '2018-09-29 16:18:51', 0);
INSERT INTO `ums_permission` VALUES (4, 1, '商品分类', 'pms:productCategory:read', NULL, 1, '/pms/productCate/index', 1, '2018-09-29 16:23:07', 0);
INSERT INTO `ums_permission` VALUES (5, 1, '商品类型', 'pms:productAttribute:read', NULL, 1, '/pms/productAttr/index', 1, '2018-09-29 16:24:43', 0);
INSERT INTO `ums_permission` VALUES (6, 1, '品牌管理', 'pms:brand:read', NULL, 1, '/pms/brand/index', 1, '2018-09-29 16:25:45', 0);
INSERT INTO `ums_permission` VALUES (7, 2, '编辑商品', 'pms:product:update', NULL, 2, '/pms/product/updateProduct', 1, '2018-09-29 16:34:23', 0);
INSERT INTO `ums_permission` VALUES (8, 2, '删除商品', 'pms:product:delete', NULL, 2, '/pms/product/delete', 1, '2018-09-29 16:38:33', 0);
INSERT INTO `ums_permission` VALUES (9, 4, '添加商品分类', 'pms:productCategory:create', NULL, 2, '/pms/productCate/create', 1, '2018-09-29 16:43:23', 0);
INSERT INTO `ums_permission` VALUES (10, 4, '修改商品分类', 'pms:productCategory:update', NULL, 2, '/pms/productCate/update', 1, '2018-09-29 16:43:55', 0);
INSERT INTO `ums_permission` VALUES (11, 4, '删除商品分类', 'pms:productCategory:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:44:38', 0);
INSERT INTO `ums_permission` VALUES (12, 5, '添加商品类型', 'pms:productAttribute:create', NULL, 2, '/pms/productAttr/create', 1, '2018-09-29 16:45:25', 0);
INSERT INTO `ums_permission` VALUES (13, 5, '修改商品类型', 'pms:productAttribute:update', NULL, 2, '/pms/productAttr/update', 1, '2018-09-29 16:48:08', 0);
INSERT INTO `ums_permission` VALUES (14, 5, '删除商品类型', 'pms:productAttribute:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:48:44', 0);
INSERT INTO `ums_permission` VALUES (15, 6, '添加品牌', 'pms:brand:create', NULL, 2, '/pms/brand/add', 1, '2018-09-29 16:49:34', 0);
INSERT INTO `ums_permission` VALUES (16, 6, '修改品牌', 'pms:brand:update', NULL, 2, '/pms/brand/update', 1, '2018-09-29 16:50:55', 0);
INSERT INTO `ums_permission` VALUES (17, 6, '删除品牌', 'pms:brand:delete', NULL, 2, '/pms/brand/delete', 1, '2018-09-29 16:50:59', 0);
INSERT INTO `ums_permission` VALUES (18, 0, '首页', NULL, NULL, 0, NULL, 1, '2018-09-29 16:51:57', 0);

-- ----------------------------
-- Table structure for ums_resource
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource`;
CREATE TABLE `ums_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源URL',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '资源分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_resource
-- ----------------------------
INSERT INTO `ums_resource` VALUES (1, '2020-02-04 17:04:55', '商品品牌管理', '/brand/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (2, '2020-02-04 17:05:35', '商品属性分类管理', '/productAttribute/category/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (3, '2020-02-04 17:06:13', '商品属性管理', '/productAttribute/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (4, '2020-02-04 17:07:15', '商品分类管理', '/productCategory/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (5, '2020-02-04 17:09:16', '商品管理', '/product/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (6, '2020-02-04 17:09:53', '商品库存管理', '/sku/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (8, '2020-02-05 14:43:37', '订单管理', '/order/**', '', 2);
INSERT INTO `ums_resource` VALUES (9, '2020-02-05 14:44:22', ' 订单退货申请管理', '/returnApply/**', '', 2);
INSERT INTO `ums_resource` VALUES (10, '2020-02-05 14:45:08', '退货原因管理', '/returnReason/**', '', 2);
INSERT INTO `ums_resource` VALUES (11, '2020-02-05 14:45:43', '订单设置管理', '/orderSetting/**', '', 2);
INSERT INTO `ums_resource` VALUES (12, '2020-02-05 14:46:23', '收货地址管理', '/companyAddress/**', '', 2);
INSERT INTO `ums_resource` VALUES (13, '2020-02-07 16:37:22', '优惠券管理', '/coupon/**', '', 3);
INSERT INTO `ums_resource` VALUES (14, '2020-02-07 16:37:59', '优惠券领取记录管理', '/couponHistory/**', '', 3);
INSERT INTO `ums_resource` VALUES (15, '2020-02-07 16:38:28', '限时购活动管理', '/flash/**', '', 3);
INSERT INTO `ums_resource` VALUES (16, '2020-02-07 16:38:59', '限时购商品关系管理', '/flashProductRelation/**', '', 3);
INSERT INTO `ums_resource` VALUES (17, '2020-02-07 16:39:22', '限时购场次管理', '/flashSession/**', '', 3);
INSERT INTO `ums_resource` VALUES (18, '2020-02-07 16:40:07', '首页轮播广告管理', '/home/advertise/**', '', 3);
INSERT INTO `ums_resource` VALUES (19, '2020-02-07 16:40:34', '首页品牌管理', '/home/brand/**', '', 3);
INSERT INTO `ums_resource` VALUES (20, '2020-02-07 16:41:06', '首页新品管理', '/home/newProduct/**', '', 3);
INSERT INTO `ums_resource` VALUES (21, '2020-02-07 16:42:16', '首页人气推荐管理', '/home/recommendProduct/**', '', 3);
INSERT INTO `ums_resource` VALUES (22, '2020-02-07 16:42:48', '首页专题推荐管理', '/home/recommendSubject/**', '', 3);
INSERT INTO `ums_resource` VALUES (23, '2020-02-07 16:44:56', ' 商品优选管理', '/prefrenceArea/**', '', 5);
INSERT INTO `ums_resource` VALUES (24, '2020-02-07 16:45:39', '商品专题管理', '/subject/**', '', 5);
INSERT INTO `ums_resource` VALUES (25, '2020-02-07 16:47:34', '后台用户管理', '/admin/**', '', 4);
INSERT INTO `ums_resource` VALUES (26, '2020-02-07 16:48:24', '后台用户角色管理', '/role/**', '', 4);
INSERT INTO `ums_resource` VALUES (27, '2020-02-07 16:48:48', '后台菜单管理', '/menu/**', '', 4);
INSERT INTO `ums_resource` VALUES (28, '2020-02-07 16:49:18', '后台资源分类管理', '/resourceCategory/**', '', 4);
INSERT INTO `ums_resource` VALUES (29, '2020-02-07 16:49:45', '后台资源管理', '/resource/**', '', 4);
INSERT INTO `ums_resource` VALUES (30, '2020-09-19 15:47:57', '会员等级管理', '/memberLevel/**', '', 7);
INSERT INTO `ums_resource` VALUES (31, '2020-09-19 15:51:29', '获取登录用户信息', '/admin/info', '用户登录必配', 4);
INSERT INTO `ums_resource` VALUES (32, '2020-09-19 15:53:34', '用户登出', '/admin/logout', '用户登出必配', 4);

-- ----------------------------
-- Table structure for ums_resource_category
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource_category`;
CREATE TABLE `ums_resource_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `sort` int(4) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_resource_category
-- ----------------------------
INSERT INTO `ums_resource_category` VALUES (1, '2020-02-05 10:21:44', '商品模块', 0);
INSERT INTO `ums_resource_category` VALUES (2, '2020-02-05 10:22:34', '订单模块', 0);
INSERT INTO `ums_resource_category` VALUES (3, '2020-02-05 10:22:48', '营销模块', 0);
INSERT INTO `ums_resource_category` VALUES (4, '2020-02-05 10:23:04', '权限模块', 0);
INSERT INTO `ums_resource_category` VALUES (5, '2020-02-07 16:34:27', '内容模块', 0);
INSERT INTO `ums_resource_category` VALUES (7, '2020-09-19 15:49:08', '其他模块', 0);

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `admin_count` int(11) NULL DEFAULT NULL COMMENT '后台用户数量',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(1) NULL DEFAULT 1 COMMENT '启用状态：0->禁用；1->启用',
  `sort` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_role
-- ----------------------------
INSERT INTO `ums_role` VALUES (1, '商品管理员', '只能查看及操作商品', 0, '2020-02-03 16:50:37', 1, 0);
INSERT INTO `ums_role` VALUES (2, '订单管理员', '只能查看及操作订单', 0, '2018-09-30 15:53:45', 1, 0);
INSERT INTO `ums_role` VALUES (5, '超级管理员', '拥有所有查看和操作功能', 0, '2020-02-02 15:11:05', 1, 0);

-- ----------------------------
-- Table structure for ums_role_menu_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_menu_relation`;
CREATE TABLE `ums_role_menu_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 209 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台角色菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_role_menu_relation
-- ----------------------------
INSERT INTO `ums_role_menu_relation` VALUES (121, 1, 1);
INSERT INTO `ums_role_menu_relation` VALUES (122, 1, 2);
INSERT INTO `ums_role_menu_relation` VALUES (123, 1, 3);
INSERT INTO `ums_role_menu_relation` VALUES (124, 1, 4);
INSERT INTO `ums_role_menu_relation` VALUES (125, 1, 5);
INSERT INTO `ums_role_menu_relation` VALUES (126, 1, 6);
INSERT INTO `ums_role_menu_relation` VALUES (177, 2, 7);
INSERT INTO `ums_role_menu_relation` VALUES (178, 2, 8);
INSERT INTO `ums_role_menu_relation` VALUES (179, 2, 9);
INSERT INTO `ums_role_menu_relation` VALUES (180, 2, 10);
INSERT INTO `ums_role_menu_relation` VALUES (181, 2, 11);
INSERT INTO `ums_role_menu_relation` VALUES (182, 2, 26);
INSERT INTO `ums_role_menu_relation` VALUES (183, 5, 1);
INSERT INTO `ums_role_menu_relation` VALUES (184, 5, 2);
INSERT INTO `ums_role_menu_relation` VALUES (185, 5, 3);
INSERT INTO `ums_role_menu_relation` VALUES (186, 5, 4);
INSERT INTO `ums_role_menu_relation` VALUES (187, 5, 5);
INSERT INTO `ums_role_menu_relation` VALUES (188, 5, 6);
INSERT INTO `ums_role_menu_relation` VALUES (189, 5, 7);
INSERT INTO `ums_role_menu_relation` VALUES (190, 5, 8);
INSERT INTO `ums_role_menu_relation` VALUES (191, 5, 9);
INSERT INTO `ums_role_menu_relation` VALUES (192, 5, 10);
INSERT INTO `ums_role_menu_relation` VALUES (193, 5, 11);
INSERT INTO `ums_role_menu_relation` VALUES (194, 5, 26);
INSERT INTO `ums_role_menu_relation` VALUES (195, 5, 27);
INSERT INTO `ums_role_menu_relation` VALUES (196, 5, 12);
INSERT INTO `ums_role_menu_relation` VALUES (197, 5, 13);
INSERT INTO `ums_role_menu_relation` VALUES (198, 5, 14);
INSERT INTO `ums_role_menu_relation` VALUES (199, 5, 16);
INSERT INTO `ums_role_menu_relation` VALUES (200, 5, 17);
INSERT INTO `ums_role_menu_relation` VALUES (201, 5, 18);
INSERT INTO `ums_role_menu_relation` VALUES (202, 5, 19);
INSERT INTO `ums_role_menu_relation` VALUES (203, 5, 20);
INSERT INTO `ums_role_menu_relation` VALUES (204, 5, 21);
INSERT INTO `ums_role_menu_relation` VALUES (205, 5, 22);
INSERT INTO `ums_role_menu_relation` VALUES (206, 5, 23);
INSERT INTO `ums_role_menu_relation` VALUES (207, 5, 24);
INSERT INTO `ums_role_menu_relation` VALUES (208, 5, 25);

-- ----------------------------
-- Table structure for ums_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_permission_relation`;
CREATE TABLE `ums_role_permission_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `permission_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户角色和权限关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_role_permission_relation
-- ----------------------------
INSERT INTO `ums_role_permission_relation` VALUES (1, 1, 1);
INSERT INTO `ums_role_permission_relation` VALUES (2, 1, 2);
INSERT INTO `ums_role_permission_relation` VALUES (3, 1, 3);
INSERT INTO `ums_role_permission_relation` VALUES (4, 1, 7);
INSERT INTO `ums_role_permission_relation` VALUES (5, 1, 8);
INSERT INTO `ums_role_permission_relation` VALUES (6, 2, 4);
INSERT INTO `ums_role_permission_relation` VALUES (7, 2, 9);
INSERT INTO `ums_role_permission_relation` VALUES (8, 2, 10);
INSERT INTO `ums_role_permission_relation` VALUES (9, 2, 11);
INSERT INTO `ums_role_permission_relation` VALUES (10, 3, 5);
INSERT INTO `ums_role_permission_relation` VALUES (11, 3, 12);
INSERT INTO `ums_role_permission_relation` VALUES (12, 3, 13);
INSERT INTO `ums_role_permission_relation` VALUES (13, 3, 14);
INSERT INTO `ums_role_permission_relation` VALUES (14, 4, 6);
INSERT INTO `ums_role_permission_relation` VALUES (15, 4, 15);
INSERT INTO `ums_role_permission_relation` VALUES (16, 4, 16);
INSERT INTO `ums_role_permission_relation` VALUES (17, 4, 17);

-- ----------------------------
-- Table structure for ums_role_resource_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_resource_relation`;
CREATE TABLE `ums_role_resource_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 280 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台角色资源关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_role_resource_relation
-- ----------------------------
INSERT INTO `ums_role_resource_relation` VALUES (232, 2, 8);
INSERT INTO `ums_role_resource_relation` VALUES (233, 2, 9);
INSERT INTO `ums_role_resource_relation` VALUES (234, 2, 10);
INSERT INTO `ums_role_resource_relation` VALUES (235, 2, 11);
INSERT INTO `ums_role_resource_relation` VALUES (236, 2, 12);
INSERT INTO `ums_role_resource_relation` VALUES (237, 2, 31);
INSERT INTO `ums_role_resource_relation` VALUES (238, 2, 32);
INSERT INTO `ums_role_resource_relation` VALUES (239, 1, 1);
INSERT INTO `ums_role_resource_relation` VALUES (240, 1, 2);
INSERT INTO `ums_role_resource_relation` VALUES (241, 1, 3);
INSERT INTO `ums_role_resource_relation` VALUES (242, 1, 4);
INSERT INTO `ums_role_resource_relation` VALUES (243, 1, 5);
INSERT INTO `ums_role_resource_relation` VALUES (244, 1, 6);
INSERT INTO `ums_role_resource_relation` VALUES (245, 1, 23);
INSERT INTO `ums_role_resource_relation` VALUES (246, 1, 24);
INSERT INTO `ums_role_resource_relation` VALUES (247, 1, 31);
INSERT INTO `ums_role_resource_relation` VALUES (248, 1, 32);
INSERT INTO `ums_role_resource_relation` VALUES (249, 5, 1);
INSERT INTO `ums_role_resource_relation` VALUES (250, 5, 2);
INSERT INTO `ums_role_resource_relation` VALUES (251, 5, 3);
INSERT INTO `ums_role_resource_relation` VALUES (252, 5, 4);
INSERT INTO `ums_role_resource_relation` VALUES (253, 5, 5);
INSERT INTO `ums_role_resource_relation` VALUES (254, 5, 6);
INSERT INTO `ums_role_resource_relation` VALUES (255, 5, 8);
INSERT INTO `ums_role_resource_relation` VALUES (256, 5, 9);
INSERT INTO `ums_role_resource_relation` VALUES (257, 5, 10);
INSERT INTO `ums_role_resource_relation` VALUES (258, 5, 11);
INSERT INTO `ums_role_resource_relation` VALUES (259, 5, 12);
INSERT INTO `ums_role_resource_relation` VALUES (260, 5, 13);
INSERT INTO `ums_role_resource_relation` VALUES (261, 5, 14);
INSERT INTO `ums_role_resource_relation` VALUES (262, 5, 15);
INSERT INTO `ums_role_resource_relation` VALUES (263, 5, 16);
INSERT INTO `ums_role_resource_relation` VALUES (264, 5, 17);
INSERT INTO `ums_role_resource_relation` VALUES (265, 5, 18);
INSERT INTO `ums_role_resource_relation` VALUES (266, 5, 19);
INSERT INTO `ums_role_resource_relation` VALUES (267, 5, 20);
INSERT INTO `ums_role_resource_relation` VALUES (268, 5, 21);
INSERT INTO `ums_role_resource_relation` VALUES (269, 5, 22);
INSERT INTO `ums_role_resource_relation` VALUES (270, 5, 23);
INSERT INTO `ums_role_resource_relation` VALUES (271, 5, 24);
INSERT INTO `ums_role_resource_relation` VALUES (272, 5, 25);
INSERT INTO `ums_role_resource_relation` VALUES (273, 5, 26);
INSERT INTO `ums_role_resource_relation` VALUES (274, 5, 27);
INSERT INTO `ums_role_resource_relation` VALUES (275, 5, 28);
INSERT INTO `ums_role_resource_relation` VALUES (276, 5, 29);
INSERT INTO `ums_role_resource_relation` VALUES (277, 5, 30);
INSERT INTO `ums_role_resource_relation` VALUES (278, 5, 31);
INSERT INTO `ums_role_resource_relation` VALUES (279, 5, 32);

-- ----------------------------
-- Triggers structure for table pms_sku_stock
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_pms_sku_stock_before_update`;
delimiter ;;
CREATE TRIGGER `trg_pms_sku_stock_before_update` BEFORE UPDATE ON `pms_sku_stock` FOR EACH ROW BEGIN
    -- 保证lock_stock≥0（核心：解决释放库存时lock_stock为负的问题）
    IF NEW.lock_stock < 0 THEN
        SET NEW.lock_stock = 0;
    END IF;
    -- 保证stock≥0
    IF NEW.stock < 0 THEN
        SET NEW.stock = 0;
    END IF;
    -- 保证lock_stock不超过stock（避免锁定库存超卖）
    IF NEW.lock_stock > NEW.stock THEN
        SET NEW.lock_stock = NEW.stock;
    END IF;
    -- 记录最后操作时间（若传入了操作类型/关联ID）
    IF NEW.last_operate_type IS NOT NULL THEN
        SET NEW.last_operate_time = NOW();
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pms_sku_stock
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_pms_sku_stock_before_insert`;
delimiter ;;
CREATE TRIGGER `trg_pms_sku_stock_before_insert` BEFORE INSERT ON `pms_sku_stock` FOR EACH ROW BEGIN
    IF NEW.lock_stock IS NULL THEN
        SET NEW.lock_stock = 0;
    END IF;
    IF NEW.stock IS NULL THEN
        SET NEW.stock = 0;
    END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
