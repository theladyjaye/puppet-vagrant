#include aventurella-bash-profile


#include aventurella-python
#include aventurella-mysql5
#include aventurella-php5
#include aventurella-ruby
include aventurella-github
include aventurella-git
include aventurella-apache2
include aventurella-ntp
include aventurella-vim

#aventurella-python::virtualenv{'default':}
#aventurella-git::profile::ps1{'profile-git-ps1':}
#aventurella-python::profile::pip{'profile-pip':}
#aventurella-python::profile::virtualenv{'default':}

aventurella-apache2::module{'rewrite':
    enable => true
}

aventurella-apache2::vhost {'vizio':
    docroot        => '/var/www/vizio',
    server_name    => 'vizio.com',
    server_aliases => ['www.vizio.com'],
    allow_override => true,
}

aventurella-git::configure{"vagrant":}
aventurella-github::clone{'blitzagency/sandstorm.git':
    path => '/var/www/vizio/www',
    owner => 'vagrant',
    group => 'vagrant'
}

#aventurella-ruby::gem {'sass':}

#aventurella-python::pip{'python-modules':
#    virtual_env => 'default',
#    packages    => ['fabric', 'jinja2']
#}
