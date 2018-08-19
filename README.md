
Credit
----------- 
https://github.com/andreisusanu/docker-nginx-php7


nginx-php7
==========
Build image
-----------

```bash
git clone https://github.com/andreal01/Docker-Nginx-PHP-MySQL.git
cd Docker-Nginx-PHP-MySQL

```

if you want to use antoher branch (ex. use Php7.0)
-------------
```bash
git fetch
git checkout <branch>
```
note: please install make with :

```bash
sudo apt-get install make
```
Run container
-------------
```bash
sudo make run
```

Check Version PHP
-------------
```bash
sudo make test
```


Run bash on container (for debug)
-------------
```bash
sudo make bash
```


Test container
--------------
```bash
http://localhost:8080/
```

Remove container
--------------
```bash
sudo make clear
```