class aventurella-nginx {

    package{"nginx":
        ensure => installed
    }

    service { 'nginx':
        name       => 'nginx',
        ensure     => running,
        enable     => true,
        hasrestart => true,
        require    => Package['nginx']
    }

}
