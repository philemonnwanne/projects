![laravel-logo]()


- I assume you know how to deploy a virtual machine
- How to use vim or at least nano

## REQUIREMENTS
- Virtual machine running Debian 11
- Git, Apache, Wget, Curl
- Php 8.1 and it's dependencies
- Mysql/MariaDb Database
- Composer

### SETUP
###### Install LAMP Stack on Debian 11


### Prerequisites to Install LAMP
- Root access to your server or a sudo user
- Domain pointed to your server's IP

### Update the Package Installer

We will be using the Apt installer to install new packages onto our server

```php
apt update
```

### Install the following packages (Apache2, Wget, Git, Curl)

Now that our installer is up to date, we can now install our web server Apache and the following packages on the server

```php
apt install -y wget git apache2 curl
```

### Install PHP

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
apt install php libapache2-mod-php php8.1-mysql php8.1-common php8.1-mysql 
php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-dev 
php8.1-imap php8.1-mbstring php8.1-opcache php8.1-soap php8.1-zip php8.1-intl -y
```

Once PHP is installed you can check the version using the following command.
```php
php -v
```


### Install Laravel 8 Using Composer 

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

### Create a copy of your `.env` file

`.env` files are not generally committed to source control for security reasons.

```php
cp .env.example .env
```

> This will create a copy of the `.env.example` file in your project and name the copy simply `.env`

Next, change the permission and ownership of `altschool.me` and `laravel` directory
```php
chown -R www-data:www-data /var/www/altschool/laravel
chmod -R 775 /var/www/altschool/laravel
chmod -R 775 /var/www/altschool/laravel/storage
chmod -R 775 /var/www/altschool/laravel/bootstrap/cache
```

### Install Composer

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

Next, verify the Composer version using the following command 
```php
composer --version
```

You should see the following output 
```php
Composer version 2.4.3 2022-10-14 17:11:08
```


### Install Composer Dependencies

Whenever you clone a new Laravel project you must now install all of the project dependencies. This is what actually installs Laravel itself, among other necessary packages to get started. When we run composer, it checks the `composer.json` file which is submitted to the github repo and lists all of the composer (PHP) packages that your repo requires. Because these packages are constantly changing, the source code is generally not submitted to github, but instead we let composer handle these updates. So to install all this source code we run composer with the following command.

```php
composer install
```

generate the artisan key with the following command
```php
php artisan key:generate
```

### Configure Apache to Host Laravel 8

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
        Options Indexes MultiViews
        AllowOverride None
        Require all granted
    </Directory>
    
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

Save and close the file and then enable the Apache rewrite module and activate the Laravel virtual host with the following command: 

```
a2enmod rewrite
a2ensite altschool.conf
```

Finally, reload the Apache service to apply the changes

```
systemctl reload apache2
```

Point your virtual domain to your IP address by editing the `/etc/hosts` file and adding your IP address and your desired virtual domain name which in my case is `altschool.me`.
```
nano /etc/hosts
```

Sample below: DON'T FORGET TO USE YOUR OWN IP PLEASE
```
root@ubuntu:/# nano /etc/hosts
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
172.17.0.2      altschool.me
```


### Access Laravel
Now, open your web browser and access the Laravel site by visiting your domain. You will be redirected to the Laravel default page. If you get a `404 | not found` error, make sure to do the following...
- move to your `routes` directory in your project directory which in my case is `/var/www/mini-project/laravel/routes`
```
cd /var/www/mini-project/laravel/routes
```
- look for a file name `web.php` and remove the comments on the block of code which starts with `Routes::` it should look something like the file below
```
<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*Route::get('/', function () {
    return view('welcome');
});*/
```

##### When you are done editing the file it should now look like what I have below

```
<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
```

### Encrypt your domain and make 
Next if you have a valid domain name, we are going to encrypt it and make our traffic use SSL/TLS



### Rendered Page
![rendered-page-laravel](https://github.com/philemonnwanne/altschool-cloud-exercises/blob/main/Mini-Project/images/rendered-page.jpg)
