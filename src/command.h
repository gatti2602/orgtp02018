/**
 * Created by gatti2602 on 12/09/18.
 * Contiene la logica de cada comando posible de ejecutar
 */

#ifndef TP0_COMMAND_H
#define TP0_COMMAND_H

#include "file.h"

/**
 * Help Command
 * Imprime por salida estandar los distintos comandos posibles.
 * Pre: N/A
 * Post: N/A
 */
void CommandHelp();

/**
 * Procesa comando de input.
 * Devuelve 1 si ok 0 si error
 * Pre: input es un file pointer sin abrir
 *      route es una ruta valida
 * Post: input apunta a ruta indicada y esta listo para abrir
 */
char CommandInput(File* input, const char* route);

/**
 * Procesa comando de output
 * Devuelve 0 si ok -1 si error
 * Pre: output es un file pointer sin abrir
 *      route es una ruta valida
 * Post: output apunta a ruta indicada y esta listo para abrir
 */
char CommandOutput(File* output, char* route);

#endif //TP0_COMMAND_H
