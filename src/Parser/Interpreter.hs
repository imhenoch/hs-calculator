module Parser.Interpreter
    ( stringEvaluation
    ) where

import Data.Bifunctor
import Parser.AST
import Parser.TheParser
import Functions.Algebraicas
import Functions.Exponencial
import Functions.Logaritmicas
import Functions.Trigogrados
import Functions.Trigoradianes

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
  return $ potencia v1 v2
evaluation (ExpSin exp) = do
  v1 <- evaluation exp
  return $ seno v1
evaluation (ExpCos exp) = do
  v1 <- evaluation exp
  return $ coseno v1
evaluation (ExpTan exp) = do
  v1 <- evaluation exp
  return $ tangente v1
evaluation (ExpCot exp) = do
  v1 <- evaluation exp
  return $ cotangente v1
evaluation (ExpSec exp) = do
  v1 <- evaluation exp
  return $ secante v1
evaluation (ExpCsc exp) = do
  v1 <- evaluation exp
  return $ cosecante v1
evaluation (ExpNum exp) = do
  case exp of
    Left int -> return $ fromIntegral int
    Right flt -> return $ flt

stringEvaluation :: String -> Either EvaluationError Double
stringEvaluation s = do
  exp <- first (const ParseError) $ parseExpression s
  evaluation exp
