## Vagrant environement for Puppet for Drupal7 


### Bootstrap the puppet in standalone mode
Puppet installtion is done with vagrant provisoning. Script bootstrap.sh is used to install puppet in standalone mode

* Install virtualbox and vagrant
* Clone vagrant files
```
git clone https://github.com/Becram/drupal7-mysql-puppet-vagrant
```
* Go into puppet env, create puppet master and configure it (default box: boxcutter/ubuntu1604)
```
cd drupal7-mysql-puppet-vagrant
vagrant up --provision
```  
*Details about virtual machines are in the Vagrantfile (private network for puppet, port redirection for puppetboard, hosts file)*
* When the vm boots for the first time, vagrant provisioning kicks in using **bootstrap.sh**.
Main steps:
    - Installing puppet, rubygems and git
    - Installing the puppet modules
    - Configuring and installing nginx with drupal setting
    - Modifying apt sources to install PHP5.6 and other dependencies
    - Installing drupalcore
    - Installing DrupalApp
    - Installing,configuring and creating database for drupal

After a few minutes everything should ready and you should be able to access drupal app from host: http://localhost:8084

