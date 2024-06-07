#!/bin/bash

# Nome do repositório no formato usuario/repositorio
REPO="ProtonMail/proton-bridge"
# pasta home do usuário
HOME_NAME="$(whoami)"
# extensão do arquivo
EXTENSION="deb"
# nome do arquivo
FILE_NAME="proton-bridge"
# Caminho temporário absoluto para salvar o .deb
TEMP_DEB_PATH="/home/$HOME_NAME/Downloads/$EXTENSION/$FILE_NAME.$EXTENSION"

# Função para obter a URL do último lançamento
get_latest_release_url() {
    api_url="https://api.github.com/repos/$REPO/releases/latest"
    deb_url=$(curl -s $api_url | grep -E 'browser_download_url.*\.deb"' | cut -d '"' -f 4)
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
    sudo apt-get remove --purge -y "$FILE_NAME"
    sudo apt-get autopurge -y  # Remover dependências não mais necessárias
    # Limpando o arquivo .deb temporário
    rm -f "$TEMP_DEB_PATH"
}

# Checando argumentos de entrada
if [ "$1" == "install" ]; then
    download_deb
    install_deb
elif [ "$1" == "uninstall" ]; then
    uninstall_app
else
    echo "Uso: $0 {install|uninstall}"
    exit 1
fi
