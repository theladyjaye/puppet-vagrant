class aventurella-ssh {
    package{"openssh-server":
        ensure => installed
    }

    package{"openssh-client":
        ensure => installed
    }

    #package{"ssh"
    #    ensure => installed
    #}
}
