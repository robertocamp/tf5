# Installation details for WordPress server
  * dry-run with AWS tutorial: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html
    1. new security group
    2. new launch template
      1. AMI:  Amazon Linux 2 AMI (HVM), SSD Volume Type - ami-0233c2d874b811deb
      2. sg-0bfd4700f1168bbf0 - 24JULYWORDPRESS-DEMO (allow ssh from my pc)
      3. user data:

      ```
        #!/bin/bash
        sudo yum update -y
        sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
        sudo yum install -y httpd mariadb-server
        systemctl start httpd
        systemctl enable httpd
        usermod -a -G apache ec2-user
        chown -R ec2-user:apache /var/www
        chmod 2775 /var/www
        find /var/www -type d -exec chmod 2775 {} \;
        find /var/www -type f -exec chmod 0664 {} \;
        echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
      ```
        
    3. launch instance
    4. connect to insance:
        - `ssh -i "JULY23-CONSOLE.pem" ec2-user@ec2-3-14-246-236.us-east-2.compute.amazonaws.com`
        - verify http server is running: `sudo systemctl is-enabled httpd`
        - verify http server is reachable from Internet: ec2-3-14-246-236.us-east-2.compute.amazonaws.com (connect in browser)

  * Apache setup (see below--this is all done in the `user data` part of the launch template)
    1. set file permissions: Apache httpd serves files that are kept in a directory called the Apache document root
        * The Amazon Linux Apache document root is /var/www/html, which by default is owned by root
        * To allow the ec2-user account to manipulate files in this directory, you must modify the ownership and permissions of the directory.
    2.  Change the group ownership of /var/www and its contents to the apache group
    3.  To add group write permissions, recursively change the file permissions of /var/www and its subdirectories:
    > RESULT: Now, ec2-user (and any future members of the apache group) can add, delete, and edit files in the Apache document root, enabling you to add content, such as a static website or a PHP application.  Complete User Data script:

```
#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd mariadb-server
sudo systemctl start httpd
sudo systemctl enable httpd
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www
sudo find /var/www -type d -exec chmod 2775 {} \;
sudo find /var/www -type f -exec chmod 0664 {} \;
sudo echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
```

