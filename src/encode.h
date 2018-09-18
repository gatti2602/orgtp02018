//
// Created by lucasveron on 14/09/18
//
#ifndef TP0_ENCODE_H
#define TP0_ENCODE_H

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
 * Retorna un buffer de 3 aracteres con el decode de 4 caracteres en base64.
 * Pre: el buffer input contiene 4 caracteres. El buffer output tiene por lo menos 3 caracteres
 * Post: retorna un buffer de 3 byte con los caracteres en ASCII. retorna 0 si error 1 si ok
 */
unsigned char Decode(unsigned char *buf_input, unsigned char *buf_output);

#endif //TP0_ENCODE_H
