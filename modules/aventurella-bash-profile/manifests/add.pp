define aventurella-bash-profile::add(
  $content = false,
  $source = false
  ) {

    include aventurella-bash-profile

    if $content{

        file {
            "/home/vagrant/profile.d/${title}":
            ensure => present,
            content => $content,
            owner => vagrant,
            group => vagrant
        }

    } elsif $source {

        file {"/home/vagrant/profile.d/${title}":
            ensure => present,
            source => $source,
            owner => vagrant,
            group => vagrant
        }
    }
}

