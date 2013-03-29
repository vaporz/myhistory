#!/bin/bash
SERVER=$1
if [ -z "${SERVER}" ]; then
        echo "Usage:deploy.sh [ip]";
    exit;
fi

mvn -U clean package
echo 'ssh zhangxiao@$SERVER rm -rf /opt/zhangxiao/myhistory.tmp'
ssh zhangxiao@$SERVER "rm -rf /opt/zhangxiao/myhistory.tmp"
echo 'scp -rp ./target/myhistory-0.0.1-SNAPSHOT zhangxiao@$SERVER:/opt/zhangxiao/myhistory.tmp'
scp -rp ./target/myhistory-0.0.1-SNAPSHOT zhangxiao@$SERVER:/opt/zhangxiao/myhistory.tmp
echo 'ssh zhangxiao@$SERVER cd /opt/zhangxiao; ln -s /opt/zhangxiao/myhistory.tmp myhistory;sh /opt/soft/resin/bin/resin.sh -server myhistory kill;sh /opt/soft/resin/bin/resin.sh -server myhistory start'
ssh zhangxiao@$SERVER "cd /opt/zhangxiao; ln -s /opt/zhangxiao/myhistory.tmp myhistory;sh /opt/soft/resin/bin/resin.sh -server myhistory kill;sh /opt/soft/resin/bin/resin.sh -server myhistory start"
