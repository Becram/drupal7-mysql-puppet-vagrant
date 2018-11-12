class drupalstack::nginx {
  # create a directory
#  file { '/var/www/drupal':ensure => 'directory',recurse => true }
#  file { '/var/www/html/index.html': owner  => 'www-data',group  => 'www-data',mode   => '0750', source  => 'puppet:///modules/drupalstack/index.html', }
  package { 'nginx': ensure => present, }

  file { 'drupal-nginx.conf':
    path    => '/etc/nginx/sites-available/default',
    source  => 'puppet:///modules/drupalstack/drupal-nginx.conf',
    ensure  => present,
    require => Package['nginx'],
    notify  => Service['nginx-service'],
  }

  service { 'nginx-service':
    name       => 'nginx',
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

}
