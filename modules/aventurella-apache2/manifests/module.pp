define aventurella-apache2::module(
    $enable          = true
  ) {

    include aventurella-apache2

    if $enable{

        exec{"apache_module_${title}":
            command => "/usr/sbin/a2enmod ${title}",
            unless => "/usr/sbin/apachectl -M | grep ${title}_module -i",
            require => Package['apache2'],
            notify => Service['apache2'],
        }
    }
    else
    {
        exec{"apache_module_${title}":
            command => "/usr/sbin/a2dismod ${title}",
            onlyif => "/usr/sbin/apachectl -M | grep ${title}_module -i",
            require => Package['apache2'],
            notify => Service['apache2'],
        }
    }
}
