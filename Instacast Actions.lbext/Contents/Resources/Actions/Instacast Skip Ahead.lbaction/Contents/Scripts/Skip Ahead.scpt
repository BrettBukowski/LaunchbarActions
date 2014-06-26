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
        click menu item 3 of menu 1 of menu bar item 7 of menu bar 1
      end tell
    end tell
    tell application "System Events"
      set visible of process "Instacast" to false
    end tell
  end if
end run
