define aventurella-nginx::vhost(
    $docroot         = false,
    $template        = 'aventurella-nginx/vhost-default.erb',
    $server_name     = "$title",
    $server_aliases  = '',
    $vhost_name      = '*',
    $vhost_port      = 80,
    $priority        = "000"
  ) {

    include aventurella-nginx

    # ubuntu only setup
    $adir   = '/etc/nginx/sites-available'
    $vdir   = '/etc/nginx/sites-enabled'
    $logdir = '/var/log/nginx'

    file {"${adir}/${name}":
        content => template($template),
        owner   => 'root',
        group   => 'root',
        mode    => '755',
        require => Package['nginx'],
    }

    file {"${vdir}/${priority}-${name}":
        ensure  => link,
        target => "${adir}/${name}",
        require => [Package['nginx'], File["${adir}/${name}"]],
        notify  => Service['nginx'],
    }
}
