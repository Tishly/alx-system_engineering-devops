# Installing and configuring Nginx using puppet manifest
package { 'nginx':
  require => Exec['apt-update'],
  ensure  => installed,}

file_line { 'aaaaa':
  ensure   => 'present',
  path     => '/etc/nginx/sites-available/default',
  after    => 'listen 80 default_server',
  line     => 'rewrite ^/redirect_me https://theweirdnerd.tech permanent;',
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

service { 'nginx':
  ensure => running,
  require => package['nginx']'
}
