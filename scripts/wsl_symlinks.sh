#!/bin/bash
# DEPLOYMENT SCRIPT - WSL SYMLINKS
# no arg - usage, args = docs drive letter, windows username
declare docs_root = "/mnt/$1"
declare win_user_path = "/mnt/c/Users/$2"
# folder maps
declare -A windows_c_symlinks=(
  ["$win_user_path/Desktop"]='~/Desktop'
  ["$win_user_path/Downloads"]='~/Downloads'
  ["$win_user_path/Documents"]='~/Documents'
)
declare -A docs_e_drive=(
  ["$docs_root"]='~/docs'
  ["$docs_root/ssh"]='~/.shh'
  ["$docs_root/ecu"]='~/ecu'
  ["$docs_root/school/current"]='~/school_current'
)
declare -A folder_maps=(windows_c_symlinks docs_e_drive)

# for each map make symlinks
for map in "${folder_maps[@]}"
do:
  printf 'creating symlinks for: %s\n...' "${!map}"
  for from_folder_key in "${!map[@]}"
  do:
    printf "\t from '%s' to '%s'..." "$from_folder_key" "${map[$from_folder_key]}"
    if $(ln -s "$from_folder_key" "${map[$from_folder_key]}")
    then
      printf "succeeded.\n"
    else
      printf "failed.\n"
    fi
  done
done
