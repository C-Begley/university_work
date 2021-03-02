import json
import sys
from routing import *
import copy

def print_help():
    print("---------------------------")
    print("List of functions:")
    print()
    for command in commands:
        print("{c} :{cm} \n\t parmameters : {par}".format(c=command, cm = commands[command]["text"],par = commands[command]["par"]))
        print()
    print("---------------------------")

def func_help(command):
    try:
        print()
        print("{c} :{cm} \n\t parmameters : {par}".format(c=command, cm = commands[command]["text"], par= commands[command]["par"]))
        print()
    except:
        print("{c} is not a known function. Try intro_help for all know functions".format(c=command))
 
def exit():
    print()
    print("Thank you, goodbye")
    global cont
    cont = False

def load_file(filename):
    global add_undo
    add_undo = True
    try:
        handler.load_from_file(filename)
    except:
        print(sys.exc_info()[0])
        print("Invalid file type/format or missing file. \nFile shouldcontain be a JSON dictionary with fields: \n- 'nodes' : ['N1', 'N2', etc] \n - connections : [('N1', 'N2', 1]) etc")

def clear():
    global add_undo
    add_undo = True
    global handler
    handler = NodeHandler()

def reset():
    global add_undo
    add_undo = True
    handler.reset()
    print("Reset handler to configuration at start \n")

def add_node(node):
    global add_undo
    add_undo = True
    handler.add_node(node)
    print("Added {n} to network \n".format(n=node))

def add_connection(n1, n2,distance):
    global add_undo
    add_undo = True
    handler.add_connection(n1, n2,int(distance))
    print("Added connection between {n1} and {n2} distance {c} to network \n".format(n1=n1, n2=n2, c = distance))

def limit_run_updates(limit, *tracing):
    global add_undo
    add_undo = True
    handler.run_updates(int(limit),trace=tracing)

def converge_run_updates(*tracing):
    global add_undo
    add_undo = True
    handler.converge(tracing)

def print_tables():
    print()
    handler.pprint()

def print_table(node):
    print()
    handler.pprint_node(node)

def print_subset_tables(*nodes):
    print()
    for node in nodes:
        print_table(node)

def update_distance(n1,n2, distance):
    global add_undo
    add_undo = True
    handler.update_distance(n1,n2,int(distance))
    print("Updated connection distance between {n1} and {n2} to distance {c} \n".format(n1=n1, n2=n2, c = distance))
    
def down_link(n1, n2):
    global add_undo
    add_undo = True
    handler.downed_link(n1, n2) 
    print("Removed connection between {n1} and {n2} from network \n".format(n1=n1,n2=n2))

def remove_node(n):
    global add_undo
    add_undo = True
    handler.remove_node(n)
    print("Removed {n} and subsquent connections from network \n".format(n=n))

def act_split_hor():
    global add_undo
    add_undo = True
    handler.activate_split_horizon()
    print("Activated split horizon")

def deact_split_hor():
    global add_undo
    add_undo = True
    handler.deactivate_split_horizon()
    print("Deactivated split horizon")

def set_inf(val):
    handler.set_infinite(int(val))
    print("Set count to inifinty value to be {v}".format(v=val))

def get_route(n1,n2):
    try:
        print(handler.get_route(n1,n2))
    except KeyError:
        print("Route between {n1} and {n2} does not exist or has not been discovered".format(n1=n1, n2=n2))

def check_converge():
    if handler.check_converged():
        print("Network has converged")
    else:
        print("Not all routing tables have converged")

def print_inf():
    print("Infinity set to {v}".format(v=handler.infinite))

def undo():
    global i
    global handler
    i = (i-1)%limit
    if i == -1:
        i = limit-1
    handler = handler_states[i]

def write_file(filename):
    handler.write_to_file(filename)

cont = True
handler = NodeHandler()

commands = {
        "intro_help" : {"text":"Lists all functions", "par":None, "function": print_help},
        "help" : {"text": "List specific function details", "par":"function_name(string)", "function":func_help},
        "load_file": {"text":"Initialise simulations  with nodes and connections from file", "par":"filename (string)","function":load_file},
        "write_file": {"text":"Writes current nodes and connections to file", "par":"filename (string)","function":write_file},
        "clear": {"text" : " Clear program, removing all nodes and connections", "par":None, "function":clear},
        "reset": {"text" : " Reset netowrk to initial nodes and connections", "par": None,"function":reset},
        "add_node" : {"text":"Add node to network","par": "node_name (string)", "function" : add_node},
        "add_connection" : {"text" : "Add connection between existing nodes", "par":"existing_node_1(string) existing_node_2(string) connection_distance(integer)",   "function" : add_connection},
        "update_distance":{"text":"Change distance of connection","par":"existing_node_1(string) existing_node_2(string) connection_distance(integer)", "function":update_distance},
        "down_link":{"text":"Remove connection between two nodes", "par":"existing_node_1(string) existing_node_2(string)","function":down_link},
        "remove_node":{"text":"Remove node from network", "par":"existing_node_1(string) ","function":remove_node},
        "activate_split_horizon":{"text":"Activate split horizon functionality", "par" : None, "function":act_split_hor},
        "deactivate_split_horizon":{"text":"Deactivate split horizon functionality","par":None, "function":deact_split_hor},
        "set_count_to_infinity":{"text":"Set count to infinity limit (default is sum of nodes connection distance at start)", "par":"infinity_value(integer)","function":set_inf},
        "print_infinity":{"text":"Print count to infinity limit", "par":None,"function":print_inf},
        "limit_run_updates" : {"text" : "Run for a max of X number of exchanges until network converges", "par":"exchanges_limit(integer) --optional to trace provide [trace_nodes] (list)", "function":limit_run_updates},
        "converge_run_updates" : {"text" : "Run exchanges until netwrok converges", "par":"--optional to trace provide [trace_nodes] (list)", "function":converge_run_updates},
        "print_tables": {"text": "Print current routing tables of all nodes", "par":None,"function":print_tables},
       "print_table": {"text": "Print current routing tables of given table", "par":"existing_node (string)","function":print_table},
 "check_converged" : {"text": "Check if network appears to be converged","par":None, "function":check_converge},
       "print_subset_tables": {"text": "Print current routing tables of subset of nodes", "par":"exisiting_node 1 existin_node_2 ... existing_node_n","function":print_subset_tables},
 "get_route": {"text": "Gets path between two nodes, based on the first nodes current routing tables(recommend to ensure network has converged)","par":"existing_node_1(string) existing_node_2(string)", "function":get_route}, 
        "undo":{ "text": "Undo last command", "par":None,"function":undo},
        "exit" : {"text": "Exit program","par":None, "function":exit}
        }
print("ANC: Assesed Exercise")
print_help()
add_undo = False
limit = 20
i = 0
handler_states = [NodeHandler()]*limit

while(cont):
    print()
    inp = input("Please enter command: ")
    try:
        old_handler = handler
        inp = inp.split(" ")
        command = commands[inp[0]]["function"]
        if len(inp) > 1:
            args = inp[1:]
            command(*args)
        else:
            command()
        #If change to handler made, add step to undo buffer 
        if add_undo:
            add_undo = False
            i = (i+1)%limit
            handler_states[i] = copy.deepcopy(old_handler)
    except:
        print(sys.exc_info())
        print("Invalid command or arguements missing")
            




        
