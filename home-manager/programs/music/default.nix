{pkgs, ...}: {
  home.packages = with pkgs; [
    termusic
    ffmpeg
  ];
  programs.yt-dlp = {
    enable = true;
  };
}
