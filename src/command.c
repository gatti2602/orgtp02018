//
// Created by gatti2602 on 12/09/18.
//

#include "command.h"
#include "file.h"

#include <stdio.h>
#include <memory.h>

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

char CommandInput(File* input, const char* route){
    return FileInit(input,route);
}

char CommandOutput(File* output, char* route){
    return FileInit(output,route);
}
