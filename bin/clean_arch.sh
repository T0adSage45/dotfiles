#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}Updating system...${NC}"
sudo pacman -Syu --noconfirm
yay -Syu --noconfirm

echo -e "${YELLOW}Removing unused packages...${NC}"
sudo pacman -Rns $(pacman -Qdtq) --noconfirm

echo -e "${RED}Clearing system journal logs (keep last 2 weeks)...${NC}"
sudo journalctl --vacuum-time=10weeks

echo -e "${CYAN}Clearing user cache...${NC}"
sudo rm -rf ~/.cache/* /tmp

echo -e "${GREEN}Freeing up unused disk space...${NC}"
sudo sync && sudo sysctl vm.drop_caches=3

echo -e "${YELLOW}Arch system cleanup complete!${NC}"

