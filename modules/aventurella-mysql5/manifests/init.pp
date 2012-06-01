class aventurella-mysql5 {

    package { 'mysql-client':
        ensure => installed,
    }

    package { 'mysql-server':
        ensure => installed,
    }

    service { 'mysql':
        name      => 'mysql',
        ensure    => running,
        enable    => true,
        require   => Package['mysql-server']
    }
}
