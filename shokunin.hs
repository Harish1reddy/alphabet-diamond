import Data.Char
import Data.List
import System.Environment

topLeft maxLetter = zipWith3 (\x y z -> x ++ [y] ++ z) (reverse spaces) letters spaces
  where letters = ['A'..toUpper maxLetter]
        spaces = [replicate n ' ' | n <- [0..length letters]]

diamond = mirrorRight . mirrorDown . topLeft
  where mirror xs = xs ++ tail (reverse xs)
        mirrorDown = mirror
        mirrorRight = map mirror

main = do
  args <- getArgs
  let maxLetter = head $ head args
  if length args == 1 && length (head args) == 1 && elem maxLetter (['a'..'z'] ++ ['A'..'Z'])
    then putStrLn $ concat (intersperse "\n\n" (diamond maxLetter))
    else putStrLn "INVALID INPUT"
