{ pkgs, lib, config, ... }:
{

imports = [
  #./youtube-next.nix
  #./uosc.nix
  #./memo.nix
];


#enable mpv
programs.mpv = {
enable = true;
# configs for mpv
config = {
  osd-font = "Manrope Medium";
  osc = "no";
  osd-level = 0;
  title = "\${media-title} - mpv";
  osd-font-size = 20;
  sub-font = "Manrope Medium";
  ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";
  sub-pos = 90;
  video-sync = "display-resample";
  geometry = "70%";
  keep-open = "yes";
  sub-auto = "fuzzy";
  profile = "gpu-hq";
  vo = "gpu-next";
  hwdec-codecs = "all";
  gpu-api = "vulkan";
  hwdec = "nvdec";
  cache = "yes";
  cache-on-disk = "yes";
  demuxer-max-back-bytes = "512M";
  demuxer-max-bytes = "512M";
  ytdl-raw-options = "ignore-config=,sub-lang=\"en,ar\",write-sub=,write-auto-sub=,force-ipv4=";
  script-opts = "ytdl_hook-ytdl_path=yt-dlp";
  deband = "no";
  deband-iterations = 4;
  deband-grain = 48;
# Set sub-ass-override to "no" as we only need to enable it for specific cases
  sub-ass-override = "no";
  sub-ass-style-overrides = "playresx=1920,playresy=1080,Kerning=yes";
  sub-color = "#FFFFFF";
  sub-border-size = 2.4;
  sub-font-size = 30;
  sub-border-color = "#FF000000";
  sub-shadow-color = "#A0000000";
  sub-shadow-offset = 0.75;
  sub-bold = "yes";
  screenshot-directory = "${config.home.homeDirectory}/Picture/mpv";
  af = "lavfi=[dynaudnorm=f=75:g=25:p=0.55]";
};
#bindings for mpv
bindings = {
  "Ctrl+q" = "script-binding quality_menu/video_formats_toggle";
  "Alt+a" = "script-binding quality_menu/audio_formats_toggle";
  "Ctrl+n" = "script-message-to youtube_upnext menu";
  "Shift+ENTER" = "script-binding uosc/items";
  "UP" = "add volume +2";
  "Down" = "add volume -2";
  "tab" = "script-binding uosc/toggle-ui";
  "h" = "script-binding memo-history";
  "MBTN_LEFT" = "cycle pause";
  "MBTN_RIGHT" = "ignore";
  "w" = "cycle-values window-dragging no yes";
  "s" = "script-binding uosc/subtitles#sub?Subtitles";
};

scriptOpts = {
  thumbfast.network = "yes";
  uosc = {
    color = "foreground=ca8c8c,foreground_text=000000,background=1e1e20,background_text=ffffff,curtain=111111,success=a5e075,error=ff616e";
    top_bar_controls = "no";
    timeline_size = "20";
    volume_size = "26";
    controls = "menu,gap,subtitles,<has_many_audio>audio,<has_many_video>video,<has_many_edition>editions,<stream>stream-quality,command:history:script-binding memo-history?History,gap,space,speed,space,shuffle,loop-playlist,loop-file,gap,prev,items,next,gap,fullscreen";
};
 youtube-upnext = {
 fetch_on_start = "no";
 auto_add = "no";
 };
 smart-copy-paste-2 = {
  linux_copy = "wl-copy"; #xclip -silent -selection clipboard -in
  linux_paste = "wl-paste"; #xclip -selection clipboard -o
 };
};

# scripts for mpv
scripts = with pkgs; [
  mpvScripts.visualizer
  mpvScripts.thumbfast
  mpvScripts.sponsorblock-minimal
  mpvScripts.quality-menu
  mpvScripts.mpv-playlistmanager
  mpvScripts.mpris
  mpvScripts.uosc
  mpvScripts.memo
  mpvScripts.youtube-upnext
  mpvScripts.quack
  mpvScripts.smart-copy-paste-2
];
};
}
