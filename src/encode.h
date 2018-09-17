//
// Created by lucasveron on 14/09/18
//

#include <stdio.h>

/**
 * Construye el TDA. Debe llamarse al principio.
 * Post: TDA construido.
 */
void EncodeConstruct();

/**
 * Retorna la representación en int del char
 * en la tabla.
 */
unsigned char DecodeChar(char toDecode);

/**
 * Recibe 3 caracteres en buffer y los convierte en 4 caracteres codificados en output.
 * Pre: el buffer contiene length caracteres (1 a 3) y todos los caracteres son validos
 * Post: retorna un buffer de 4 byte con los caracteres en base64.
 */
void Encode(const unsigned char* buffer, unsigned int length, unsigned char* output);

/**
 * Decodifica la entrada en Base64.
 */
char* Decode(char* toDecode);
