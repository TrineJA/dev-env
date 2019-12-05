#!/bin/sh

config_macos_settings() {
    echo "Configuring OS"
    
    #Enable repeat on keydown
    defaults write -g ApplePressAndHoldEnabled -bool false

    #Set a blazingly fast keyboard repeat rate
    defaults write NSGlobalDomain KeyRepeat -int 1

    #Set a shorter Delay until key repeat
    defaults write NSGlobalDomain InitialKeyRepeat -int 15

    #Enable Trackpad touch to click
    defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

    #Enable Trackpad three finger drag
    defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

    #Use current directory as default search scope in Finder
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

    #Show Path bar in Finder
    defaults write com.apple.finder ShowPathbar -bool true

    #Show Status bar in Finder
    defaults write com.apple.finder ShowStatusBar -bool true

    #Show indicator lights for open applications in the Dock
    defaults write com.apple.dock show-process-indicators -bool true

    #Show recent items stack
    defaults write com.apple.dock persistent-others -array-add '{"tile-data" = {"list-type" = 1;}; "tile-type" = "recents-tile";}'

    #Enable AirDrop over Ethernet and on unsupported Macs running Lion
    defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

    #Enable Safari’s debug menu
    defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

    #Add a context menu item for showing the Web Inspector in web views
    defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

    #Show the ~/Library folder
    chflags nohidden ~/Library
}
