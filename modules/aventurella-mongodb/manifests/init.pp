class aventurella-mongodb {

    package{"mongodb":
        ensure => installed
    }

    service { 'mongodb':
        name       => 'mongodb',
        ensure     => running,
        enable     => true,
        hasrestart => true,
        require    => Package['mongodb']
    }
}
