# re_nb_demo_h5
nopen_demo_h5工程的相关运行环境

### 运行环境
* JDK 1.7
* Tomcat 8.5
* CentOS 6.4+

### 文件下载
* http://download.oracle.com/otn/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz
* http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v8.5.27/bin/apache-tomcat-8.5.27.tar.gz
* 本工程的文件

### 使用说明
网络环境配置：
* 请保证自己拥有固定的公网ip
* 将所有用到的公网ip维护到艺龙的ip白名单中，添加ip白名单可以在http://open.elong.com中进行。
* 测试环境ip维护在open站点的开发文档-国内酒店-常用工具中。
* 正式环境ip维护在open站点个人中心-合作业务中。

java环境搭建（linux为例）：
* 解压缩下载的jdk以及tomcat压缩包，解压命令tar -xzvf 文件名。
* 修改jdk下的jre/lib/security/java.security，将其中的securerandom.source=file:/dev/urandom
更改为securerandom.source=file:/dev/./urandom。
* 修改/etc/profile文件，在其末尾加入
export PATH=$PATH:/JAVA_HOME/bin
此处JAVA_HOME指的是解压后的jdk文件的绝对路径，文件编辑保存后，执行source /etc/profile命令。
windows服务器请自行查询如何配置java环境。
* 检查jdk是否配置成功，输入java -version命令，若输出jdk版本号，则为成功。

MySQL数据库：
* 新建mysql数据库，登录后执行工程中的h5demo.sql脚本，创建所需要的数据库和表。
* 执行完成后，检查mysql中是否存在h5数据库，其中有user、self_order、incr_order_manager三张表，
incr_order_manager中存在一条数据则为执行成功。

Tomcat配置与服务启动：
* 备份tomcat下的conf/server.xml为server.xml-bak，将本工程的server.xml放入conf文件夹下，即替换server.xml。
* 在tomcat目录下的webapps中新建文件夹nbopen_demo_h5
* 将下载好的nbopen_demo_h5.war文件放入tomcat目录下的webapps/nbopen_demo_h5中。
* 使用jar命令解开nbopen_demo_h5.war，命令：jar -xvf nbopen_demo_h5.war。
* 进入tomcat目录下的webapps/nbopen_demo_h5/WEB-INF/classes/conf/custom/env，修改配置文件如下
* config.properties中：
 username、appkey和secretkey修改为商务提供的对应的3个值，然后根据环境不同，使用不同的elong_openapi_url，修改后保存
* jdbc.properties中：
 将自己的MySQL数据库的url、用户名和密码配置上，用户表、订单表、订单增量管理表三个可以配置不同的MySQL服务，也可以是同一个。修改后保存。
* 进入tomcat下的bin目录中，执行./startup.sh命令启动tomcat服务。
