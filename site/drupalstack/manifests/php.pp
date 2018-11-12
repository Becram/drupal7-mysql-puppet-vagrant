class drupalstack::php {
  exec { 'php5:update-php-add-repository': command => '/usr/bin/add-apt-repository ppa:ondrej/php'}
  exec { "apt-get update": command => "/usr/bin/apt-get update" }
 # package { ['php', 'php-mysql', 'php-gd', 'libapache2-mod-php']: ensure => present, require  => Exec['apt-get update'] }
  package { ['php5.6', 'php5.6-mysql','php5.6-mbstring', 'php5.6-gd','php5.6-xml','php5.6-json','php5.6-fpm']: ensure => present, require  => Exec['apt-get update'] }
  file { 'php.ini': path => '/etc/php/5.6/fpm/php.ini', source  => 'puppet:///modules/drupalstack/php.ini'}

}
