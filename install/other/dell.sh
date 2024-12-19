if $(gum confirm "Do you want to install Dell Command Configure?"); then
    yay -S dell-command-configure --needed --noconfirm
    sudo /opt/dell/dcc/cctk --primarybatterycfg=Custom:70-80
fi
