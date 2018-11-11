class install_nginx (
  $package_name = 'nginx',
  $service_name = 'nginx',
  $doc_root = '/var/www/html',
  $nginx_config = '/etc/nginx/conf.d/default.conf'
) {

  file { '/var/www/html':
    ensure => 'directory',
  }

  package { $package_name:
    ensure => present,
  }
  service { $service_name:
    ensure => running,
    enable => true,
  }

  file { "$doc_root/index.html":
    notify  => Service['nginx'],
    source => "puppet:///modules/install_nginx/index.html",
  }

  file { "$nginx_config":
    notify  => Service['nginx'],
    source => "puppet:///modules/install_nginx/civicrm.conf",
  }

}