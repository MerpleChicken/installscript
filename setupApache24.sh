#/bin/bash
# 아파치 2.4 설치
export DEFAULT_LOC = `pwd`;
echo ${DEFAULT_LOC};
echo "==============================================================";
echo "==============================================================";
echo "================install gcc and g++ compiler==================";
echo "==============================================================";
echo "==============================================================";
apt-get install -y gcc;
apt-get install -y g++;
apt install -y libexpat1-dev;
apt-get install iy pcre-devel;
echo "done."

echo "==============================================================";
echo "==============================================================";
echo "==========================install apr=========================";
echo "==============================================================";
echo "==============================================================";
wget http://mirror.navercorp.com/apache//apr/apr-1.6.5.tar.gz;
tar zxvf ./apr-1.6.5.tar.gz;
cd apr-1.6.5;
./configure --prefix=/usr/local/apr;
make && make install;
cd ..;
echo "done";

echo "==============================================================";
echo "==============================================================";
echo "=====================install apr-util=========================";
echo "==============================================================";
echo "==============================================================";
wget http://mirror.navercorp.com/apache//apr/apr-util-1.6.1.tar.gz;
tar zxvf ./apr-util-1.6.1.tar.gz;
cd apr-util-1.6.1;
./configure --prefix=/usr/local/apr-util  --with-apr=/usr/local/apr;
make && make install;
cd ..;
echo "done.";

echo "==============================================================";
echo "==============================================================";
echo "=========================install pcre=========================";
echo "==============================================================";
echo "==============================================================";
tar zxvf ./pcre-8.39.tar.gz;
cd pcre-8.39;
./configure --prefix=/usr/local/pcre;
make && make install;
echo "done.";

echo "==============================================================";
echo "==============================================================";
echo "=======================install apache=========================";
echo "==============================================================";
echo "==============================================================";
wget http://apache.tt.co.kr//httpd/httpd-2.4.37.tar.gz;
tar zxvf ./httpd-2.4.37.tar.gz;
mkdir -p /engn001/apache/2.4;
cd httpd-2.4.37;
./configure --prefix=/engn001/apache/2.4 --with-apr=/usr/local/apr --with-apr-util=/usr/local/apr-util --with-pcre=/usr/local/pcre --enable-mods-shared=most --enable-module=so --enable-rewrite;
make && make install;
echo "done."

echo "==============================================================";
echo "==============================================================";
echo "===================remove install files=======================";
echo "==============================================================";
echo "==============================================================";
cd /engn001/installscript;
rm -rf ./apr* && rm -rf ./pcre* && rm -rf httpd*;
echo "done";

echo "==============================================================";
echo "==============================================================";
echo "=============make instance and configuration==================";
echo "==============================================================";
echo "==============================================================";
mkdir -p /engn001/apache/2.4/servers/webd-apache_80;
cp -r /engn001/apache/2.4/conf /engn001/apache/2.4/servers/webd-apache_80;
mkdir -p /logs/apache/2.4/logs;
ln -s /logs/apache/2.4/logs /engn001/apache/2.4/servers/webd-apache_80;
mkdir -p /engn001/apache/2.4/servers/webd-apache_80/bin;
cp ${DEFAULT_LOC}/*.sh /engn001/apache/2.4/servers/webd-apache_80/bin;
cp ${DEFAULT_LOC}/httpd.conf /engn001/apache/2.4/servers/webd-apache_80/conf
chmod -R 755 /engn001/apache;
chown -R dextop:dextop /engn001/apache;
su - dextop -c '/engn001/apache/2.4/servers/webd-apache_80/bin/start.sh';

