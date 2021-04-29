# Irene Moon performs beepr

library("tuneR")

tuneR::setWavPlayer('/usr/bin/afplay')

x <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
t = seq(0, 1, 1/5000) #times in seconds if sample for 3 seconds at 8000Hz
u = (2^15-1)*sin(4*pi*500*t) #440 Hz sine wave that lasts t length seconds (here, 3 seconds)
w = Wave(u, samp.rate = 8000, bit=16) #make the wave variable

# beepr indicates that work is complete and the program has finished....

for (val in x){
  beepr::beep(2)
  play(w)
  #pause(0.75)
  beepr::beep(0) 
  play(w)
  beepr::beep(2)
}


