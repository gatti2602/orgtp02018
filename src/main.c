/**
 * Created by gatti2602 on 12/09/18.
 * Main
 */

#define ERROR 0
#define FALSE 0
#define TRUE 1

#include <getopt.h>
#include "command.h"

int main(int argc, char** argv) {
    struct option arg_long[] = {
            {"input",   required_argument,  NULL,  'i'},
            {"output",  required_argument,  NULL,  'o'},
            {"action",  required_argument,  NULL,  'a'},
            {"help",    no_argument,        NULL,  'h'},
            {"version", no_argument,        NULL,  'V'},
    };
    char arg_opt_str[] = "i:o:a:hV";
    int arg_opt;
    int arg_opt_idx = 0;
    char should_finish = FALSE;

    CommandOptions cmd_opt;
    CommandCreate(&cmd_opt);

    if(argc == 1)
        CommandSetError(&cmd_opt);

    while((arg_opt =
                   getopt_long(argc, argv, arg_opt_str, arg_long, &arg_opt_idx)) != -1 && !should_finish) {
        switch(arg_opt){
        	case 'i':
        		CommandSetInput(&cmd_opt, optarg);
        		break;
        	case 'o':
                CommandSetOutput(&cmd_opt, optarg);
                break;
        	case 'h':
        		CommandHelp();
                should_finish = TRUE;
                break;
        	case 'V':
        		CommandVersion();
                should_finish = TRUE;
                break;
        	case 'a':
        	    CommandSetEncodeOpt(&cmd_opt, optarg);
				break;
        	default:
        		CommandSetError(&cmd_opt);
        		break;
        }
    }

    if(should_finish)
        return 0;

    if(!CommandHasError(&cmd_opt)) {
        CommandProcess(&cmd_opt);
    } else {
        CommandErrArg();
        return 1;
    }
    return 0;
}
