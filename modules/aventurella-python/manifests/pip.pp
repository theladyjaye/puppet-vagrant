define aventurella-python::pip(
    $packages,
    $virtual_env = false,
    $owner       = $id
  ) {

    include aventurella-python
    aventurell-python::pip_action{ $packages:
        virtual_env => $virtual_env,
        owner => $owner
    }
}

define aventurell-python::pip_action(
    $virtual_env = false,
    $owner
){
    if $virtual_env {
        $pip = "/home/vagrant/.virtualenvs/${virtual_env}/bin/pip"

        exec { $name:
            command => "${pip} install ${name}",
            require => Aventurella-python::Virtualenv[$virtual_env],
            user => $owner,
            unless => "${pip} freeze | grep ${name} -i",
        }

    } else {
        package{ $name:
            provider => "pip",
            ensure => installed,
            require => Package['python-pip'],
        }
    }

}

