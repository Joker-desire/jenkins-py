#! /bin/bash
# Author: Joker-desire
# Date: 2022-07-15


initPipfile()
{
    echo "Init python virtual env"
    # 参数1：python版本
    if [ -f "Pipfile" ]; then
        echo "Python virtual env is existed"
    else
        echo "Start build python virtual env"
        pipenv --python $1
    fi
}
getVirtName()
{
    # 参数1: 虚拟环境名称，实际就是Jenkins任务名
    # 通过当前任务名，查询虚拟环境文件夹名称
    echo $(ls $HOME/.local/share/virtualenvs | grep "$1-")
}

addEnv()
{
    echo "Add temporary system env variables"
    # 设置虚拟环境临时环境变量
    export VIRTUAL_ENV=$HOME/.local/share/virtualenvs/$1
    # 把bin加入到path环境变量中
    export PATH=${VIRTUAL_ENV}/bin:$PATH
}

main()
{
    echo "come into workspace"
    cd $3
    py=$1
    jobName=$2
    initPipfile $py
    virtName=`getVirtName $jobName`
    addEnv $virtName
    # 检查当前python版本
    python3 --version
}

# 参数1 python版本
# 参数2 Jenkins任务名称 $JOB_NAME
# 参数3 Jenkins Job文件夹路径
main $1 $2 $3