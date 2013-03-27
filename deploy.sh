#!/bin/bash
mvn -U clean package
echo 'rm -rf /opt/www/myhistory'
rm -rf /opt/www/myhistory 
echo 'cp -r ./target/myhistory-0.0.1-SNAPSHOT /opt/www/myhistory'
cp -r ./target/myhistory-0.0.1-SNAPSHOT /opt/www/myhistory
sh /opt/soft/resin/bin/resin.sh -server myhistory kill
sh /opt/soft/resin/bin/resin.sh -server myhistory start
