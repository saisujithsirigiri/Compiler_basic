%code requires {
  #include "SyntaxTree/SyntaxTree.hpp"

}

%{
  #include <math.h>
  #include <stdio.h>
  #include <stdlib.h>
  #include <iostream>
  #include "SyntaxTree/Includes.hpp"
  #include <memory>
  std::unique_ptr<compiler::SyntaxTree> root;
  using namespace compiler;
  int yylex (void);
  extern char *yytext;
  void yyerror (char const *);
%}

%define api.value.type {compiler :: SyntaxTree *}

%token NAME COLON RIGHT_ARROW LEFT_BRACE RIGHT_BRACE SEMICOLON


%start input

%%

input:
  function function_list                                           {root.reset(new Input($1, $2)); }

  function_list:
    function function_list                                         { $$ = $1; }
    |%empty                                                        { $$ = nullptr; }

function:
  NAME COLON RIGHT_ARROW LEFT_BRACE statements RIGHT_BRACE         { $$ = new compiler::Function($1, $5); }

statements:
    statements statement                                           { $$ = new compiler::Statements($1, $2); }
    | %empty                                                       { $$ = nullptr;  }

statement:
  name SEMICOLON                                                   { $$ = new compiler::Statement($1);  }

name:
  NAME                                                             { $$ = new compiler::Name(yytext); }


%%


void yyerror(char const *x)
{
  printf("Error %s\n",x);
  exit(1);
}
