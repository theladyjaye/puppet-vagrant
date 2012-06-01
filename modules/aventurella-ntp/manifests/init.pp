class aventurella-ntp {

    package{"ntp":
        ensure => installed
    }

    service{"ntp":
        ensure => running,
        enable => true,
    }

    file { "/etc/localtime":
        ensure => link,
        target => "/usr/share/zoneinfo/America/Los_Angeles",
    }
}
