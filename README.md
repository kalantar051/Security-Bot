# [Security-Bot](https://telegram.me/tgsecuritybot)
* **نصب پیش نیازها**
`````sh
sudo apt-get update; sudo apt-get upgrade -y --force-yes; sudo apt-get dist-upgrade -y --force-yes; sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev libjansson* libpython-dev make unzip git redis-server g++ autoconf -y --force-yes
`````
* **نصب روبات**
`````sh
cd $HOME && git clone https://github.com/MobinDehghani/Security-Bot.git && cd Security-Bot && chmod +x launch.sh && ./launch.sh install && ./launch.sh
`````
* **اجرای روبات**
`````sh
cd $HOME && cd Security-Bot && ./launch.sh
`````
* **نصب ردیس - سرورهای رایگان**
`````sh
sudo service redis-server start && redis-cli
`````
* **نکات مهم در اجرای روبات**
`````sh
- حتما تیجی پایین را جایگذاری نمایید
- از آموزش نصب تیجی در زیل متن استفاده نمایید
- برای کارکرد کامل روبات تعویض تیجی الزامیست
- درصورت نصب نکردن تیجی به مشکل خواهد خورد
`````

* [آموزش نصب تیجی](https://telegram.me/AboutBots/64)
* [تیجی مخصوص روبات - سازگاری کامل](https://telegram.me/AboutBots/68)

#
* **تشکر ویژه از بیوند تیم**
