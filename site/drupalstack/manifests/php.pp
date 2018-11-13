class drupalstack::php {
  exec { 'php5:update-php-add-repository': command => '/usr/bin/add-apt-repository ppa:ondrej/php'}

  exec { "apt-get update": command => "/usr/bin/apt-get update" }

  package { ['php5.6', 'php5.6-mysql','php5.6-mbstring', 'php5.6-gd','php5.6-xml','php5.6-json','php5.6-fpm']: ensure => present, require  => Exec['apt-get update'] }
  
  # Check NGINX service if its running or not  
  service { 'php5.6-fpm':
    ensure  => 'running',
    enable  => true,
  }

  #Congure the php file
  file { 'php.ini': 
         notify  => Service['php5.6-fpm'],
         path => '/etc/php/5.6/fpm/php.ini', 
         source  => 'puppet:///modules/drupalstack/php.ini'
 

 }

}
