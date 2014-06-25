#!/bin/sh
current=`defaults read com.apple.finder CreateDesktop`
newVal="true"

if [[ $current == "true" ]]; then
  newVal="false"
fi

defaults write com.apple.finder CreateDesktop $newVal
killall Finder
