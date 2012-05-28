define aventurella-github::clone(
    $path
){
    exec { $title:
        command => "git clone ${title} ${path}",
        require => [ Package['git'], File[$path] ],
        creates => "${path}/.git",
        path => ["/usr/bin"],
        user => 'vagrant',
        }
}
