# Apteka

# Linux deploy

## Downloading repository and requirements

```
git clone https://github.com/janjur/apteka.git ~/apteka
cd ~/apteka
sudo apt-get install python3-dev libmysqlclient-dev
# if using Python3.6 on Ubuntu16.04:
    sudo add-apt-repository ppa:jonathonf/python-3.6
    sudo apt-get update
    sudo apt-get install python3.6-dev
sudo pip3 install -r requirements
```

## Running MySQL server

* [Install Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)
```
mkdir ~/apteka.data
sudo docker run --name apteka-mysql -e MYSQL_ROOT_PASSWORD=pw -d -p 3306:3306 -v ~/apteka/.data:/var/lib/mysql mysql
```
* Run `MySQL workbench` or `Pycharm Professional` built-in `Databse` tool
* Connect to db at localhost:3306 
* Create and populate tables using provided scripts in `~/apteka/scripts`

## Running Flask server

```
cd ~/apteka
python3 apteka.py
```

## Access application

Connect to dashboard using browser at localhost:8080
