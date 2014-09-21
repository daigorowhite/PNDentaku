{-# LANGUAGE OverloadedStrings #-}
import Control.Applicative
import Data.Text(pack)
import Data.Char (ord)
import Data.Attoparsec.Text
import Data.Attoparsec.Number
import System.Environment (getArgs)

data Exp = Add Exp Exp |
           Sub Exp Exp |
           Mul Exp Exp |
           Div Exp Exp |
           Nat Int deriving Show

prog = many1 expr

expr :: Parser Exp
expr =  add <|>
        sub <|>
        mul <|>
        divi <|>
        num

add :: Parser Exp
add = Add <$> ("(" *> ("+" *> (spaces *> expr))) <* spaces <*>  expr <* spaces <* ")"
sub :: Parser Exp
sub = Sub <$> ("(" *> ("-" *> (spaces *> expr))) <* spaces <*>  expr <* spaces <* ")"
mul :: Parser Exp
mul = Mul <$> ("(" *> ("*" *> (spaces *> expr))) <* spaces <*>  expr <* spaces <* ")"
divi :: Parser Exp
divi = Div <$> ("(" *> ("/" *> (spaces *> expr))) <* spaces <*>  expr <* spaces <* ")"

num :: Parser Exp
num = Nat . read <$> many1 digit

spaces = many space

main :: IO ()
main = do
	args <- getArgs;
	print $ parseOnly prog $ pack $ concat args


