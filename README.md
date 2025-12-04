## 项目介绍

`mall`项目是一套电商系统，包括前台商城系统及后台管理系统，基于SpringBoot+MyBatis实现，采用Docker容器化部署。前台商城系统包含首页门户、商品推荐、商品搜索、商品展示、购物车、订单流程、会员中心、客户服务、帮助中心等模块。后台管理系统包含商品管理、订单管理、会员管理、促销管理、运营管理、内容管理、统计报表、财务管理、权限管理、设置等模块。

前端项目`Mall-web`地址：https://github.com/zjjjjkkk/Mall-web

#### 前台商城系统

前端项目`Mall-app-web`地址：https://github.com/zjjjjkkk/Mall-app-web

### 组织结构

``` lua
mall
├── mall-common -- 工具类及通用代码
├── mall-mbg -- MyBatisGenerator生成的数据库操作代码
├── mall-security -- SpringSecurity封装公用模块
├── mall-admin -- 后台商城管理系统接口
├── mall-search -- 基于Elasticsearch的商品搜索系统
├── mall-portal -- 前台商城系统接口
└── mall-demo -- 框架搭建时的测试代码
```

### 技术选型

#### 后端技术

| 技术                 | 说明                | 官网                                           |
| -------------------- | ------------------- | ---------------------------------------------- |
| SpringBoot           | Web应用开发框架      | https://spring.io/projects/spring-boot         |
| SpringSecurity       | 认证和授权框架      | https://spring.io/projects/spring-security     |
| MyBatis              | ORM框架             | http://www.mybatis.org/mybatis-3/zh/index.html |
| MyBatisGenerator     | 数据层代码生成器     | http://www.mybatis.org/generator/index.html    |
| Elasticsearch        | 搜索引擎            | https://github.com/elastic/elasticsearch       |
| RabbitMQ             | 消息队列            | https://www.rabbitmq.com/                      |
| Redis                | 内存数据存储         | https://redis.io/                              |
| MongoDB              | NoSql数据库         | https://www.mongodb.com                        |
| LogStash             | 日志收集工具        | https://github.com/elastic/logstash            |
| Kibana               | 日志可视化查看工具  | https://github.com/elastic/kibana              |
| Nginx                | 静态资源服务器      | https://www.nginx.com/                         |
| Docker               | 应用容器引擎        | https://www.docker.com                         |
| Jenkins              | 自动化部署工具      | https://github.com/jenkinsci/jenkins           |
| Druid                | 数据库连接池        | https://github.com/alibaba/druid               |
| OSS                  | 对象存储            | https://github.com/aliyun/aliyun-oss-java-sdk  |
| MinIO                | 对象存储            | https://github.com/minio/minio                 |
| JWT                  | JWT登录支持         | https://github.com/jwtk/jjwt                   |
| Lombok               | Java语言增强库      | https://github.com/rzwitserloot/lombok         |
| Hutool               | Java工具类库        | https://github.com/looly/hutool                |
| PageHelper           | MyBatis物理分页插件 | http://git.oschina.net/free/Mybatis_PageHelper |
| Swagger-UI           | API文档生成工具      | https://github.com/swagger-api/swagger-ui      |
| Hibernator-Validator | 验证框架            | http://hibernate.org/validator                 |

#### 前端技术

| 技术       | 说明                  | 官网                                   |
| ---------- | --------------------- | -------------------------------------- |
| Vue        | 前端框架              | https://vuejs.org/                     |
| Vue-router | 路由框架              | https://router.vuejs.org/              |
| Vuex       | 全局状态管理框架      | https://vuex.vuejs.org/                |
| Element    | 前端UI框架            | https://element.eleme.io               |
| Axios      | 前端HTTP框架          | https://github.com/axios/axios         |
| v-charts   | 基于Echarts的图表框架 | https://v-charts.js.org/               |
| Js-cookie  | cookie管理工具        | https://github.com/js-cookie/js-cookie |
| nprogress  | 进度条控件            | https://github.com/rstacruz/nprogress  |

#### 移动端技术

| 技术         | 说明             | 官网                                    |
| ------------ | ---------------- | --------------------------------------- |
| Vue          | 核心前端框架     | https://vuejs.org                       |
| Vuex         | 全局状态管理框架 | https://vuex.vuejs.org                  |
| uni-app      | 移动端前端框架   | https://uniapp.dcloud.io                |
| mix-mall     | 电商项目模板     | https://ext.dcloud.net.cn/plugin?id=200 |
| luch-request | HTTP请求框架     | https://github.com/lei-mu/luch-request  |

