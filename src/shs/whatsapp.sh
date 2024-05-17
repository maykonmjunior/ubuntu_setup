#!/bin/bash

# Nome do repositório no formato usuario/repositorio
REPO="amanharwara/altus"
# pasta home do usuário
HOME_NAME="maykon-marcos-junior"
# extensão do arquivo
EXENSION="AppImage"
# nome do arquivo
FILE_NAME="whatsapp-desktop"
# Caminho temporário absoluto para salvar o .deb
TEMP_DEB_PATH="/home/$HOME_NAME/Downloads/$EXTENSION/$FILE_NAME.$EXENSION"

# Função para obter a URL do último lançamento
get_latest_release_url() {
    api_url="https://api.github.com/repos/$REPO/releases/latest"
    # descomente a 1ª versão e comente a 2ª, instalando o jq com sudo apt install jq
    # deb_url=$(curl -s $api_url | jq -r '.assets[] | select(.name | endswith(".AppImage")) | .browser_download_url')
    deb_url=$(curl -s $api_url | grep -o 'https://github.com/[^"]*\.AppImage')
    echo $deb_url
}

# Função para baixar o .deb
download_deb() {
    deb_url=$(get_latest_release_url)
    if [[ -z "$deb_url" ]]; then
        echo "Erro: URL do pacote não encontrada."
        exit 1
    fi
    echo "Baixando o pacote da URL: $deb_url"
#    wget -O "$TEMP_DEB_PATH" "$deb_url"
    curl -L -o "$TEMP_DEB_PATH" "$deb_url"
}

# Função para instalar o .deb
install_deb() {
    echo "Instalando o pacote .deb..."
    sudo dpkg -i "$TEMP_DEB_PATH"
    sudo apt-get install -f -y  # Instalar dependências faltantes, se houver
}

# Função para desinstalar o aplicativo
uninstall_app() {
    echo "Desinstalando o aplicativo..."
    rm -f "$TEMP_DEB_PATH"
}

# Checando argumentos de entrada
if [ "$1" == "install" ]; then
    download_deb
    # install_deb
elif [ "$1" == "uninstall" ]; then
    uninstall_app
else
    echo "Uso: $0 {install|uninstall}"
    exit 1
fi


# usage:
#   => first: to make the script executable
#   chmod +x name.sh
#  => then run the script with either of the following commands
#   ./name.sh install
#   or
#   ./name.sh uninstall

### to verify if URL is still valid
# curl -s https://api.github.com/$REPO/altus/releases/latest | grep "browser_download_url"