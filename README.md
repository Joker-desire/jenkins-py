# jenkins-py

## 描述
Jenkins Docker集成Python

## 文件夹描述
- app: 挂载出的目录（预留）
- compose：存放Dockerfile
  - Dockerfile：集成Python的Jenkins镜像文件
  - initPipenv.sh：初始化pipenv虚拟环境 
- jenkins_home：挂载Jenkins家目录
- docker-compose.yml 

## 运行
```bash
cd jenkins-py
docker-compose -f docker-compose.yml up -d
```

## 包含了pipenv虚拟环境
参考此篇文章【[Jenkins任务中使用Pipenv](https://joker-desire.github.io/2022/07/jenkins%E4%BB%BB%E5%8A%A1%E4%B8%AD%E4%BD%BF%E7%94%A8pipenv/)】
