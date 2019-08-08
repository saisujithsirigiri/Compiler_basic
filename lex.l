%option noyywrap
%{
  #include "grammar.tab.h"
  #include "SyntaxTree/Includes.hpp"
%}

alpha [a-zA-Z]
name {alpha}([0-9]*{alpha})+
whitespace [  \r\t\v\f]
linefeed \n

%%
{name}                {  return NAME; }

":"                   {  return COLON; }
";"                   {  return SEMICOLON; }
"->"                  {  return RIGHT_ARROW; }
"{"                   {  return LEFT_BRACE; }
"}"                   {  return RIGHT_BRACE; }
{whitespace}
{linefeed}            ++yylineno;
%%
