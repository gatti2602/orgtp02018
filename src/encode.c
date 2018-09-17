//
// Created by lucasveron 14/09/18
//
#include <stdlib.h>

#define BASE64_END '='

static unsigned char encoding_table[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
                                         'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
                                         'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
                                         'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
                                         'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
                                         'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
                                         'w', 'x', 'y', 'z', '0', '1', '2', '3',
                                         '4', '5', '6', '7', '8', '9', '+', '/'};

static int encoding_table_size = 64;

/**
 * Retorna la representación del char en la tabla.
 * pre: character es válido(pertenece a la tabla)
 * ó es el caracter '='.
 * post: retorna la representación(int) del character
 * en la tabla encoding.
 *
 */
unsigned char DecodeChar(char character){
	for(unsigned char i = 0;i<encoding_table_size;i++){
		if(encoding_table[i] == character){
			return i;
		}
	}
	return 0;
}

void Encode(const unsigned char* buffer, unsigned int length, unsigned char* output){
	unsigned char b1 = buffer[0];
	unsigned char b2 = buffer[1];
	unsigned char b3 = buffer[2];
	//Recupero los primeros 6 bits y opero.
	unsigned char b1aux = b1 >> 2;
	//Recuperados los primeros 6 bits busco en la tabla el encoding.
	output[0] = encoding_table[(int)b1aux];
	//Recupero los siguientes 6 bits.
	unsigned char b2aux = b1 << 6;
	b2aux = b2aux >> 2;
	b2aux = b2aux | (b2 >> 4);
	//Busco en la tabla el encoding.
	output[1] = encoding_table[(int)b2aux];
    output[2] = BASE64_END;
    output[3] = BASE64_END;
    if(length == 3){
        /*
         * Si tengo los 3 caracteres en el buffer opero
         * con los ultimos 2 caracteres.
         */
        unsigned char b3aux = b3 >> 6;
        unsigned char b3aux2 = b2 << 4;
        b3aux2 = b3aux2 >> 2;
        b3aux = b3aux | b3aux2;
        //Busco en la tabla el encoding.
        output[2] = encoding_table[(int)b3aux];
        unsigned char b4aux = b3 << 2;
        b4aux = b4aux >> 2;
        //Busco en la tabla el encoding.
        output[3] =encoding_table[(int)b4aux];
    } else {
        if (length == 2) {
            /*
             * En caso de tener sólo 2 caracteres en el buffer
             * recupero el caracter restante y coloco el fin de linea(=)
             */
            unsigned char b3aux = b3 >> 6;
            unsigned char b3aux2 = b2 << 4;
            b3aux2 = b3aux2 >> 2;
            b3aux = b3aux | b3aux2;
            output[2] = encoding_table[(int) b3aux];
        }
    }
}

/**
 * Retorna el decode de 4 caracteres en base64.
 * Pre: el buffer contiene 4 caracteres.
 * Post: retorna un buffer de 3 byte con los caracteres en ASCII.
 */
char* Decode(char* charsBase64){
	unsigned char char1 = DecodeChar(charsBase64[0]);
	unsigned char char2 = DecodeChar(charsBase64[1]);
	unsigned char char3 = DecodeChar(charsBase64[2]);
	unsigned char char4 = DecodeChar(charsBase64[3]);

	char* return_buff = (char*)malloc(sizeof(char)*3);

	unsigned char char1_aux = char1 << 2;
	//Tomo los 2 ultimos bits de char2
	unsigned char char2_aux = char2 >> 4;
	char1_aux = char1_aux | char2_aux;
	return_buff[0] = char1_aux;

	//Tomo los ultimos 4b del char2 y los 4b primeros del char3
	char1_aux = char2 << 4;
	char2_aux = char3 >> 2;
	char2_aux = char1_aux | char2_aux;
	return_buff[1] = char2_aux;

	//Tomo los ultimos 2b del char3 + los bits del char4
	char1_aux = char3 << 6;
	return_buff[2] = char1_aux | char4;
	return return_buff;
}
