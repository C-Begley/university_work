import matplotlib.pyplot as plt
from matplotlib.patches import Polygon
import numpy as np
import scipy.ndimage

import svg_read
import font

paths = svg_read.find_paths("shapes2.svg")
path_names = ["circle", "dash", "star6", "hexagon", "spike", "star5", "teardrop", "roundhex", "roundstar6", "ellipse",
    "tribal_1", "tribal_2", "tribal_3", "tribal_4", "bullet"]

def load_font(name):
    return font.load(name)

def rel_shape(path): 
    ox, oy = path[0]
    rel = []
    scale = 0.2
    for x,y in path:
        dx, dy = x-ox, y-oy
        ox,oy = x,y
        rel.append((dx*scale,dy*scale))
    return rel

def get_shape(name):
    path_ix = path_names.index(name)
    return rel_shape(paths[path_ix])
    


skin_back = scipy.ndimage.imread("imgs/back2.jpg")

def transform(pts, m, c):
    pts = np.array(pts)    
    return np.dot(np.array(pts),m)+c

def scale(pts, s):
    return transform(pts, np.eye(2)*s, np.array([0,0]))

def translate(pts, x, y):
    return transform(pts, np.eye(2), np.array([x,y]))

def rotate(pts, deg_angle):
    angle = np.radians(deg_angle)
    m = np.array([[np.cos(angle), np.sin(angle)], [-np.sin(angle), np.cos(angle)]])
    return transform(pts, m, np.zeros(2,))

class Tattooist(object):
    def __init__(self):
        self.x, self.y = 0,0
        self.stack = []
        self.patch = []
        plt.figure(figsize=(10,10))
        
        plt.axis("equal")
        plt.xlim(-100,100)
        plt.ylim(-100,100)
        self.in_patch = False
        self.color = [0.02, 0.14, 0.2]
        skin = plt.imshow(skin_back, extent=[-100,100,-100,100], cmap="gray", alpha=0.3)
        skin.set_clip_on(False)
        plt.axis("off")
        self.fill_color = [0.08, 0.25, 0.35]
        self.transform = np.eye(2)
        plt.gcf().tight_layout()
        
    def scale(self, s):
        self.transform *= s
    
    def rotate(self, deg_angle):
        angle = np.radians(deg_angle)
        m = np.array([[np.cos(angle), np.sin(angle)], [-np.sin(angle), np.cos(angle)]])
        self.transform = np.dot(self.transform, m)        
   
    def store(self):
        self.stack.append((self.x, self.y, self.transform))
    
    def recall(self):
        self.x, self.y, self.transform = self.stack.pop()
        
    def move_to(self, dx, dy):        
        x,y = np.dot(np.array([dx,dy]), self.transform)
        self.x += x
        self.y += y
        if self.in_patch:
            self.patch.append([self.x, self.y])
        
    def line_to(self, x,y):
        ox, oy = self.x, self.y
        self.move_to(x,y)
        plt.plot([self.x, ox], [self.y, oy], c=self.color)                            
                
    def begin_ink(self):        
        self.in_patch = True
        self.patch.append([self.x, self.y])
        
    def end_ink(self):
        self.in_patch = False
        if len(self.patch)>1:
            p = Polygon(self.patch, facecolor=self.fill_color, closed=True)
            plt.gca().add_patch(p)
        self.patch = []      
    
    def center(self):
        self.x, self.y = 0,0
