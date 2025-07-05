{ pkgs, ... }:
{
  home.packages = with pkgs; [
    termusic
    yt-dlp
    ffmpeg
  ];
}
