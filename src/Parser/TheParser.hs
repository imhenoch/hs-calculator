module Parser.TheParser
    ( parseExpression
    ) where

import           Parser.AST
import           Control.Monad (void)
import           Text.Megaparsec
import           Text.Megaparsec.Char
import           Text.Megaparsec.Expr
import qualified Text.Megaparsec.Lexer as L
import           Text.Megaparsec.String (Parser)

sc :: Parser ()
sc = L.space (void spaceChar) lineComment blockComment
 where
  lineComment  = L.skipLineComment "//"
  blockComment = L.skipBlockComment "/*" "*/"

lexeme :: Parser a -> Parser a
lexeme = L.lexeme sc

symbol :: String -> Parser String
symbol = L.symbol sc

parentheses :: Parser a -> Parser a
parentheses = between (symbol "(") (symbol ")")

number :: Parser (Either Integer Double)
number = lexeme L.number

term :: Parser Expression
term = parentheses expr <|> ExpNum <$> number <|> expr

rword :: String -> Parser ()
rword w = (lexeme . try) (string w *> notFollowedBy alphaNumChar)

table :: [[Operator Parser Expression]]
table =
  [ [binary "^" ExpPow]
  , [binary "*" ExpMul, binary "/" ExpDiv]
  , [binary "+" ExpAdd, binary "-" ExpSub]
  , [ prefix "sin" ExpSin
    , prefix "cos" ExpCos
    , prefix "tan" ExpTan
    , prefix "_cot" ExpCot
    , prefix ".sec" ExpSec
    , prefix "Csc" ExpCsc
    , prefix "Log" ExpLog
    , prefix "ln" ExpLn
    , prefix "Sqrt" ExpSqrt
    ]
  ]

binary name f = InfixL (symbol name >> return f)
prefix name f = Prefix (symbol name >> return f)

expr :: Parser Expression
expr = makeExprParser term table <?> "expression"

parseExpression :: String -> Either ParseError Expression
parseExpression = parse expr ""
