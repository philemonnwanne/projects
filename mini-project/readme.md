![laravel-logo](/mini-project/img/laravel-logo.svg)

# Prerequisites
- I assume you know how to deploy a virtual machine 🖥
- basic knowledge of the linux file system | ownership | permissions 🐧
- basic knowledge of git 🚦
- stable internet connection (very important)☁️
- How to use linux editor `vim` or at least `nano` 📝
- a cup of coffee ☕️

<span> If this mini-article doesn't work for you there are video guides below that can help deploy this project here [Helpful Videos](#Helpful-Videos)</span>

### SETUP

###### Install LAMP Stack on Debian 11
- Virtual machine running Debian 11
- Git, Apache, Wget, Curl
- Php 8.1 and it's dependencies
- Mysql/MariaDb Database
- Composer

### Prerequisites to Install LAMP
- Root access to your server or a sudo user
- Domain pointed to your server's IP

### 1. Update the Package Installer

Make sure to switch to `root user`. We will be installing updating the apt repository before installing any package

```php
sudo su
apt update
```

### 2. Install the following packages (Apache2, Wget, Git, Curl)

Now that our installer is up to date, we can now install our web server Apache and the following packages on the server

```php
apt install -y wget git apache2 unzip curl
```

### 3. Install PHP

###### Add the SURY PPA for PHP 8.1

```php
apt -y install lsb-release apt-transport-https ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
```

Now you can add the PPA to the server packages using the following command
```php
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
```

Update the packages and install PHP 8.1
```php
apt update
apt install php libapache2-mod-php php8.1-mysql php8.1-common php8.1-mysql php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-dev php8.1-imap php8.1-mbstring php8.1-opcache php8.1-soap php8.1-zip php8.1-intl -y
```

Once PHP is installed you can check the version using the following command.
```php
php -v
```


### 4. Install mySQL

The next step is to install our database server on our virtual machine. Follow steps below to Install mySQL 8.0 on your Debian 11 Linux system

Add mySQL Dev apt repository. MySQL 8.0 packages are available on official mySQL Dev apt repository
```
apt update
wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
```

> Note: If you get any error in this next 👇🏾 step, keep retrying the command until it's all good -- could be network issues 

Install the release package
```
apt update
apt install ./mysql-apt-config_0.8.22-1_all.deb
```

<span>Confirm addition of mySQL 8.0 repository as default when prompted</span>


![mysql-prompt-image](/mini-project/img/mysql-prompt.png)

Use the down arrow key to choose OK, then press `Tab` and hit `Enter` (as shown in the image above) - Would be done twice

> Note: If you get any error in this next 👇🏾 step, keep retrying the command until it's all good -- could be network issues 

Now you can install mySQL
```
apt update
apt install mysql-server
```
<samp>When prompted, enter your root password and choose legacy authentication</samp>

we can now exit mySQL using the command `exit;`

To verify that the mySQL server is running, type:
```
service mysql status
```

The output should show that the service is enabled and running


### 5. Create a Database
Login to mySQL  by executing the following command into mySQL:
```
mysql -u root -p
```

Replace the “your password” with the password you had set up during installation. Once we are logged in, we can now create a database using the following command:

```
CREATE DATABASE yourdatabase;
```
> replace `yourdatabase` with your desired database name. Once the database has been created, we can now exit mySQL using the command `exit;`. Also remember to add the semi-colons.



### 6. Clone the project repo

Switch to apache's document root
```php
cd /var/www/
```

Create a directory to house your laravel project, and for the purpose of this writing I will call mine `altschool`
```php
mkdir altschool
```

