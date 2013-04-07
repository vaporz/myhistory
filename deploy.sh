#!/bin/bash
SERVER=$1
if [ -z "${SERVER}" ]; then
        echo "usage : deploy.sh [ip]";
    exit;
fi

DATE=`date +%s`

mvn -U clean package
cd target
mv myhistory-0.0.1-SNAPSHOT myhistory.$DATE
tar czvf myhistory.tar myhistory.$DATE
cd ..
echo "scp -rp ./target/myhistory.tar zhangxiao@$SERVER:/opt/zhangxiao/www/"
      scp -rp -C -l 1024 ./target/myhistory.tar zhangxiao@$SERVER:/opt/zhangxiao/www/
echo "ssh zhangxiao@$SERVER cd /opt/zhangxiao/www; tar xzvf myhistory.tar;ln -s myhistory.$DATE myhistory;sh /opt/soft/resin/bin/resin.sh -server myhistory kill;sh /opt/soft/resin/bin/resin.sh -server myhistory start"
     ssh zhangxiao@$SERVER "cd /opt/zhangxiao/www; tar xzvf /opt/zhangxiao/www/myhistory.tar;rm -rf myhistory; ln -s myhistory.$DATE myhistory;sh /opt/soft/resin/bin/resin.sh -server myhistory kill;sh /opt/soft/resin/bin/resin.sh -server myhistory start"
