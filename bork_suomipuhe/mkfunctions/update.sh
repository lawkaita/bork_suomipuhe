#!/bin/bash

# mode: filepatch or relative {
#mode="filepatch"
#mode="relative"
mode="addon"
# }

main() {
  cd ..
  local tag="$(basename "$PWD")"
  local armaroot
  if [ "$mode" == filepatch ]; then
    find_path_from_root
  else
    armaroot=""
  fi
  update
}

lvlprint() {
  local i
  for ((i=0; i<$lvl; i++)); do
    printf '%s' ' '
  done
  printf '%s ' "$@"
  printf '\n'
}
lvlprint_open() {
  lvlprint '{'
  ((lvl = lvl + 2))
}
lvlprint_close() {
  ((lvl = lvl - 2))
  lvlprint '};'
}

armaroot_crit() {
  [ -f "arma3.exe" ]
}
find_path_from_root() {
  pushd .
  armaroot=""
  lastdir=""
  while
    ! armaroot_crit
  do
    currdirname="$(basename "$PWD")"
    armaroot="\\${currdirname}${armaroot}"

    currdir="$PWD"
    if [ "$lastdir" == "$currdir" ]; then
      echo armaroot not found
      read -r enter
      exit 1
    fi
    lastdir="$PWD"
    cd ..
  done
  echo "armaroot: '$armaroot'"
  popd
}

mkCfgFunctions() {
  local lvl=0
  local root
  if [ "$mode" == filepatch ]; then
    root="$armaroot\\"
  elif [ "$mode" == addon ]; then
    root="\\$tag\\"
  else
    root="$tag\\"
  fi
  #lvlprint class CfgFunctions
  #lvlprint_open
  lvlprint "// include this in CfgFunctions"
  lvlprint class "$tag"
  lvlprint_open
  for folder in $(ls functions); do
    lvlprint class "$folder"
    lvlprint_open
    for file in $(ls functions/$folder/*.sqf); do
      classname="$(basename "$file")"
      classname="$(sed -e 's/^.*\/fn_//' -e 's/.sqf$//' <<< $classname)"
      lvlprint class "$classname"
      lvlprint_open
      file="$(sed 's_/_\\_g' <<< "$file")"
      lvlprint 'file = "'${root}${file}'";'
      local folder_tolower="$( tr '[:upper:]' '[:lower:]' <<< "$folder" )"
      if [ $folder_tolower == preinit ]; then
        lvlprint "preInit = 1;"
      fi
      if [ $folder_tolower == postinit ]; then
        lvlprint "postInit = 1;"
      fi
      lvlprint_close
    done
    lvlprint_close
  done
  lvlprint_close
  #lvlprint_close
}

update() {
  echo doing update
  mkCfgFunctions | tee CfgFunctions_"$tag".hpp
  read -r enter
}

main
