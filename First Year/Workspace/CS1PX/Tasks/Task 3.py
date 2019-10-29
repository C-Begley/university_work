from Canvas import *

colours = ["black", "white", "blue","green", "yellow", "cyan", "magenta"]

def barchart(xOrigin, yOrigin, xSize, ySize, labels, data):
    number = len(labels)
    width = xSize /number
    maximum = max(data)
    yScale = ySize/maximum
    
    return number, width, maximum, yScale  

def draw_barchart(xOrigin, yOrigin, xSize, ySize, labels, data):
    
    number, width, maximum, yScale = barchart(xOrigin, yOrigin, xSize, ySize, labels, data)
    
    centre = width/2 -2

    create_line(xOrigin - 20, yOrigin, xOrigin - 20, yOrigin - ySize )

    create_text(xOrigin - 20, yOrigin - ySize, text= maximum)
    
    
    for i in range(len(labels)):
        create_text((xOrigin + i*(width)) , yOrigin, text=labels[i])

    j = 0
    height = 10
    
    for i in range(len(labels)):
        if j == 7:
            j = 0
        create_rectangle((xOrigin + i*(width)- centre), (yOrigin - height),(xOrigin + i*(width) + centre ), (yOrigin - yScale*(data[i])), fill =colours[j])
        j += 1
    

draw_barchart(30, 250, 300, 200, ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'], [7,19,3,5,4,10,17,5,4,2,11,13])





