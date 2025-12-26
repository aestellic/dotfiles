{
  programs.ghostty.settings = {
    gtk-titlebar = false;
    working-directory = "home";
    shell-integration-features = [
      "ssh-terminfo"
      "ssh-env"
      "sudo"
    ];
  };
}