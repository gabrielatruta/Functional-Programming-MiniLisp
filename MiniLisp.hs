module MiniLisp where

import Parser
data LispAtom = Number Int | Symbol String deriving (Eq, Show)
data LispValue = List [LispValue] | Atom LispAtom deriving (Eq, Show)

ws :: Parser String
ws = error "TODO"

between :: Parser a -> Parser b -> Parser c -> Parser c
between pHd pTl p = error "TODO"

ident :: Parser String
ident = Parser inner where
   inner "" = Error "End of input"
   inner input =
     case runParser alpha input of
       Success a rest ->
         case runParser (some (orElse alpha (orElse digit (char '?')))) rest of
           Success b remaining -> Success (a:b) remaining
           Error err -> Error err
       Error err -> Error err

-- sepBy :: Parser a -> Parser b -> Parser c
-- sepBy sep p = Parser inner where
--     inner "" = Success [] ""
--     inner input = 
--         case runParser ws input of
--             Success a remaining -> 

-- sepBy :: Parser a -> Parser b -> Parser [b]
-- sepBy sep p = Parser inner where
--   inner "" = Error "End of input"
--   inner input = 
--     case runParser p input of
--       Success r rest -> 
--         case runParser sep rest of
--           Success rs remaining -> Success [r] remaining
--       Error err -> Error err           

lisp :: Parser LispValue
lisp = error "TODO"

-- lispAtom :: Parser LispAtom
-- lispAtom = Parser inner where
--     inner "" = Error "End of input"
--     inner input = 
--         case runParser ident inner of
--             Success a remaining -> Success (Symbol inner) ""
--             Error _ -> Success (Number (read inner :: Int)) ""
            
lispList :: Parser [LispValue] 
lispList = error "TODO"