-- Abstract Syntax Tree

module AST where

data Expression =
      ExpAdd Expression Expression
    | ExpSub Expression Expression
    | ExpMul Expression Expression
    | ExpDiv Expression Expression
    | ExpInt Integer
    deriving(Show)
