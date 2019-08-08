#pragma once
#include "SyntaxTree.hpp"
#include <iostream>

namespace compiler
{
  class Input : public SyntaxTree
  {
  public:

    Input(SyntaxTree *function, SyntaxTree *functions)
    {
      children.push_back(function);
      children.push_back(functions);
    }

    virtual ~Input()
    {

    }

    virtual std::string toCode() const
    {
      std::string code;
      for(SyntaxTree *node : children)
      {
        if(node != nullptr)
        {
          code += node->toCode();
        }
      }

      return code;
    }

  };
}
