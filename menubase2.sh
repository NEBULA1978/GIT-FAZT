#!/bin/bash

# Verificar si Git está instalado
if ! [ -x "$(command -v git)" ]; then
  echo "Error: Git no está instalado." >&2
  exit 1
fi

while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar directorio"
    echo "2. Mostrar calendario"
    echo "3. Mostrar fecha del dia de hoy"
    echo "4. Iniciar git con una carpeta"
    echo "5. Añadir archivo"
    echo "6. Hacer commit"
    echo "7. Ver el estado de git"
    echo "8. Ver los commits: el hash la fecha y el autor"
    echo "9. Cambiar de commit"
    echo "10. Volver al último commit"
    echo "11. Ver el estado de git"
    echo "12. Salir"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        echo "Mostrando directorio"
        ls
        read foo
        ;;
    2)
        echo "Mostrando calendario"
        cal
        read foo
        ;;
    3)
        echo "Mostrar fecha del dia de hoy"
        date
        read foo
        ;;

    4)
        # Verificar si ya se ha inicializado Git en el directorio
        if [ -d ".git" ]; then
            echo "Git ya está inicializado en este directorio."
        else
            echo "Iniciando git con el directorio actual"
            git init
        fi
        read foo
        ;;

    5)
        echo "Ingresa el nombre del archivo a añadir:"
        read file
        git add $file
        read foo
        ;;

    6)
        echo "Ingresa un mensaje para el commit:"
        read message
        git commit -m "$message"
        read foo
        ;;

    7)
        echo "Verificando el estado de git"
        git status
        read foo
        ;;

    8)
        echo "Ver los commits: el hash, la fecha y el autor"
        git log --pretty=format:"%h %ad %s %an" --date=short
        read foo
        ;;

    9)
        echo "Ingresa el hash del commit al cual deseas cambiar:"
        read hash
        git checkout $hash
        read foo
        ;;

    10)
        echo "Volver al último commit"
        git checkout master
        read foo
        ;;
    11)
        echo "Ver el estado de git"
        git status
        read foo
        ;;

    12) exit 0 ;;
    #Alerta
    *)
        echo "Opcion invalida..."
        sleep 1
        ;;
    esac
done
