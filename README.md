# Mall 电商系统 v2.0

一个基于SpringBoot+MyBatis的全功能电商系统，包含前台商城系统和后台管理系统，支持Docker容器化部署。

## 📋 版本更新日志

### v2.0.0 (2025-12-9) - 重大功能更新

#### 🎉 核心新增功能

**1. UGC内容社区系统**
- ✅ 帖子发布功能：支持文本、图片、视频、混合媒体类型
- ✅ 帖子浏览与互动：帖子列表、详情查看、点赞功能
- ✅ 评论系统：评论、回复、评论点赞
- ✅ 评论审核：后台支持评论显示/隐藏管理
- ✅ 媒体上传：图片/视频直接上传到阿里云OSS
- ✅ 内容管理：帖子置顶、审核、删除功能

**2. 消息通知系统**
- ✅ 多类型通知：订单通知、评论通知、点赞通知、回复通知
- ✅ 未读提醒：用户中心显示未读消息数量徽章
- ✅ 消息管理：支持单条/全部标记已读
- ✅ 自动推送：系统自动发送各类通知

**3. 搜索优化功能**
- ✅ 搜索建议：输入关键词时实时显示搜索建议（基于历史记录）
- ✅ 搜索历史：记录用户搜索历史，支持本地和云端同步
- ✅ 热门搜索：显示热门搜索关键词
- ✅ 性能优化：使用Redis缓存搜索建议，提升响应速度

**4. 用户行为分析系统**
- ✅ 行为记录：自动记录用户浏览、搜索、点击、购买等行为
- ✅ 行为统计：支持按类型、按商品、按时间趋势统计
- ✅ 异步处理：使用异步处理记录行为，不影响主流程性能
- ✅ 数据分析：为运营决策提供数据支持

**5. 商品报修功能增强**
- ✅ 报修方式：支持邮寄到商家和线下到店两种方式
- ✅ 地图导航：集成高德地图，显示距离、步行/骑车时间
- ✅ 门店管理：根据商品品牌自动匹配授权维修门店
- ✅ 支付流程：维修完成后支付维修费并提交收货地址
- ✅ 发货管理：管理员发货，用户确认收货

**6. 个人资料管理**
- ✅ 资料编辑：用户名、性别、联系电话、个性签名编辑
- ✅ 头像上传：支持头像上传到OSS
- ✅ 实时更新：用户信息实时更新到Vuex状态

**7. 数据统计大屏**
- ✅ 订单趋势：支持按天/按小时查看订单趋势图表
- ✅ 销售排行：商品销售排行横向柱状图
- ✅ 地区分布：地区销售分布饼图
- ✅ 自定义查询：支持自定义日期范围查询

**8. 在线客服系统**
- ✅ 智能客服：关键词识别，自动回复预设问题
- ✅ 报修入口：识别"报修"关键词，自动获取最近订单
- ✅ 反馈功能：支持用户提交反馈

**9. 签到功能**
- ✅ 每日签到：用户每日签到获得10积分
- ✅ 签到记录：查询签到历史、连续签到天数
- ✅ 积分兑换：积分可用于兑换优惠券（1元=10积分）

**10. 退款功能增强**
- ✅ 退款管理：完整的退款申请、审核、处理流程
- ✅ 退款状态：支持待审核、退款中、已退款、已拒绝等状态
- ✅ 退款统计：后台支持退款统计查询

#### 🔧 技术优化

- ✅ **性能优化**：
  - Redis缓存搜索建议和热门关键词
  - 异步处理用户行为记录
  - 优化大文件上传（支持500MB，动态超时设置）

- ✅ **用户体验优化**：
  - 现代化UI设计（登录/注册页面重构）
  - 搜索体验优化（搜索建议、历史记录）
  - 消息通知实时提醒
  - 移动端适配优化

- ✅ **代码质量**：
  - 统一异常处理
  - 统一响应格式
  - 完善的API文档（Swagger）

#### 📊 数据库新增表

- `cms_ugc_post` - UGC帖子表
- `cms_ugc_post_like` - UGC帖子点赞表
- `cms_ugc_post_comment` - UGC帖子评论表
- `cms_ugc_post_comment_like` - UGC评论点赞表
- `ums_notification` - 消息通知表
- `pms_search_history` - 搜索历史表
- `ums_user_behavior` - 用户行为表
- `pms_repair` - 商品报修表（增强）
- `pms_brand_store` - 品牌门店表
- `ums_member_sign_in` - 会员签到表

#### 🎯 功能对比（v1.0 vs v2.0）

| 功能模块 | v1.0 | v2.0 |
|---------|------|------|
| 基础电商功能 | ✅ | ✅ |
| UGC内容社区 | ❌ | ✅ |
| 评论系统 | ❌ | ✅ |
| 消息通知 | ❌ | ✅ |
| 搜索优化 | ❌ | ✅ |
| 用户行为分析 | ❌ | ✅ |
| 商品报修 | ❌ | ✅ |
| 个人资料管理 | ❌ | ✅ |
| 数据统计大屏 | ❌ | ✅ |
| 在线客服 | ❌ | ✅ |
| 签到功能 | ❌ | ✅ |
| 积分兑换 | ❌ | ✅ |

---

### v1.0.0 - 基础版本

