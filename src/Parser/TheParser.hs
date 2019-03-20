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

integer :: Parser Integer
integer = lexeme L.decimal

term = parentheses expr <|> ExpInt <$> integer <?> "term"

table =
  [ [binary "*" ExpMul, binary "/" ExpDiv]
  , [binary "+" ExpAdd, binary "-" ExpSub]
  ]

binary name f = InfixL (symbol name >> return f)

expr :: Parser Expression
expr = makeExprParser term table <?> "expression"

parseExpression :: String -> Either ParseError Expression
parseExpression = parse expr ""
