module Trigoradianes where
import Algebraicas

cosenon :: Double -> Double -> Double
cosenon x (-1) = 0
cosenon x n = ((potencia (-1) n) * (potencia x (2 * n))/(factorial (2 * n))) + cosenon x (n - 1)

senon :: Double -> Double -> Double
senon x (-1) = 0
senon x n = ((potencia (-1) n) * (potencia x ((2 * n) + 1))/(factorial ((2 * n) + 1))) + senon x (n - 1)

senor :: Double -> Double
senor x= senon x 80

cosenor :: Double -> Double
cosenor x= cosenon x 80

tangenter :: Double -> Double 
tangenter x = senor x  / cosenor x 

cotangenter :: Double -> Double 
cotangenter x = 1 / tangenter x

secanter :: Double -> Double 
secanter x = 1 / cosenor x 

cosecanter :: Double -> Double 
cosecanter x = 1 / senor x 
