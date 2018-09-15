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
 * Retorna la conversión en Base64 de la entrada.
 */
char* Encode(char* toEncode);

/**
 * Decodifica la entrada en Base64.
 */
char* Decode(char* toDecode);
