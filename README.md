# [سکوریتی بات](https://telegram.me/tgsecuritybot)
* **نصب پیش نیازها**
`````sh
sudo apt-get update; sudo apt-get upgrade -y --force-yes; sudo apt-get dist-upgrade -y --force-yes; sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev libjansson* libpython-dev make unzip git redis-server g++ autoconf -y --force-yes
`````
* **نصب روبات**
`````sh
git clone https://github.com/MobinDehghani/Security-Bot.git && cd Security-Bot && chmod +x launch.sh && ./launch.sh install && ./launch.sh
`````
* **اجرای روبات**
`````sh
cd $HOME && cd Security-Bot && ./launch.sh
`````
* **نصب ردیس [برای سرورهای رایگان[**
`````sh
sudo service redis-server start && redis-cli
`````

