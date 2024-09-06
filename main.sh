#!/bin/bash

function upd() {
    sudo apt update && sudo apt upgrade -y && apt list --upgradable | sudo apt install -fy && sudo apt autoclean -y && sudo apt autopurge -y
}

function install() {
    upd

    # Lista de aplicativos a serem instalados
    apps=(
        "appimage_launcher"
        "audacious"
        "balena-etcher"
        "binance"
        "blender"
        "brave"
        "discord"
        "firefox"
        "git"
        "github_desktop"
        "gmail"
        "mega"
        "nvidia"
        "proton_mail"
        "rclone"
        "rust"
        "teamviewer"
        "unity"
        "vscode"
        "waydroid"
        "whatsapp"
        "wine"
        "wmctrl"
        "yt-dlp"
    )

    for app in "${apps[@]}"; do
        read -p "Deseja instalar o aplicativo $app? (y/n) " confirm
        if [[ $confirm == "y" || $confirm == "Y" ]]; then
            # Aqui você pode adicionar o comando para instalar o aplicativo específico
            echo "Instalando $app..."
            make -f src/$app.mk
            sudo apt update -y
        else
            echo "Ignorando a instalação de $app."
        fi
    done
}

function get_configs() {
    sudo cp ~/.bash_aliases ../settings_files/bash_aliases
    # get gnome get_configs
    dconf dump / > ../settings_files/dconf-backup.txt
    sudo cp ~/.config/mimeapps.list ../settings_files/defaultapps.list
    # make -f appimage_launcher.mk getup
    # make -f audacious.mk getup
    # make -f brave.mk getup
    # make -f whatsapp.mk getup
}

function load_configs() {
    # setup bash aliases
    sudo cp ../settings_files/bash_aliases ~/.bash_aliases
    # setup gnome configs
    dconf load / < ../settings_files/dconf-backup.txt
    remove_snap
    upd
}

function setup() {
    # make -f audacious.mk setup
    # make -f whatsapp.mk setup
    upd
}

function remove_snap() {
    snap list
    sudo snap remove --purge firefox
    sudo snap remove --purge core*
    sudo snap remove --purge gnome*
    sudo snap remove --purge gtk*
    sudo snap remove --purge snap-store
    sudo snap remove --purge snapd
    sudo rm -rf /var/cache/snapd/
    sudo systemctl stop snapd
    sudo unmount /snap/core/*
    sudo apt purge snapd* gnome-software-plugin-snap --auto-remove
    sudo rm -rf ~/snap /var/cache/snapd/ /var/snap /var/lib/snapd
    sudo apt-mark hold snapd
}

case "$1" in
    install)
        install
        ;;
    get_configs)
        get_configs
        ;;
    load_configs)
        load_configs
        ;;
    setup)
        setup
        ;;
    remove_snap)
        remove_snap
        ;;
    upd)
        upd
        ;;
    *)
        echo "Opções:"
        echo "--> $0 install                  = instalar todos os aplicativos suportados"
        echo "--> $0 get_configs              = obter configurações do sistema atual"
        echo "--> $0 load_configs             = carregar configurações no sistema atual"
        echo "--> $0 setup                    = configurar todos os aplicativos"
        echo "--> $0 remove_snap              = remover pacotes snap"
        echo "--> $0 upd                      = atualizar o sistema"
        ;;
esac
