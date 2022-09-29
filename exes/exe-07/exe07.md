
# [Automate](https://github.com/philemonnwanne/o0o0o/tree/main/exes/exe-07) the boring stuff

## Setup Project requirements for Sending mail via terminal
This script will setup all dependencies for carrying out the seventh exercise. 

> Note: There isn't any support for crontab yet, and I might raise that as an issue. Also feel free to raise an issue on this if you have an immediate solution.

![cron](https://i2.wp.com/www.adminschoice.com/wp-content/uploads/2009/12/crontab-layout.png?w=775&ssl=1)

## Procedure

- Spin up a fresh virtual machine in vagrant for the exercise
- Make sure to have an app password for your desired gmail account ready
- Create two files in your home directory, one for the [memory logger](https://github.com/philemonnwanne/o0o0o/blob/main/exes/exe-07/script.sh) and one for the [exec-07](https://github.com/philemonnwanne/o0o0o/blob/main/exes/exe-07/exec_07.sh) script
- Make sure each script is executable by running: `chmod u+x script_name.sh`

With all of the above in place you can then run the [exec-07]() script in your home directory and watch it do it's magic

After all that is done, you can go ahead to setup your crontab with the following configuration:
```ruby
* * * * * /home/vagrant/exec-07.sh
```

#### Note: 
Contributions are highly welcome. There are lots of functionalities missing, so feel free to raise issues and solutions if you have them.
This has only been tested on ubuntu version 20.04 running on docker or virtualbox environments.
