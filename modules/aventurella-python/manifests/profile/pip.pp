define aventurella-python::profile::pip(
  ) {

    include aventurella-python
    include aventurella-bash-profile

    aventurella-bash-profile::add{"pip":
        source => "puppet:///modules/aventurella-python/pip"
    }
}
