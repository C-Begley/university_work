import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
import komm
import scipy
import math

tx_im = Image.open("DC4_640x480.pgm")
Npixels = tx_im.size[1]*tx_im.size[0]

tx_bin = np.unpackbits(np.array(tx_im))

for i in range(0,len(tx_bin), 8):
    tx_bin[i+7] = np.sum(tx_bin[i:i+7])%2
    
bers = []
snrs = []
curve = []
ratio_curve = []
for i in np.linspace(0,12,10):
    ARQ_count = 0
    psk = komm.PSKModulation(4,phase_offset=np.pi/4)
    stnr=10**(i/10.)
    rx_bin = np.empty(tx_bin.size).astype(int)
    awgn = komm.AWGNChannel(snr=stnr)
    for j in range(0, len(tx_bin), 8):
        ARQ = True
        while ARQ:
            tx_data_word = psk.modulate(tx_bin[j:j+8])
            rx_data_word = awgn(tx_data_word)
            rx_bin_word = psk.demodulate(rx_data_word)
            if np.sum(rx_bin_word)%2 == 0:
                ARQ = False
            else:
                ARQ_count += 1
        for k in range(0,8):
            rx_bin[j+k] = rx_bin_word[k]
    
    #Bitwise check for errors
    errors = 0
    for l in range(0, len(tx_bin)):
        if tx_bin[l] != rx_bin[l]:
            errors += 1

    ber = errors/(8*Npixels)
    bers.append(ber)
    snrs.append(i)
    curve.append(0.5*(scipy.special.erfc(math.sqrt((10**(i/10))/2))))
    ratio_curve.append(ARQ_count/(8*Npixels))

plt.figure()
plt.scatter(snrs, bers) #plot points
plt.plot(snrs, bers) 
plt.plot(snrs,curve) #plot lines
plt.plot(snrs,ratio_curve)
plt.yscale("log")
plt.grid(True)
plt.show()

        