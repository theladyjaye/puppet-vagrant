class aventurella-redis {
    package{"redis-server":
        ensure => installed
    }

    service { 'redis-server ':
        name       => 'redis-server ',
        ensure     => running,
        enable     => true,
        require    => Package['redis-server']
    }
}
