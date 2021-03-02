import matplotlib.pyplot as plt
import random

from matplotlib import animation, rc
from IPython.display import HTML
import canvas


class Lander(object):

    def __init__(self, fn):
        self.distance = 500.0
        self.velocity = -50.0
        self.fn = fn
        self.fuel = 150.0
        self.fuel_rate = 8.0
        self.gravity = 1.62
        self.fuel_density = 0.9
        self.module_mass = 1500
        self.engine_thrust = 18500
        self.oxygen_density = 1.14
        self.oxygen = 150
        self.oxygen_rate = 1.5
        self.dt = 0.1
        self.max_speed = 0
        self.max_fuel = self.fuel
        self.max_oxygen = self.oxygen
        self.max_distance = self.distance
        self.time = 0
        codes_1 = ["Valiant", "Burning", "Endless", "Fragrant", "Unbelievable", "Seventh", "Grand", "First", "Noble", "Dire", "Feeble","Glorius", "Tempramental"]
        codes_2 = ["Eagle", "Bird", "Thumper", "Crisis", "Gazelle", "Brick", "Soaring", "Solaris", "Lunar", "Crunching", "Falcon", "Seagull"]
        self.launch_name = "STS-%d" % (random.randint(30,500))
        self.module_name = "%s %s" % (random.choice(codes_1), random.choice(codes_2))
        self.stopped = False
        self.thrust = 0
        
    def draw(self, canvas):
        width = float(canvas.cget("width"))
        height = float(canvas.cget("height"))
        
        canvas.delete('all')        
        canvas.create_rectangle([0, 0, width, height], fill="black")
        landing = height * 0.9
        lheight = (1.0-(self.distance / self.max_distance))  * landing
        
        
        lander_w = 20
        lander_h = 25
        blast_h = 15
        lander_pts = [[-lander_w/2, -lander_h], [-lander_w, 0], [lander_w, 0], [lander_w/2, -lander_h]]
        
        lander_pts = [[x+width/2, y+lheight] for x,y in lander_pts]
        #canvas.create_rectangle([width/2-lander_w, lheight-lander_h, width/2+lander_w,  lheight], fill="gray")
        canvas.create_polygon(lander_pts, fill="gray")
        
        
        r = self.thrust * 1000
        g = r / 1.5
        b = r / 8
        canvas.create_rectangle([width/2-lander_w, lheight, width/2+lander_w,  lheight+blast_h], fill="#%02X%02X%02X" % (min(r,255),min(g,255),min(b,255)))
        
        canvas.create_rectangle([0, landing, width, height], fill="gray")
        
        fuel_y = 30
        oxy_y = 50
        bar_x = 5
        bar_h = 8
        bar_w = 70
        speed_y = 100
        canvas.create_rectangle([bar_x, fuel_y, bar_x+bar_w, fuel_y+bar_h], fill="white")
        canvas.create_rectangle([bar_x, fuel_y, bar_x+bar_w*self.fuel/self.max_fuel, fuel_y+bar_h], fill="red")
        canvas.create_text([bar_x, fuel_y-5], fill="gray", text="Fuel", anchor="w")
        
        canvas.create_rectangle([bar_x, oxy_y, bar_x+bar_w,  oxy_y+bar_h], fill="white")
        canvas.create_rectangle([bar_x, oxy_y, bar_x+bar_w*self.oxygen/self.max_oxygen, oxy_y+bar_h], fill="blue")
        canvas.create_text([bar_x, oxy_y-5], fill="gray", text="Oxygen", anchor="w")
        canvas.create_text([width/2,20], fill="green", text=self.launch_name, anchor="center")
        
        canvas.create_text([bar_x, speed_y], fill="white", text="Velocity:  % 4.2f m/s"%self.velocity, anchor="w")
        canvas.create_text([bar_x, speed_y+12], fill="red", text="Altitude: % 4.1f m"%self.distance, anchor="w")
        canvas._root().update() 
        
    def update(self, dt):
        
        if self.fn(self.distance, -self.velocity):
            thrust = 1
        else:
            thrust = 0
        if self.fuel<=0:    
            thrust = 0
            
        self.thrust = self.thrust * 0.96 + 0.04*thrust
        
        
        self.fuel -= thrust * self.fuel_rate * self.dt
        self.mass = self.fuel_density * self.fuel + self.module_mass + self.oxygen_density * self.oxygen
        acc = (thrust * self.engine_thrust) / self.mass - self.gravity 
        self.oxygen -= self.dt * self.oxygen_rate
        self.velocity += acc * self.dt
        self.distance += self.velocity * self.dt        
        
        if self.oxygen<0:
            print  "Oxygen has run out. The crew have died :("
            return True
            
        if self.distance<0:
            if abs(self.velocity)>50.0:
                print  "Impact velocity was %.2f m/s: module made an enormous crater!" % self.velocity            
                return True
            elif abs(self.velocity)>15.0:
                print  "Impact velocity was %.2f m/s: module utterly destroyed!" % self.velocity
                return True
            elif abs(self.velocity)>4.0:
                print "Impact velocity was %.2f m/s: module destroyed!" % self.velocity
                return True
            elif abs(self.velocity)>1:
                print  "Impact velocity was %.2f m/s: module damaged!" % self.velocity            
                return True
            else:
                print "Impact velocity was %.2f m/s: module survived unharmed!" % self.velocity
                return True
            
        if self.distance>1000 and self.velocity>0:
            print  "Module drifted off into space at %.2f m/s" % self.velocity            
            return True
            
        if abs(self.velocity)>self.max_speed:
            self.max_speed = abs(self.velocity)            
        
        return False
       

def simulate(fn):
    print "OU"
    lander = Lander(fn)    
    c = canvas.Can(draw_fn = lander.draw, tick_fn=lander.update)
    c.run()
    #while msg is None:
    #    msg = lander.update(0)
   
    return lander
    


def test_fn(x,y):
    return True
    
if __name__=="__main__":
    simulate(test_fn)
    