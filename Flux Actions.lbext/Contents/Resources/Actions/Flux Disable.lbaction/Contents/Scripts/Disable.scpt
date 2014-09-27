on run
  return [{title: "Toggle disable for an hour", action: "disableaction", icon: "/Applications/Flux.app/Contents/Resources/macflux.icns", actionArgument: "a"}, {title: "Toggle disable until sunrise", action: "disableaction", icon: "/Applications/Flux.app/Contents/Resources/macflux.icns", actionArgument: "b"}, {title: "Toggle disable for current app", action: "disableaction", icon: "/Applications/Flux.app/Contents/Resources/macflux.icns", actionArgument: "c"}]
end run


on disableaction(_string)
  set chosenOption to _string as string

  ignoring application responses
    tell application "System Events" to tell process "Flux"
      click menu bar item 1 of menu bar 2
    end tell
  end ignoring

  do shell script "killall System\\ Events"
  delay 0.1

  tell application "System Events" to tell process "Flux" to tell menu bar item 1 of menu bar 2
    click menu item "Disable" of menu 1
    if chosenOption = "a" then
      click menu item "for an hour" of menu 1 of menu item "Disable" of menu 1
    else if chosenOption = "b" then
      click menu item "until sunrise" of menu 1 of menu item "Disable" of menu 1
    else if chosenOption = "c" then
      click menu item "for current app" of menu 1 of menu item "Disable" of menu 1
    end if
  end tell
end disableaction
