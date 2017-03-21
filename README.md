### docker容器化php开发环境搭建 
初次使用mac,  想编译安装lnmp开发，遇到软件依赖问题, 于是制作了docker环境

### 基础目录
- /data/www    代码目录
- /data/mysql   mysql数据库目录
- /data/nginx   nginx配置

### 依赖
docker  docker-compose 最新稳定版本
#### 构建
docker-compose up
### 初始化
```bash
    $ chmod +x docker_enter_init.sh
    $ ./docker_enter_init.sh
    $  enterpoint [mysql | php | nginx]  #进入相应容器命令
```
### 注意
- 默认启动php5.6版本
  如果切换php7, 修改php71对应的 SERVER_START = ‘true’,  php56的SERVER_START = ‘false’,   并修I改web容器的PHP_VERSION=php71, 重新构建即可
- mysql的配置
```
    #root 密码
    MYSQL_ROOT_PASSWORD: root
    # 默认添加一个新用户
    MYSQL_USER: homestead
    MYSQL_PASSWORD: 123456
```
