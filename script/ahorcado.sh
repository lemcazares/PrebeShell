
intentos=0
contador=0

function limpiar()
{
clear
}
limpiar


declare -a palabra_user[20];
echo;
read -p "Escriba la palabra por adivinar : " palabra_user2                # Se lee la palabra
let longitud=`expr length "$palabra_user2"`-1     # Sacar la longitud de la palabra:
# echo $longitud
for i in $(seq 0 $longitud);
do
palabra_user[$i]=${palabra_user2:$i:1}            # Se mete cada caracter en un subindice, en el array palabra_user[x]
# echo palabra_user[$i] = ${palabra_user[$i]}
done
read -p "Defina el numero de intentos : " intentos       # No. de intentos que puede cometer el usuario.
declare -a palabra_adivinar[$longitud];
for i in $(seq 0 $longitud);
do
palabra_adivinar[$i]=_                            # Se meten guiones en cada subindice de palabra_adivinar[x]
echo ${palabra_adivinar[$i]};
done
limpiar;
# Mostrar guiones :
while test $contador -le $intentos
do
echo;echo;
for i in $(seq 0 $longitud);
do
echo -n "${palabra_adivinar[$i]} ";
done
echo;
echo "Letra :                                                      Intentos: $contador de $intentos"
read letra
echo $palabra_user2 | grep "$letra" > nul 2>&1 || let contador+=1
# Busqueda secuencial : 
for i in $(seq 0 $longitud);
do
if [ ${palabra_user[$i]} = "$letra" ];then
palabra_adivinar[$i]=$letra
fi
done
# Mostrar los guiones : 
echo;echo;
for i in $(seq 0 $longitud);
do
echo -n "${palabra_adivinar[$i]} ";
done
echo;echo;
limpiar
# Aqui va el IF y el break:
if [ "$contador" -ge "$intentos" ];
then
break
fi
i=0
cadena_final=`while test $i -le $longitud; do echo -n ${palabra_adivinar[$i]}; let i+=1; done`
# echo Cadena final : $cadena_final
if [ "$cadena_final" == "$palabra_user2" ];
then
break;
fi
done
if [ "$cadena_final" == "$palabra_user2" ];
then
echo Felicidades, has ganado.

elif [ "$cadena_final" -ne "$palabra_user2" ];
then
echo Lo siento, has perdido.
fi
exit 0