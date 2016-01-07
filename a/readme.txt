1.后台采用架构是spring + mybatis + springmvc
2.项目部署采用maven
3.前台弹窗效果使用layout
4.权限框架采用shiro
5.阿里 druid数据库连接池
6.数据库使用mysql
7.缓存框架ehcache
7.数据抓取httpclient

注释格式
1、单行(single-line)注释：“//……”

2、块(block)注释：“/*……*/”

3、文档注释：“/**……*/”

4、javadoc 注释标签语法

@author   对类的说明 标明开发该类模块的作者

@version   对类的说明 标明该类模块的版本

@see     对类、属性、方法的说明 参考转向，也就是相关主题

@param    对方法的说明 对方法中某参数的说明

@return   对方法的说明 对方法返回值的说明

@exception  对方法的说明 对方法可能抛出的异常进行说明

@Time 时间

类注解
@Repository注解用于将数据访问层 (DAO 层 ) 的类标识为 Spring Bean。
@Component 是一个泛化的概念，仅仅表示一个组件 (Bean) ，可以作用在任何层次。
@Service 通常作用在业务层，但是目前该功能与 @Component 相同。
@Constroller 通常作用在控制层，但是目前该功能与 @Component 相同。

bean注解
@Resource 注解被用来激活一个命名资源（named resource）的依赖注入

classpath:/org/springframework/beans/factory/xml/spring-beans-4.2.xsd
classpath:/org/springframework/web/servlet/config/spring-mvc-4.2.xsd

Mysql 免安装版使用步骤
1、解压
2、my-default.ini copy成 my.ini文件
3、配置
basedir =C:\mysql-5.6.19-winx64
datadir =C:\mysql-5.6.19-winx64\data
port = 3306
skip-grant-tables //免密码登录
[client]
port= 3306
设置环境变量MYSQL_HOME\bin
4、注册服务
E:\软件\mysql-5.7.10-winx64\bin>mysqld -install
5、移除服务
mysqld remove
6、初始化
mysqld  --initialize-insecure 
7、启动服务
net start mysql
8、修改密码
mysql -u root --skip-password
ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';
flush privileges;
