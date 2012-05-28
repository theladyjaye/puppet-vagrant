define aventurella-python::virtualenv(
  ) {
    include aventurella-python

    exec {"virtualenv --no-site-packages --prompt='' /home/vagrant/.virtualenvs/${title}":
        path => ['/usr/local/bin'],
        require => Aventurella-python::Pip["virtualenv"],
        user => 'vagrant',
        creates => "/home/vagrant/.virtualenvs/${title}"
    }
}
