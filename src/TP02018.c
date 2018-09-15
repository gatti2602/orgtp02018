/*
 ============================================================================
 Name        : TP02018.c
 Author      : Lucas
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <getopt.h>
#include <ctype.h>

#define VERSION "1.0"

#define TRUE 0
#define FALSE 1

typedef struct params {
	int incorrectOpt;
	int showversion;
	int showhelp;
	char * version;
	char * help;
	char * input;
	char * output;
	char * action;
} params;

enum ParameterState {
	 OKEY = 0, INCORRECT_QUANTITY_PARAMS = 1, INCORRECT_MENU = 2, ERROR_FILE = 3, ERROR_MEMORY = 4, ERROR_PARAM = 5, ERROR_FORMAT = 6
};

enum ResultState {
	RDO_OKEY = 0, ERROR_WRITE = -1
};

params initParams(){
	params params;

	// valor por defecto: 1.0
	params.version = "1.0";

	// valor por defecto:
	params.help = "";

	// valor por defecto:
	params.input = "";

	// valor por defecto:
	params.output = "";

	// valor por defecto:
	params.action = "";

	return params;
}

int retrieveParams(int argc, char *argv[], params *p) {

	/* Una estructura de varios arrays describiendo
	 * los valores largos
	 */
	const struct option longOptions[] = {
				{"version",	no_argument,  0,	'V' }, // optional_argument
				{"help",	no_argument,  0,	'h' },
				{"input",   required_argument, 	0,  'i' },
				{"output",	required_argument, 	0,  'o' },
				{"action",  required_argument, 	0,  'a' },
				{0,		0,                 	0,   0      }
	};
	int incorrectOption = FALSE;
	int finish = FALSE;

	int longIndex = 0;
	char opt = 0;

	/* Una cadena que lista las opciones cortas validas */
	//const char* const smallOptions = "V:h:i:o:a:";
	const char* const smallOptions = "Vh:i:o:a:";

	/*
	 * Switch para obtener los parámetros de entrada.
	 */
	while ((opt
			= getopt_long(argc, argv, smallOptions, longOptions, &longIndex))
			!= -1 && incorrectOption == FALSE) {
		switch (opt) {
			case 'V':
				p->showversion = TRUE;
				finish = TRUE;
				break;
			case 'h':
				p->showhelp = TRUE;
				finish = TRUE;
				break;
			case 'i':
				p->input = optarg;
				break;
			case 'o':
				p->output = optarg;
				break;
			case 'a':
				p->action = optarg;
				break;
			default:
				p->incorrectOpt = incorrectOption = TRUE;
		}
	}

	/*
	 * Si no existe parámetro de output seteamos incorrectOpt
	 */
	if(p->output == NULL){
		p->incorrectOpt = TRUE;
		return;
	}

	if (incorrectOption == TRUE) {
		return ERROR_PARAM;
	}

	//setDefaultParams(p);

	return OKEY;
}

/*
 * Muestra la version de la aplicación.
 */
int executeVersion(params *p) {
	if(p->showversion == TRUE){
		fprintf(stderr, "Version: \"%s\" \n", VERSION);
	}
	return OKEY;
}

/*
 * Menú de ayuda
 */
int executeHelp(params *p) {
	if(p->showhelp == TRUE){
		fprintf(stdout, "Uso: \n");
		fprintf(stdout, "	tp0 -h \n");
		fprintf(stdout, "	tp0 -V \n");
		fprintf(stdout, "	tp0 [opciones] \n");
		fprintf(stdout, "Options: \n");
		fprintf(stdout, "	-V, --version		Muestra la version. \n");
		fprintf(stdout, "	-h, --help	    	Muestra esta información. \n");
		fprintf(stdout, "	-r, --resolution	Permite cambiar la resolucion de la imagen generada.El valor por defecto es 640x480 puntos. \n");
		fprintf(stdout, "	-c, --center		Especifica las coordenadas correspondientes al punto central de la porción del plano complejo dibujada, en forma binómica. \n");
		fprintf(stdout, "	-w, --width			Especifica el ancho de la región del plano complejo por dibujar. Valor por defecto: 2 \n");
		fprintf(stdout, "	-H, --height		Especifica el alto de la región del plano complejo por dibujar. Valor por defecto: 2 \n");
		fprintf(stdout, "	-s, --seed			Para configurar el valor complejo de la semilla.\n");
		fprintf(stdout, "	-o, --output		Permite colocar la imagen de salida ó salida estándar si el argumento es - . \n");
		fprintf(stdout, "Ejemplo: \n");
		fprintf(stdout, "	tp0 -o uno.pgm \n");
	}
	return OKEY;
}

int execute(int argc, char *argv[]) {
	/*
	 * Inicializamos los params.
	 */
	params p = initParams();
	/*
	 * Obtenemos los parámetros ingresados.
	 */
	retrieveParams(argc,argv,&p);
}


/*
 * int main(int argc, char *argv[]) {
	/*
	 * Si la cantidad de parámetros ingresados es incorrecta salimos.
	 */
/*	if (argc > MAX_ARGS || argc < MIN_ARGS) {
		fprintf(stderr, "[Error] Cantidad de parámetros incorrecta: %d \n", argc);
		return INCORRECT_QUANTITY_PARAMS;
	}

	return execute(argc, argv);
}
 */
