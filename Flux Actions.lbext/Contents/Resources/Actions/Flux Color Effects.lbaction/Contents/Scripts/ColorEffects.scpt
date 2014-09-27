on run
  return [{title: "Toggle Darkroom", action: "coloreffects", icon: "/Applications/Flux.app/Contents/Resources/macflux.icns", actionArgument: "a"}, {title: "Toggle Movie Mode", action: "coloreffects", icon: "/Applications/Flux.app/Contents/Resources/macflux.icns", actionArgument: "b"}]
end run


on coloreffects(_string)
  set chosenOption to _string as string

  ignoring application responses
    tell application "System Events" to tell process "Flux"
      click menu bar item 1 of menu bar 2
    end tell
  end ignoring

  do shell script "killall System\\ Events"
  delay 0.1

  tell application "System Events" to tell process "Flux" to tell menu bar item 1 of menu bar 2
    click menu item "Color Effects" of menu 1
    if chosenOption = "a" then
      click menu item "Darkroom" of menu 1 of menu item "Color Effects" of menu 1
    else if chosenOption = "b" then
      click menu item "Movie mode" of menu 1 of menu item "Color Effects" of menu 1
    end if
  end tell
end coloreffects
