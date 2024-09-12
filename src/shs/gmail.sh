#!/bin/bash

# Nome do repositório no formato usuario/repositorio
REPO="timche/gmail-desktop"
# pasta home do usuário
HOME_NAME=$(whoami) #"maykon-marcos-junior"
# extensão do arquivo
EXENSION="AppImage"
# nome do arquivo
FILE_NAME="gmail-desktop"
# Caminho temporário absoluto para salvar o arquivo
TEMP_PATH="/home/$HOME_NAME/Downloads/$EXENSION/$FILE_NAME.$EXENSION"

# Função para obter a URL do último lançamento
get_latest_release_url() {
    api_url="https://api.github.com/repos/$REPO/releases/latest"
    # descomente a 1ª versão e comente a 2ª, instalando o jq com sudo apt install jq
    # url=$(curl -s $api_url | jq -r '.assets[] | select(.name | endswith(".$EXENSION")) | .browser_download_url')
    url=$(curl -s $api_url | grep -o 'https://github.com/[^"]*\.'$EXENSION)
    echo $url
}

# Função para baixar o app
download_app() {
    url=$(get_latest_release_url)
    if [[ -z "$url" ]]; then
        echo "Erro: URL do pacote não encontrada."
        exit 1
    fi
    echo "Baixando o pacote da URL: $url"
#    wget -O "$TEMP_PATH" "$url"
    curl -L -o "$TEMP_PATH" "$url"
}

# Função para instalar o app
install_app() {
    echo "Instalando o pacote..."
    sudo dpkg -i "$TEMP_PATH"
    sudo apt install -f -y  # Instalar dependências faltantes, se houver
}

# Função para desinstalar o aplicativo
uninstall_app() {
    echo "Desinstalando o aplicativo..."
    sudo apt remove --purge -y "$FILE_NAME"
    sudo apt autoremove -y  # Remover dependências não mais necessárias
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

# Limpando o arquivo .deb temporário
rm -f "$TEMP_PATH"

# usage:
#   => first: to make the script executable
#   chmod +x gmail.sh
#  => then run the script with either of the following commands
#   ./gmail.sh install
#   or
#   ./gmail.sh uninstall

### to verify if URL is still valid
# curl -s https://api.github.com/repos/$REPO/releases/latest | grep "browser_download_url"