包含完整的电商基础功能：
- 商品管理、订单管理、购物车
- 会员管理、权限管理
- 优惠券、秒杀活动
- 支付功能（支付宝）
- 退款退货基础功能

## 📦 项目简介

Mall项目是一套完整的电商解决方案，采用前后端分离架构，分为前台商城系统和后台管理系统两大部分：

### 前台商城系统 (mall-portal)
- **首页门户**：轮播图、推荐商品、分类导航、品牌展示、秒杀专区
- **商品管理**：商品搜索（基于Elasticsearch）、商品分类浏览、商品详情展示
- **购物车系统**：添加、删除、修改购物车商品，支持促销计算
- **订单系统**：生成订单、支付（支持支付宝）、物流跟踪、订单管理
- **会员中心**：个人信息、订单历史、收藏夹、浏览历史、地址管理、个人资料编辑（新增）
- **积分系统**：每日签到获得积分、积分兑换优惠券、积分消费记录
- **退款退货**：退款申请、退货申请、退款/退货进度跟踪
- **优惠券系统**：优惠券领取、使用、积分兑换优惠券
- **商品报修**：报修申请（支持邮寄/线下到店）、报修进度查询、高德地图导航、支付维修费、确认收货（新增）
- **商品搜索**：全文搜索、搜索历史、热门搜索、搜索建议（新增）
- **在线客服**：智能客服、关键词识别、报修申请入口（新增）
- **UGC内容**：帖子发布、帖子列表、帖子详情、点赞功能、评论系统（评论、回复、点赞）、评论审核、图片/视频上传到OSS（新增）
- **消息通知**：订单通知、评论通知、点赞通知、未读消息提醒（新增）
- **用户行为分析**：浏览记录、搜索记录、点击记录、购买记录（新增）

### 后台管理系统 (mall-admin)
- **商品管理**：商品分类、品牌、属性、SKU、库存管理
- **订单管理**：订单查询、发货、退货处理、退款审核
- **会员管理**：会员信息管理、会员等级管理
- **促销管理**：优惠券管理、秒杀活动、满减活动、积分规则配置
- **内容管理**：广告管理、专题管理、帮助中心管理
- **商品报修管理**：报修列表查询、报修状态更新、报修详情查看、发货管理（新增）
- **UGC内容管理**：帖子列表查询、帖子审核、帖子置顶、帖子删除、评论管理、评论审核（新增）
- **数据大屏**：数据可视化展示，包括订单趋势、商品销售排行、地区销售分布（新增）
- **统计报表**：订单统计、商品统计、会员统计、用户行为统计（新增）
- **权限管理**：管理员、角色、权限、资源管理

### 前端项目
- **后台管理前端** (`web/`)：基于Vue.js + Element UI的Web管理后台
- **移动端前端** (`mall-app-web/`)：基于uni-app的跨平台移动应用

## 📁 项目结构

```text
mail/
├── mall-common          # 工具类及通用代码
│   ├── src/main/java/com/macro/mall/common/
│   │   ├── api/         # 统一响应格式
│   │   ├── domain/      # 通用领域模型（UgcPost、UgcPostLike等）
│   │   ├── enums/       # 枚举类（订单状态、退款状态等）
│   │   ├── exception/   # 异常处理
│   │   └── util/        # 工具类
│   └── pom.xml
├── mall-mbg             # MyBatis Generator生成的数据库操作代码
│   ├── src/main/java/com/macro/mall/
│   │   ├── mapper/      # Mapper接口
│   │   └── model/       # 实体类
│   └── src/main/resources/com/macro/mall/mapper/  # MyBatis XML映射文件
├── mall-security        # Spring Security封装公用模块
│   └── src/main/java/com/macro/mall/security/
│       ├── component/   # 安全组件
│       ├── config/      # 安全配置
│       └── util/        # JWT工具类
├── mall-admin           # 后台商城管理系统接口
│   ├── src/main/java/com/macro/mall/
│   │   ├── controller/  # 控制器（商品、订单、会员、UGC等管理接口）
│   │   │   ├── UgcPostController.java    # UGC帖子管理（新增）
│   │   │   ├── PmsRepairController.java  # 报修管理（含发货功能）
│   │   │   └── ...
│   │   ├── service/     # 业务服务层
│   │   ├── dao/         # 自定义DAO（含UgcPostDao）
│   │   ├── dto/         # 数据传输对象
│   │   └── validator/   # 自定义验证器
│   └── src/main/resources/
│       ├── dao/         # MyBatis XML映射文件（含UgcPostDao.xml）
│       └── application-dev.yml  # 开发环境配置
├── mall-search          # 基于Elasticsearch的商品搜索系统
│   └── src/main/java/com/macro/mall/search/
│       ├── dao/         # Elasticsearch数据访问
│       └── domain/     # 搜索领域模型
└── mall-portal          # 前台商城系统接口
    ├── src/main/java/com/macro/mall/portal/
    │   ├── controller/  # 控制器（用户、商品、订单、UGC等接口）
    │   │   ├── UgcPostController.java    # UGC帖子接口（新增）
    │   │   ├── PmsRepairController.java  # 报修接口（含支付、确认收货）
    │   │   ├── UmsMemberController.java  # 会员接口（含个人资料更新、头像上传）
    │   │   └── ...
    │   ├── service/     # 业务服务层
    │   ├── dao/         # 自定义DAO（含UgcPostDao、UgcPostLikeDao、BrandStoreDao）
    │   ├── domain/      # 领域模型（含UgcPostCreateParam、BrandStore）
    │   ├── repository/  # MongoDB Repository
    │   └── config/     # 配置类
    └── src/main/resources/
        ├── dao/         # MyBatis XML映射文件（含UgcPostDao.xml、UgcPostLikeDao.xml、BrandStoreDao.xml）
        └── application-dev.yml  # 开发环境配置
```

