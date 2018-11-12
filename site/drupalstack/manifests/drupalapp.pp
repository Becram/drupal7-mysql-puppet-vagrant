class drupalstack::drupalapp {
  exec { 'copy-app':
    command => '/bin/cp -r /vagrant/site/drupalstack/files/drupal /var/www/drupal',
    creates => '/var/www/drupal',
  }

  file { '/var/www/drupal/sites/default/settings.php':
    ensure  => present,
    mode    => '777',
    source  => 'file:///var/www/drupal/sites/default/default.settings.php',
    require => Exec['copy-app'],
  }

  file { '/var/www/drupal/sites/default/files':
    ensure  => directory,
    mode    => '777',
    require => Exec['copy-app'],
  }
    file { '/var/www/drupal':
    ensure  => directory,
    owner => 'www-data',
    group => 'www-data',
    mode    => '0644',
    recurse => true,
    require => Exec['copy-app'],
  }

}
