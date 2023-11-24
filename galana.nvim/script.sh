sh << "EOF"
  LUSH_NAME=$(basename $(pwd))
  GIT_NAME=$(git config user.name)
  YEAR=$(date +"%Y")
  mv colors/lush_template.lua colors/$LUSH_NAME.lua
  mv lua/lush_theme/lush_template.lua lua/lush_theme/$LUSH_NAME.lua
  if command -v sed &> /dev/null; then
    sed -i "s/lush_template/$LUSH_NAME/g" colors/$LUSH_NAME.lua
    sed -i "s/COPYRIGHT_NAME/$GIT_NAME/g" LICENSE
    sed -i "s/COPYRIGHT_YEAR/$YEAR/g" LICENSE
    git add .
  else
    echo "Could not find sed, please manually replace 'lush_template' with '$LUSH_NAME' in colors/$LUSH_NAME.vim, and update the LICENCE file."
  fi
EOF