## 🛠️ 技术选型

### 后端技术栈

| 技术                 | 版本      | 说明                  |
| -------------------- | --------- | --------------------- |
| Spring Boot          | 2.7.5     | Web应用开发框架       |
| Spring Security      | 5.7.3     | 认证和授权框架        |
| MyBatis              | 3.5.10    | ORM框架               |
| MyBatis Generator    | 1.4.0     | 数据层代码生成器      |
| Elasticsearch        | 7.17.3    | 搜索引擎              |
| RabbitMQ             | 3.10.5    | 消息队列（订单超时取消）|
| Redis                | 7.0       | 内存数据存储（缓存、Session）|
| MongoDB              | 5.0       | NoSQL数据库（浏览历史、收藏等）|
| LogStash             | 7.17.3    | 日志收集工具          |
| Kibana               | 7.17.3    | 日志可视化工具        |
| Docker               | 20.10+    | 容器化部署工具        |
| Druid                | 1.2.11    | 数据库连接池          |
| OSS/MinIO            | -         | 对象存储（图片、文件）|
| JWT                  | 0.11.5    | 身份认证（Token机制）|
| Lombok               | 1.18.24   | Java语言增强库        |
| Hutool               | 5.8.11    | Java工具类库          |
| Swagger-UI           | 3.0.0     | API文档生成工具       |
| Hibernator-Validator | 6.2.3.Final | 验证框架           |

### 前端技术栈

| 技术         | 版本      | 说明                  |
| ------------ | --------- | --------------------- |
| Vue          | 2.6.14    | 前端框架              |
| Vue-router   | 3.5.4     | 路由框架              |
| Vuex         | 3.6.2     | 全局状态管理框架      |
| Element UI   | 2.15.12   | 后台管理UI框架        |
| uni-app      | 3.0.0     | 移动端前端框架        |
| Axios        | 0.27.2    | HTTP请求库            |
| ECharts      | 5.4.0     | 图表库                |

## 📊 系统架构

### 系统架构图
![系统架构图](./document/resource/re_mall_system_arch.jpg)

### 业务架构图
![业务架构图](./document/resource/re_mall_business_arch.jpg)

## 🧩 核心模块详解

### 后台管理系统 (`mall-admin`)

#### 功能模块

**1. 商品管理 (PMS)**
- **商品分类管理**：多级分类树形结构，支持分类排序
- **品牌管理**：品牌信息维护，品牌Logo上传
- **商品属性管理**：商品属性分类、属性值管理
- **商品信息管理**：
  - 商品基本信息（名称、价格、库存等）
  - 商品SKU管理（规格、价格、库存）
  - 商品图片管理（主图、详情图）
  - 商品上下架管理
  - 商品审核流程

**2. 订单管理 (OMS)**
- **订单列表**：订单查询、筛选、搜索
- **订单详情**：查看订单完整信息
- **订单发货**：订单发货、物流单号录入
- **退货管理**：退货申请审核、退货处理
- **退款管理**：退款申请审核、退款处理
- **订单设置**：订单超时时间、自动取消规则

**3. 促销管理 (SMS)**
- **优惠券管理**：
  - 优惠券创建（全场券、分类券、商品券）
  - 优惠券发放、使用统计
  - 优惠券有效期管理
- **秒杀活动管理**：
  - 秒杀场次设置
  - 秒杀商品管理
  - 秒杀库存管理
- **首页推荐管理**：
  - 首页轮播图管理
  - 推荐品牌管理
  - 推荐商品管理
  - 新品推荐管理

**4. 会员管理 (UMS)**
- **会员信息管理**：会员列表、会员详情查看
- **会员等级管理**：会员等级设置、权益配置
- **积分管理**：积分规则配置、积分记录查询

**5. 权限管理**
- **管理员管理**：管理员账号管理
- **角色管理**：角色创建、权限分配
- **权限管理**：权限资源管理
- **菜单管理**：后台菜单配置

#### 代码结构
```text
mall-admin
├── bo/          # 业务对象（Business Object）
├── config/      # 配置类（Spring配置、MyBatis配置等）
├── controller/  # 控制器（RESTful API接口）
│   ├── PmsProductController.java        # 商品管理接口
│   ├── PmsBrandController.java          # 品牌管理接口
│   ├── PmsRepairController.java         # 报修管理接口（新增）
│   ├── OmsOrderController.java          # 订单管理接口
│   ├── OmsRefundOrderController.java    # 退款管理接口
│   ├── OmsStatisticsController.java     # 数据统计接口（新增）
│   ├── SmsCouponController.java          # 优惠券管理接口
│   └── ...
├── dao/         # 自定义DAO（复杂查询）
├── dto/         # 数据传输对象（Data Transfer Object）
├── service/     # 业务服务接口
│   └── impl/    # 业务服务实现
└── validator/   # 自定义验证器
```

