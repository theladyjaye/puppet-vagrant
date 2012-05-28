# Definition: apache::vhost
#
# This class installs Apache Virtual Hosts
#
# Parameters:
# - The $port to configure the host on
# - The $docroot provides the DocumentationRoot variable
# - The $template option specifies whether to use the default template or override
# - The $priority of the site
# - The $serveraliases of the site
# - The $options for the given vhost
# - The $vhost_name for name based virtualhosting, defaulting to *
#
# Actions:
# - Install Apache Virtual Hosts
#
# Requires:
# - The apache class
#
# Sample Usage:
#  aventurella-apache2::vhost { 'site.name.fqdn':
#    priority => '20',
#    port => '80',
#    docroot => '/path/to/docroot',
#  }
#

define aventurella-apache2::vhost(
    $docroot         = false,
    $template        = 'aventurella-apache2/vhost-default.erb',
    $server_name     = "$title",
    $server_aliases  = '',
    $options         = "Indexes FollowSymLinks MultiViews",
    $vhost_name      = '*',
    $vhost_port      = 80,
    $allow_override  = false
  ) {

    include aventurella-apache2

    # ubuntu only setup
    $vdir   = '/etc/apache2/sites-enabled'
    $logdir = '/var/log/apache2'

    file{$docroot:
        ensure => directory,
        owner => vagrant,
        group => vagrant,
    }

    file {
        "${vdir}/${name}.conf":
        content => template($template),
        owner   => 'root',
        group   => 'root',
        mode    => '755',
        require => Package['apache2'],
        notify  => Service['apache2'],
    }
}
