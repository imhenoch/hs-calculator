-- Abstract Syntax Tree

module Parser.AST where

data Expression =
      ExpAdd  Expression  Expression
    | ExpSub  Expression  Expression
    | ExpMul  Expression  Expression
    | ExpDiv  Expression  Expression
    | ExpSin  Expression
    | ExpCos  Expression
    | ExpTan  Expression
    | ExpCot  Expression
    | ExpSec  Expression
    | ExpCsc  Expression
    | ExpLog  Expression
    | ExpLn   Expression
    | ExpSqrt Expression
    | ExpPow  Expression  Expression
    | ExpNum  (Either Integer Double)
    deriving Show
