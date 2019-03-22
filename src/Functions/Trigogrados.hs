module Functions.Trigogrados where
import Functions.Algebraicas
import Functions.Trigoradianes

coseno :: Double -> Double
coseno x = cosenor ((x * pi) /180)

seno :: Double -> Double
seno x = senor ((x * pi) /180)

tangente :: Double -> Double 
tangente x = seno x / coseno x

cotangente :: Double -> Double 
cotangente x = 1 / tangente x

secante :: Double -> Double 
secante x = 1 / coseno x 

cosecante :: Double -> Double 
cosecante x = 1 / seno x