# Mall 电商系统

一个基于SpringBoot+MyBatis的全功能电商系统，包含前台商城系统和后台管理系统，支持Docker容器化部署。

## 📦 项目简介

Mall项目是一套完整的电商解决方案，分为前台商城系统和后台管理系统两大部分：

### 前台商城系统
- 首页门户、商品推荐、商品搜索、商品展示
- 购物车、订单流程、会员中心
- 客户服务、帮助中心等功能模块

### 后台管理系统
- 商品管理、订单管理、会员管理
- 促销管理、运营管理、内容管理
- 统计报表、财务管理、权限管理

### 前端项目
- 后台管理前端：https://github.com/zjjjjkkk/Mall-web
- 移动端前端：https://github.com/zjjjjkkk/Mall-app-web

## 📁 项目结构

```text
mall
├── mall-common          # 工具类及通用代码
├── mall-mbg             # MyBatis Generator生成的数据库操作代码
├── mall-security        # Spring Security封装公用模块
├── mall-admin           # 后台商城管理系统接口
├── mall-search          # 基于Elasticsearch的商品搜索系统
└── mall-portal          # 前台商城系统接口
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
| RabbitMQ             | 3.10.5    | 消息队列              |
| Redis                | 7.0       | 内存数据存储          |
| MongoDB              | 5.0       | NoSQL数据库           |
| LogStash             | 7.17.3    | 日志收集工具          |
| Kibana               | 7.17.3    | 日志可视化工具        |
| Docker               | 20.10+    | 容器化部署工具        |
| Druid                | 1.2.11    | 数据库连接池          |
| OSS/MinIO            | -         | 对象存储              |
| JWT                  | 0.11.5    | 身份认证              |
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

## 🧩 核心模块

### 后台管理系统 (`mall-admin`)

#### 功能模块
- **商品管理**：商品分类、品牌、属性、SKU等管理
- **订单管理**：订单查询、发货、退货、退款处理
- **促销管理**：优惠券、满减活动、积分管理
- **内容管理**：广告、专题、帮助中心管理
- **用户管理**：管理员、角色、权限管理

#### 代码结构
```text
mall-admin
├── bo/          # 业务对象
├── config/      # 配置类
├── controller/  # 控制器
├── dao/         # 自定义DAO
├── dto/         # 数据传输对象
├── service/     # 业务服务
│   └── impl/    # 服务实现
└── validator/   # 自定义验证器
```

### 前台商城系统 (`mall-portal`)

#### 功能模块
- **首页门户**：轮播图、推荐商品、分类导航
- **商品搜索**：基于Elasticsearch的商品搜索
- **购物车**：添加、删除、修改购物车商品
- **订单系统**：生成订单、支付、物流跟踪
- **会员中心**：个人信息、订单历史、收藏夹

#### 代码结构
```text
mall-portal
├── component/   # 组件
├── config/      # 配置类
├── controller/  # 控制器
├── dao/         # 自定义DAO
├── domain/      # 领域模型
├── repository/  # MongoDB Repository
└── service/     # 业务服务
    └── impl/    # 服务实现
```

## 🚀 快速开始

### 开发环境要求

| 工具          | 版本要求  |
| ------------- | --------- |
| JDK           | 1.8+      |
| MySQL         | 5.7+      |
| Redis         | 7.0+      |
| MongoDB       | 5.0+      |
| RabbitMQ      | 3.10+     |
| Nginx         | 1.20+     |
| Elasticsearch | 7.17+     |

### 开发工具推荐

| 工具          | 用途                  |
| ------------- | --------------------- |
| IDEA          | Java开发IDE           |
| RedisDesktop  | Redis客户端          |
| Navicat       | 数据库连接工具        |
| Postman       | API接口调试工具       |
| Typora        | Markdown编辑器       |
| Snipaste      | 屏幕截图工具          |

### 项目启动步骤

1. **克隆项目**
   ```bash
   git clone https://github.com/your-repo/mall.git
   cd mall
   ```

2. **创建数据库并导入数据**
   - 创建数据库：`mall`
   - 导入SQL文件：`document/sql/mall.sql`

3. **修改配置文件**
   - 修改各模块的`application-dev.yml`配置
   - 配置MySQL、Redis、MongoDB等服务地址

4. **启动服务**
   - 启动Elasticsearch、Redis、MongoDB、RabbitMQ等中间件
   - 依次启动各模块服务：
     ```bash
     # 启动mall-admin
     cd mall-admin
     mvn spring-boot:run
     
     # 启动mall-portal
     cd mall-portal
     mvn spring-boot:run
     
     # 启动mall-search
     cd mall-search
     mvn spring-boot:run
     ```

5. **访问服务**
   - 后台管理系统：http://localhost:8080
   - 前台商城系统：http://localhost:8085
   - API文档：http://localhost:8080/swagger-ui.html

## 🐳 Docker部署

```bash
# 构建镜像
docker-compose -f document/docker/docker-compose-app.yml build

# 启动服务
docker-compose -f document/docker/docker-compose-app.yml up -d
```

## 📝 开发规范

### 代码风格
- 遵循阿里巴巴Java开发规范
- 使用Lombok简化代码
- 接口使用Swagger注解文档

### 数据库设计
- 合理使用索引
- 表名使用下划线命名
- 字段名使用下划线命名

### 接口设计
- RESTful风格接口
- 统一响应格式
- 异常统一处理

## 🔧 常用功能

### 商品管理
- 商品分类、品牌管理
- 商品添加、编辑、上下架
- 商品库存管理

### 订单管理
- 订单查询、发货
- 退货、退款处理
- 订单统计

### 促销管理
- 优惠券发放
- 满减活动设置
- 积分规则配置

## 📄 文档说明

- **数据库设计**：`document/pdm/`目录
- **API文档**：Swagger UI，启动后访问
- **部署文档**：`document/reference/`目录
- **开发文档**：`document/mind/`目录

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
