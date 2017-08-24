
Credit
----------- 
https://github.com/andreisusanu/docker-nginx-php7


nginx-php7
==========
Build image
-----------

```bash
git clone https://github.com/andreal01/nginx-php7
cd nginx-php7

```
note: please install make with :

```bash
sudo apt-get install make
```

and then : 

```bash
sudo make build
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
http://localhost:8000/
```



