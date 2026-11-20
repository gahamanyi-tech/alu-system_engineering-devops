# Raises the open-file limit for Nginx so it can handle high concurrency
exec { 'fix--for-nginx':
  command  => 'sed -Ei "s/^#?ULIMIT=.*/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
  provider => 'shell',
  path     => '/bin:/usr/bin',
}

exec { 'restart-nginx':
  command => 'service nginx restart',
  path    => '/usr/sbin:/usr/bin:/sbin:/bin',
  require => Exec['fix--for-nginx'],
}
