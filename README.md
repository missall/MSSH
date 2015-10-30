# MSSH
Mssh是一个基于maven、struts、spring、hibernate框架的脚手架生产工具。

##用法
1. mssh需要依赖ruby环境，请先安装ruby
    brew install ruby
2. 创建一个项目
    mssh create myproject
3. 根据生成的ORM映射文件生成MODEL的各层代码
    mssh create all modelName
4. 启动项目
    maven jetty:run
5. 使用浏览器访问`http://localhost:8080/myproject`

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

