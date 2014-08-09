tell application "System Preferences"
  set current pane to pane "com.apple.preference.displays"
  activate
end tell

tell application "System Events"
  tell process "System Preferences"
    set theValue to ((value of attribute "AXValue") of pop up button 1 of window 1)
    click pop up button 1 of window 1
    if theValue is "Off" then
      click menu item 3 of menu 1 of pop up button 1 of window 1
    else
      click menu item 1 of menu 1 of pop up button 1 of window 1
    end if
  end tell
end tell

tell application "System Preferences"
    quit
end tell
