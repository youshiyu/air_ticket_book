# -
##软件工程课程设计
#
**题目描述：**
    
-     为方便旅客，航空公司拟开发一个网上机票订购系统。旅客可向该系统查询航班情况（按目的地、起飞时间、航班班次等）。旅行社把预定机票的旅客信息（姓名、性别、工作单位、身份证号码、旅行时间、旅行目的地等）输入该系统，系统为旅客安排航班，打印取票通知和帐单，旅客在收到取票通知和帐单后可交费并于飞机起飞前一天凭取票通知和交款单经系统校对无误后打印机票给旅客。但是考虑到对于机票的购买人群，除了旅行社还有很多的散客，为了服务到所有旅客，我们把原本“旅行社-旅客”关系改变为“旅客-关联旅客”关系。关联旅客的信息经过旅客设定后存储在数据库内，不用每次都重复输入；可以满足原本旅行社为大量旅客一次性订购机票的需求，还可以满足私人出行时，为家人或朋友一起订购机票的需求。对于取票的流程，除了在机场的人工服务台可以沿用原取票流程外，我们还决定增加一种简化的自助取票方式：付款可以在网页登录后，使用银行卡、支付宝、微信等网上支付手段进行支付，系统将已支付信息和电子账单保存在数据库里，旅客可随时网上查阅，在起飞前一天可以在机场的机票打印终端登录自己的账号，打印已付款的机票，也可以现场支付后打印机票，从而取消了实物的取票通知、账单、交款单带来的繁琐和不便性。 
    - 
    - 对航空公司而言，使用网上机票订购系统可以节约人力成本，方便统一管理，刺激旅客消费。有针对管理员设计的界面，提供丰富的功能，便于航空公司的运营与管理。对旅客而言，使用网上机票订购系统，可以随时随地在网上订购机票，而不需要去线下网点排队购买，简化购买流程，节省时间和精力。此举方便了航空公司和旅客，提高了商务信息化水平，也能增加旅客对机票的购买。
    - 

## 1.1运行项目所需软件 ##
本项目为动态javaweb项目，所需软件为eclipse EE ，tomcat+，mysql ，Navicat Premium 12。
 
## 1.2 配置环境步骤 ##
### 1.2.1从官网下载jdk安装包  ###
官网会提供最新的版本，同时也可以选择历史版本下载，安装时选择了当前最新的版本点，击链接到下载页面，下载完成后点击安装。 
根据安装提示信息，以此选择JDK和JRE的安装位置，可以放在同一文件夹下。
https://www.oracle.com

### 1.2.2 配置java环境变量 ###
找到环境变量的配置之后下面需要新建两个环境变量并且在path中添加变量： 
CLASSPATH 对应 .;%JAVA_HOME%\lib;%JAVA_HOME%\lib\tools.jar 不要忘记前边的点。 
JAVA_HOME 对应 jdk 安装位置，例如：E:\java\jdk 
path 中 添加 %JAVA_HOME%\bin;%JAVA_HOME%\jre\bin; 如果末尾没有分好需要添加分号，用来与其他变量分隔。 
也可以单独添加 %JAVA_HOME%\bin 和 %JAVA_HOME%\jre\bin。 
添加完后打开命令行（Win+R,输入cmd），输入java -version测试。
### 1.2.3 下载Eclipse ###
下载Eclipse，安装Eclipse for Java and Web Developers 版本。
https://www.eclipse.org
### 1.2.4 下载tomcat服务器 ###
在tomcat官网下载。
https://tomcat.apache.org

### 1.2.5 配置tomcat服务器 ###
添加系统变量 变量名：CATALINA_HOME 变量值：刚刚安装的tomcat路径 。
然后在路径下的bin文件夹中双击startup.bat启动服务器。

### 1.2.6 在eclipse添加tomcat ###
在导航栏上选择Window->Preferences->Serve->Runtime Environment 点击右侧Add按钮选择安装位置，添加完成。
 
### 1.2.7 检测是否可以建立web项目 ###
新建Dynamic web Project 输入web项目name，点击finish完成，默认没有建立xml文件，可以在建立时点击Next，会有一个选项勾选建立xml文件

注：如果新建没有Dynamic web Project，需要添加开发web项目的组件，在eclipse中的help中找到install new software选项，下载如下图所示组件,下载后重新启动项目
 
### 1.2.8 下载mysql +Navicat Premium 12 ###
Navicat for mysql 是mysql数据库的可视化工具，通过navicat我们可以更方便的操作mysql数据库。
mySQL是一个关系型数据库管理系统，由瑞典MySQL AB公司开发，目前属于Oracle公司。MySQL是一种关联数据库管理系统，关联数据库将数据保存在不同的表中，而不是将所有数据放在一个大仓库内，这样就增加了速度并提高了灵活性。MySQL所使用的SQL语言是用于访问数据库的最常用标准化语言。MySQL软件采用了双授权政策（本词条“授权政策”），它分为社区版和商业版，由于其体积小、速度快、总体拥有成本低，尤其是开放源码这一特点，一般中小型网站的开发都选择MySQL作为网站数据库。
https://www.mysql.com/ 
https://www.navicat.com.cn/ 

### 1.2.9 连接MySQL与Navicat ###
点击“新建连接”，输入mysqlroot用户信息。连接成功后Navicat右侧显示如下，注意这个端口号，之后要使用.
 

### 1.2.10 在navicat上建立数据库 ###
在Navicat上新建mysql连接->新建数据库->新建查询。
装入mysql语句，点击“运行”，数据库就建立完成了。

### 1.2.11 导入javaweb项目 ###
在eclipse中导入完整项目。
注意运行javaweb项目时需要在Referenced Libraries下Build Path导入如下图所示的.jar包。
其中 jsp-api.jar servlet-api.jar tomcat-api.jar都在之前下载的tomcat的lib文件夹中
Mysql-connector-java-8.0.16.jar是采用(mysql数据库)JDBC驱动包mysql-connector-java-8.0.16，可以在mysql官网下载。
 




### 1.2.13 运行项目 ###
最后确认src->javabean->db_conn.java文件中数据连接的端口后和数据名字是否和navicat中建好的数据库端口号，数据库名字，数据库密码匹配，如果不一样请修改。
 
所有环境配置完成后就可以选择自己要运行的.jsp文件，一般从index.jsp开始，点击项目右键Run as -> Run on Server。
可以直接在eclipse中查看网页，也可以在浏览器中输入网址，一般默认网址为http://localhost:8080/项目名称/文件名字.jsp

