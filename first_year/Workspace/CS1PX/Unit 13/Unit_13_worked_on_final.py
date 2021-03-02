import Canvas

x = 0
y = 0

new_commands = {}

def position(new_x,new_y):
    global x,y
    x = int(new_x)
    y = int(new_y)

def line(new_x,new_y):
    global x,y
    new_x = int(new_x)
    new_y = int(new_y)
    Canvas.create_line(x,y,(x+new_x),(y+new_y))
    x += new_x
    y += new_y

def circle(radius):
    global x,y
    r = int(radius)
    x1 = x + r 
    y1 = y + r 
    x2 = x - r
    y2 = y - r

    print x1,y1,x2,y2

    Canvas.create_oval(x1,y1,x2,y2)
    

def move(new_x,new_y):
    global x,y
    new_x = int(new_x)
    new_y = int(new_y)
    x += new_x
    y += new_y   

def new_command(command, paramter):
    global new_commands
    instructions = new_commands[command][1:]
    count = new_commands[command][0]

    value = new_commands[(command,'parameters')]

    for ins in command:
        for i in range(len(ins)):
            if ins[i] == value:
                ins[i] = paramter       

    main(instructions, count)

commands = {'position':position, 'line':line, 'circle':circle, 'move':move, 'new_command':new_command}

def main(instructions, count =1):
    global commands
    for i in range(count):
        for command in instructions:
            commands[command[0]](*command[1:])


def load_test(file_name):
    global new_commands
    instructions = []
    writing = False
    looping = True
    command = ''
    
    with open('H:\Workspace\CS1PX\Unit 13\Lab Test Data\\' + file_name) as f:
        lines = f.readlines()
    
    for line in lines:
            instruction = (line.strip()).split()

            

            if instruction == []:
                break
            
            if instruction[0] == 'define':
                writing = True
                command = instruction[1]
                new_commands[(command,'parameters')] = instruction[1:]
                new_commands[command]=[1,]

            elif instruction[0] == 'loop':
               instructions.append(['new_command',instruction[0]])
               writing = True
               command = 'loop'
               new_commands[command]=[int(instruction[1])+1,]
                
            elif instruction[0] == 'end':
                writing = False

            elif instruction[0] in ['position','line','circle','move']:
                if len(instruction) > 2 :
                    if writing == False:
                        instructions.append([instruction[0],instruction[1],instruction[2]])
                    else:
                        new_commands[command].append([instruction[0],instruction[1],instruction[2]])

                else:
                    if writing == False:
                        instructions.append([instruction[0],instruction[1]])
                    else:
                        new_commands[command].append([instruction[0],instruction[1]])

            else:
                instructions.append(['new_command',instruction[0], instructions[1:]])
                

                
    main(instructions)

#load_test('test1.txt')
#load_test('test2.txt')
#load_test('test3.txt')
#load_test('circle.txt')
load_test('test4.txt')







        