Switch to the directory created in the previous step and clone the [laravel project](https://github.com/f1amy/laravel-realworld-example-app.git) from github

```php
cd altschool
git clone https://github.com/f1amy/laravel-realworld-example-app.git
```

Rename the cloned git repo to whatever you wish to call your project, for my use case I will name it `laravel`
```php
mv laravel-realworld-example-app laravel
```

Switch to your projects directory
```php
cd laravel 
```


Run the following command to edit the `web.php` file in the routes directory
```
nano /var/www/altschool/laravel/routes/web.php
```

The code block that we want to alter in the file should look similar to what we have below

```php
<?php

/*Route::get('/', function () {
    return view('welcome');
});*/
```

When you are done editing the file it should now look like this 👇🏾

```php
<?php

Route::get('/', function () {
    return view('welcome');
});
```


### 7. Create and edit the `.env` file

`.env` files are not generally committed to source control for security reasons.

```php
cp .env.example .env
```

> This will create a copy of the `.env.example` file in your project and name the copy simply `.env`

Next, edit the `.env` file and define your database:
```
nano .env
```

`Note`: Configure your `.env` file just as it is in the output below, only make changes to the `DB_DATABASE` and `DB_PASSWORD` lines

```php
APP_NAME="your app name" (call it anything you wish)
APP_URL=your machine's IP addr eg. (192.168.10.22)
DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=enter the name of your database here
DB_USERNAME=root
DB_PASSWORD=enter your mysql root password here
```
After updating your .env file, save the changes and exit


### 8. Install Composer

Composer is a dependency manager for PHP used for managing dependencies and libraries required for PHP applications. To install `composer` run the following command: 

```php
curl -sS https://getcomposer.org/installer | php
```

You should get the following output
```php
All settings correct for using Composer
Downloading...
Composer (version 2.4.3) successfully installed to: /root/composer.phar
Use it: php composer.phar 
```

Next, move the downloaded binary to the system path and make it executable by everyone
```php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
```

Next, run the following command and enter `yes` to any prompt that appears 
```php
composer
```

You should see the following output 

![laravel-logo](/mini-project/img/composer.png)


### 9. Install Composer Dependencies

<span>Whenever you clone a new Laravel project you must now install all of the project dependencies. This is what actually installs Laravel itself, among other necessary packages to get started. When we run composer, it checks the `composer.json` file which is submitted to the github repo and lists all of the composer (PHP) packages that your repo requires. Because these packages are constantly changing, the source code is generally not submitted to github, but instead we let composer handle these updates.</span>

So to install all this source code run composer with the following command and enter `yes` to any prompt that appears

```php
composer install
```

Generate the artisan key with the following command 
> make sure you are in the `/var/www/altschool/laravel` directory before executing any command that starts with `php artisan`
```php
php artisan key:generate
```

Also run the following php artisan commands
```
sudo php artisan config:cache
sudo php artisan migrate:fresh
sudo php artisan migrate --seed
```


### 10. Configure Apache to Host Laravel 8

Next, you'll need to create an Apache virtual host configuration file to host your Laravel application.
```php
nano /etc/apache2/sites-available/altschool.conf
```

Add the following lines
```php
<VirtualHost *:80>
    ServerAdmin admin@altschool.me
    ServerName altschool.me
    ServerAlias www.altschool.me
    DocumentRoot /var/www/altschool/laravel/public
    
    <Directory /var/www/altschool/laravel/public>
        AllowOverride All
    </Directory>
    
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

Save and close the file and then enable the Apache rewrite module and activate the Laravel virtual host with the following commands: 

```
a2enmod rewrite
a2dissite 000-default.conf
a2ensite altschool.conf
```

Next, change the permission and ownership of `altschool` and `laravel` directory
```php
chown -R www-data:www-data /var/www/altschool/laravel
chmod -R 775 /var/www/altschool/laravel
```

Finally, reload the Apache service to apply the changes

```
systemctl restart apache2
```


### Access Laravel

Now you should be able to view the default laravel page
#### rendered page
![rendered-page-laravel](/mini-project/img/mini-proj.png)

Note: Run the following commands to test that all endpoints are working as they should

```php
cd /var/www/altschool/laravel
php artisan route:list
```

This will return a list of all the possible endpoints in the project and you can test them by visiting your `domain name/the desired endpoint` or preferably using `postman`

### apis/endpoints
![rendered-page-laravel](/mini-project/img/endpoints.png)


### Helpful-Videos
- https://www.youtube.com/watch?v=a3JrPjEXTPI
- https://www.youtube.com/watch?v=XAP86mB55xI
- https://www.youtube.com/watch?v=K25411ukOh0
- https://www.youtube.com/watch?v=poHRomqMjts


### Errors
Besides network connectivity related problems one major error that you might encounter might be related to;
- [ ] mySQL hogging up your memory and not releasing it
- [ ] mySQL service failing to start or getting other processes killed

<span>The solution to the above is to make sure you assign 2gb (2048mb) of RAM and above to your vm</span>

To go back to the top click [here](#Prerequisites)
