//
// Created by gatti2602 on 11/09/18.
//

#define ERROR 0
#define OK 1
#define CHUNK 64


#include "file.h"
#include<stdlib.h>
#include<string.h>

void FileConstruct(File* file){
    file->route = 0;
    file->file = 0;
    file->eof = 0;
}

char FileInit(File* file, const char* from_route){
    file->route = (char*)malloc(sizeof(char)*(strlen(from_route)+1));
    if(file->route == NULL) { // Error en malloc!
        fprintf(stderr, "FileInit: Unable to allocate memory\n");
        return ERROR;
    }
    file->eof = 0;

    //Memcpy no puede fallar si la memoria se asigno correctamente
    memcpy(file->route, from_route, strlen(from_route) + 1);
    return OK;
}

int FileOpenForRead(File* file){
    file->file = fopen(file->route, "r");
    if (file->file == NULL)
        return ERROR;
    else
        return OK;
}

int FileOpenForWrite(File* file) {
    file->file = fopen(file->route, "w");
    if (file->file == NULL)
        return ERROR;
    else
        return OK;
}

int FileClose(File* file){
    if(file->file == 0)
        return OK;

    int result = fclose(file->file);
    if (result == EOF)
        return ERROR;
    else
        return OK;
}

void FileDestroy(File* file){
    if (file->route != 0)
        free(file->route);
}

unsigned int FileReadChunk(File* file, unsigned char* buffer) {
    unsigned int result = 0;
    if(!FileEofReached(file)){
        // El tamaño de un chunk no debe superar el tamaño de un unsigned int
        result = (unsigned int) fread(buffer, sizeof(char), CHUNK, file->file);
        if(feof(file->file)) //TODO: Chequear si esto esta correcto
            file->eof = 1;	//Setea Flag EOF
    }
    return result;
}

int FileEofReached(File* file){
    return file->eof;
}

void FileWriteChunk(File* file, unsigned char* buffer, unsigned int length) {
    fwrite(buffer, sizeof(char), length, file->file);
}
