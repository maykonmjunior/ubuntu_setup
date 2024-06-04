# Obtém a versão estável mais recente do Blender a partir do site oficial
BLENDER_VERSION=$(wget -qO- https://www.blender.org/download/ | grep -oP 'blender-\K\d+\.\d+' | head -n 1)

# Nome do pacote do Blender
# BLENDER_PKG := blender=$(BLENDER_VERSION)
BLENDER_PKG := blender

# Dependências necessárias
DEPS := libxi6 libxrender1 libxcursor1 libxinerama1 libglew-dev

all:
	sudo apt install -fy $(BLENDER_PKG)

$(DEPS):
	sudo apt install -y $@

clean:
	sudo apt purge -y $(BLENDER_PKG)
	sudo apt autopurge -y

# A diretiva .PHONY é usada para informar ao Make que os alvos listados após ela não são arquivos reais,
# 	mas sim pseudoalvos.
# Isso garante que o Make sempre execute os comandos associados a esses alvos,
#   mesmo que existam arquivos com os mesmos nomes no diretório atual.
.PHONY: all clean
