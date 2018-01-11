# Apteka

# Linux deploy

## Downloading repository and requirements

```
git clone https://github.com/janjur/apteka.git ~/apteka
cd ~/apteka
sudo su
apt-get install python3-dev libmysqlclient-dev
# if using Python3.6 on Ubuntu16.04:
    add-apt-repository ppa:jonathonf/python-3.6
    apt-get update
    apt-get install python3.6-dev
pip3 install -r requirements  # better to use venv, though
```

## Running MySQL server

* [Install Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)
```
mkdir ~/apteka.data
docker run --name apteka-mysql -e MYSQL_ROOT_PASSWORD=pw -d -p 3306:3306 -v ~/apteka/.data:/var/lib/mysql mysql  #still su?
```
* Connect to db at localhost:3306. 
* Create and populate tables using provided scripts in `~/apteka/scripts`
** You may use `MySQL workbench` or `Pycharm Professional` built-in `Databse` tool.

## Running Flask server

```
cd ~/apteka
python3 apteka.py
```

## Access application

Connect to dashboard using browser at localhost:8080
