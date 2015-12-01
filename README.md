# MSSH

    Mssh是一个基于maven、struts、spring、hibernate框架的脚手架生产工具。

##用法
1. 下载安装文件
    
    `wget https://github.com/missall/MSSH/archive/master.zip`
    
    OR
    
    `git clone https://github.com/missall/MSSH.git`

2. 解压安装文件
    
    `unzip master.zip`

3. 安装
    
    `cd mssh`

    `sudo sh install.sh`

4. 安装依赖的ruby环境
    
    `brew install ruby`

5. 创建一个项目
    
    `mssh create myproject`

6. 根据生成的ORM映射文件生成MODEL的各层代码
    
    `mssh create all modelName`

7. 启动项目
    
    `maven jetty:run`

8. 浏览器访问 

    `http://localhost:8080/myproject`

##引入的主要框架和类库
* bootstrap.js_v3.3.5
* bootstrap.css_v3.3.5
* jquery_v2.1.4
* jquery.form_v3.09
* spring3.0.5
* struts2.2.1
* hibernate3.5.1
* urlrewirte3.2.0
* json-lib2.4
* jedisClient2.0

