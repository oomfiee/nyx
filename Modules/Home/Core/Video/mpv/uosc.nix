{ pkgs, lib, config, ... }:
{

home.file."${config.xdg.configHome}/mpv/scripts/uosc/main.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/main.lua";
  sha256 = "1gpajvvjp82qy7jxh26mhz3ksfxdlk89kji6bj7mlkmzydvs5czi";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/elements/BufferingIndicator.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/elements/BufferingIndicator.lua";
  sha256 = "1i618fjvyvprxjc7i5xp66cnynpfadfw9a7jmvjrxr0ni74bgkpp";
 };
};


home.file."${config.xdg.configHome}/mpv/scripts/uosc/elements/Button.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/elements/Button.lua";
  sha256 = "0rn1vr7rx05hjncwjrsa4qmypvwaras8jy5gfy6dqka5j9vhpqcw";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/elements/Controls.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/elements/Controls.lua";
  sha256 = "0rg5si1xfznfwfwh69a7kmawm5krhv1vkzcqms1h5jwb1lhdsn3j";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/elements/Curtain.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/elements/Curtain.lua";
  sha256 = "0chypgyilsacffkpkni16d1q6paafvdjbw0cwz6dhw7wlqcm35kz";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/elements/CycleButton.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/elements/CycleButton.lua";
  sha256 = "11a26lw4gk5rw4k7v2v16a3fgq4m6mmrkmvwndld8shv3p8kslf5";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/elements/Element.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/elements/Element.lua";
  sha256 = "0b0qyy9d2k0gq3yk4k0bsrca1f113llnnhw4i3v0fxfsklaphfk4";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/elements/Elements.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/elements/Elements.lua";
  sha256 = "15gs35y7058zbj0mf7hlin3wpah5cx4yfs3rpgis57anmqgvxfmr";
 };
};


home.file."${config.xdg.configHome}/mpv/scripts/uosc/elements/Menu.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/elements/Menu.lua";
  sha256 = "12qxg0pybv2f0pi0qggpsgajrza68cz85w3cygq4cw68vxii9vbf";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/elements/PauseIndicator.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/elements/PauseIndicator.lua";
  sha256 = "1ilhy1qk4x5949r37jfpv5gjyk5l2hcgyhirwbqf2x3y39ms859z";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/elements/Speed.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/elements/Speed.lua";
  sha256 = "1ny3652p99xnd6jc41i20rskd9f9p6pvvr24hnh80y8wsz3cvjqs";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/elements/Timeline.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/elements/Timeline.lua";
  sha256 = "0zaidi3frd8s3bq5x6sm1lmvzbzv2ly0j9y7jy597ph5g5w0y6iv";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/elements/TopBar.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/elements/TopBar.lua";
  sha256 = "193ds5mnsym5x1xahvisirp3xb5v4n58vrb61fw308abl9v6mgj5";
 };
};


home.file."${config.xdg.configHome}/mpv/scripts/uosc/elements/Updater.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/elements/Updater.lua";
  sha256 = "1l66k1c0irhl1lk53zq01lqjx6vhkgngjyrphg1hmdwjlnlfci2f";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/elements/Volume.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/elements/Volume.lua";
  sha256 = "03nh58xbnv3faxx8g7zcrn4ddfwlb259cmvkixxf3c0qsjyljf9g";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/elements/WindowBorder.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/elements/WindowBorder.lua";
  sha256 = "18m32fk3l42a9fpb084av2f970807rgzdpbb9kr7rm3jc6f5qhv1";
 };
};

home.file."${config.xdg.configHome}/mpv/fonts/uosc_icons.otf" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/fonts/uosc_icons.otf";
  sha256 = "09gfbmw80c35vl2frbdcz4w30bqc4gznklmcdzvnfzjr2c4zalx8";
 };
};

home.file."${config.xdg.configHome}/mpv/fonts/uosc_textures.ttf" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/fonts/uosc_textures.ttf";
  sha256 = "19ddf90psjrpxs0yfa7nrl7z6p9mnb667cqynddfpz2d507ndh6c";
 };
};


home.file."${config.xdg.configHome}/mpv/scripts/uosc/lib/ass.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/lib/ass.lua";
  sha256 = "0srxfk4z5fqx7b9dn3yvym9z7yyijl9x36cc1qaw02q5p35m7inq";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/lib/char_conv.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/lib/char_conv.lua";
  sha256 = "0rm8vadhibflrrxxglyrcizh7d752kv3hfiaighvm74r9p6z0n27";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/lib/cursor.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/lib/cursor.lua";
  sha256 = "0dbnklmzp5pdlzd3v0xvasvldag03aw4ab94wj3fyr0rf3h0fyc9";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/lib/intl.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/lib/intl.lua";
  sha256 = "038icx49wb125dlnj0cnngyf9fv9cqac6mp10jdhh9va3ryg4k93";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/lib/menus.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/lib/menus.lua";
  sha256 = "14s7q0mm0zzjijq7zmgxa0m58firqalh9gx1s91pp5dhh2pbm821";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/lib/std.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/lib/std.lua";
  sha256 = "1jd6mhw54m78xka2g49gm0b8is2gh5kmqs2m1rn1rd8d33ai4l26";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/lib/text.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/lib/text.lua";
  sha256 = "1zvc37jddm3n7nlf7y2z41y0hsfm655kh68g0iip561cbfwx8frl";
 };
};

home.file."${config.xdg.configHome}/mpv/scripts/uosc/lib/utils.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/tomasklaen/uosc/main/src/uosc/lib/utils.lua";
  sha256 = "0yzzyyks5qlvwaadk1bm2jwdj2v5i9jc7jsr0mcmdpwf67bsmq0v";
 };
};
}
