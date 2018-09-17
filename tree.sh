#! bin/bash

echo Directorio Actual
pwd;
cd;
#cd Documentos/;
#ls -R -1 --color | grep ":$" | sed '/:$/{x;\tp;x;}';
#ls -R -1 --color | grep -v ":$" | sed -e 's/^/     /';
#'s/cadenasrc1\|cadenasrc2/cadena_nueva/g'
#&> ~/Documentos/hola.txt;
ls -R --color | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
echo
echo
echo -------
#cat hola.txt
#sort hola.txt;
echo
echo
echo -------
#cat hola1.txt;
