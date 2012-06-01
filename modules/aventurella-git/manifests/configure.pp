define aventurella-git::configure(
    $username = $title
){

    file{"/home/$username/.gitconfig":
        source => "puppet:///modules/aventurella-git/gitconfig"
    }

    file{"/home/$username/.gitignore":
        source => "puppet:///modules/aventurella-git/gitignore"
    }
}