### 前台商城系统 (`mall-portal`)

#### 功能模块

**1. 首页模块**
- **轮播图展示**：首页广告轮播
- **商品推荐**：推荐商品、新品、热销商品展示
- **品牌展示**：推荐品牌列表
- **秒杀专区**：限时秒杀商品展示（含倒计时）
- **分类导航**：商品分类快速入口

**2. 商品模块**
- **商品搜索**：基于Elasticsearch的全文搜索
- **商品分类**：分类树展示、分类商品列表
- **商品详情**：
  - 商品基本信息展示
  - 商品图片轮播
  - 商品规格选择（SKU）
  - 商品库存查询
  - 商品评价查看
- **商品列表**：支持排序、筛选、分页

**3. 购物车模块**
- **购物车管理**：
  - 添加商品到购物车
  - 修改商品数量
  - 删除购物车商品
  - 购物车商品勾选
- **促销计算**：自动计算优惠券、满减等促销优惠
- **购物车结算**：跳转到订单确认页面

**4. 订单模块**
- **订单创建**：
  - 选择收货地址
  - 选择优惠券
  - 选择支付方式
  - 订单金额计算（含积分抵扣）
- **订单支付**：
  - 支付宝支付
  - 支付成功回调
- **订单管理**：
  - 订单列表（待付款、待发货、待收货、已完成）
  - 订单详情查看
  - 订单取消
  - 确认收货
- **退款退货**：
  - 退款申请（支持已完成订单）
  - 退货申请（支持已完成订单）
  - 退款/退货进度查询

**5. 会员模块**
- **用户注册/登录**：手机号注册、用户名登录
- **个人信息管理**：头像、昵称、性别等
- **收货地址管理**：地址增删改查、默认地址设置
- **收藏管理**：
  - 商品收藏
  - 品牌关注
- **浏览历史**：商品浏览记录（存储在MongoDB）
- **积分系统**：
  - **每日签到**：用户每日签到获得积分（10积分/次）
  - **签到记录**：查询签到历史、连续签到天数
  - **积分兑换**：使用积分兑换优惠券（1元=10积分）
  - **积分记录**：积分变化历史查询

**6. 优惠券模块**
- **优惠券列表**：可领取优惠券列表
- **优惠券领取**：领取优惠券
- **我的优惠券**：已领取优惠券列表（未使用、已使用、已过期）
- **积分兑换优惠券**：使用积分兑换优惠券

#### 代码结构
```text
mall-portal
├── component/   # 组件（消息队列发送接收组件）
├── config/      # 配置类
│   ├── MallSecurityConfig.java      # Spring Security配置
│   ├── MyBatisConfig.java           # MyBatis配置
│   ├── SwaggerConfig.java           # Swagger配置
│   └── ...
├── controller/  # 控制器
│   ├── HomeController.java                    # 首页接口
│   ├── PmsPortalProductController.java         # 商品接口
│   ├── OmsCartItemController.java             # 购物车接口
│   ├── OmsPortalOrderController.java           # 订单接口
│   ├── OmsRefundOrderController.java           # 退款接口
│   ├── UmsMemberController.java                # 会员接口（含个人资料、头像上传）
│   ├── UmsMemberSignInController.java         # 签到接口
│   ├── UmsMemberCouponController.java         # 优惠券接口
│   ├── PmsRepairController.java               # 报修接口（含支付、确认收货）
│   ├── UgcPostController.java                 # UGC帖子接口（新增）
│   ├── LocationController.java                # 定位接口（新增）
│   └── ...
├── dao/         # 自定义DAO
│   ├── UgcPostDao.java              # UGC帖子DAO（新增）
│   ├── UgcPostLikeDao.java          # UGC点赞DAO（新增）
│   ├── BrandStoreDao.java           # 品牌门店DAO（新增）
│   └── ...
├── domain/      # 领域模型
│   ├── OrderParam.java              # 订单参数
│   ├── RefundApplyParam.java        # 退款申请参数
│   ├── UgcPostCreateParam.java      # UGC帖子创建参数（新增）
│   ├── BrandStore.java              # 品牌门店信息（新增）
│   └── ...
├── repository/  # MongoDB Repository
│   ├── MemberReadHistoryRepository.java       # 浏览历史
│   ├── MemberProductCollectionRepository.java # 商品收藏
│   └── ...
└── service/     # 业务服务
    ├── impl/    # 服务实现
    │   ├── UmsMemberSignInServiceImpl.java    # 签到服务实现（新增）
    │   └── ...
    └── ...
```

## 🚀 快速开始

### 开发环境要求

| 工具          | 版本要求  | 说明                  |
| ------------- | --------- | --------------------- |
| JDK           | 1.8+      | Java开发环境          |
| Maven         | 3.6+      | 项目构建工具          |
| MySQL         | 5.7+      | 关系型数据库          |
| Redis         | 7.0+      | 缓存数据库            |
| MongoDB       | 5.0+      | NoSQL数据库           |
| RabbitMQ      | 3.10+     | 消息队列              |
| Elasticsearch | 7.17+     | 搜索引擎              |
| Nginx         | 1.20+     | Web服务器（可选）     |

### 开发工具推荐