#### 架构图

##### 系统架构图

![系统架构图](./document/resource/re_mall_system_arch.jpg)

##### 业务架构图

![业务架构图](./document/resource/re_mall_business_arch.jpg)

#### 模块介绍

##### 后台管理系统 `mall-admin`

- 商品管理：[功能结构图-商品.jpg](document/resource/mind_product.jpg)
- 订单管理：[功能结构图-订单.jpg](document/resource/mind_order.jpg)
- 促销管理：[功能结构图-促销.jpg](document/resource/mind_sale.jpg)
- 内容管理：[功能结构图-内容.jpg](document/resource/mind_content.jpg)
- 用户管理：[功能结构图-用户.jpg](document/resource/mind_member.jpg)

**模块详细结构：**

```lua
mall-admin
├── src/main/java/com/macro/mall
│   ├── bo/                    # 业务对象
│   │   └── AdminUserDetails.java   # 管理员用户详情
│   ├── config/                # 配置类
│   │   ├── GlobalCorsConfig.java    # 全局CORS配置
│   │   ├── MallSecurityConfig.java  # Spring Security配置
│   │   ├── MyBatisConfig.java       # MyBatis配置
│   │   ├── OssConfig.java           # OSS配置
│   │   └── SwaggerConfig.java       # Swagger配置
│   ├── controller/            # 控制器
│   │   ├── CmsPrefrenceAreaController.java      # 商品优选管理
│   │   ├── CmsSubjectController.java            # 商品专题管理
│   │   ├── OmsOrderController.java              # 订单管理
│   │   ├── PmsProductController.java            # 商品管理
│   │   ├── SmsCouponController.java             # 优惠券管理
│   │   ├── UmsAdminController.java              # 管理员管理
│   │   └── UmsRoleController.java               # 角色权限管理
│   ├── dao/                   # 自定义DAO
│   │   ├── PmsProductDao.java                   # 商品自定义DAO
│   │   ├── OmsOrderDao.java                     # 订单自定义DAO
│   │   └── UmsAdminRoleRelationDao.java         # 管理员角色关系DAO
│   ├── dto/                   # 数据传输对象
│   │   ├── PmsProductParam.java                 # 商品参数
│   │   ├── OmsOrderQueryParam.java              # 订单查询参数
│   │   └── UmsAdminParam.java                   # 管理员参数
│   ├── service/               # 业务服务
│   │   ├── impl/              # 服务实现
│   │   │   ├── PmsProductServiceImpl.java       # 商品服务实现
│   │   │   ├── OmsOrderServiceImpl.java         # 订单服务实现
│   │   │   └── UmsAdminServiceImpl.java         # 管理员服务实现
│   │   ├── PmsProductService.java               # 商品服务
│   │   ├── OmsOrderService.java                 # 订单服务
│   │   └── UmsAdminService.java                 # 管理员服务
│   └── validator/             # 自定义验证器
│       ├── FlagValidator.java                   # 标志位验证器
│       └── FlagValidatorClass.java              # 标志位验证器类
└── src/main/resources
    ├── application.yml        # 主配置文件
    ├── application-dev.yml    # 开发环境配置
    ├── application-prod.yml   # 生产环境配置
    └── dao/                   # DAO映射文件
        ├── PmsProductDao.xml                    # 商品DAO映射
        ├── OmsOrderDao.xml                      # 订单DAO映射
        └── UmsAdminRoleRelationDao.xml          # 管理员角色关系DAO映射
```

##### 前台商城系统 `mall-portal`

[功能结构图-前台.jpg](document/resource/mind_portal.jpg)

**模块详细结构：**

