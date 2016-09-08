ls
rm t50-5.6.6.tar.gz
rm t50-5.6.6.tar.gz.1 
¬
wget --quiet "http://downloads.sourceforge.net/project/t50/t50-5.6/t50-5.6.6.tar.gz"
ls
tar -xvzf t50-5.6.6 > /dev/null
tar -xvzf t50-5.6.6
ls
tar -xvzf t50-5.6.6.tar.gz > /dev/null
ls
cd t50-5.6.6/
ks
ls
sudo ./configure
sudo make
sudo make install
t50 --version
exit
