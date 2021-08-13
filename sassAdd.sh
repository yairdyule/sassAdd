#!/usr/bin/env bash

# TODO:  <13-08-21, jared> #
# 1. determine if pkg.json exists in this dir #
#   - if so, grep line # of 'scripts' (be strict, other pkgs may contain 'scripts' in name)
#   - if not, echo & bail!
# 2. determine if there is already sass folder in this dir #
#   - if there is, add 'sass -w etc etc' to pkg.json
#   - if not, create one, add a .scss example file, and add sass -w etcetc to pkg.json



# 1. does pkg.json exist in this dir?
if test -f "package.json"; then
  # 2. is there a sass folder in this dir?
  # TODO:  <13-08-21, jared> #
  # check recursively
  if [ ! -d "sass" ]; then
    mkdir sass
    echo -e "\n/sass created"
  fi

  if [ ! -d "css" ]; then
    mkdir css
    echo -e "\n/css created"
  fi

  scriptsLine="$(grep -n '"scripts": {' "package.json" | cut -d : -f 1)" #find line no. containing "scripts: {"
  sed -i "$(($scriptsLine + 1)) i \"style\": \"sass -w sass:css\"," package.json #add sass watch to the next line
  echo -e "\nsass watch script added!"
  echo -e "try 'yarn style', and have fun editing your sass! :)\n"

else
  echo -e "\nNo package.json was found."
  echo -e "Either npm init, or call sassAdd in a folder with a package.json.\n"
fi


