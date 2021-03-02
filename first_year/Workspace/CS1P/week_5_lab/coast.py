import pickle
import matplotlib.pyplot as plt
with open("gb_coastline.dat", "rb") as f:
    coastline = pickle.load(f)
    
    
def draw():
    plt.gcf().clf()
    plt.axis("equal")
    plt.axis("off")
    for pts in coastline:
        plt.plot([s[0] for s in pts], [s[1] for s in pts], 'k')
        