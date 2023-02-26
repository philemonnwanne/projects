#!/bin/bash

# COMMENT OUT FOR USE WITH UBUNTU [20.04-22.04]
# apt update -y
# apt install -y apache2
# systemctl start apache2

# COMMENT OUT FOR USE WITH AMAMZON-LINUX 2
# this is necessary to make the ec2 instances healthy
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd


# export META_INST_ID=`curl http://169.254.169.254/latest/meta-data/instance-id`
# export META_INST_TYPE=`curl http://169.254.169.254/latest/meta-data/instance-type`
# export META_INST_AZ=`curl http://169.254.169.254/latest/meta-data/placement/availability-zone`
# # export META_INST_PRIVATE_IP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
# export META_INST_LOCAL_HOSTNAME=`curl http://169.254.169.254/latest/meta-data/local-hostname`
# export META_INST_PUBLIC_IP=`curl http://169.254.169.254/latest/meta-data/public-ipv4`

# document='index.html'
# appname='philemonnwanne.me'
# cd /var/www/html
# rm -r ${document}
# echo "<!DOCTYPE html>" >> ${document}
# echo "<html lang="en">" >> ${document}
# echo "<head>" >> ${document}
# echo "    <meta charset="UTF-8">" >> ${document}
# echo "    <meta name="viewport" content="width=device-width, initial-scale=1.0">" >> ${document}
# echo "    <style>" >> ${document}
# echo "        @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');" >> ${document}
# echo "        html {" >> ${document}
# echo "            position: relative;" >> ${document}
# echo "            overflow-x: hidden !important;" >> ${document}
# echo "        }" >> ${document}
# echo "        * {" >> ${document}
# echo "            box-sizing: border-box;" >> ${document}
# echo "        }" >> ${document}
# echo "        body {" >> ${document}
# echo "            font-family: 'Open Sans', sans-serif;" >> ${document}
# echo "            color: #324e63;" >> ${document}
# echo "        }" >> ${document}
# echo "        .wrapper {" >> ${document}
# echo "            width: 100%;" >> ${document}
# echo "            width: 100%;" >> ${document}
# echo "            height: auto;" >> ${document}
# echo "            min-height: 90vh;" >> ${document}
# echo "            padding: 50px 20px;" >> ${document}
# echo "            padding-top: 100px;" >> ${document}
# echo "            display: flex;" >> ${document}
# echo "        }" >> ${document}
# echo "        .instance-card {" >> ${document}
# echo "            width: 100%;" >> ${document}
# echo "            min-height: 380px;" >> ${document}
# echo "            margin: auto;" >> ${document}
# echo "            box-shadow: 12px 12px 2px 1px rgba(13, 28, 39, 0.4);" >> ${document}
# echo "            background: #fff;" >> ${document}
# echo "            border-radius: 15px;" >> ${document}
# echo "            border-width: 1px;" >> ${document}
# echo "            max-width: 500px;" >> ${document}
# echo "            position: relative;" >> ${document}
# echo "            border: thin groove #FCC968;" >> ${document}
# echo "        }" >> ${document}
# echo "        .instance-card__cnt {" >> ${document}
# echo "            margin-top: 35px;" >> ${document}
# echo "            text-align: center;" >> ${document}
# echo "            padding: 0 20px;" >> ${document}
# echo "            padding-bottom: 40px;" >> ${document}
# echo "            transition: all .3s;" >> ${document}
# echo "        }" >> ${document}
# echo "        .instance-card__name {" >> ${document}
# echo "            font-weight: 700;" >> ${document}
# echo "            font-size: 24px;" >> ${document}
# echo "            color: #fba604;" >> ${document}
# echo "            margin-bottom: 15px;" >> ${document}
# echo "        }" >> ${document}
# echo "        .instance-card-inf__item {" >> ${document}
# echo "            padding: 10px 35px;" >> ${document}
# echo "            min-width: 150px;" >> ${document}
# echo "        }" >> ${document}
# echo "        .instance-card-inf__title {" >> ${document}
# echo "            font-weight: 700;" >> ${document}
# echo "            font-size: 27px;" >> ${document}
# echo "            color: #324e63;" >> ${document}
# echo "        }" >> ${document}
# echo "        .instance-card-inf__txt {" >> ${document}
# echo "            font-weight: 500;" >> ${document}
# echo "            margin-top: 7px;" >> ${document}
# echo "        }" >> ${document}
# echo "    </style>" >> ${document}
# echo "    <title>${appname}</title>" >> ${document}
# echo "</head>" >> ${document}
# echo "<body>" >> ${document}
# echo "    <div class="wrapper">" >> ${document}
# echo "        <div class="instance-card">" >> ${document}
# echo "            <div class="instance-card__cnt">" >> ${document}
# echo "                <div class="instance-card__name">Instance $META_INST_ID is running!</div>" >> ${document}
# echo "                <div class="instance-card-inf">" >> ${document}

# echo "                    <div class="instance-card-inf__item">" >> ${document}
# echo "                        <div class="instance-card-inf__txt">Instance Id</div>" >> ${document}
# echo "                        <div class="instance-card-inf__title">" $META_INST_ID "</div>" >> ${document}
# echo "                    </div>" >> ${document}

# echo "                    <div class="instance-card-inf__item">" >> ${document}
# echo "                        <div class="instance-card-inf__txt">Instance Type</div>" >> ${document}
# echo "                        <div class="instance-card-inf__title">" $META_INST_TYPE "</div>" >> ${document}
# echo "                    </div>" >> ${document}

# echo "                    <div class="instance-card-inf__item">" >> ${document}
# echo "                        <div class="instance-card-inf__txt">Private IP</div>" >> ${document}
# echo "                        <div class="instance-card-inf__title">" $META_INST_PRIVATE_IP "</div>" >> ${document}
# echo "                    </div>" >> ${document}

# echo "                    <div class="instance-card-inf__item">" >> ${document}
# echo "                        <div class="instance-card-inf__txt">Local Hostname</div>" >> ${document}
# echo "                        <div class="instance-card-inf__title">" $META_INST_LOCAL_HOSTNAME "</div>" >> ${document}
# echo "                    </div>" >> ${document}

# echo "                    <div class="instance-card-inf__item">" >> ${document}
# echo "                        <div class="instance-card-inf__txt">Availability zone</div>" >> ${document}
# echo "                        <div class="instance-card-inf__title">" $META_INST_AZ "</div>" >> ${document}
# echo "                    </div>" >> ${document}

# echo "                </div>" >> ${document}
# echo "            </div>" >> ${document}
# echo "        </div>" >> ${document}
# echo "</body>" >> ${document}
# echo "</html>" >> ${document}

# COMMENT OUT TO RESTART THE APACHE SERVICE ON UBUNTU
# systemctl restart apache2

# COMMENT OUT TO RESTART THE APACHE SERVICE ON AMAZON_LINUX
systemctl restart httpd