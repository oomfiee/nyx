{pkgs, lib, config, userSettings, ...}:
{

 # // Enables git service //

programs.git = {
  enable = true;
  userName = "${userSettings.gitname}";
  userEmail = "${userSettings.gitemail}";
 };
}
