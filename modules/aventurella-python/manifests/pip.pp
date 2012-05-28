define aventurella-python::pip(
    $packages,
    $virtual_env         = false,
  ) {

    include aventurella-python
    aventurell-python::pip_action{ $packages:
        virtual_env => $virtual_env
    }
}

define aventurell-python::pip_action(
    $virtual_env = false
){
    if $virtual_env {
        $pip = "/home/vagrant/.virtualenvs/${virtual_env}/bin/pip"

        exec { $name:
            command => "${pip} install ${name}",
            require => Aventurella-python::Virtualenv[$virtual_env],
            user => 'vagrant',
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

