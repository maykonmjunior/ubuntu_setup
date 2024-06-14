#!/bin/bash

# Função para verificar se um comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Função para instalar pacotes usando apt-get
install_package() {
    sudo apt-get update
    sudo apt-get install -y "$1"
}

# Solicitar o usuario@ip_do_servidor
read -p "Digite o usuário e o IP do servidor (formato usuario@ip_do_servidor): " USER_SERVER

# Verificar se o OpenSSH está instalado e instalá-lo se necessário
if ! command_exists ssh; then
    echo "OpenSSH não está instalado. Instalando..."
    install_package openssh-client
fi

if ! command_exists sshd; then
    echo "OpenSSH server não está instalado. Instalando..."
    install_package openssh-server
fi

# Verificar se o serviço SSH está em execução e iniciá-lo se necessário
if ! sudo systemctl is-active --quiet ssh; then
    echo "O serviço SSH não está em execução. Iniciando..."
    sudo systemctl start ssh
fi

# Verificar se o serviço SSH está habilitado para iniciar no boot e habilitá-lo se necessário
if ! sudo systemctl is-enabled --quiet ssh; then
    echo "O serviço SSH não está habilitado para iniciar no boot. Habilitando..."
    sudo systemctl enable ssh
fi

# Gerar um par de chaves SSH se não existir
if [ ! -f ~/.ssh/ ]; then
    echo "Gerando um novo par de chaves SSH..."
    ssh-keygen -t rsa -b 4096 -C "$(whoami)@$(hostname)" -N "" -f ~/.ssh/id_rsa
fi

# Copiar a chave pública para o servidor remoto
echo "Copiando a chave pública para o servidor remoto..."
ssh-copy-id "$USER_SERVER"

# Conectar ao servidor remoto
echo "Conectando ao servidor remoto..."
ssh "$USER_SERVER"
