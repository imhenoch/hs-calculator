module Functions.Algebraicas where

potencia :: Double -> Double -> Double
potencia x 0 = 1
potencia x n = x * (potencia x (n-1))

factorial 0 = 1
factorial n = n * factorial (n -1)

rz :: Double -> Double -> Double
rz x 0 = 1
rz x n = 0.5 * ((x / (rz x (n-1)))+ rz x (n-1))

raiz :: Double -> Double
raiz x = rz x 17