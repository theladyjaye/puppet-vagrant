include aventurella-bash-profile
include aventurella-git
include aventurella-github
include aventurella-python
include aventurella-mysql5
include aventurella-php5
include aventurella-ruby
include aventurella-apache2

aventurella-python::virtualenv{'default':}
aventurella-git::profile::ps1{'profile-git-ps1':}
aventurella-python::profile::pip{'profile-pip':}
aventurella-python::profile::virtualenv{'default':}

aventurella-apache2::vhost {'vizio':
    docroot        => '/var/www/vizio',
    server_name    => 'vizio.com',
    server_aliases => ['www.vizio.com'],
    allow_override => true,
}

aventurella-github::clone{'git@github.com:blitzagency/sandstorm.git':
    path => '/var/www/vizio',
}

aventurella-ruby::gem {'sass':}

aventurella-python::pip{'python-modules':
    virtual_env => 'default',
    packages    => ['fabric', 'jinja2']
}
