#!/bin/bash

set -e

GREEN='\033[0;32m'
BLUE='\033[1;34m'
ORANGE='\033[0;33m'
NC='\033[0m'

script_root="$HOME/dotfiles/zsh/.oh-my-zsh/custom/cppinit"

echo -en "${ORANGE}[?] Project name: ${NC}" 
read  project_name
project_root="$(pwd)/$project_name"
echo -e "${BLUE}[*] Initializing project in ${project_root}${NC}"

if [ -z "$project_name" ]; then
  echo -e "${ORANGE}Project name cannot be empty${NC}"
  exit 1
fi

mkdir -p "$project_name"
cp -a $script_root/exe-template/. "$project_root/"

sed -i -e "s/__PROJECT_NAME__/$project_name/g" $project_root/dev.sh
sed -i -e "s/__PROJECT_NAME__/$project_name/g" $project_root/launch.json
sed -i -e "s/__PROJECT_NAME__/$project_name/g" $project_root/CMakeLists.txt
sed -i -e "s/__PROJECT_NAME__/$project_name/g" $project_root/src/Main.cpp

mkdir -p $project_root/include/$project_name

echo -e "${GREEN}[+] Project initialized in ${project_root}${NC}"
