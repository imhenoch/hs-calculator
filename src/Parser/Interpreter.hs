module Parser.Interpreter
    ( stringEvaluation
    ) where

import Data.Bifunctor
import Parser.AST
import Parser.TheParser

data EvaluationError =
    ParseError
    deriving Show

evaluation :: Expression -> Either EvaluationError Double
evaluation (ExpAdd exp1 exp2) = do
  v1 <- evaluation exp1
  v2 <- evaluation exp2
  return $ v1 + v2
evaluation (ExpSub exp1 exp2) = do
  v1 <- evaluation exp1
  v2 <- evaluation exp2
  return $ v1 - v2
evaluation (ExpMul exp1 exp2) = do
  v1 <- evaluation exp1
  v2 <- evaluation exp2
  return $ v1 * v2
evaluation (ExpDiv exp1 exp2) = do
  v1 <- evaluation exp1
  v2 <- evaluation exp2
  return $ v1 / v2
evaluation (ExpPow exp1 exp2) = do
  v1 <- evaluation exp1
  v2 <- evaluation exp2
  return $ v1 ** v2
evaluation (ExpNum exp) = do
  case exp of
    Left int -> return $ fromIntegral int
    Right flt -> return $ flt

stringEvaluation :: String -> Either EvaluationError Double
stringEvaluation s = do
  exp <- first (const ParseError) $ parseExpression s
  evaluation exp
