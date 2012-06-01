define aventurella-apache2::site(
    $sites,
    $enable         = false,
){

    include aventurella-apache2
    aventurella-apache2::site_action{ $sites:
        enable => $enable
    }
}

define aventurella-apache2::site_action(
    $enable = false
){
    $vdir   = '/etc/apache2/sites-enabled'

    if $enable {

        exec{"apache_site_enable_${name}":
            command => "/usr/sbin/a2ensite ${name}",
            unless => "ls -1 ${vdir} | grep ${name}$ -i",
            require => Package['apache2'],
            notify => Service['apache2'],
        }

    } else {
        exec{"apache_site_disable_${name}":
            command => "/usr/sbin/a2dissite ${name}",
            onlyif => "ls -1 ${vdir} | grep ${name}$ -i",
            require => Package['apache2'],
            notify => Service['apache2'],
        }
    }

}
