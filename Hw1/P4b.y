/* Template for HW1, problem #4b

 * The makefile has instructions for turning these templates into
 * executables.  Just use the command 'make' in this directory.

 * To test your solution, put the inputs to be tested, one to a
 * line, in some file INPUTFILE, and enter the command
 *
 *    ./P4b INPUTFILE
 *
 * or
 *
 *    ./P4b < INPUTFILE
 *
 * Or, just type
 *
 *    ./P4b
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
V = {0, 1, e};
T = {S1, S2, S3}
S = 0S2 | eS2 | e
P = S1 > 0S2 | eS2 | e, S2 > 1S3 | e, S3 > S1 | e, ;


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
