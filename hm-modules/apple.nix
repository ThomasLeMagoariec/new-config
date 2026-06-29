{ ... }:
{
    xdg.desktopEntries.apple-icloud = {
        name = "Apple iCloud";
        exec = "brave --profile-directory=Default --app-id=agedgfbdadefbodjkkkcpihgcmibpcff";
        terminal = false;
        categories = [ "Network" ];
        icon = "/run/current-system/sw/share/icons/hicolor/128x128/apps/account-apple.png";
    };
}
