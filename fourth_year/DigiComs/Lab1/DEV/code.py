import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
import komm
import scipy
import math

tx_im = Image.open("DC4_150x100.pgm")
Npixels = tx_im.size[1]*tx_im.size[0]
#plt.figure()
#plt.imshow(np.array(tx_im),cmap="gray",vmin=0,vmax=255)
#plt.show()

tx_bin = np.unpackbits(np.array(tx_im))


#Add parity bits:
count = 0
for i in range (0, Npixels, 8):
    tx_bin[i] = np.sum(tx_bin[i-7:i])%2
    
bers = []
snrs = []
curve = []
for i in np.linspace(0,12,100):
    psk = komm.PSKModulation(2)
    snr=10**(i/10.)
    awgn = komm.AWGNChannel(snr)
    tx_data = psk.modulate(tx_bin)
    rx_data = awgn(tx_data)
    rx_bin = psk.demodulate(rx_data)

    #plt.figure()
    #plt.axes().set_aspect("equal")
    #plt.scatter(rx_data[:10000].real,rx_data[:10000].imag,s=1,marker=".")
    #plt.show()

    rx_im = np.packbits(rx_bin).reshape(tx_im.size[1],tx_im.size[0])
    #plt.imshow(np.array(rx_im),cmap="gray",vmin=0,vmax=255)

    #Bitwise check for errors
    errors = 0
    for j in range(0, len(tx_bin)):
        if tx_bin[j] != rx_bin[j]:
            errors += 1

    ber = errors/(8*Npixels)
    bers.append(ber)
    snrs.append(i)
    curve.append(0.5*(scipy.special.erfc(math.sqrt((10**(snr/10))/8))))

plt.figure()
plt.scatter(snrs, bers) #plot points
plt.plot(snrs, bers) 
plt.plot(snrs,curve) #plot lines
plt.yscale("log")
plt.grid(True)
plt.show()

        