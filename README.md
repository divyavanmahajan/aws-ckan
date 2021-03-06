# CKAN

## 1. OVERVIEW

CKAN is a powerful data management system that makes data accessible – by providing tools to streamline publishing, sharing, finding and using data. CKAN is aimed at data publishers (national and regional governments, companies and organizations) wanting to make their data open and available.

This is a fork of the original https://github.com/Launch-with-1-Click/aws-ckan which has not been updated since 2 years. I've updated the setup to deploy into AWS VPCs, CKAN 2.5.2 and Ubuntu 16.04 (Xenial).

## 2. COMPONENTS AND INSTALLATION STEPS

* Ubuntu 16.04
* Apache (latest)
* Nginx (latest)
* PostgreSQL 9.5
* CKAN 2.5.2
* Jetty 8
* OpenJDK 8


## 2.1 Installation

+ Clone this repository
```bash
git clone https://github.com/divyavanmahajan/aws-ckan.git
```
+ Edit the file start.sh (or start.bat in Windows) to set your environment variables. 
```
#!/bin/sh
export AWS_ACCESS_KEY=AKXXXXX55GP7WORDQ
export AWS_SECRET_ACCESS_KEY=l5XXXXXXXXXXXXXXXXXXRTvPWMHIwkp
export AWS_EC2_KEYPAIR=my-aws-keypair
export AWS_EC2_KEYPAIR_PATH=~/.ssh/my-aws-keypair.pem
export AWS_SUBNET=subnet-6xxxx852
vagrant up --provider aws
vagrant provision
```
+ Run start.sh (or start.bat in Windows)
```bash
  sh start.sh
```
+ Alternative to running vagrant provision - If Vagrant provision seems to hang
```bash
vagrant ssh
cd /vagrant
sudo bash bootstrap.sh
```
 

## 3. URLs

```
http://${public_hostname}/
```

## 4. DEFAULT USERNAMES AND PASSWORDS

* PostgreSQL
    * User: ckan_default
    * Password: Random Password (See /etc/ckan/default/production.ini)

## 5. Creating a sysadmin user

You have to use CKAN’s command line interface to create your first sysadmin user.

SSH into the instance with the user ‘ubuntu’. 

```
vagrant ssh
```

CKAN commands are executed using the paster command on the server that CKAN is installed on. Before running the paster commands below, you need to make sure that your virtualenv is activated and that you're in your ckan source directory.

```
. /usr/lib/ckan/default/bin/activate
cd /usr/lib/ckan/default/src/ckan
```

You have to create your first CKAN sysadmin user from the command line. For example, to create a user called seanh and make him a sysadmin:

```
paster sysadmin add seanh -c /etc/ckan/default/production.ini
```

More instructions on getting started with CKAN at the CKAN docs site at http://docs.ckan.org/en/latest/maintaining/getting-started.html

## 5. Customizing look and feel


Some simple customizations to customize the ‘look and feel’ of your CKAN site are available via the UI, at `http://<my-ckan-url>/ckan-admin/config/`.
To remove the instructions, enter something in the "Intro Text" in the CKAN customization
(The template is stored in `/usr/lib/ckan/default/src/ckan/ckan/templates/home/snippets/promoted.html`.

![CKAN Config Panel](https://www.evernote.com/shard/s21/sh/b4245a4f-a769-433e-8235-d05ee0156c0d/e731f862589c40101fd6d72f46704f2f/deep/0/Administration---CKAN.png)

http://docs.ckan.org/en/latest/maintaining/getting-started.html

## 6. Install an Email Server

Install an email server to enable CKAN’s email features (such as sending traceback emails to sysadmins when crashes occur, or sending new activity email notifications to users). For example, to install the Postfix email server, do:

```
sudo apt-get install postfix
```


When asked to choose a Postfix configuration, choose `Internet Site` and press return.
Alternatively, you can use https://github.com/ckan/ckan-docker/blob/master/_etc/postfix/main.cf to replace `/etc/postfix/main.cf`.

## 7. More information

[Welcome to CKAN’s Documentation](http://docs.ckan.org/)

