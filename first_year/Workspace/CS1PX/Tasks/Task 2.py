#Task 2 - a)

def barchart(xOrigin, yOrigin, xSize, ySize, labels, data):
    number = len(labels)
    width = xSize/number
    maximum = max(data)
    yScale = ySize/maximum
    
    return number, width, maximum, yScale
    
print barchart(0, 0, 30, 200, ['Jan', 'Feb', 'Mar'], [7,19,3])    