| 工具          | 用途                  |
| ------------- | --------------------- |
| IDEA          | Java开发IDE           |
| RedisDesktop  | Redis客户端          |
| Navicat       | 数据库连接工具        |
| Postman       | API接口调试工具       |
| HBuilderX     | uni-app开发工具       |
| VS Code       | 前端开发工具          |

### 数据库初始化

1. **创建数据库**
   ```sql
   CREATE DATABASE mall CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
   ```

2. **导入数据库脚本**
   ```bash
   # 导入主数据库脚本
   mysql -u root -p mall < document/sql/mall.sql
   
   # 导入签到表脚本
   mysql -u root -p mall < document/sql/mall_sign_in.sql
   
   # 导入报修表脚本（新增功能）
   mysql -u root -p mall < document/sql/mall_repair.sql
   
   # 导入UGC表脚本（新增功能）
   mysql -u root -p mall < document/sql/mall_ugc.sql
   mysql -u root -p mall < document/sql/mall_ugc_comment.sql
   
   # 导入数据统计表脚本（新增功能）
   mysql -u root -p mall < document/sql/mall_statistics.sql
   
   # 导入品牌门店表脚本（新增功能）
   mysql -u root -p mall < document/sql/mall_brand_store.sql
   
   # 导入消息通知表脚本（新增功能）
   mysql -u root -p mall < document/sql/mall_notification.sql
   
   # 导入搜索历史表脚本（新增功能）
   mysql -u root -p mall < document/sql/mall_search_history.sql
   
   # 导入用户行为表脚本（新增功能）
   mysql -u root -p mall < document/sql/mall_user_behavior.sql
   ```

3. **数据库表说明**
   - `ums_member`：会员表
   - `ums_member_sign_in`：会员签到表
   - `ums_integration_change_history`：积分变化历史表
   - `sms_coupon`：优惠券表
   - `sms_coupon_history`：优惠券领取历史表
   - `oms_order`：订单表
   - `oms_refund_order`：退款订单表
   - `pms_product`：商品表
   - `pms_repair`：商品报修表（含支付、发货、确认收货字段）
   - `pms_brand_store`：品牌门店表（新增）
- `cms_ugc_post`：UGC帖子表（新增）
- `cms_ugc_post_like`：UGC帖子点赞表（新增）
- `cms_ugc_post_comment`：UGC帖子评论表（新增）
- `cms_ugc_post_comment_like`：UGC评论点赞表（新增）
- `ums_notification`：消息通知表（新增）
- `pms_search_history`：搜索历史表（新增）
- `ums_user_behavior`：用户行为表（新增）
- `pms_brand`：品牌表（新增地址、经纬度字段）
   - `oms_statistics_daily`：每日统计数据表（新增）
   - `oms_statistics_hourly`：每小时统计数据表（新增）
   - `oms_statistics_product`：商品统计数据表（新增）
   - `oms_statistics_region`：地区统计数据表（新增）
   - `ums_member`：会员表（新增个性化签名、头像字段）
   - 更多表结构请查看 `document/pdm/` 目录

### 配置文件说明

**mall-portal配置** (`mall-portal/src/main/resources/application-dev.yml`)
```yaml
server:
  port: 8085  # 前台服务端口

spring:
  datasource:
    url: jdbc:mysql://localhost:3306/mall
    username: root
    password: 1234
  redis:
    host: localhost
    port: 6379
  data:
    mongodb:
      host: localhost
      port: 27017
      database: mall-port
```

**mall-admin配置** (`mall-admin/src/main/resources/application-dev.yml`)
```yaml
server:
  port: 8080  # 后台服务端口
```

### 项目启动步骤

1. **启动中间件服务**
   ```bash
   # 启动Redis
   redis-server
   
   # 启动MongoDB
   mongod
   
   # 启动RabbitMQ
   rabbitmq-server
   
   # 启动Elasticsearch
   elasticsearch
   ```

2. **启动后端服务**
   ```bash
   # 方式1：使用Maven启动
   cd mall-admin
   mvn spring-boot:run
   
   cd mall-portal
   mvn spring-boot:run
   
   # 方式2：使用IDE直接运行
   # 运行 MallAdminApplication.java
   # 运行 MallPortalApplication.java
   ```

3. **启动前端服务**
   ```bash
   # 后台管理前端
   cd web
   npm install
   npm run dev
   
   # 移动端前端（H5）
   cd mall-app-web
   npm install
   npm run dev:h5
   ```

4. **访问服务**
   - 后台管理系统：http://localhost:8092
   - 前台商城系统（H5）：http://localhost:8080（uni-app H5端口）
   - API文档（后台）：http://localhost:8080/swagger-ui.html
   - API文档（前台）：http://localhost:8085/swagger-ui.html

## 🔑 核心功能详解

### 1. 商品报修功能（新增）

**功能说明**：用户可以对已购买的商品申请报修，支持邮寄到商家或线下到店两种方式。

**数据库表**：`pms_repair`
- 记录报修信息、订单信息、商品信息、品牌信息
- 支持邮寄和线下到店两种报修方式
- 包含位置信息（经纬度、地址、距离、时间）

