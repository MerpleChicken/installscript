#/bin/bash
# 아파치 2.4 설치
echo "install gcc and g++ compiler";
apt-get install -y gcc;
apt-get install -y g++;
apt install -y libexpat1-dev;
apt-get install iy pcre-devel;
echo "done."

echo "install apr";
wget http://mirror.navercorp.com/apache//apr/apr-1.6.5.tar.gz;
tar zxvf ./apr-1.6.5.tar.gz;
cd apr-1.6.5;
./configure --prefix=/usr/local/apr;
make && make install;
cd ..;
echo "done";

echo "install apr-util";
wget http://mirror.navercorp.com/apache//apr/apr-util-1.6.1.tar.gz;
tar zxvf ./apr-util-1.6.1.tar.gz;
cd apr-util-1.6.1;
./configure --prefix=/usr/local/apr-util  --with-apr=/usr/local/apr;
make && make install;
cd ..;
echo "done.";

echo "pcre installation needs manual download";
tar zxvf ./pcre-8.39.tar.gz;
cd pcre-8.39;
./configure --prefix=/usr/local/pcre;
make && make install;
echo "done.";

echo "install apache";
wget http://apache.tt.co.kr//httpd/httpd-2.4.37.tar.gz;
tar zxvf ./httpd-2.4.37.tar.gz;
mkdir -p /engn001/apache/2.4;
cd httpd-2.4.37;
./configure --prefix=/engn001/apache/2.4 --with-apr=/usr/local/apr --with-apr-util=/usr/local/apr-util --with-pcre=/usr/local/pcre --enable-mods-shared=most --enable-module=so --enable-rewrite;
make && make install;
echo "done."

echo `pwd`;
echo "remove install file...";
cd /engn001/installscript;
#rm -rf ./apr*;
echo "done";
