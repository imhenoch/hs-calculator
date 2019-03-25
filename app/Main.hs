module Main where

    import Control.Monad
    import Data.Maybe
    import Text.Printf
    import Safe          (readMay)
    
    
    import qualified Graphics.UI.Threepenny as UI
    import Graphics.UI.Threepenny.Core
    
    import Parser
    import Data.Either.Compat
    
    {-----------------------------------------------------------------------------
        Main
    ------------------------------------------------------------------------------}
    main :: IO ()
    main = startGUI defaultConfig setup
    
    setup :: Window -> UI ()
    setup window = void $ do
        return window # set title "Calculadora"
    
        operation <- UI.input
            # set UI.style [("border","2px solid"), ("width", "50%"), ("padding", "2%"),
                            ("margin-left", "24%"), ("margin-right", "50%"), 
                            ("margin-bottom", "3%")]
        result <- UI.input
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
            
        getBody window #+ [element operation,
                           element result,
                            row[element sin, element cos, element tan, element cotg,
                                element sec, element cosec],
                            row[element log, element sqrt, element exp]
                        ]

        operationIn <- stepper "0" $ UI.valueChange operation
        let
            resultOut = evaluate <$> operationIn
        element result # sink value resultOut

        on UI.click sin $ const $ do
            element operation # set value ("sin (  )")
        on UI.click cos $ const $ do 
            element operation # set value ("cos (  )")
        on UI.click tan $ const $ do
            element operation # set value ("tan (  )")
        on UI.click cotg $ const $ do
            element operation # set value ("_cot (  )")
        on UI.click sec $ const $ do
            element operation # set value (".sec (  )")
        on UI.click cosec $ const $ do
            element operation # set value ("Csc (  )")
        on UI.click log $ const $ do
            element operation # set value ("Log (  )")
        on UI.click sqrt $ const $ do
            element operation # set value ("Sqrt (  )")
        on UI.click exp $ const $ do
            element operation # set value (" ^ ")