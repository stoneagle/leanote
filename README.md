# 项目初始化
## mongodb创建
* 拉取mongodb镜像，并启动相关容器，将数据落地到docker-compose配置的本地路径
* 通过docker exec进入mongo容器，根据命令创建全局admin用户，参考命令如下：
```
db.createUser({ 
    user: 'admin', 
    pwd: 'xxx', 
    roles: [ { role: "root", db: "admin" } ] });
```
* 创建完admin账户后，通过MongoChef访问mongodb服务，port配置在docker目录下的.env
* 通过admin账号登陆，并创建对应database，并创建对应账号与配置密码，重新启动leanote服务
* 根据backup还原leanote的mongodb数据
```
mongorestore --username user --password 'pass' --db db ./backup-dir
```
* 为了支持pdf下载，需要额外配置whhtmltopdf插件以及相关字体
