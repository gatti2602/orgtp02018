//
// Created by gatti2602 on 11/09/18.
//

#ifndef TP0_FILE_H
#define TP0_FILE_H

#include <stdio.h>

typedef struct{
    FILE* file;
    char eof;
} File;

/**
 * Construye el TDA.
 * Post: TDA construido
 */
void FileCreate(File *f);

/**
 * Abre un File, devuelve 0 (NULL) si falla
 * Pre: Ptr a File Inicializado ,
 *      Ruta a archivo, si es 0 (NULL) utiliza stdin
 */
int FileOpenForRead(File* file, const char* route);

/**
 * Abre un File, devuelve 0 (NULL) si falla
 * Pre: Ptr a File Inicializado ,
 *      Ruta a archivo, si es 0 (NULL) utiliza stdout
 */
int FileOpenForWrite(File* file, const char* route);

/*
 * Cierra archivo abierto
 * Pre: Archivo previamente abierto
 */
int FileClose(File* file);

/*
 * Lee el archivo abierto, solo un chunk de 64 bytes
 * Pre: Archivo abierto en modo lectura buffer de tamaño mayor o igual
 * a 64 bytes. Devuelve cantidad de bytes leidos.
 * Post: Se actualiza Flag EOF en tda File
 */
unsigned int FileReadChunk(File* file, unsigned char* buffer);

/*
 * Escribe length posiciones del buffer en el archivo file
 * Pre: File apunta a un archivo abierto para escritura, buffer ocntiene por
 * lo menos length posiciones
 * Post: Informacion grabada en el archivo.
 */
void FileWriteChunk(File* file, unsigned char* buffer, unsigned int length);
/*
 * Chequea Flag EOF, devuelve 1 si se alcanzo el EOF y 0 sino.
 */
int FileEofReached(File* file);
/*
 * Libera recursos alocados en tda
 * Pre: tda inicializado
 */
void FileDestroy(File* file);

#endif //TP0_FILE_H
