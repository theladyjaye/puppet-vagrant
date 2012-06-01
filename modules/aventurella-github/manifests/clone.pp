define aventurella-github::clone(
    $path,
    $owner = $id,
    $group = $id
){

    file{$path:
        ensure => directory,
        owner => $owner,
        group => $group
    }

    exec { $title:
        command => "git clone git@github.com:${title} ${path}",
        require => [ Package['git'], File[$path], Sshkey['github_known_host']],
        creates => "${path}/.git",
        path => ["/usr/bin"],
    }


}
