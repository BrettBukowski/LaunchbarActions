on run
  tell application "System Events"
    set MyList to (name of every process)
  end tell

  tell application "System Events" to set appList to ¬
    name of application processes whose frontmost is true

  set activeApp to item 1 of appList
  if (MyList contains "Instacast") is true then
    tell application "Instacast" to activate
    tell application "System Events"
      tell process "Instacast"
        keystroke "m" using {control down, command down}
        --      click menu item 8 of menu 1 of menu bar item 6 of menu bar 1
      end tell
    end tell
  end if
end run
