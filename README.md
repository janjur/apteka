# Apteka

# Linux deploy

## Downloading repository and requirements

```
git clone https://github.com/janjur/apteka.git ~/apteka
cd ~/apteka
pip3 install -r requirements
apt-get install python3-dev libmysqlclient-dev
```

## Running MySQL server

* [Install Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)
* Create ~/apteka/.data if nonexisting
* Run `docker run --name apteka-mysql -e MYSQL_ROOT_PASSWORD=pw -d -p 3306:3306 -v ~/apteka/.data:/var/lib/mysql mysql`
* Check, if you can connect to db at localhost:3306. _You may use `MySQL workbench` or `Pycharm Professional` built-in `Databse` tool._
* Create and populate tables using provided scripts

## Running Flask server

```
cd ~/apteka
python3 apteka.py
```

## Access application

### Connect to dashboard via browser at localhost:8080