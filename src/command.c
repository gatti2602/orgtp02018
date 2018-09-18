//
// Created by gatti2602 on 12/09/18.
//

#include "command.h"
#include "encode.h"
#include <string.h>

void CommandHelp(){
    printf("Options:\n");
    printf("  -V, --version    Print version and quit.\n");
    printf("  -h, --help       Print this information.\n");
    printf("  -i, --input      Location of the input file.\n");
    printf("  -o, --output     Location of the output file.\n");
    printf("  -a, --action     Program action: encode (default) or decode.\n");
    printf("Examples:\n");
    printf("  tp0 -a encode -i ~/input -o ~/output\n");
    printf("  tp0 -a decode\n");
}

void CommandVersion() {
    printf("Version: 0.1\n");
}

void CommandCreate(CommandOptions *opt) {
    FileCreate(&opt->input);
    FileCreate(&opt->output);
    opt->error = FALSE;
    opt->encode_opt = CMD_NOENCODE;
    opt->input_route = 0;
    opt->output_route = 0;
}

void CommandSetInput(CommandOptions *opt, const char *input) {
    opt->input_route = input;
}

void CommandSetOutput(CommandOptions *opt, const char *output) {
    opt->output_route = output;
}

void CommandSetEncodeOpt(CommandOptions *opt, const char *encode_opt) {
    if(strcmp(encode_opt,"encode") == 0){
        opt->encode_opt = CMD_ENCODE;
    } else {
        if(strcmp(encode_opt,"decode") == 0) {
            opt->encode_opt = CMD_DECODE;
        } else {
            fprintf(stderr, "Encoding option should be encode/decode");
            opt->error = TRUE;
        }
    }
}

char CommandHasError(CommandOptions *opt) {
    return opt->error || opt->encode_opt == CMD_NOENCODE;
}

void CommandSetError(CommandOptions *opt) {
    opt->error = TRUE;
}

char CommandProcess(CommandOptions *opt) {
    opt->error = FileOpenForRead(&opt->input, opt->input_route);

    if(!opt->error)
        opt->error = FileOpenForWrite(&opt->output, opt->output_route);

    if(!opt->error){
        opt->error = _CommandEncodeDecode(opt);
        FileClose(&opt->input);
        FileClose(&opt->output);
    }
    else {
        FileClose(&opt->input);
    }
    return opt->error;
}

char _CommandEncodeDecode(CommandOptions *opt) {
    unsigned char buf_decoded[3];
    unsigned char buf_encoded[4];
    if(opt->encode_opt == CMD_ENCODE){
        while(!FileEofReached(&opt->input)){
            memset(buf_decoded, 0, 3);
            unsigned int read = FileRead(&opt->input, buf_decoded, 3);
            if (read > 0) {
                Encode(buf_decoded, read, buf_encoded);
                FileWrite(&opt->output, buf_encoded, 4);
            }
        }
    }
    if (opt->encode_opt == CMD_DECODE) {
        while (!FileEofReached(&opt->input) && !CommandHasError(opt)) {
            unsigned int read = FileRead(&opt->input, buf_encoded, 4);
            if (read > 0) {   // Solo es 0 si alcance el EOF
                if (read != 4) {  //Siempre debo leer 4 sino el formato es incorrecto
                    fprintf(stderr, "Longitud de archivo no es multiplo de 4\n");
                    CommandSetError(opt);
                } else {
                    if (Decode(buf_encoded, buf_decoded)) {
                        FileWrite(&opt->output, buf_decoded, 3);
                    } else {
                        fprintf(stderr, "Caracteres invalidos en archivo codificado: ");
                        unsigned int i;
                        for (i = 0; i < 4; ++i)
                            fprintf(stderr, "%c", buf_encoded[i]);
                        CommandSetError(opt);
                    }
                }
            }


        }
    }
    return opt->error;
}

void CommandErrArg() {
    fprintf(stderr, "Invalid Arguments\n");
    fprintf(stderr,"Options:\n");
    fprintf(stderr,"  -V, --version    Print version and quit.\n");
    fprintf(stderr,"  -h, --help       Print this information.\n");
    fprintf(stderr,"  -i, --input      Location of the input file.\n");
    fprintf(stderr,"  -o, --output     Location of the output file.\n");
    fprintf(stderr,"  -a, --action     Program action: encode (default) or decode.\n");
    fprintf(stderr,"Examples:\n");
    fprintf(stderr,"  tp0 -a encode -i ~/input -o ~/output\n");
    fprintf(stderr,"  tp0 -a decode\n");
}
