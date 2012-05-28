define aventurella-git::profile::ps1(
  ) {

    include aventurella-git
    include aventurella-bash-profile

    aventurella-bash-profile::add{ "git_ps1":
        source => "puppet:///modules/aventurella-git/git_ps1"
    }
}
