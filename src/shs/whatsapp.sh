#!/bin/bash

# Nome do repositório no formato usuario/repositorio
REPO="amanharwara/altus"
# pasta home do usuário
HOME_NAME=$(whoami) #"maykon-marcos-junior"
# extensão do arquivo
EXENSION="AppImage"
# nome do arquivo
FILE_NAME="whatsapp-desktop"
# Caminho temporário absoluto para salvar o app
TEMP_PATH="/home/$HOME_NAME/Downloads/$EXTENSION/$FILE_NAME.$EXENSION"

# Função para obter a URL do último lançamento
get_latest_release_url() {
    api_url="https://api.github.com/repos/$REPO/releases/latest"
    # descomente a 1ª versão e comente a 2ª, instalando o jq com sudo apt install jq
    # app_url=$(curl -s $api_url | jq -r '.assets[] | select(.name | endswith(".AppImage")) | .browser_download_url')
    app_url=$(curl -s $api_url | grep -o 'https://github.com/[^"]*\.'$EXENSION)
    echo $app_url
}

# Função para baixar o app
download_app() {
    app_url=$(get_latest_release_url)
    if [[ -z "$app_url" ]]; then
        echo "Erro: URL do pacote não encontrada."
        exit 1
    fi
    echo "Baixando o pacote da URL: $app_url"
#    wget -O "$TEMP_PATH" "$app_url"
    curl -L -o "$TEMP_PATH" "$app_url"
}

# Função para instalar o app
install_app() {
    echo "Instalando o pacote app..."
    sudo dpkg -i "$TEMP_PATH"
    sudo apt-get install -f -y  # Instalar dependências faltantes, se houver
}

# Função para desinstalar o aplicativo
uninstall_app() {
    echo "Desinstalando o aplicativo..."
    rm -f "$TEMP_PATH"
}

# Checando argumentos de entrada
if [ "$1" == "install" ]; then
    download_app
    # install_app
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
