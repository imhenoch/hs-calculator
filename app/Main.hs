module Main where

import Control.Monad (void)
import Data.Maybe
import Text.Printf
import Safe          (readMay)

import qualified Graphics.UI.Threepenny as UI
import Graphics.UI.Threepenny.Core

{-----------------------------------------------------------------------------
    Main
------------------------------------------------------------------------------}
main :: IO ()
main = startGUI defaultConfig setup

setup :: Window -> UI ()
setup window = void $ do
    return window # set title "Calculadora"

    pantalla <- UI.input
        # set UI.style [("border","2px solid"), ("width", "50%"), ("padding", "2%"),
                        ("margin-left", "24%"), ("margin-right", "50%"), 
                        ("margin-bottom", "3%")]
    sin <- UI.button # set UI.text "sin"
        # set UI.style [("border","1px solid "), ("border-radius","16px"), 
                        ("padding", "14px 40px"), ("margin-left", "150%")]
    cos <- UI.button # set UI.text "cos"
        # set UI.style [("border","1px solid "), ("border-radius","16px"), 
                        ("padding", "14px 40px"), ("margin-left", "200%")]
    tan <- UI.button # set UI.text "tan"
        # set UI.style [("border","1px solid "), ("border-radius","16px"), 
                        ("padding", "14px 40px"), ("margin-left", "250%")]
    cotg <- UI.button # set UI.text "cotg"
        # set UI.style [("border","1px solid "), ("border-radius","16px"), 
                        ("padding", "14px 40px"), ("margin-left", "275%")]
    sec <- UI.button # set UI.text "sec"
        # set UI.style [("border","1px solid "), ("border-radius","16px"), 
                        ("padding", "14px 40px"), ("margin-left", "340%")]
    cosec <- UI.button # set UI.text "cosec"
        # set UI.style [("border","1px solid "), ("border-radius","16px"), 
                        ("padding", "14px 40px"), ("margin-left", "335%"), ("margin-bottom", "10%")]
    log <- UI.button # set UI.text "log"
        # set UI.style [("border","1px solid "), ("border-radius","16px"), 
                        ("padding", "14px 40px"), ("margin-left", "147%")]
    sqrt <- UI.button # set UI.text "sqrt"
        # set UI.style [("border","1px solid "), ("border-radius","16px"), 
                        ("padding", "14px 40px"), ("margin-left", "187%")]
    exp <- UI.button # set UI.text "^"
        # set UI.style [("border","1px solid "), ("border-radius","16px"), 
                        ("padding", "14px 40px"), ("margin-left", "287%")]
    result <- UI.button # set UI.text "="
        # set UI.style [("border","1px solid "), ("border-radius","16px"), 
                        ("width", "1500%"), ("height", "50px"), ("margin-left", "1200%")]
        
    getBody window #+ [element pantalla,
                        row[element sin, element cos, element tan, element cotg,
                            element sec, element cosec],
                        row[element log, element sqrt, element exp, element result]
                    ]
    on UI.click sin $ const $ do
        element pantalla # set value ("sin(")
    on UI.click cos $ const $ do
        element pantalla # set value ("cos(")
    on UI.click tan $ const $ do
        element pantalla # set value ("tan(")
    on UI.click cotg $ const $ do
        element pantalla # set value ("cotg(")
    on UI.click sec $ const $ do
        element pantalla # set value ("sec(")
    on UI.click cosec $ const $ do
        element pantalla # set value ("cosec(")
    on UI.click log $ const $ do
        element pantalla # set value ("log(")
    on UI.click sqrt $ const $ do
        element pantalla # set value ("sqrt(")
    on UI.click exp $ const $ do
        element pantalla # set value ("^")
    on UI.click result $ const $ do
        element pantalla # set value ("[pressed]")