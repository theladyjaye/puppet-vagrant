define aventurella-ruby::gem(
  ) {

    include aventurella-ruby

    exec {"/usr/bin/gem install ${title}":
        require => Package['rubygems'],
        unless => "/usr/bin/gem list | grep ${title} -i",
    }
}
