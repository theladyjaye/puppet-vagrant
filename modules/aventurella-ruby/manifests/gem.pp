define aventurella-ruby::gem(
  ) {

    include aventurella-ruby

    exec {"gem install ${title}":
        path => ['/usr/bin'],
        require => Package['rubygems'],
        unless => "gem list | grep ${title} -i",
    }
}
