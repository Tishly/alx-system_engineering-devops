# Installing and configuring Nginx using puppet manifest
#
exec { 'Update server':
  command => 'apt update',
  path    => '/usr/bin:/usr/sbin:/bin'
}

package { 'nginx':
  ensure  => installed
}

file_line { 'aaaaa':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'listen 80 default_server;',
  line    => 'rewrite ^/redirect_me https://theweirdnerd.tech permanent;'
}

file { '/var/www/html/index.html':
  content => "Hello World!"
}

service { 'nginx':
  ensure  => running,
  require => package["nginx"]
}

exec { 'Start server':
  command => 'service nginx restart',
  path    => '/usr/bin:/usr/sbin:/bin'
}
