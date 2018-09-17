
#Script para la opcion de buscar
echo "Escriba el archivo a buscar seguido del directorio (ruta absoluta)"
read buscar_archivo buscar_directorio
echo $(ls $buscar_directorio | grep $buscar_archivo)