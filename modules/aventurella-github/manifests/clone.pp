define aventurella-github::clone(
    $path,
    $owner = $id,
    $group = $id,
    $require = false
){

    file{$path:
        ensure => "directory",
        recurse => true,
        owner => $owner,
        group => $group
    }

    if $require{
        File[$path] { require +> $require }
    }

    exec { $title:
        command => "git clone git@github.com:${title} ${path}",
        require => [ Package['git'], File[$path], Sshkey['github_known_host']],
        creates => "${path}/.git",
        path => ["/usr/bin"],
    }
}
