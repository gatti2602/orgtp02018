//
// Created by gatti2602 on 11/09/18.
//

#define ERROR 0
#define OK 1
#define CHUNK 64


#include "file.h"
#include<stdlib.h>
#include<string.h>

void FileCreate(File *file){
    file->file = 0;
    file->eof = 0;
}

int FileOpenForRead(File* file, const char *route ){
    if(route == NULL) {
        file->file = stdin;
    } else {
        file->file = fopen(route, "r");
        if (file->file == NULL)
            return ERROR;
    }
    return OK;
}

int FileOpenForWrite(File* file, const char *route ) {
    if(route == NULL) {
        file->file = stdout;
    } else {
        file->file = fopen(route, "w");
        if (file->file == NULL)
            return ERROR;
    }
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
