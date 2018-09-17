i=0

if [ -e $PWD/contraprebe ]; then
	n=0
else
	mkdir $PWD/contraprebe
fi

while [ "$i" != "3" ]; do

echo "Inserte usuario"
read usu

echo "Ingrese contrasena"
read -s contra



if [ $(sudo grep $usu /etc/shadow) ]; then
	
	contr=$(sudo -S grep -r $usu /etc/shadow)
	sudo echo "$contr" > $PWD/contraprebe/"$usu.txt"
	salt=$(cut -d "$" -f 3 $PWD/contraprebe/$usu.txt)
	cont=$(mkpasswd -m sha-512 -S $salt $contra)


		if [[ "$contr" == *$cont* ]]; then
			clear

			trap '' 2 20

			echo -e "$(tput sgr0)$(tput setaf 2; tput bold)>>>>>>>>>> Bienvenido a la Prebe Shell de $usu <<<<<<<<<<<\n$(tput sgr0)Recuerte teclear 'ayuda' para obtener informacion de los comandos de esta consola\nPara salir teclee el comando 'salir'"

			PS1="$(tput sgr0)$(tput setaf 1; tput bold)$usu@$(tput sgr0)$(tput setaf 1)$(tput bold)$PWD$(tput sgr0)--> "

			cont=0
			while [ "$cont" != "1" ]; do
				read -p "$PS1" cmd

					case $cmd in
						arbol )
							#QUIQUE
							;;

						ayuda )
							$PWD/script/ayuda.sh
							;;

						infosis )
							$PWD/script/infosis.sh
							;;

						buscar )
				
							$PWD/script/buscar.sh
							;;

						juego )
							$PWD/script/ahorcado.sh
							;;

						pp )
							#QUIQUE
							;;

						creditos )
							cat $PWD/script/creditos
						;;

						salir)
						cont=1
						;;

						*)
						echo $($cmd)
						;;

					esac
			done

		


		i=3
		else
		
		echo "verifique sus datos"
		((++i))

		fi

else

	echo "verifique sus datos"
	((++i))

fi

done
