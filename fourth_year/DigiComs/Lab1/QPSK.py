import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
import komm
import scipy
import math

tx_im = Image.open("DC4_600x400.pgm")
Npixels = tx_im.size[1]*tx_im.size[0]

tx_bin = np.unpackbits(np.array(tx_im))

for i in range(0,len(tx_bin), 8):
    tx_bin[i+7] = np.sum(tx_bin[i:i+7])%2
    
bers = []
snrs = []
curve = []
i = 6
for i in np.linspace(0,12,40):
    qpsk = komm.PSKModulation(4,phase_offset=np.pi/4)
    stnr=10**(i/10.)
    rx_bin = np.empty(tx_bin.size).astype(int)
    awgn = komm.AWGNChannel(snr=stnr)
    for j in range(0, len(tx_bin), 8):
        tx_data_word = qpsk.modulate(tx_bin[j:j+8])
        rx_data_word = awgn(tx_data_word)
        rx_bin_word = qpsk.demodulate(rx_data_word)
        
        for k in range(0,8):
            rx_bin[j+k] = rx_bin_word[k]
    
    #Bitwise check for errors
    errors = 0
    for j in range(0, len(tx_bin)):
        if tx_bin[j] != rx_bin[j]:
            errors += 1
    
    ber = errors/(8*Npixels)
    bers.append(ber)
    snrs.append(i)
    curve.append(0.5*(scipy.special.erfc(math.sqrt((10**(i/10))/2))))

plt.figure()
plt.scatter(snrs, bers) #plot points
#plt.plot(snrs, bers) 
plt.plot(snrs,curve, "r") #plot lines
plt.yscale("log")
plt.grid(True)
plt.show()

        