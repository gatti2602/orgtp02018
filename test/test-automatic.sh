#!/bin/bash

echo "#########################################"
echo "########## Tests automaticos  ###########"
echo "#########################################"

mkdir ./outputs

echo "#---------# COMIENZA test ejercicio 0 archivo vacio #--------#"
touch ./outputs-aut/zero.txt
./tp0 -a encode -i ./outputs-aut/zero.txt -o ./outputs-aut/zero.txt.b64
ls -l ./outputs-aut/zero.txt.b64

if diff -b ./outputs-aut/zero.txt ./outputs-aut/zero_ok.txt; then
 echo "[OK]";
else echo ERROR;
fi

echo "#---------# FIN test ejercicio 0 archivo vacio #--------#"
echo "#-------------------------------------------------------#"
echo "#---------# COMIENZA test ejercicio 1 archivo vacio sin -a #--------#"

touch ./outputs-aut/zero.txt
./tp0 -i ./outputs-aut/zero.txt -o ./outputs-aut/zero.txt.b64
ls -l ./outputs-aut/zero.txt.b64

if diff -b ./outputs-aut/zero.txt ./outputs-aut/zero_ok.txt; then
 echo "[OK]";
else echo ERROR;
fi

echo "#---------# FIN test ejercicio 1 archivo vacio sin -a #--------#"
echo "#--------------------------------------------------------------#"
echo "#---------# COMIENZA test ejercicio 2 stdin y stdout #---------#"

echo -n Man | ./tp0 -a encode > ./outputs/outputEncode.txt
if diff -b ./outputs-aut/outputEncode-aut.txt ./outputs/outputEncode.txt; then echo "[OK]"; else
	echo ERROR;
fi

echo "#---------# FIN test ejercicio 2 stdin y stdout #--------#"
echo "#--------------------------------------------------------#"
echo "#---------# COMIENZA test ejercicio 3 stdin y stdout #--------#"

echo -n TWFu | ./tp0 -a decode > ./outputs/outputDecode.txt
if diff -b ./outputs-aut/outputDecode-aut.txt ./outputs/outputDecode.txt; then echo "[OK]"; else
	echo ERROR;
fi

echo "#---------# FIN test ejercicio 3 stdin y stdout #--------#"
echo "#--------------------------------------------------------#"
echo "#---------# COMIENZA test ejercicio 3 help sin parámetros #--------#"

./tp0 > ./outputs/outputMenuHelp.txt
if diff -b ./outputs-aut/outputMenuHelp-aut.txt ./outputs/outputMenuH.txt; then echo "[OK]"; else
	echo ERROR;
fi

echo "#---------# FIN test ejercicio 3 help sin parámetros #--------#"
echo "#-----------------------------------------------------#"
echo "#----------# COMIENZA test menu help (-h) #----------#"

./tp0 -h > ./outputs/outputMenuH.txt

if diff -b ./outputs-aut/outputMenuHelp-aut.txt ./outputs/outputMenuH.txt; then echo "[OK]"; else
	echo ERROR;
fi

echo "#----------# FIN test menu version (-h) #----------#"
echo "#-----------------------------------------------------#"
echo "#----------# COMIENZA test menu help (--help) #----------#"

./tp0 --help > ./outputs/outputMenuHelp.txt

if diff -b ./outputs-aut/outputMenuHelp-aut.txt ./outputs/outputMenuHelp.txt; then echo "[OK]"; else
		echo ERROR;
fi

echo "#----------# FIN test menu version (--help) #----------#"
echo "#-----------------------------------------------------#"
echo "#----------# COMIENZA test menu version (-V) #----------#"

./tp0 -V > ./outputs/outputMenuV.txt

if diff -b ./outputs-aut/outputMenuVersion-aut.txt ./outputs/outputMenuV.txt; then echo "[OK]"; else
		echo ERROR;
fi
echo "#----------# FIN test menu version (-V) #----------#"
echo "#-----------------------------------------------------#"
echo "#----------# COMIENZA test menu version (--version) #----------#"

./tp0 --version > ./outputs/outputMenuVersion.txt

if diff -b ./outputs-aut/outputMenuVersion-aut.txt ./outputs/outputMenuVersion.txt; then echo "[OK]"; else
		echo ERROR;
fi
echo "#----------# FIN test menu version (--version) #----------#"
echo "#-----------------------------------------------------#"
echo "#---------# COMIENZA test ejercicio encode/decode #--------#"

echo xyz | ./tp0 -a encode | ./tp0 -a decode | od -t c

echo "#---------# FIN test ejercicio encode #--------#"
echo "#-----------------------------------------------------#"
echo "#---------# COMIENZA test ejercicio longitud maxima 76 #--------#"

yes | head -c 1024 | ./tp0 -a encode > ./outputs/outputSize76.txt

if diff -b ./outputs-aut/outputSize76-aut.txt ./outputs/outputSize76.txt; then echo "[OK]"; else
		echo ERROR;
fi

echo "#---------# FIN test ejercicio longitud maxima 76 #--------#"
echo "#-----------------------------------------------------#"
echo "#---------# COMIENZA test ejercicio decode 1024 #--------#"

yes | head -c 1024 | ./tp0 -a encode | ./tp0 -a decode | wc -c > ./outputs/outputSize1024.txt

if diff -b ./outputs-aut/outputSize1024-aut.txt ./outputs/outputSize1024.txt; then echo "[OK]"; else
		echo ERROR;
fi

echo "#---------# FIN test ejercicio decode 1024#--------#"
echo "#-----------------------------------------------------#"
echo "#---------# COMIENZA test ejercicio encode/decode random #--------#"

n=1;
while :; do
head -c $n </dev/urandom >/tmp/in.bin;
./tp0 -a encode -i /tmp/in.bin -o /tmp/out.b64;
./tp0 -a decode -i /tmp/out.b64 -o /tmp/out.bin;
if diff /tmp/in.bin /tmp/out.bin; then :; else
echo ERROR: $n;
break;
fi
echo ok: $n;
n="‘expr $n + 1‘";
rm -f /tmp/in.bin /tmp/out.b64 /tmp/out.bin
done

echo "#---------# FIN test ejercicio encode/decode random #--------#"
echo "#------------------------------------------------------------#"

echo "##########################################"
echo "####### FIN Tests automaticos  ###########"
echo "##########################################"
