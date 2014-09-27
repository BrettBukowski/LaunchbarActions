on run
  return [{title: "Toggle fast fade at sunset", action: "customize", icon: "/Applications/Flux.app/Contents/Resources/macflux.icns", actionArgument: "a"}, {title: "Toggle sleep in on weekends", action: "customize", icon: "/Applications/Flux.app/Contents/Resources/macflux.icns", actionArgument: "b"}, {title: "Toggle extra hour of sleep", action: "customize", icon: "/Applications/Flux.app/Contents/Resources/macflux.icns", actionArgument: "c"}]
end run


on customize(_string)
  set chosenOption to _string as string

  ignoring application responses
    tell application "System Events" to tell process "Flux"
      click menu bar item 1 of menu bar 2
    end tell
  end ignoring

  do shell script "killall System\\ Events"
  delay 0.1

  tell application "System Events" to tell process "Flux" to tell menu bar item 1 of menu bar 2
    click menu item "Customize" of menu 1
    if chosenOption = "a" then
      click menu item "Fast fade at sunset" of menu 1 of menu item "Customize" of menu 1
    else if chosenOption = "b" then
      click menu item "Sleep in on weekends" of menu 1 of menu item "Customize" of menu 1
    else if chosenOption = "c" then
      click menu item "Extra hour of sleep (ages 13-18)" of menu 1 of menu item "Customize" of menu 1
    end if
  end tell
end customize
