#!/bin/bash

# pasta home do usuário
HOME_NAME="maykon-marcos-junior"
# extensão do arquivo
EXENSION="deb"
# nome do arquivo
FILE_NAME="binance"
# Caminho temporário absoluto para salvar o arquivo
TEMP_DEB_PATH="/home/$HOME_NAME/Downloads/$EXENSION/$FILE_NAME.$EXENSION"

# URL da página de download do Binance Desktop
DOWNLOAD_PAGE_URL="https://www.binance.com/en/download"

# Função para baixar o .deb
download_deb() {
    echo "Baixando o pacote .deb..."
    
    # Obtém o cookie de sessão da página de download
    session_cookie=$(curl -s -c - "$DOWNLOAD_PAGE_URL" | grep -o 'Binance.*\.cookie' | head -n 1)
    
    # Faz a requisição para baixar o arquivo .deb, enviando o cookie de sessão
    curl -L -O -J -b "$session_cookie" "$DOWNLOAD_PAGE_URL" 2>&1 | grep -o 'https://.*\.deb' | head -n 1
    
    # Verifica se o arquivo foi baixado corretamente
    if [ -f "$FILE_NAME.$EXENSION" ]; then
        mv "$FILE_NAME.$EXENSION" "$TEMP_DEB_PATH"
    else
        echo "Falha ao baixar o pacote .deb."
        exit 1
    fi
}

# Função para verificar se o arquivo é um pacote .deb válido
check_deb_file() {
    file_output=$(file "$TEMP_DEB_PATH")
    if [[ $file_output == *"Debian binary package"* ]]; then
        return 0  # O arquivo é um pacote .deb válido
    else
        return 1  # O arquivo não é um pacote .deb válido
    fi
}

# Função para instalar o .deb
install_deb() {
    if check_deb_file; then
        echo "Instalando o pacote .deb..."
        sudo dpkg -i "$TEMP_DEB_PATH"
        sudo apt-get install -f -y  # Instalar dependências faltantes, se houver
        # Limpando o arquivo .deb temporário
        rm -f "$TEMP_DEB_PATH"
    else
        echo "O arquivo baixado não é um pacote .deb válido."
        exit 1
    fi
}

# Função para desinstalar o aplicativo
uninstall_app() {
    echo "Desinstalando o aplicativo..."
    sudo apt-get remove --purge -y "$FILE_NAME"
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
