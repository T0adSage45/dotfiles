#!/bin/bash

# 壁紙を格納するディレクトリ
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# ディレクトリからランダムな壁紙ファイルを選択
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# 選択した壁紙を feh を使って設定
feh --bg-scale "$WALLPAPER"