**API接口**（前台）：
- `POST /repair/create` - 创建报修申请
- `GET /repair/myList` - 获取我的报修列表
- `GET /repair/detail/{id}` - 获取报修详情
- `POST /repair/cancel/{id}` - 取消报修
- `POST /repair/pay/{id}` - 支付维修费并提交收货信息（新增）
- `POST /repair/confirmReceive/{id}` - 确认收货（新增）
- `GET /brand/store/list` - 根据品牌名获取门店列表（新增）

**API接口**（后台）：
- `GET /pms/repair/list` - 分页查询报修列表
- `GET /pms/repair/{id}` - 获取报修详情
- `POST /pms/repair/updateStatus/{id}` - 更新报修状态
- `POST /pms/repair/deliver/{id}` - 管理员发货（新增）

**功能特性**：
- 支持邮寄到商家（填写邮寄地址）
- 支持线下到店（集成高德地图，显示距离、步行时间、骑车时间）
- 自动计算用户到商家的距离和时间
- 支持图片上传（报修图片）
- 后台可更新报修状态和进度
- **报修支付流程**：维修完成后用户支付200元维修费并提交收货地址，管理员发货，用户确认收货（新增）
- **品牌门店管理**：根据商品品牌自动匹配门店，支持门店评分、地址、营业时间展示（新增）

### 2. 签到功能

**功能说明**：用户每日签到可获得积分，积分可用于兑换优惠券。

**数据库表**：`ums_member_sign_in`
- 记录用户每日签到信息
- 唯一索引确保每日只能签到一次

**API接口**：
- `POST /member/signIn/sign` - 用户签到
- `GET /member/signIn/checkToday` - 查询今日是否已签到
- `GET /member/signIn/recent/{days}` - 查询最近N天签到记录
- `GET /member/signIn/currentMonth` - 查询本月签到记录
- `GET /member/signIn/continuousDays` - 查询连续签到天数

**积分规则**：
- 每次签到获得：10积分
- 积分兑换优惠券：1元 = 10积分（可配置）

### 3. 积分兑换优惠券

**功能说明**：用户可以使用积分兑换优惠券。

**API接口**：
- `POST /member/coupon/exchange/{couponId}` - 使用积分兑换优惠券

**兑换规则**：
- 优惠券金额 × 10 = 所需积分
- 例如：10元优惠券需要100积分

### 4. 退款功能

**功能说明**：支持用户申请退款，管理员审核退款。

**退款状态**：
- 0 - 待审核
- 1 - 退款中
- 2 - 已退款
- 3 - 已拒绝
- 4 - 退款失败
- 5 - 已取消（用户主动取消）

**API接口**：
- `POST /order/refundOrder/apply` - 提交退款申请
- `GET /order/refundOrder/list` - 查询退款列表
- `GET /order/refundOrder/{id}` - 查询退款详情
- `POST /order/refundOrder/cancel/{id}` - 取消退款申请（前台）

### 5. 商品搜索

**功能说明**：基于Elasticsearch实现商品全文搜索。

**搜索功能**：
- 关键词搜索
- 分类筛选
- 价格排序
- 销量排序
- 分页加载

**API接口**：
- `GET /product/search` - 商品搜索接口
  - 支持关键词搜索
  - 支持分类筛选
  - 支持品牌筛选
  - 支持排序（综合、新品、销量、价格）

### 6. 定位服务（新增）

**功能说明**：提供基于高德地图的定位和地址解析服务。

**API接口**：
- `GET /location/reverse` - 逆地理编码（根据经纬度获取地址）
  - 参数：`lat`（纬度）、`lng`（经度）
  - 返回：省、市、区、详细地址等信息

### 7. 订单超时自动取消

**功能说明**：使用RabbitMQ延迟消息实现订单超时自动取消。

**实现方式**：
- 订单创建时发送延迟消息
- 消息队列延迟时间到达后自动取消订单
- 释放库存和优惠券

### 8. UGC内容功能（新增）

**功能说明**：用户生成内容（User-Generated Content）系统，支持用户发布帖子、点赞互动。

**数据库表**：
- `cms_ugc_post` - UGC帖子表
  - 记录帖子标题、内容、封面图、媒体URL（图片/视频）
  - 支持文本、图片、视频、混合媒体类型
  - 状态管理（草稿、发布）
  - 置顶功能
  - 点赞数、浏览数、评论数统计
- `cms_ugc_post_like` - UGC帖子点赞表
  - 记录用户点赞记录
  - 唯一索引确保用户对同一帖子只能点赞一次

**API接口**（前台）：
- `GET /ugc/post/list` - 获取帖子列表（分页）
- `GET /ugc/post/detail/{id}` - 获取帖子详情
- `POST /ugc/post/create` - 发布帖子
- `POST /ugc/post/like/{id}` - 点赞帖子
- `POST /ugc/post/unlike/{id}` - 取消点赞
- `POST /ugc/post/upload` - 上传图片/视频到OSS
- `GET /ugc/post/{postId}/comments` - 获取帖子评论列表
- `POST /ugc/post/comment` - 发表评论
- `GET /ugc/post/comment/{parentId}/replies` - 获取评论回复列表
- `POST /ugc/post/comment/like/{commentId}` - 点赞评论
- `POST /ugc/post/comment/unlike/{commentId}` - 取消点赞评论
- `GET /notification/list` - 获取消息通知列表
- `GET /notification/unreadCount` - 获取未读消息数量
- `POST /notification/read/{id}` - 标记消息为已读
- `POST /notification/readAll` - 标记所有消息为已读
- `GET /search/suggestions` - 获取搜索建议
- `GET /search/hot` - 获取热门搜索关键词
- `GET /search/history` - 获取搜索历史
- `POST /search/history` - 保存搜索历史
- `DELETE /search/history` - 清除搜索历史

