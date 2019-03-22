module Functions.Logaritmicas where
import Functions.Algebraicas

logn :: Double -> Double -> Double
logn x 0 = 1
logn x n = (1/((2 * n) + 1)) * (potencia (((potencia x 2)- 1)/(((potencia x 2)+ 1))) ((2 * n) + 1)) + logn x (n - 1) 

ln :: Double -> Double
ln x = logn x 1000;

logaritmo :: Double -> Double -> Double
logaritmo x b= (ln x) / (ln b)