import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
import komm

tx_im = Image.open("DC4_150x100.pgm")
Npixels = tx_im.size[1]*tx_im.size[0]
#plt.figure()
#plt.imshow(np.array(tx_im),cmap="gray",vmin=0,vmax=255)
#plt.show()

tx_bin = np.unpackbits(np.array(tx_im))
#Add parity bits:
count = 0
for i in range (0, len(tx_bin), 8):
    tx_bin[i+7] = (int)(np.sum(tx_bin[i:i+7])%2)
    
bers = []
snrs = []
curve = []

ARQ = False
       
for i in np.linspace(0,6,1):
    rx_bin = np.empty(tx_bin.size).astype(int)
    count = 0
    psk = komm.PSKModulation(2)
    stnr=10**(i/10.)
    awgn = komm.AWGNChannel(snr=stnr)
    tx_data = psk.modulate(tx_bin)
    rx_data = awgn(tx_data)
    
    for j in range (0,8*Npixels,8):
        rx_bin_word = psk.demodulate(rx_data[j:j+8])
        if (np.sum(rx_bin_word)%2 != 0):
                count +=1
                ARQ = True
        
        while ARQ:
            ARQ = False
            tx_data_word = psk.modulate(tx_bin[j:j+8])
            rx_data_word = awgn(tx_data)
            rx_bin_word = psk.demodulate(rx_data_word)
            
            if (np.sum(rx_bin_word)%2 != 0):
                count +=1
                ARQ = True
        
        for k in range(0,8):
           rx_bin[j-8+k] = rx_bin_word[k]
    
    errors = 0 
    for l in range(0, len(tx_bin)):
            if tx_bin[l] != rx_bin[l]:
                errors += 1
    ber = errors/(8*Npixels)
    bers.append(ber)
    snrs.append(i)
    curve.append((count/Npixels))
    print(ber)

   


rx_im_p = np.packbits(rx_bin.astype(int)).reshape(tx_im.size[1],tx_im.size[0])
#plt.figure()
plt.imshow(np.array(rx_im_p),cmap="gray",vmin=0,vmax=255)
plt.show()

plt.figure()
#plt.scatter(snrs, bers) #plot points
plt.plot(snrs, bers)
plt.yscale("log")
plt.grid(True)
plt.show() 
plt.figure()
plt.plot(snrs,curve) #plot lines
plt.yscale("log")
plt.grid(True)
plt.show()

        