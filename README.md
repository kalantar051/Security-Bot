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
````
* **اجرای اپ استارت پیکا**
`````sh
ابتدا به پوشه
etc
برید و در فایل
pika.conf
خط دهم بجای کلمه
root
نام یوزرتون یا روتتون رو قرار بدید
سپس دستورات زیر را اجرا نمایید

cd Security-Bot

sed -i "s/root/$(whoami)/g" etc/pika.conf

sed -i "s_telegrambotpath_$(pwd)_g" etc/pika.conf

sudo cp etc/pika.conf /etc/init/

chmod 777 pika

nohup ./pika &>/dev/null &

sudo start pika

screen ./pika
````
* **نکات مهم در اجرای روبات**
`````sh
- حتما تیجی پایین را جایگذاری نمایید
- از آموزش نصب تیجی در زیل متن استفاده نمایید
- برای کارکرد کامل روبات تعویض تیجی الزامیست
- درصورت نصب نکردن تیجی به مشکل خواهید خورد

`````

* [آموزش نصب تیجی](https://telegram.me/AboutBots/64)
* [تیجی مخصوص روبات - سازگاری کامل](https://telegram.me/AboutBots/68)

#
* **تشکر ویژه از بیوند تیم**
