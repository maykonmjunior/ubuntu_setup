def main():
    saida = "options:\n"
    saida += " - make install                  = install all suported apps\n"
    saida += " - make get_configs              = get settings from current sistem\n"
    saida += " - make load_configs             = load settings into current sistem\n"
    saida += " - make setup                    = settings setup for all apps\n"
    saida += " - make -f <file_name>.mk        = install the associated app\n"
    saida += " - make -f <file_name>.mk clean  = uninstall the associated app\n"
    saida += " - make -f <file_name>.mk update = update the associated app\n"
    print(saida, end='')

main()
