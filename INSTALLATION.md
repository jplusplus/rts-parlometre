# Installation

This document is a detailed guide about how to installed this application on 
a production server (UBUNTU 14.04 LTS).

## Pre-requisites

This application is based on Node.js and MySQL. Both can be installed on Ubuntu  using APT.

### Install system dependencies

Use APT to install the following package (supposing the user is in the sudoers file):

    sudo apt-get install -y nodejs npm mysql-server git
    sudo ln -s /usr/bin/nodejs /usr/bin/node

An invite may ask you to enter a password for the root user of MySQL. Pick one
and keep it for later.

### Install Node.js binairies

This application uses a few Node.js binaries to executes basic tasks. 
You have to install them globally with NPM:

    sudo npm install -g bower grunt-cli

### Download the app

Now you need to download the last version of the app.
The application will stand in `/opt/rts-parlometre`:

    cd /opt
    git clone git@github.com:jplusplus/rts-parlometre.git 

### Download dependencies

This app relies on NPM and Bower to manage its dependencies.

    cd /opt/rts-parlometre
    npm install
    bower install

## Build

The application is now ready to be build for production. Still from the root directory
of the project, simply run:

    grunt build:production

A build of the application ready for production will be available in the `dist` directory.

## Configure

To configure the app you have to create a `.env` file in the `dist` directory:

    cd /opt/rts-parlometre/dist
    touch .env

This file contains the environment variables to configure your application. 
It might look like follow:

    NODE_ENV=production
    DATABASE_URL=mysql://root:password@localhost/parlometre
    PORT=8080

This supposes that you already have created a database `parlometre` for you project. 
If you didn't, run:

    mysql -uroot -p -e "CREATE DATABASE parlometre"

## Run

The way you want to run the application is entirely up to you. 
Basically to start it, you have to run the following command:

    node dist/server/app.js

And that's it. 

### Forever

You may want to start it with an error-proof runner, like 
[Forever](https://github.com/foreverjs/forever) which is installable globally with NPM:

    forever start dist/server/app.js

### Nohup

Or more natively on Linux with the `nohup` command:

    nohup node dist/server/app.js &

Note that it wont be able to restart the server automatically if anything makes 
the application crash.

### Upstart

A last alternative would be to use a `upstart` to run the application as a service. 
This script may look like that:

    description "RTS - Le Parlometre"

    start on started mountall
    stop on shutdown

    # Automatically Respawn:
    respawn
    respawn limit 99 5

    script  
        exec sudo -u www-data /usr/bin/node /opt/rts-parlometre/dist/server/app.js >> /var/log/rts-parlometre.log
    end script


Save this script into `/etc/init/rts-parlometre.conf` then run:

    sudo start rts-parlometre