**API接口**（后台）：
- `GET /ugc/post/list` - 分页查询帖子（支持关键词、状态、置顶筛选）
- `GET /ugc/post/{id}` - 获取帖子详情
- `POST /ugc/post/create` - 创建帖子
- `POST /ugc/post/update/{id}` - 更新帖子
- `POST /ugc/post/delete` - 批量删除帖子
- `POST /ugc/post/updateStatus` - 批量更新状态
- `POST /ugc/post/updateTopStatus` - 批量更新置顶状态
- `GET /ugc/post/{postId}/comments` - 获取帖子评论列表
- `GET /ugc/post/{postId}/likes` - 获取帖子点赞列表
- `POST /ugc/post/comment/delete` - 删除评论
- `POST /ugc/post/comment/deleteBatch` - 批量删除评论
- `GET /statistics/behavior/type` - 用户行为统计（按类型）
- `GET /statistics/behavior/product` - 商品行为统计
- `GET /statistics/behavior/trend` - 用户行为趋势统计

**功能特性**：
- **帖子发布**：支持纯文本、图片、视频、混合媒体类型
- **媒体上传**：图片和视频直接上传到阿里云OSS
- **点赞互动**：用户可以对帖子进行点赞/取消点赞
- **评论系统**：支持评论、回复、评论点赞、评论审核（新增）
- **内容审核**：后台可审核帖子，支持发布、下架、删除
- **置顶功能**：后台可设置帖子置顶
- **数据统计**：自动统计点赞数、浏览数、评论数
- **消息通知**：评论、点赞自动发送通知给用户（新增）

### 9. 个人资料管理（新增）

**功能说明**：用户可编辑个人资料，包括用户名、性别、联系电话、个性签名、头像。

**API接口**：
- `POST /sso/profile/update` - 更新个人资料
- `POST /sso/avatar/upload` - 上传头像到OSS

**功能特性**：
- 支持用户名、性别、联系电话、个性签名编辑
- 头像上传到阿里云OSS
- 实时更新用户信息到Vuex状态

### 10. 品牌门店管理（新增）

**功能说明**：根据商品品牌自动匹配对应的授权维修门店，支持门店信息展示和选择。

**数据库表**：`pms_brand_store`
- 记录品牌门店信息（名称、电话、地址、经纬度、评分、营业时间）
- 支持多品牌门店管理（小米、华为、Apple、OPPO、三星、ASUS、HP、Dell、Lenovo等）

**API接口**：
- `GET /brand/store/list` - 根据品牌名获取门店列表

**功能特性**：
- 根据商品品牌自动匹配门店
- 支持门店评分、地址、营业时间展示
- 支持门店选择（报修时使用）

### 11. 消息通知系统（新增）

**功能说明**：提供完整的消息通知系统，支持订单、评论、点赞等各类通知。

**数据库表**：`ums_notification`
- 记录通知类型、标题、内容、来源类型、来源ID、关联ID
- 支持已读/未读状态管理
- 支持多种通知类型（订单、评论、点赞等）

**API接口**：
- `GET /notification/list` - 获取消息通知列表
- `GET /notification/unreadCount` - 获取未读消息数量
- `POST /notification/read/{id}` - 标记消息为已读
- `POST /notification/readAll` - 标记所有消息为已读

**功能特性**：
- **通知类型**：订单通知、评论通知、点赞通知、回复通知
- **未读提醒**：用户中心显示未读消息数量
- **自动发送**：系统自动发送通知（评论、点赞等）
- **已读管理**：支持单条已读和全部已读

### 12. 搜索优化功能（新增）

**功能说明**：优化搜索体验，提供搜索建议、搜索历史、热门搜索等功能。

**数据库表**：`pms_search_history`
- 记录用户搜索历史
- 支持搜索关键词统计
- 支持热门关键词查询

**API接口**：
- `GET /search/suggestions` - 获取搜索建议（基于历史记录）
- `GET /search/hot` - 获取热门搜索关键词
- `GET /search/history` - 获取搜索历史
- `POST /search/history` - 保存搜索历史
- `DELETE /search/history` - 清除搜索历史

**功能特性**：
- **搜索建议**：输入关键词时自动显示搜索建议（Redis缓存）
- **搜索历史**：记录用户搜索历史，支持本地和云端同步
- **热门搜索**：显示热门搜索关键词
- **性能优化**：使用Redis缓存搜索建议，提升响应速度

### 13. 用户行为分析（新增）

**功能说明**：记录和分析用户行为，包括浏览、搜索、点击、购买等行为。

**数据库表**：`ums_user_behavior`
- 记录用户行为类型、来源类型、来源ID、来源名称
- 记录IP地址、User-Agent等信息
- 支持行为统计分析

**API接口**（后台）：
- `GET /statistics/behavior/type` - 用户行为统计（按类型）
- `GET /statistics/behavior/product` - 商品行为统计
- `GET /statistics/behavior/trend` - 用户行为趋势统计

