{
  programs.helix = {
    enable = true;
    settings = {
      theme = "amberwood";
      keys.normal."C-e" =
        ":pipe-to tmux load-buffer - && tmux paste-buffer -dp -t {right} && tmux send-keys -t {right} Enter";
    };

  };
}
