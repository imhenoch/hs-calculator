module Functions.Exponencial where
import Functions.Algebraicas

expo :: Double -> Double -> Double
expo x 0 = 1
expo x n = (potencia x n) / (factorial n) + expo x (n - 1)

exponencial :: Double -> Double
exponencial x  = expo x 90