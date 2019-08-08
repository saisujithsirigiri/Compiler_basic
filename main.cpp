#include <iostream>
#include <memory>
#include "SyntaxTree/SyntaxTree.hpp"

extern int yyparse();
extern int yylineno;
extern std::unique_ptr<compiler::SyntaxTree> root;

int main()
{
  int result = yyparse();
  /*if(result ==0)
    std::cout << "The input valid." << std::endl;
  else
    std::cout << "The input is invalid." << std::endl;
  std::cout << "The amount of lines in the input is: " <<yylineno << std::endl;
*/
std::cout << root->toCode() << std::endl;


  return result;
}
