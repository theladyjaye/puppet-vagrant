class aventurella-apache2 {

    package { 'apache2':
        ensure => installed,
    }

    service { 'apache2':
        name      => 'apache2',
        ensure    => running,
        enable    => true,
        require   => Package['apache2']
    }

}
