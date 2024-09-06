all:
	curl https://rclone.org/install.sh | sudo bash && clone config

# Após o rclone config, siga os passos abaixo:
# - Escolha n para criar uma nova configuração.
# - Dê um nome ao remote (por exemplo, gdrive).
# - Quando for solicitado para escolher o tipo de armazenamento, escolha drive.
# - O rclone perguntará por várias opções, como o client_id, client_secret e scope. Você pode deixar essas opções em branco para usar os padrões do rclone.
# - O rclone pedirá para abrir uma URL para autenticação com o Google.
# - Se você estiver em um terminal sem ambiente gráfico, copie essa URL para um navegador local, faça login na sua conta do Google e copie o código de autenticação gerado de volta no terminal.
# - Finalize a configuração respondendo n para a opção de configurar o team drive, se não estiver utilizando.

# ================= Exemplos de uso do rclone ============================

# caminho de arquivo no drive chamado exemplo_drive:
# Google Drive (Raiz) 				==> exemplo_drive:/
#  └── Projetos 					==> exemplo_drive:/Projetos
#     ├── ML 						==> exemplo_drive:/Projetos/ML
#     │   └── modelo.pkl			==> exemplo_drive:/Projetos/ML/modelo.pkl
#     └── Relatórios				==> exemplo_drive:/Projetos/Relatórios
#         └── relatorio_final.pdf	==> exemplo_drive:/Projetos/Relatórios/relatorio_final.pdf


# Para fazer upload de um arquivo:
# rclone copy /caminho/para/o/arquivo nome_drive:/caminho/no/drive

# Para fazer upload de uma pasta:
# rclone copy /caminho/da/pasta nome_drive:/caminho/no/drive

# Para fazer download de um arquivo:
# rclone copy nome_drive:/caminho/no/drive /caminho/para/o/destino

# Para sincronizar uma pasta:
# rclone sync /caminho/para/a/pasta gdrive:/caminho/no/drive

# Para listar os arquivos e pastas:
# rclone ls nome_drive:nome_da_pasta

# Você pode também usar rclone mount para montar seu Google Drive diretamente no sistema de arquivos, permitindo que você acesse os arquivos como se estivessem localmente.
