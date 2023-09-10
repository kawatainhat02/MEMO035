$ mkdir elm-project && cd elm-project
$ elm package install

$ cat > Main.elm
module Main where
import Html exposing (..)
main = h1 [] [text "Hello World!"]
^C
$ elm package install evancz/elm-html --yes
$ elm reactor