```lua
mall-portal
├── src/main/java/com/macro/mall/portal
│   ├── component/             # 组件
│   │   ├── CancelOrderReceiver.java     # 取消订单消息接收者
│   │   ├── CancelOrderSender.java       # 取消订单消息发送者
│   │   └── OrderTimeOutCancelTask.java  # 订单超时取消任务
│   ├── config/                # 配置类
│   │   ├── MallSecurityConfig.java      # Spring Security配置
│   │   ├── RabbitMqConfig.java           # RabbitMQ配置
│   │   ├── SpringTaskConfig.java         # Spring Task配置
│   │   └── SwaggerConfig.java            # Swagger配置
│   ├── controller/            # 控制器
│   │   ├── HomeController.java           # 首页管理
│   │   ├── OmsCartItemController.java    # 购物车管理
│   │   ├── OmsPortalOrderController.java # 订单管理
│   │   ├── PmsPortalProductController.java # 商品管理
│   │   └── UmsMemberController.java      # 会员管理
│   ├── dao/                   # 自定义DAO
│   │   ├── HomeDao.java                  # 首页自定义DAO
│   │   ├── PortalOrderDao.java           # 订单自定义DAO
│   │   └── PortalProductDao.java         # 商品自定义DAO
│   ├── domain/                # 领域模型
│   │   ├── CartProduct.java              # 购物车商品
│   │   ├── ConfirmOrderResult.java       # 确认订单结果
│   │   ├── HomeContentResult.java        # 首页内容结果
│   │   └── OrderParam.java               # 订单参数
│   ├── repository/            # MongoDB Repository
│   │   ├── MemberProductCollectionRepository.java # 商品收藏Repository
│   │   └── MemberReadHistoryRepository.java       # 商品浏览历史Repository
│   ├── service/               # 业务服务
│   │   ├── impl/              # 服务实现
│   │   │   ├── HomeServiceImpl.java     # 首页服务实现
│   │   │   ├── OmsPortalOrderServiceImpl.java # 订单服务实现
│   │   │   └── UmsMemberServiceImpl.java # 会员服务实现
│   │   ├── HomeService.java              # 首页服务
│   │   ├── OmsPortalOrderService.java    # 订单服务
│   │   └── UmsMemberService.java         # 会员服务
│   └── util/                  # 工具类
│       └── DateUtil.java                 # 日期工具
└── src/main/resources
    ├── application.yml        # 主配置文件
    ├── application-dev.yml    # 开发环境配置
    ├── application-prod.yml   # 生产环境配置
    └── dao/                   # DAO映射文件
        ├── HomeDao.xml                   # 首页DAO映射
        ├── PortalOrderDao.xml            # 订单DAO映射
        └── PortalProductDao.xml          # 商品DAO映射
```

#### 开发进度

![项目开发进度图](./document/resource/re_mall_dev_flow.jpg)

## 环境搭建

### 开发工具

| 工具          | 说明                | 官网                                            |
| ------------- | ------------------- | ----------------------------------------------- |
| IDEA          | 开发IDE             | https://www.jetbrains.com/idea/download         |
| RedisDesktop  | redis客户端连接工具 | https://github.com/qishibo/AnotherRedisDesktopManager  |
| Robomongo     | mongo客户端连接工具 | https://robomongo.org/download                  |
| SwitchHosts   | 本地host管理        | https://oldj.github.io/SwitchHosts/             |
| X-shell       | Linux远程连接工具   | http://www.netsarang.com/download/software.html |
| Navicat       | 数据库连接工具      | http://www.formysql.com/xiazai.html             |
| PowerDesigner | 数据库设计工具      | http://powerdesigner.de/                        |
| Axure         | 原型设计工具        | https://www.axure.com/                          |
| MindMaster    | 思维导图设计工具    | http://www.edrawsoft.cn/mindmaster              |
| ScreenToGif   | gif录制工具         | https://www.screentogif.com/                    |
| ProcessOn     | 流程图绘制工具      | https://www.processon.com/                      |
| PicPick       | 图片处理工具        | https://picpick.app/zh/                         |
| Snipaste      | 屏幕截图工具        | https://www.snipaste.com/                       |
| Postman       | API接口调试工具      | https://www.postman.com/                        |
| Typora        | Markdown编辑器      | https://typora.io/                              |

### 开发环境

| 工具          | 版本号 | 下载                                                         |
| ------------- | ------ | ------------------------------------------------------------ |
| JDK           | 1.8    | https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html |
| MySQL         | 5.7    | https://www.mysql.com/                                       |
| Redis         | 7.0    | https://redis.io/download                                    |
| MongoDB       | 5.0    | https://www.mongodb.com/download-center                      |
| RabbitMQ      | 3.10.5 | http://www.rabbitmq.com/download.html                        |
| Nginx         | 1.22   | http://nginx.org/en/download.html                            |
| Elasticsearch | 7.17.3 | https://www.elastic.co/downloads/elasticsearch               |
| Logstash      | 7.17.3 | https://www.elastic.co/cn/downloads/logstash                 |
| Kibana        | 7.17.3 | https://www.elastic.co/cn/downloads/kibana                   |
