class aventurella-bash-profile {

    $path = "/home/vagrant"

    file{"profile.d":
        ensure => directory,
        path => "${path}/profile.d",
        owner => vagrant,
        group => vagrant
    }

    file{"profile":
        path => "${path}/.profile",
        ensure  => present,
        replace => true,
        content => template('aventurella-bash-profile/profile.erb'),
        owner => vagrant,
        group => vagrant
    }

}
