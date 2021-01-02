/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2021-01-02 11:17:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '李华湛', '123456', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584367404804&di=070c78aac95428c480b480a87b534e96&imgtype=0&src=http%3A%2F%2Fbbs.cnlinfo.net%2Fup%2Ftou%2F150611164743.jpg');

-- ----------------------------
-- Table structure for `blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `like` int(10) unsigned zerofill DEFAULT NULL,
  `content` text,
  `first_picture` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT '原创',
  `views` int(11) DEFAULT NULL,
  `share_statement` int(11) DEFAULT '0',
  `commentabled` int(11) DEFAULT '0',
  `published` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `description` text,
  `tag_ids` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', 'maven中静态资源的过滤', '0000000100', '# maven中静态资源的过滤\r\n\r\npom.xml文件中加入下面配置\r\n\r\n### 可以过滤java和resources文件夹里面所有的的.properties和.xml文件\r\n**directory：指定资源所在的目录，目录的路径是相对于pom.xml文件的\r\nincludes：指定要包含哪些文件**\r\n**filtering标签中：false表示不过滤，true表示过滤**\r\n\r\n```java\r\n    <build>\r\n        <resources>\r\n            <resource>\r\n                <directory>src/main/java</directory>\r\n                <includes>\r\n                    <include>**/*.properties</include>\r\n                    <include>**/*.xml</include>\r\n                </includes>\r\n                <filtering>false</filtering>\r\n            </resource>\r\n            <resource>\r\n                <directory>src/main/resources</directory>\r\n                <includes>\r\n                    <include>**/*.properties</include>\r\n                    <include>**/*.xml</include>\r\n                </includes>\r\n                <filtering>false</filtering>\r\n            </resource>\r\n        </resources>\r\n    </build>\r\n```\r\n', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584367888190&di=7855ff350e759b4b3de8c614978673b4&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201612%2F07%2F20161207154722_Cmce5.thumb.400_0.gif', '原创', '2', '1', '1', '1', '2020-03-12 08:25:47', '2018-12-01 11:56:19', '1', 'pom.xml文件中加入下面配置\r\n可以过滤java和resources文件夹里面所有的的.properties和.xml文件', '4');
INSERT INTO `blog` VALUES ('2', '使用System.out.format()格式化输出', '0000000000', '#### JDK5.0允许java像C语言那样直接用printf()方法来格式化输出\r\n####  System.out.format()功能与printf()一样，可以使用%d,%f等参数。\r\n使用System.out.format()完成**左对齐，补0，千位分隔符，小数点位数，本地化表达**\r\n```java\r\npublic class TestNumber {\r\n   \r\n    public static void main(String[] args) {\r\n        int year = 2020;\r\n        //左对齐，补0，千位分隔符，小数点位数，本地化表达\r\n        \r\n      //直接打印数字\r\n        System.out.println(year);\r\n          \r\n        //直接打印数字\r\n        System.out.format(\"%d%n\",year);\r\n        //总长度是8,默认右对齐\r\n        System.out.format(\"%8d%n\",year);\r\n        //总长度是8,左对齐\r\n        System.out.format(\"%-8d%n\",year);\r\n        //总长度是8,不够补0\r\n        System.out.format(\"%08d%n\",year);\r\n        //千位分隔符\r\n        System.out.format(\"%,8d%n\",year*10000);\r\n  \r\n        //保留5位小数\r\n        System.out.format(\"%.5f%n\",Math.PI);\r\n          \r\n        //不同国家的千位分隔符\r\n        System.out.format(Locale.FRANCE,\"%,.2f%n\",Math.PI*10000);\r\n        System.out.format(Locale.US,\"%,.2f%n\",Math.PI*10000);\r\n        System.out.format(Locale.UK,\"%,.2f%n\",Math.PI*10000);\r\n          \r\n    }\r\n}\r\n```\r\n输出结果：\r\n\r\n```java\r\n2020\r\n2020\r\n    2020\r\n2020    \r\n00002020\r\n20,200,000\r\n3.14159\r\n31?415,93\r\n31,415.93\r\n31,415.93\r\n```\r\n', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584368822685&di=19855856bbd158b52926a49b51e876c0&imgtype=0&src=http%3A%2F%2Fwx2.sinaimg.cn%2Fcrop.0.4.1280.711%2F70745653ly1fvuflwe10zj20zk0k0n06.jpg', '原创', '0', '1', '1', '1', '2019-03-12 13:42:14', '2019-03-13 12:00:08', '1', 'JDK5.0允许java像C语言那样直接用printf()方法来格式化输出\r\nSystem.out.format()功能与printf()一样，可以使用%d,%f等参数。\r\n\r\n使用System.out.format()完成左对齐，补0，千位分隔符，小数点位数，本地化表达', '7');
INSERT INTO `blog` VALUES ('3', 'Springboot中PageHelper 分页查询使用方法', '0000000007', '### 一：导入依赖\r\n\r\n```java\r\n<dependency>\r\n	<groupId>com.github.pagehelper</groupId>\r\n	<artifactId>pagehelper-spring-boot-starter</artifactId>\r\n	<version>1.2.13</version>\r\n</dependency>\r\n```\r\n### 二：配置yml文件中PageHelper的属性\r\n\r\n```java\r\npagehelper:                #分页插件\r\n  helper-dialect: mysql\r\n  reasonable: true\r\n  support-methods-arguments: true\r\n  params:\r\n```\r\n### 三：在controller类中使用，\r\n##### 1.在查询方法上调用PageHelper.startPage()方法，设置分页的页数和每页信息数，\r\n##### 2.将查询出来的结果集用PageInfo的构造函数初始化为一个分页结果对象\r\n##### 3.将分页结果对象存入model，返回前端页面\r\n```java\r\n@GetMapping(\"/types\")\r\npublic String types(@RequestParam(required = false,defaultValue = \"1\",value = \"pagenum\")int pagenum, Model model){\r\n\r\n    PageHelper.startPage(pagenum, 5);  //pagenum：页数，pagesize:每页的信息数\r\n    \r\n    List<Type> allType = typeService.getAllType(); //调用业务层查询方法\r\n    \r\n    PageInfo<Type> pageInfo = new PageInfo<>(allType); //得到分页结果对象\r\n    \r\n    model.addAttribute(\"pageInfo\", pageInfo);  //携带分页结果信息\r\n    \r\n    return \"admin/types\";  //回到前端展示页面\r\n}\r\n```\r\n### 四：前端展示分页（thymeleaf+semantic-ui）,这里ui用自己的就行，比如bootstrap或layui，主要是thymeleaf的使用。\r\n\r\n```java\r\n<table  class=\"ui compact celled teal table\">\r\n  <thead>\r\n  <tr>\r\n    <th></th>\r\n    <th>名称</th>\r\n    <th>操作</th>\r\n  </tr>\r\n  </thead>\r\n  <tbody>\r\n  <tr th:each=\"type, iterStat : ${pageInfo.list}\">\r\n    <td th:text=\"${iterStat.count}\">1</td>\r\n    <td th:text=\"${type.name}\">摸鱼方法</td>\r\n    <td>\r\n      <a href=\"#\" th:href=\"@{/admin/types/{id}/input(id=${type.id})}\" class=\"ui mini teal basic button\">编辑</a>\r\n      <a href=\"#\" th:href=\"@{/admin/types/{id}/delete(id=${type.id})}\" class=\"ui mini red basic button\">删除</a>\r\n    </td>\r\n  </tr>\r\n  </tbody>\r\n  <tfoot>\r\n  <tr>\r\n    <th colspan=\"7\">\r\n      <div class=\"ui mini pagination menu\"  >\r\n        <div class=\"item\"><a th:href=\"@{/admin/types}\">首页</a></div>\r\n        <div class=\"item\"><a th:href=\"@{/admin/types(pagenum=${pageInfo.hasPreviousPage}?${pageInfo.prePage}:1)}\">上一页</a></div>\r\n        <div class=\"item\"><a th:href=\"@{/admin/types(pagenum=${pageInfo.hasNextPage}?${pageInfo.nextPage}:${pageInfo.pages})}\">下一页</a></div>\r\n        <div class=\"item\"><a th:href=\"@{/admin/types(pagenum=${pageInfo.pages})}\">尾页</a></div>\r\n      </div>\r\n      <a href=\"#\" th:href=\"@{/admin/types/input}\" class=\"ui mini right floated teal basic button\">新增</a>\r\n    </th>\r\n  </tr>\r\n  </tfoot>\r\n</table>\r\n\r\n<div class=\"ui segment m-inline-block\">\r\n  <p >当前第<span th:text=\"${pageInfo.pageNum}\"></span>页，总<span th:text=\"${pageInfo.pages}\"></span>页，共<span th:text=\"${pageInfo.total}\"></span>条记录</p>\r\n</div>\r\n```\r\n### 五：效果展示（pagesize设置为5的效果）\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200310105006168.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyODA0NzM2,size_16,color_FFFFFF,t_70)\r\n', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584368536828&di=460fea188bd56a9f691d87e56622b891&imgtype=0&src=http%3A%2F%2Ftc.sinaimg.cn%2Fmaxwidth.800%2Ftc.service.weibo.com%2Fp3_pstatp_com%2F5ffc4f5b05b15c5642dd59cc7341cc71.jpg', '原创', '5', '0', '1', '1', '2019-03-14 17:05:58', '2019-06-21 11:45:10', '1', '1.在查询方法上调用PageHelper.startPage()方法，设置分页的页数和每页信息数，\r\n2.将查询出来的结果集用PageInfo的构造函数初始化为一个分页结果对象\r\n3.将分页结果对象存入model，返回前端页面', '5,4');
INSERT INTO `blog` VALUES ('4', 'thymeleaf语法及使用', '0000000008', '## 模板引擎\r\n\r\n简介：模板引擎(这里特指用于Web开发的模板引擎)是为了使用户界面与业务数据(内容)分离而产生的,它可以生成特定格式的文档，用于网站的模板引擎就会生成一个标准的HTML文档。\r\n模板引擎的思想：\r\n![在这里插入图片描述](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMuY25ibG9ncy5jb20vY25ibG9nc19jb20venltMTk5OS8xNjQ1NDE2L29fMjAwMjExMDk1OTQxMTQucG5n?x-oss-process=image/format,png)\r\nThymeleaf就是SpringBoot给我们推荐的一种模板引擎！\r\n\r\n## Thymeleaf模板引擎\r\n\r\n#### 1.使用Thymeleaf之前的步骤\r\n\r\n 1. Thymeleaf 官网：https://www.thymeleaf.org/\r\n 2. springboot项目直接引入依赖：\r\n```java\r\n<dependency>\r\n   <groupId>org.springframework.boot</groupId>\r\n   <artifactId>spring-boot-starter-thymeleaf</artifactId>\r\n</dependency>\r\n```\r\n3.非springboot项目直接引入依赖：\r\n\r\n```java\r\n<dependency>\r\n    <groupId>org.thymeleaf</groupId>\r\n    <artifactId>thymeleaf</artifactId>\r\n    <version>2.1.4</version>\r\n</dependency>\r\n```\r\n  4.在thymeleaf的配置类ThymeleafProperties中我们可以发现：thymeleaf配置的默认前缀为：\"classpath:/templates/\"，默认后缀为：\".html\"，只要把html页面放在这个路径下，\r\n\r\nthymeleaf就可以帮我们自动渲染。\r\n\r\n```java\r\npublic class ThymeleafProperties {\r\n    private static final Charset DEFAULT_ENCODING;\r\n    public static final String DEFAULT_PREFIX = \"classpath:/templates/\";\r\n    public static final String DEFAULT_SUFFIX = \".html\";\r\n    private boolean checkTemplate = true;\r\n    private boolean checkTemplateLocation = true;\r\n    private String prefix = \"classpath:/templates/\";\r\n    private String suffix = \".html\";\r\n    private String mode = \"HTML\";\r\n...\r\n}\r\n```\r\n如图为用idea创建的springboot的项目结构：将html页面放在resources/templates中即可。\r\n![在这里插入图片描述](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMuY25ibG9ncy5jb20vY25ibG9nc19jb20venltMTk5OS8xNjQ1NDE2L29fMjAwMjExMDk1OTExMTMucG5n?x-oss-process=image/format,png)\r\n#### 2.Thymeleaf语法简单使用（th:text, th:utext, th:each）\r\n编写一个controller实现跳转到一个html页面，通过Model对象携带数据\r\n\r\n```java\r\n@Controller\r\npublic class HelloController {\r\n\r\n    @RequestMapping(\"/success\")\r\n    public String success(Model model){\r\n        //存入数据\r\n        model.addAttribute(\"msg\",\"<h1>Hello</h1>\");\r\n        model.addAttribute(\"users\", Arrays.asList(\"小红\", \"小米\",\"小白\"));\r\n        //classpath:/templates/success.html\r\n        return \"success\";\r\n    }\r\n}\r\n```\r\nsuccess.html\r\n\r\n```java\r\n<!DOCTYPE html>\r\n<html lang=\"en\" xmlns:th=\"http://www.thymeleaf.org\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>Title</title>\r\n</head>\r\n<body>\r\n    <h1>success</h1>\r\n\r\n    <!--Thymeleaf语法：th:text就是将div中的内容设置为它指定的值-->\r\n\r\n    <div th:text=\"${msg}\">你好</div>\r\n    <!--utext：会解析html，显示相应的效果-->\r\n    <div th:utext=\"${msg}\">你好</div>\r\n    <!--each：遍历-->\r\n    <h3 th:each=\"user:${users}\" th:text=\"${user}\"></h3>\r\n\r\n</body>\r\n</html>\r\n```\r\n通过http://localhost:8080/success路径访问到success.html页面，同时成功显示数据：![在这里插入图片描述](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMuY25ibG9ncy5jb20vY25ibG9nc19jb20venltMTk5OS8xNjQ1NDE2L29fMjAwMjExMTEyOTE3MTUucG5n?x-oss-process=image/format,png)\r\n#### 3.Thymeleaf基本语法（属性和表达式）\r\n**Thymeleaf标准表达式**\r\n   \r\n\r\n 1. 变量表达式：**${ }**：用于前端获取后端传递的变量值\r\n\r\n   \r\n\r\n 1. 选择表达式：***{ }**：用于绑定一个对象的属性\r\n\r\n   \r\n\r\n 1. URL链接表达式：**@{ }**：用于链接\r\n\r\n    \r\n\r\n 1. 条件表达式：**三目运算符（表达式 ？值（then）：值（else））**\r\n\r\n    \r\n\r\n\r\n    \r\n**Thymeleaf属性标签：**\r\n![在这里插入图片描述](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMuY25ibG9ncy5jb20vY25ibG9nc19jb20venltMTk5OS8xNjQ1NDE2L29fMjAwMjExMTEzMTAxMTYucG5n?x-oss-process=image/format,png)\r\n\r\n \r\n\r\n', 'http://n.sinaimg.cn/sinacn20111/600/w1920h1080/20190331/0f41-huxwryw5226043.jpg', '原创', '7', '1', '1', '1', '2020-03-14 17:01:31', '2020-03-14 17:01:31', '1', '简介：模板引擎(这里特指用于Web开发的模板引擎)是为了使用户界面与业务数据(内容)分离而产生的,它可以生成特定格式的文档，用于网站的模板引擎就会生成一个标准的HTML文档。Thymeleaf就是SpringBoot给我们推荐的一种模板引擎！', '5,3');
INSERT INTO `blog` VALUES ('6', 'mybatis根据日期查询、查询日期并返回', '0000000002', '### 方法：\r\n\r\n#### 1.查询日期，返回日期字符串\r\n```handlebars\r\n//查询所有博客对应的年份，返回一个集合\r\nList<String> findGroupYear();  \r\n```\r\n#### 2.根据日期查询\r\n```handlebars\r\n//根据年份查询博客信息\r\nList<Blog> findByYear(@Param(\"year\") String year);  \r\n```\r\n\r\n\r\n### mybatis映射:\r\n\r\n\r\n```java\r\n<select id=\"findGroupYear\" resultType=\"String\">\r\n    select DATE_FORMAT(b.update_time, \'%Y\') from t_blog b\r\n</select>\r\n\r\n\r\n<select id=\"findByYear\" resultType=\"Blog\">\r\n    select b.title, b.update_time, b.id, b.flag\r\n    from t_blog b\r\n    where DATE_FORMAT(b.update_time, \'%Y\') = #{year}\r\n</select>\r\n```\r\n\r\n## 总结：\r\n**DATE_FORMAT(date,format)：date表示日期，format表示显示的格式。**\r\n**该方法可以把date类型转换为String类型的字符串**\r\n', 'http://p.qpic.cn/dnfbbspic/0/dnfbbs_dnfbbs_dnf_gamebbs_qq_com_forum_202002_04_082156ifotspmtuzcffycn.jpg/0', '原创', '5', '1', '1', '1', '2020-03-21 11:54:41', '2020-03-21 15:33:02', '1', 'mybatis根据日期查询、查询日期并返回\r\n方法：\r\n1.查询日期，返回日期字符串', '4');
INSERT INTO `blog` VALUES ('10', '蓝桥杯：基础练习 01字串（java）', '0000000001', '## 试题 基础练习 01字串\r\n  \r\n### 资源限制\r\n时间限制：1.0s   内存限制：256.0MB\r\n### 问题描述\r\n对于长度为5位的一个01串，每一位都可能是0或1，一共有32种可能。它们的前几个是：\r\n\r\n00000\r\n\r\n00001\r\n\r\n00010\r\n\r\n00011\r\n\r\n00100\r\n\r\n请按从小到大的顺序输出这32种01串。\r\n\r\n### 输入格式\r\n本试题没有输入。\r\n### 输出格式\r\n输出32行，按从小到大的顺序每行一个长度为5的01串。\r\n### 样例输出\r\n00000\r\n00001\r\n00010\r\n00011\r\n<以下部分省略>\r\n\r\n#### 思路：\r\n**使用Integer.toBinaryString()将十进制整数转换为二进制字符串，再判断长度是否能整除5，在前面加0输出**\r\n\r\n```java\r\npublic class 字串01 {\r\n	public static void main(String[] args) {\r\n		\r\n		for(int i = 0; i <= 31; i++) {\r\n			String s = Integer.toBinaryString(i);\r\n			int len = s.length();\r\n			switch(len % 5) {\r\n			case 1: s = \"0000\" + s;break;\r\n			case 2: s = \"000\" + s;break;\r\n			case 3: s = \"00\" + s;break;\r\n			case 4: s = \"0\" + s;break;\r\n			case 0: break;\r\n			}\r\n			System.out.println(s);\r\n		}\r\n	}\r\n}\r\n```\r\n\r\n**另一种方法，不用判断加0，也可以直接使用printf输出指定格式的整数：**\r\n```java\r\npublic class 字串01 {\r\n	public static void main(String[] args) {\r\n		\r\n		for(int i = 0; i <= 31; i++) {\r\n			String s = Integer.toBinaryString(i);\r\n			int n = Integer.parseInt(s);\r\n			System.out.printf(\"%05d\\n\",n);\r\n		}\r\n	}\r\n}\r\n```\r\n\r\n', 'http://5b0988e595225.cdn.sohucs.com/images/20190112/12a825d7c0f94223a0b1fc3dcddc6570.jpeg', '原创', '13', '1', '1', '1', '2020-03-21 16:19:41', '2020-03-21 16:19:41', '1', '问题描述\r\n\r\n对于长度为5位的一个01串，每一位都可能是0或1，一共有32种可能。它们的前几个是：\r\n\r\n00000\r\n\r\n00001\r\n\r\n00010\r\n\r\n00011\r\n\r\n00100\r\n\r\n请按从小到大的顺序输出这32种01串。', '7');
INSERT INTO `blog` VALUES ('14', 'MyBatis面试题总结   ', '0000000032', '**1、什么是Mybatis？**\r\n\r\n（1）Mybatis是一个半ORM（对象关系映射）框架，它内部封装了JDBC，开发时只需要关注SQL语句本身，不需要花费精力去处理加载驱动、创建连接、创建statement等繁杂的过程。程序员直接编写原生态sql，可以严格控制sql执行性能，灵活度高。\r\n\r\n（2）MyBatis 可以使用 XML 或注解来配置和映射原生信息，将 POJO映射成数据库中的记录，避免了几乎所有的 JDBC 代码和手动设置参数以及获取结果集。\r\n\r\n（3）通过xml 文件或注解的方式将要执行的各种 statement 配置起来，并通过java对象和 statement中sql的动态参数进行映射生成最终执行的sql语句，最后由mybatis框架执行sql并将结果映射为java对象并返回。（从执行sql到返回result的过程）。\r\n\r\n**2、Mybaits的优点：**\r\n\r\n（1）基于SQL语句编程，相当灵活，不会对应用程序或者数据库的现有设计造成任何影响，SQL写在XML里，解除sql与程序代码的耦合，便于统一管理；提供XML标签，支持编写动态SQL语句，并可重用。\r\n\r\n（2）与JDBC相比，减少了50%以上的代码量，消除了JDBC大量冗余的代码，不需要手动开关连接；\r\n\r\n（3）很好的与各种数据库兼容（因为MyBatis使用JDBC来连接数据库，所以只要JDBC支持的数据库MyBatis都支持）。\r\n\r\n（4）能够与Spring很好的集成；\r\n\r\n（5）提供映射标签，支持对象与数据库的ORM字段关系映射；提供对象关系映射标签，支持对象关系组件维护。\r\n\r\n**3、MyBatis框架的缺点：**\r\n\r\n（1）SQL语句的编写工作量较大，尤其当字段多、关联表多时，对开发人员编写SQL语句的功底有一定要求。\r\n\r\n（2）SQL语句依赖于数据库，导致数据库移植性差，不能随意更换数据库。\r\n\r\n**4、MyBatis框架适用场合：**\r\n\r\n（1）MyBatis专注于SQL本身，是一个足够灵活的DAO层解决方案。\r\n\r\n（2）对性能的要求很高，或者需求变化较多的项目，如互联网项目，MyBatis将是不错的选择。\r\n\r\n \r\n\r\n**5、MyBatis与Hibernate有哪些不同？**\r\n\r\n（1）Mybatis和hibernate不同，它不完全是一个ORM框架，因为MyBatis需要程序员自己编写Sql语句。\r\n\r\n（2）Mybatis直接编写原生态sql，可以严格控制sql执行性能，灵活度高，非常适合对关系数据模型要求不高的软件开发，因为这类软件需求变化频繁，一但需求变化要求迅速输出成果。但是灵活的前提是mybatis无法做到数据库无关性，如果需要实现支持多种数据库的软件，则需要自定义多套sql映射文件，工作量大。 \r\n\r\n（3）Hibernate对象/关系映射能力强，数据库无关性好，对于关系模型要求高的软件，如果用hibernate开发可以节省很多代码，提高效率。 \r\n\r\n \r\n\r\n**6、#{}和${}的区别是什么？**\r\n\r\n#{}是预编译处理，${}是字符串替换。\r\n\r\nMybatis在处理#{}时，会将sql中的#{}替换为?号，调用PreparedStatement的set方法来赋值；\r\n\r\nMybatis在处理${}时，就是把${}替换成变量的值。\r\n\r\n使用#{}可以有效的防止SQL注入，提高系统安全性。\r\n\r\n \r\n\r\n**7、当实体类中的属性名和表中的字段名不一样 ，怎么办 ？**\r\n\r\n第1种： 通过在查询的sql语句中定义字段名的别名，让字段名的别名和实体类的属性名一致。\r\n\r\n    <select id=”selectorder” parametertype=”int” resultetype=”me.gacl.domain.order”>\r\n       select order_id id, order_no orderno ,order_price price form orders where order_id=#{id};\r\n    </select>\r\n第2种： 通过<resultMap>来映射字段名和实体类属性名的一一对应的关系。\r\n\r\n <select id=\"getOrder\" parameterType=\"int\" resultMap=\"orderresultmap\">\r\n        select * from orders where order_id=#{id}\r\n    </select>\r\n \r\n   <resultMap type=”me.gacl.domain.order” id=”orderresultmap”>\r\n        <!–用id属性来映射主键字段–>\r\n        <id property=”id” column=”order_id”>\r\n \r\n        <!–用result属性来映射非主键字段，property为实体类属性名，column为数据表中的属性–>\r\n        <result property = “orderno” column =”order_no”/>\r\n        <result property=”price” column=”order_price” />\r\n    </reslutMap>\r\n \r\n\r\n**8、 模糊查询like语句该怎么写?**\r\n\r\n第1种：在Java代码中添加sql通配符。\r\n\r\n    string wildcardname = “%smi%”;\r\n    list<name> names = mapper.selectlike(wildcardname);\r\n \r\n    <select id=”selectlike”>\r\n     select * from foo where bar like #{value}\r\n    </select>\r\n第2种：在sql语句中拼接通配符，会引起sql注入\r\n\r\n    string wildcardname = “smi”;\r\n    list<name> names = mapper.selectlike(wildcardname);\r\n \r\n    <select id=”selectlike”>\r\n         select * from foo where bar like \"%\"${value}\"%\"\r\n    </select>\r\n \r\n\r\n**9、通常一个Xml映射文件，都会写一个Dao接口与之对应，请问，这个Dao接口的工作原理是什么？Dao接口里的方法，参数不同时，方法能重载吗？**\r\n\r\nDao接口即Mapper接口。接口的全限名，就是映射文件中的namespace的值；接口的方法名，就是映射文件中Mapper的Statement的id值；接口方法内的参数，就是传递给sql的参数。\r\n\r\nMapper接口是没有实现类的，当调用接口方法时，接口全限名+方法名拼接字符串作为key值，可唯一定位一个MapperStatement。在Mybatis中，每一个<select>、<insert>、<update>、<delete>标签，都会被解析为一个MapperStatement对象。\r\n\r\n举例：com.mybatis3.mappers.StudentDao.findStudentById，可以唯一找到namespace为com.mybatis3.mappers.StudentDao下面 id 为 findStudentById 的 MapperStatement。\r\n\r\nMapper接口里的方法，是不能重载的，因为是使用 全限名+方法名 的保存和寻找策略。Mapper 接口的工作原理是JDK动态代理，Mybatis运行时会使用JDK动态代理为Mapper接口生成代理对象proxy，代理对象会拦截接口方法，转而执行MapperStatement所代表的sql，然后将sql执行结果返回。\r\n\r\n \r\n\r\n**10、Mybatis是如何进行分页的？分页插件的原理是什么？**\r\n\r\n        Mybatis使用RowBounds对象进行分页，它是针对ResultSet结果集执行的内存分页，而非物理分页。可以在sql内直接书写带有物理分页的参数来完成物理分页功能，也可以使用分页插件来完成物理分页。\r\n\r\n       分页插件的基本原理是使用Mybatis提供的插件接口，实现自定义插件，在插件的拦截方法内拦截待执行的sql，然后重写sql，根据dialect方言，添加对应的物理分页语句和物理分页参数。\r\n\r\n \r\n\r\n**11、Mybatis是如何将sql执行结果封装为目标对象并返回的？都有哪些映射形式？**\r\n\r\n第一种是使用<resultMap>标签，逐一定义数据库列名和对象属性名之间的映射关系。\r\n\r\n第二种是使用sql列的别名功能，将列的别名书写为对象属性名。\r\n\r\n有了列名与属性名的映射关系后，Mybatis通过反射创建对象，同时使用反射给对象的属性逐一赋值并返回，那些找不到映射关系的属性，是无法完成赋值的。\r\n\r\n \r\n\r\n**12、如何执行批量插入?**\r\n\r\n首先,创建一个简单的insert语句:\r\n\r\n    <insert id=”insertname”>\r\n         insert into names (name) values (#{value})\r\n    </insert>\r\n然后在java代码中像下面这样执行批处理插入:\r\n\r\n  list<string> names = new arraylist();\r\n    names.add(“fred”);\r\n    names.add(“barney”);\r\n    names.add(“betty”);\r\n    names.add(“wilma”);\r\n \r\n    // 注意这里 executortype.batch\r\n    sqlsession sqlsession = sqlsessionfactory.opensession(executortype.batch);\r\n    try {\r\n     namemapper mapper = sqlsession.getmapper(namemapper.class);\r\n     for (string name : names) {\r\n         mapper.insertname(name);\r\n     }\r\n     sqlsession.commit();\r\n    }catch(Exception e){\r\n     e.printStackTrace();\r\n     sqlSession.rollback(); \r\n     throw e; \r\n    }\r\n     finally {\r\n         sqlsession.close();\r\n    }\r\n \r\n\r\n**13、如何获取自动生成的(主)键值?**\r\n\r\ninsert 方法总是返回一个int值 ，这个值代表的是插入的行数。\r\n\r\n如果采用自增长策略，自动生成的键值在 insert 方法执行完后可以被设置到传入的参数对象中。\r\n\r\n示例：\r\n\r\n<insert id=”insertname” usegeneratedkeys=”true” keyproperty=”id”>\r\n     insert into names (name) values (#{name})\r\n</insert>\r\n    name name = new name();\r\n    name.setname(“fred”);\r\n \r\n    int rows = mapper.insertname(name);\r\n    // 完成后,id已经被设置到对象中\r\n    system.out.println(“rows inserted = ” + rows);\r\n    system.out.println(“generated key value = ” + name.getid());\r\n \r\n\r\n**14、在mapper中如何传递多个参数?**\r\n\r\n（1）第一种：\r\n//DAO层的函数\r\nPublic UserselectUser(String name,String area);  \r\n//对应的xml,#{0}代表接收的是dao层中的第一个参数，#{1}代表dao层中第二参数，更多参数一致往后加即可。\r\n<select id=\"selectUser\"resultMap=\"BaseResultMap\">  \r\n    select *  fromuser_user_t   whereuser_name = #{0} anduser_area=#{1}  \r\n</select>  \r\n \r\n（2）第二种： 使用 @param 注解:\r\npublic interface usermapper {\r\n   user selectuser(@param(“username”) string username,@param(“hashedpassword”) string hashedpassword);\r\n}\r\n然后,就可以在xml像下面这样使用(推荐封装为一个map,作为单个参数传递给mapper):\r\n<select id=”selectuser” resulttype=”user”>\r\n         select id, username, hashedpassword\r\n         from some_table\r\n         where username = #{username}\r\n         and hashedpassword = #{hashedpassword}\r\n</select>\r\n \r\n（3）第三种：多个参数封装成map\r\ntry{\r\n//映射文件的命名空间.SQL片段的ID，就可以调用对应的映射文件中的SQL\r\n//由于我们的参数超过了两个，而方法中只有一个Object参数收集，因此我们使用Map集合来装载我们的参数\r\nMap<String, Object> map = new HashMap();\r\n     map.put(\"start\", start);\r\n     map.put(\"end\", end);\r\n     return sqlSession.selectList(\"StudentID.pagination\", map);\r\n }catch(Exception e){\r\n     e.printStackTrace();\r\n     sqlSession.rollback();\r\n    throw e; }\r\nfinally{\r\n MybatisUtil.closeSqlSession();\r\n }\r\n \r\n\r\n**15、Mybatis动态sql有什么用？执行原理？有哪些动态sql？**\r\n\r\nMybatis动态sql可以在Xml映射文件内，以标签的形式编写动态sql，执行原理是根据表达式的值 完成逻辑判断并动态拼接sql的功能。\r\n\r\nMybatis提供了9种动态sql标签：trim | where | set | foreach | if | choose | when | otherwise | bind。\r\n\r\n \r\n\r\n**16、Xml映射文件中，除了常见的select|insert|updae|delete标签之外，还有哪些标签？\r\n**\r\n答：<resultMap>、<parameterMap>、<sql>、<include>、<selectKey>，加上动态sql的9个标签，其中<sql>为sql片段标签，通过<include>标签引入sql片段，<selectKey>为不支持自增的主键生成策略标签。\r\n\r\n \r\n\r\n**17、Mybatis的Xml映射文件中，不同的Xml映射文件，id是否可以重复？\r\n**\r\n不同的Xml映射文件，如果配置了namespace，那么id可以重复；如果没有配置namespace，那么id不能重复；\r\n\r\n原因就是namespace+id是作为Map<String, MapperStatement>的key使用的，如果没有namespace，就剩下id，那么，id重复会导致数据互相覆盖。有了namespace，自然id就可以重复，namespace不同，namespace+id自然也就不同。\r\n\r\n但是，在以前的Mybatis版本的namespace是可选的，不过新版本的namespace已经是必须的了。\r\n\r\n \r\n\r\n**18、为什么说Mybatis是半自动ORM映射工具？它与全自动的区别在哪里？\r\n**\r\nHibernate属于全自动ORM映射工具，使用Hibernate查询关联对象或者关联集合对象时，可以根据对象关系模型直接获取，所以它是全自动的。而Mybatis在查询关联对象或关联集合对象时，需要手动编写sql来完成，所以，称之为半自动ORM映射工具。\r\n\r\n \r\n\r\n**19、 一对一、一对多的关联查询 ？ **\r\n\r\n<mapper namespace=\"com.lcb.mapping.userMapper\">  \r\n    <!--association  一对一关联查询 -->  \r\n    <select id=\"getClass\" parameterType=\"int\" resultMap=\"ClassesResultMap\">  \r\n        select * from class c,teacher t where c.teacher_id=t.t_id and c.c_id=#{id}  \r\n    </select>  \r\n \r\n    <resultMap type=\"com.lcb.user.Classes\" id=\"ClassesResultMap\">  \r\n        <!-- 实体类的字段名和数据表的字段名映射 -->  \r\n        <id property=\"id\" column=\"c_id\"/>  \r\n        <result property=\"name\" column=\"c_name\"/>  \r\n        <association property=\"teacher\" javaType=\"com.lcb.user.Teacher\">  \r\n            <id property=\"id\" column=\"t_id\"/>  \r\n            <result property=\"name\" column=\"t_name\"/>  \r\n        </association>  \r\n    </resultMap>  \r\n \r\n \r\n    <!--collection  一对多关联查询 -->  \r\n    <select id=\"getClass2\" parameterType=\"int\" resultMap=\"ClassesResultMap2\">  \r\n        select * from class c,teacher t,student s where c.teacher_id=t.t_id and c.c_id=s.class_id and c.c_id=#{id}  \r\n    </select>  \r\n \r\n    <resultMap type=\"com.lcb.user.Classes\" id=\"ClassesResultMap2\">  \r\n        <id property=\"id\" column=\"c_id\"/>  \r\n        <result property=\"name\" column=\"c_name\"/>  \r\n        <association property=\"teacher\" javaType=\"com.lcb.user.Teacher\">  \r\n            <id property=\"id\" column=\"t_id\"/>  \r\n            <result property=\"name\" column=\"t_name\"/>  \r\n        </association>  \r\n \r\n        <collection property=\"student\" ofType=\"com.lcb.user.Student\">  \r\n            <id property=\"id\" column=\"s_id\"/>  \r\n            <result property=\"name\" column=\"s_name\"/>  \r\n        </collection>  \r\n    </resultMap>  \r\n</mapper> \r\n \r\n\r\n**20、MyBatis实现一对一有几种方式?具体怎么操作的？**\r\n\r\n有联合查询和嵌套查询,联合查询是几个表联合查询,只查询一次, 通过在resultMap里面配置association节点配置一对一的类就可以完成；\r\n\r\n嵌套查询是先查一个表，根据这个表里面的结果的 外键id，去再另外一个表里面查询数据,也是通过association配置，但另外一个表的查询通过select属性配置。\r\n\r\n \r\n\r\n**21、MyBatis实现一对多有几种方式,怎么操作的？**\r\n\r\n        有联合查询和嵌套查询。联合查询是几个表联合查询,只查询一次,通过在resultMap里面的collection节点配置一对多的类就可以完成；嵌套查询是先查一个表,根据这个表里面的 结果的外键id,去再另外一个表里面查询数据,也是通过配置collection,但另外一个表的查询通过select节点配置。\r\n\r\n \r\n\r\n**22、Mybatis是否支持延迟加载？如果支持，它的实现原理是什么？**\r\n\r\n答：Mybatis仅支持association关联对象和collection关联集合对象的延迟加载，association指的就是一对一，collection指的就是一对多查询。在Mybatis配置文件中，可以配置是否启用延迟加载lazyLoadingEnabled=true|false。\r\n\r\n它的原理是，使用CGLIB创建目标对象的代理对象，当调用目标方法时，进入拦截器方法，比如调用a.getB().getName()，拦截器invoke()方法发现a.getB()是null值，那么就会单独发送事先保存好的查询关联B对象的sql，把B查询上来，然后调用a.setB(b)，于是a的对象b属性就有值了，接着完成a.getB().getName()方法的调用。这就是延迟加载的基本原理。\r\n\r\n当然了，不光是Mybatis，几乎所有的包括Hibernate，支持延迟加载的原理都是一样的。\r\n\r\n \r\n\r\n** 23、Mybatis的一级、二级缓存:**\r\n\r\n1）一级缓存: 基于 PerpetualCache 的 HashMap 本地缓存，其存储作用域为 Session，当 Session flush 或 close 之后，该 Session 中的所有 Cache 就将清空，默认打开一级缓存。\r\n\r\n2）二级缓存与一级缓存其机制相同，默认也是采用 PerpetualCache，HashMap 存储，不同在于其存储作用域为 Mapper(Namespace)，并且可自定义存储源，如 Ehcache。默认不打开二级缓存，要开启二级缓存，使用二级缓存属性类需要实现Serializable序列化接口(可用来保存对象的状态),可在它的映射文件中配置<cache/> ；\r\n\r\n3）对于缓存数据更新机制，当某一个作用域(一级缓存 Session/二级缓存Namespaces)的进行了C/U/D 操作后，默认该作用域下所有 select 中的缓存将被 clear 掉并重新更新，如果开启了二级缓存，则只根据配置判断是否刷新。\r\n\r\n \r\n\r\n**24、什么是MyBatis的接口绑定？有哪些实现方式？**\r\n\r\n接口绑定，就是在MyBatis中任意定义接口,然后把接口里面的方法和SQL语句绑定, 我们直接调用接口方法就可以,这样比起原来了SqlSession提供的方法我们可以有更加灵活的选择和设置。\r\n\r\n接口绑定有两种实现方式,一种是通过注解绑定，就是在接口的方法上面加上 @Select、@Update等注解，里面包含Sql语句来绑定；另外一种就是通过xml里面写SQL来绑定, 在这种情况下,要指定xml映射文件里面的namespace必须为接口的全路径名。当Sql语句比较简单时候,用注解绑定, 当SQL语句比较复杂时候,用xml绑定,一般用xml绑定的比较多。\r\n\r\n**25、使用MyBatis的mapper接口调用时有哪些要求？**\r\n\r\n①  Mapper接口方法名和mapper.xml中定义的每个sql的id相同；\r\n②  Mapper接口方法的输入参数类型和mapper.xml中定义的每个sql 的parameterType的类型相同；\r\n③  Mapper接口方法的输出参数类型和mapper.xml中定义的每个sql的resultType的类型相同；\r\n④  Mapper.xml文件中的namespace即是mapper接口的类路径。\r\n\r\n**26、Mapper编写有哪几种方式？**\r\n\r\n第一种：接口实现类继承SqlSessionDaoSupport：使用此种方法需要编写mapper接口，mapper接口实现类、mapper.xml文件。\r\n（1）在sqlMapConfig.xml中配置mapper.xml的位置\r\n<mappers>\r\n    <mapper resource=\"mapper.xml文件的地址\" />\r\n    <mapper resource=\"mapper.xml文件的地址\" />\r\n</mappers>\r\n（2）定义mapper接口\r\n（3）实现类集成SqlSessionDaoSupport\r\nmapper方法中可以this.getSqlSession()进行数据增删改查。\r\n（4）spring 配置\r\n<bean id=\" \" class=\"mapper接口的实现\">\r\n    <property name=\"sqlSessionFactory\" ref=\"sqlSessionFactory\"></property>\r\n</bean>\r\n\r\n \r\n第二种：使用org.mybatis.spring.mapper.MapperFactoryBean：\r\n（1）在sqlMapConfig.xml中配置mapper.xml的位置，如果mapper.xml和mappre接口的名称相同且在同一个目录，这里可以不用配置\r\n<mappers>\r\n    <mapper resource=\"mapper.xml文件的地址\" />\r\n    <mapper resource=\"mapper.xml文件的地址\" />\r\n</mappers>\r\n（2）定义mapper接口：\r\n①mapper.xml中的namespace为mapper接口的地址\r\n②mapper接口中的方法名和mapper.xml中的定义的statement的id保持一致\r\n③Spring中定义\r\n<bean id=\"\" class=\"org.mybatis.spring.mapper.MapperFactoryBean\">\r\n    <property name=\"mapperInterface\"   value=\"mapper接口地址\" /> \r\n    <property name=\"sqlSessionFactory\" ref=\"sqlSessionFactory\" /> \r\n</bean>\r\n\r\n\r\n第三种：使用mapper扫描器：\r\n（1）mapper.xml文件编写：\r\nmapper.xml中的namespace为mapper接口的地址；\r\nmapper接口中的方法名和mapper.xml中的定义的statement的id保持一致；\r\n如果将mapper.xml和mapper接口的名称保持一致则不用在sqlMapConfig.xml中进行配置。 \r\n（2）定义mapper接口：\r\n注意mapper.xml的文件名和mapper的接口名称保持一致，且放在同一个目录\r\n（3）配置mapper扫描器：\r\n<bean class=\"org.mybatis.spring.mapper.MapperScannerConfigurer\">\r\n    <property name=\"basePackage\" value=\"mapper接口包地址\"></property>\r\n    <property name=\"sqlSessionFactoryBeanName\" value=\"sqlSessionFactory\"/> \r\n</bean>\r\n（4）使用扫描器后从spring容器中获取mapper的实现对象。\r\n\r\n \r\n\r\n**27、简述Mybatis的插件运行原理，以及如何编写一个插件。**\r\n\r\n答：Mybatis仅可以编写针对ParameterHandler、ResultSetHandler、StatementHandler、Executor这4种接口的插件，Mybatis使用JDK的动态代理，为需要拦截的接口生成代理对象以实现接口方法拦截功能，每当执行这4种接口对象的方法时，就会进入拦截方法，具体就是InvocationHandler的invoke()方法，当然，只会拦截那些你指定需要拦截的方法。\r\n\r\n编写插件：实现Mybatis的Interceptor接口并复写intercept()方法，然后在给插件编写注解，指定要拦截哪一个接口的哪些方法即可，记住，别忘了在配置文件中配置你编写的插件。', 'http://img.improve-yourmemory.com/pic/5e169b5c394ffc2e422aead89bfb3944-0.jpg', '转载', '22', '0', '0', '1', '2020-08-18 22:32:58', '2020-08-19 09:58:52', '1', 'Mybatis是一个半ORM（对象关系映射）框架，它内部封装了JDBC，开发时只需要关注SQL语句本身，不需要花费精力去处理加载驱动、创建连接、创建statement等繁杂的过程', '1');
INSERT INTO `blog` VALUES ('30', '张爱玲语录', '0000000101', '1.\r\n你如果认识从前的我，也许你会原谅现在的我。\r\n——张爱玲《倾城之恋》\r\n\r\n2.\r\n于千万人之中遇见你所要遇见的人，于千万年之中，时间的无涯的荒野里，没有早一步，也没有晚一步，刚巧赶上了，那也没有别的话可说，惟有轻轻地问一声：“噢，你也在这里吗？”\r\n——张爱玲《爱》\r\n\r\n3.\r\n也许每一个男子全都有过这样的两个女人，至少两个。\r\n娶了红玫瑰，久而久之，红的变了墙上的一抹蚊子血，白的还是“床前明月光”；\r\n娶了白玫瑰，白的便是衣服上的一粒饭粘子，红的却是心口上的一颗朱砂痣。\r\n——张爱玲《红玫瑰与白玫瑰》\r\n\r\n4.\r\n我们都是寂寞惯了的人。\r\n——张爱玲《十八春》\r\n\r\n5.\r\n有些傻话，不但是要背着人说，还得背着自己。让自己听见了也怪难为情的。譬如说，我爱你，我一辈子都爱你。\r\n——张爱玲《倾城之恋》\r\n\r\n6.\r\n我要你知道,在这个世界上总有一个人是等着你的,不管在什么时候,不管在什么地方,反正你知道,总有这么个人。\r\n——张爱玲《半生缘》\r\n\r\n7.\r\n你问我爱你值不值得，其实你应该知道，爱就是不问值得不值得。\r\n——张爱玲《惘然记》\r\n\r\n8.\r\n孤独的人有他们自己的泥沼。\r\n——张爱玲《红玫瑰与白玫瑰》\r\n\r\n9.\r\n既然抄袭是最隆重的赞美。\r\n——张爱玲 《更衣记》\r\n\r\n10.\r\n生命是一袭华美的袍，爬满了蚤子。\r\n——张爱玲《天才梦》\r\n\r\n11.\r\n不管你的条件有多差 总会有个人在爱你。不管你的条件有多好 也总有个人不爱你。\r\n——张爱玲《半生缘》\r\n\r\n12.\r\n生在这世上，没有一样感情不是千疮百孔的。\r\n——张爱玲《留情》\r\n\r\n13.\r\n感情原来是这么脆弱的。经得起风雨，却经不起平凡。\r\n——张爱玲《一别一辈子》\r\n\r\n14.\r\n回忆这东西若是有气味的话，那就是樟脑的香，甜而稳妥，像记得分明的快乐，甜而怅惘，像忘却了的忧愁。\r\n——张爱玲《更衣记》\r\n\r\n15.\r\n对于三十岁以后的人来说，十年八年不过是指缝间的事 而对于年轻人而言，三年五年就可以是一生一世\r\n——张爱玲 《十八春》\r\n\r\n16.\r\n雨声潺潺，像住在溪边，宁愿天天下雨，以为你是因为下雨不来。\r\n——张爱玲《小团圆》\r\n\r\n17.\r\n也许爱不是热情，也不是怀念，不过是岁月，年深月久成了生活的一部分。\r\n——张爱玲《半生缘》\r\n\r\n18.\r\n我爱你，关你什么事？千怪万怪也怪不到你身上去。\r\n——张爱玲《沉香屑·第一炉香》\r\n\r\n19.\r\n\r\n一恨鲥鱼多刺，二恨海棠无香，三恨《红楼梦》未完。\r\n\r\n——张爱玲《红楼梦魇》', 'https://wallpaperm.cmcm.com/aab1692cf70ed27d9ebcf0ca3e88d61d.jpg', '原创', '64', '0', '0', '1', '2020-08-19 19:40:14', '2020-08-21 19:40:14', '1', '你如果认识从前的我，也许你会原谅现在的我。\r\n——张爱玲《倾城之恋》', '8');

-- ----------------------------
-- Table structure for `blog_like`
-- ----------------------------
DROP TABLE IF EXISTS `blog_like`;
CREATE TABLE `blog_like` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `blog_id` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_like
-- ----------------------------
INSERT INTO `blog_like` VALUES ('1', '2', '30');
INSERT INTO `blog_like` VALUES ('20', '1', '14');
INSERT INTO `blog_like` VALUES ('29', '1', '30');

-- ----------------------------
-- Table structure for `blog_tags`
-- ----------------------------
DROP TABLE IF EXISTS `blog_tags`;
CREATE TABLE `blog_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) DEFAULT NULL,
  `blog_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of blog_tags
-- ----------------------------
INSERT INTO `blog_tags` VALUES ('1', '6', '4');
INSERT INTO `blog_tags` VALUES ('2', '6', '1');
INSERT INTO `blog_tags` VALUES ('5', '8', '4');
INSERT INTO `blog_tags` VALUES ('6', '6', '2');
INSERT INTO `blog_tags` VALUES ('7', '6', '5');
INSERT INTO `blog_tags` VALUES ('64', '8', '3');
INSERT INTO `blog_tags` VALUES ('66', '6', '6');
INSERT INTO `blog_tags` VALUES ('74', '6', '10');
INSERT INTO `blog_tags` VALUES ('75', '6', '11');
INSERT INTO `blog_tags` VALUES ('76', '8', '12');
INSERT INTO `blog_tags` VALUES ('77', '8', '13');
INSERT INTO `blog_tags` VALUES ('78', '5', '12');
INSERT INTO `blog_tags` VALUES ('79', '6', '12');
INSERT INTO `blog_tags` VALUES ('80', '6', '13');
INSERT INTO `blog_tags` VALUES ('81', '5', '13');
INSERT INTO `blog_tags` VALUES ('82', '1', '14');
INSERT INTO `blog_tags` VALUES ('83', '2', '15');
INSERT INTO `blog_tags` VALUES ('84', '8', '16');
INSERT INTO `blog_tags` VALUES ('85', '9', '16');
INSERT INTO `blog_tags` VALUES ('86', '5', '17');
INSERT INTO `blog_tags` VALUES ('87', '6', '17');
INSERT INTO `blog_tags` VALUES ('88', '5', '18');
INSERT INTO `blog_tags` VALUES ('89', '6', '18');
INSERT INTO `blog_tags` VALUES ('90', '6', '19');
INSERT INTO `blog_tags` VALUES ('91', '1', '20');
INSERT INTO `blog_tags` VALUES ('92', '5', '20');
INSERT INTO `blog_tags` VALUES ('93', '1', '22');
INSERT INTO `blog_tags` VALUES ('94', '5', '23');
INSERT INTO `blog_tags` VALUES ('95', '6', '23');
INSERT INTO `blog_tags` VALUES ('96', '1', '24');
INSERT INTO `blog_tags` VALUES ('97', '5', '25');
INSERT INTO `blog_tags` VALUES ('98', '6', '25');
INSERT INTO `blog_tags` VALUES ('99', '1', '26');
INSERT INTO `blog_tags` VALUES ('100', '5', '26');
INSERT INTO `blog_tags` VALUES ('101', '1', '27');
INSERT INTO `blog_tags` VALUES ('102', '1', '28');
INSERT INTO `blog_tags` VALUES ('103', '1', '14');
INSERT INTO `blog_tags` VALUES ('104', '1', '14');
INSERT INTO `blog_tags` VALUES ('105', '1', '29');
INSERT INTO `blog_tags` VALUES ('106', '2', '30');
INSERT INTO `blog_tags` VALUES ('107', '8', '31');
INSERT INTO `blog_tags` VALUES ('108', '2', '32');
INSERT INTO `blog_tags` VALUES ('109', '8', '1');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `blog_id` bigint(20) DEFAULT NULL,
  `parent_comment_id` bigint(20) DEFAULT NULL,
  `admincomment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '小白', 'bai@qq.com', '小白的评论', '/images/avatar.jpg', '2020-03-15 21:28:13', '4', '-1', null);
INSERT INTO `comment` VALUES ('2', '小红', 'hong@qq.com', '小红的评论', '/images/avatar.jpg', '2020-03-15 21:35:02', '4', '-1', null);
INSERT INTO `comment` VALUES ('5', '小蓝', 'lan@qq.com', '小蓝的评论', '/images/avatar.jpg', '2020-03-16 15:04:24', '4', '-1', null);
INSERT INTO `comment` VALUES ('7', '朱一鸣', '691639910@qq.com', '博主的评论', 'http://5b0988e595225.cdn.sohucs.com/images/20181103/feaa7d14883047fb81bbaa16f681f583.jpeg', '2020-03-16 15:11:07', '2', '-1', '1');
INSERT INTO `comment` VALUES ('8', '安东尼', '2333@qq.com', '不论是我的世界车水马龙繁华盛世 还是它们都瞬间消失化为须臾 我都会坚定地走向你 不慌张 不犹豫', '/images/avatar.jpg', '2020-03-24 17:41:17', '11', '-1', '0');
INSERT INTO `comment` VALUES ('9', 'AA', '2224984493@qq.com', 'AA', null, '2020-08-11 10:19:29', '10', '-1', '0');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `create_time` date NOT NULL,
  `admin` int(2) NOT NULL DEFAULT '0',
  `msg_avatar` varchar(255) DEFAULT 'http://img.duoziwang.com/2018/17/05272146700399.jpg',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '留言板功能搭建完成！！！', '管理员', '2020-08-19', '1', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=663978067,3767961086&fm=26&gp=0.jpg');
INSERT INTO `message` VALUES ('10', '测试', '逗妇乳', '2020-10-27', '0', 'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=99244459,1946253744&fm=26&gp=0.jpg');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '好消息！博客终于上线啦！！');
INSERT INTO `notice` VALUES ('2', '音乐盒在左下角！！ 音乐盒在左下角！！ 音乐盒在左下角！！');
INSERT INTO `notice` VALUES ('3', '后面会添加歌单切换功能！');
INSERT INTO `notice` VALUES ('4', '点击左边的小按钮有惊喜哟！');

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `create_time` date NOT NULL,
  `mes_id` int(10) NOT NULL,
  `reply_name` varchar(50) DEFAULT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2902069684,3620245990&fm=26&gp=0.jpg',
  `user_id` int(255) DEFAULT NULL,
  `reply_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', 'MyBatis');
INSERT INTO `tag` VALUES ('2', '语录');
INSERT INTO `tag` VALUES ('3', '心情');
INSERT INTO `tag` VALUES ('5', 'SpringBoot');
INSERT INTO `tag` VALUES ('6', 'Java');
INSERT INTO `tag` VALUES ('8', '杂谈');
INSERT INTO `tag` VALUES ('12', '生活');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT 'http://img.duoziwang.com/2018/17/05272146700399.jpg',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '放下', '123', '2224984493@qq.com', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584367404804&di=070c78aac95428c480b480a87b534e96&imgtype=0&src=http%3A%2F%2Fbbs.cnlinfo.net%2Fup%2Ftou%2F150611164743.jpg', '2020-03-08 18:25:26', null);
INSERT INTO `user` VALUES ('2', '逗妇乳', '123', null, 'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=99244459,1946253744&fm=26&gp=0.jpg', null, null);
