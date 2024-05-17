import os
from pathlib import Path
import requests
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Configurações
HOME_NAME = "maykon-marcos-junior"
FILE_NAME = "binance"
EXTENSION = "deb"
TEMP_DEB_PATH = Path(f"/home/{HOME_NAME}/Downloads/{EXTENSION}/{FILE_NAME}.{EXTENSION}")
DOWNLOAD_PAGE_URL = "https://www.binance.com/en/download"

# Função para baixar o .deb
def download_deb():
    print("Baixando o pacote .deb...")

    # Configurar o driver do Selenium (Chrome)
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Executa o Chrome em modo headless (sem interface gráfica)
    driver = webdriver.Chrome(options=chrome_options)

    try:
        # Acessar a página de download
        driver.get(DOWNLOAD_PAGE_URL)

        # Aguardar o carregamento completo da página
        wait = WebDriverWait(driver, 10)
        wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, "a[data-download]")))

        # Obter o link de download do arquivo .deb
        deb_link_element = wait.until(EC.visibility_of_element_located((By.CSS_SELECTOR, "a[data-download*='.deb']")))
        deb_link = deb_link_element.get_attribute("data-download")

        # Baixar o arquivo usando requests
        response = requests.get(deb_link)
        TEMP_DEB_PATH.parent.mkdir(parents=True, exist_ok=True)
        with open(TEMP_DEB_PATH, "wb") as f:
            f.write(response.content)

        print(f"Arquivo baixado com sucesso: {TEMP_DEB_PATH}")
    finally:
        driver.quit()

# Função para verificar se o arquivo é um pacote .deb válido
def check_deb_file():
    file_output = os.popen(f"file '{TEMP_DEB_PATH}'").read()
    if "Debian binary package" in file_output:
        return True
    else:
        return False

# Função para instalar o .deb
def install_deb():
    if check_deb_file():
        print("Instalando o pacote .deb...")
        os.system(f"sudo dpkg -i '{TEMP_DEB_PATH}'")
        os.system("sudo apt-get install -f -y")
        print("Limpando o arquivo .deb temporário...")
        os.remove(TEMP_DEB_PATH)
    else:
        print("O arquivo baixado não é um pacote .deb válido.")

# Função para desinstalar o aplicativo
def uninstall_app():
    print("Desinstalando o aplicativo...")
    os.system(f"sudo apt-get remove --purge -y {FILE_NAME}")
    os.system("sudo apt-get autoremove -y")

# Entrada do usuário
# action = input("Digite 'i' para instalar ou 'u' para desinstalar: ").strip().lower()

if True: # action == "i":
    download_deb()
    install_deb()
'''elif action == "u":
    uninstall_app()
else:
    print("Opção inválida!")
'''
