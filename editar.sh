#!/bin/bash

# Script usado para editar os arquivos de áudio. Uso: ./editar.sh *.wav (-s) para fazer transcrição dos arquivos sem e com edição.

cp $1 speech_$1
normalize speech_$1
sox speech_$1 edited_$1 compand 0.03,1 -90,-90,-70,-70,-60,-45,0,0 -5
# parâmetros de compand otimizados para nivelar gravações faladas.
rm speech_$1
if [ $2 == '-s' ]; then
	echo -e "\n\nTranscribing unedited audio file: "	
	speech2text $1
	echo -e "\n\nTranscribing improved audio file: "
	speech2text edited_$1
fi 2>&-
