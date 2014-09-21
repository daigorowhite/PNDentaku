PNDentaku
=========
## Description
ポーランド記法の電卓をパースするプログラム
四則演算までパースする。

## Usage
        % ghc dentaku.hs
        % ./dentaku [電卓文字列]
          # ex. "(+ 1 1)"

## Demo
        % ghc dentaku.hs 
        [1 of 1] Compiling Main             ( dentaku.hs, dentaku.o )
        Linking dentaku ...
        % ./dentaku "(+ 1 (- 1 (* 1 (/ 1 1))))"
        Right [Add (Nat 1) (Sub (Nat 1) (Mul (Nat 1) (Div (Nat 1) (Nat 1))))]

## Requirement
haskell (ghc)

## Author
blog    : http://daigorowhite.hatenablog.com

git_hub : daigorowhite

twitter : wata_dai
