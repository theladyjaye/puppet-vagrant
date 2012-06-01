define aventurella-apache2::module(
    $modules,
    $enable         = false,
){

    include aventurella-apache2
    aventurella-apache2::module_action{ $modules:
        enable => $enable
    }
}

define aventurella-apache2::module_action(
    $enable = false
){
    if $enable {

        exec{"apache_module_enable_${name}":
            command => "/usr/sbin/a2enmod ${name}",
            unless => "/usr/sbin/apachectl -M | grep ${name}_module -i",
            require => Package['apache2'],
            notify => Service['apache2'],
        }

    } else {
        exec{"apache_module_disable_${name}":
            command => "/usr/sbin/a2dismod ${name}",
            onlyif => "/usr/sbin/apachectl -M | grep ${name}_module -i",
            require => Package['apache2'],
            notify => Service['apache2'],
        }
    }

}
