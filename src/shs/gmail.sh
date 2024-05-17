#!/bin/bash

# Nome do repositório no formato usuario/repositorio
REPO="timche/gmail-desktop"

# Caminho temporário absoluto para salvar o .deb
TEMP_DEB_PATH="/tmp/gmail-desktop.deb"

# Função para obter a URL do último lançamento
get_latest_release_url() {
    echo "Obtendo a URL do último lançamento..."
    api_url="https://api.github.com/repos/$REPO/releases/latest"
    deb_url=$(curl -s $api_url | jq -r '.assets[] | select(.name | endswith(".deb")) | .browser_download_url')
#    deb_url=$(curl -s $api_url | grep "browser_download_url.*.deb" | cut -d '"' -f 4)
    echo $deb_url
}

# Função para baixar o .deb
download_deb() {
    deb_url=$(get_latest_release_url)
    if [[ -z "$deb_url" ]]; then
        echo "Erro: URL do pacote .deb não encontrada."
        exit 1
    fi
    echo "Baixando o pacote .deb da URL: $deb_url"
#    wget -O "$TEMP_DEB_PATH" "$deb_url"
    curl -L -o "$TEMP_DEB_PATH" "$deb_url"
}

# Função para instalar o .deb
install_deb() {
    echo "Instalando o pacote .deb..."
    sudo dpkg -i "$TEMP_DEB_PATH"
    sudo apt-get install -f -y  # Instalar dependências faltantes, se houver
    # Limpando o arquivo .deb temporário
    rm -f "$TEMP_DEB_PATH"

}

# Função para desinstalar o aplicativo
uninstall_app() {
    echo "Desinstalando o aplicativo..."
    # Substitua 'gmail-desktop' pelo nome real do pacote
    sudo apt-get remove --purge -y gmail-desktop
    sudo apt-get autoremove -y  # Remover dependências não mais necessárias
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


# usage:
#   => first: to make the script executable
#   chmod +x gmail.sh
#  => then run the script with either of the following commands
#   ./gmail.sh install
#   or
#   ./gmail.sh uninstall

### to verify if URL is still valid
# curl -s https://api.github.com/repos/timche/gmail-desktop/releases/latest | grep "browser_download_url"