**功能特性**：
- **行为记录**：自动记录用户浏览、搜索、点击、购买等行为（异步处理）
- **行为统计**：支持按类型、按商品、按时间趋势统计
- **性能优化**：使用异步处理记录行为，不影响主流程性能

### 14. 数据大屏功能（新增）

**功能说明**：提供数据可视化展示，包括订单趋势、商品销售排行、地区销售分布等。

**数据库表**：
- `oms_statistics_daily` - 每日统计数据表
- `oms_statistics_hourly` - 每小时统计数据表
- `oms_statistics_product` - 商品统计数据表
- `oms_statistics_region` - 地区统计数据表

**API接口**（后台）：
- `GET /statistics/trend` - 获取订单趋势数据（支持按天/按小时）
- `GET /statistics/product/ranking` - 获取商品销售排行
- `GET /statistics/region/distribution` - 获取地区销售分布

**功能特性**：
- **订单趋势图表**：支持按天/按小时查看，自定义日期范围，显示订单数、订单金额、已支付订单数、已支付金额
- **商品销售排行**：横向柱状图展示商品销量排行，支持自定义日期范围
- **地区销售分布**：饼图展示各地区销售额占比，支持自定义日期范围
- **手动刷新**：支持手动刷新所有图表数据

## 🐳 Docker部署

### 使用Docker Compose部署

```bash
# 构建镜像
docker-compose -f document/docker/docker-compose-app.yml build

# 启动服务
docker-compose -f document/docker/docker-compose-app.yml up -d

# 查看日志
docker-compose -f document/docker/docker-compose-app.yml logs -f

# 停止服务
docker-compose -f document/docker/docker-compose-app.yml down
```

## 📝 开发规范

### 代码风格
- 遵循阿里巴巴Java开发规范
- 使用Lombok简化代码
- 接口使用Swagger注解文档
- 统一异常处理
- 统一响应格式（CommonResult）

### 数据库设计
- 表名使用下划线命名（如：`ums_member`）
- 字段名使用下划线命名（如：`member_id`）
- 合理使用索引
- 主键使用自增ID

### 接口设计
- RESTful风格接口
- 统一响应格式：`CommonResult<T>`
- 统一异常处理
- 接口文档使用Swagger注解

### 命名规范
- Controller：`XxxController`
- Service接口：`XxxService`
- Service实现：`XxxServiceImpl`
- Mapper接口：`XxxMapper`
- 实体类：`Xxx`

## 🔧 常用功能

### 商品管理
- 商品分类、品牌管理
- 商品添加、编辑、上下架
- 商品库存管理
- 商品SKU管理

### 订单管理
- 订单查询、发货
- 退货、退款处理
- 订单统计
- 订单超时自动取消

### 促销管理
- 优惠券发放
- 满减活动设置
- 积分规则配置
- 秒杀活动管理

### 会员管理
- 会员信息管理
- 会员等级管理
- 积分管理
- 签到管理（新增）

## 📄 文档说明

- **数据库设计**：`document/pdm/`目录（PowerDesigner文件）
- **数据库脚本**：`document/sql/`目录
  - `mall.sql` - 主数据库脚本
  - `mall_sign_in.sql` - 签到表脚本
  - `mall_repair.sql` - 报修表脚本（新增）
  - `mall_ugc.sql` - UGC表脚本（新增）
  - `mall_ugc_comment.sql` - UGC评论表脚本（新增）
  - `mall_brand_store.sql` - 品牌门店表脚本（新增）
  - `mall_statistics.sql` - 数据统计表脚本（新增）
  - `mall_notification.sql` - 消息通知表脚本（新增）
  - `mall_search_history.sql` - 搜索历史表脚本（新增）
  - `mall_user_behavior.sql` - 用户行为表脚本（新增）
- **API文档**：Swagger UI，启动后访问
  - 后台API：http://localhost:8080/swagger-ui.html
  - 前台API：http://localhost:8085/swagger-ui.html
- **部署文档**：`document/reference/`目录
- **开发文档**：`document/mind/`目录（思维导图）
- **Docker配置**：`document/docker/`目录

## 🔐 默认账号

### 后台管理系统
- 管理员账号：`admin`
- 管理员密码：`macro123`

### 前台商城系统
- 测试账号：`test`
- 测试密码：`123456`

## 🐛 常见问题

### 1. 数据库连接失败
- 检查MySQL服务是否启动
- 检查配置文件中的数据库连接信息
- 确认数据库已创建并导入脚本

### 2. Redis连接失败
- 检查Redis服务是否启动
- 检查配置文件中的Redis连接信息

### 3. 接口404错误
- 确认后端服务已启动
- 检查Controller是否被正确扫描
- 查看启动日志是否有错误信息

### 4. 签到功能不工作
- 确认已执行 `mall_sign_in.sql` 创建签到表
- 检查Mapper XML文件是否正确加载
- 确认后端服务已重启

## 🤝 贡献指南

1. Fork 项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开 Pull Request

## 📄 许可证

该项目使用 MIT 许可证，详情请查看 [LICENSE](LICENSE) 文件。

## 📞 联系方式

如有问题或建议，欢迎提交 Issue 或 Pull Request。

---

**感谢使用 Mall 电商系统！** 🎉
