宝塔_6.0

## How to start

```bash

docker run --name bt_test -d -p 20:20 -p 21:21 -p 80:80 -p 443:443 -p 888:888 -p 8888:8888 wojiushixiaobai/bt:test

```

## 查看默认用户密码

```bash

docker logs -f bt_test

```

**设置环境变量：**

- VOLUME /www
