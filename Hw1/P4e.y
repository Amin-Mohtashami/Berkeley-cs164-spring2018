/* Template for HW1, problem #4e

 * The makefile has instructions for turning these templates into
 * executables.  Just use the command 'make' in this directory.

 * To test your solution, put the inputs to be tested, one to a
 * line, in some file INPUTFILE, and enter the command
 *
 *    ./P4e INPUTFILE
 *
 * or
 *
 *    ./P4e < INPUTFILE
 *
 * Or, just type
 *
 *    ./P4e
 *
 * and enter inputs, one per line, by hand (on Unix, use ^D to end this input,
 * or ^C^D in an Emacs shell).

*/

%glr-parser
%start ANSWER

%%

/* Insert a regular grammar that defines the nonterminal symbol
 * ANSWER to be a language equivalent to the corresponding regular
 * expression in problem 2. */


 /* REPLACE WITH YOUR SOLUTION */
ANSWER :
V = {00, 11, 01, 10};
T = {S1, S2, S3, S4, S5, S6}
S = 00 | 11 | e
P = S1 > 00 | 11 | e, S2 > S3 | e, S3 > 01 | 10, S4 > 00 | 11 | 1e,
S5 > 01 | 10, S6 > 00 | 11 | e;


/* End of grammar */

%%

#include <stdlib.h>
#include <stdio.h>

/** Returns terminal symbols '0' or '1', skipping any other
 *  character. */
int
yylex()
{
  while (1) {
    int c = getchar();
    if (c == EOF)
      return 0;
    else if (c == '0' || c == '1')
      return c;
  }
}

int
yywrap()
{
  return 1;
}

int
yyerror(const char* msg) {
  fprintf(stderr, "The input is not in the language.\n");
  exit(0);
}

int
main(int argc, char* argv[])
{
  if (argc > 1) {
    if (freopen(argv[1], "r", stdin) == NULL) {
      fprintf(stderr, "Could not read file %s\n", argv[1]);
      exit(1);
    }
  }
  yyparse();
  fprintf(stderr, "The input is in the language.\n");
  exit(0);
}
