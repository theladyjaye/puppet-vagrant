define aventurella-python::profile::virtualenv(
  $virtual_env = "$title"
  ) {

    include aventurella-python
    include aventurella-bash-profile

    $template ="aventurella-python/virtualenv.profile.erb"

    aventurella-bash-profile::add{"virtualenv_${title}":
        content => template($template)
    }
}


