import copy
import json

class Node():
    def __init__(self,name):
        self.name = name
        self.distance_vector_table = {}
        self.connections = {}
        self.updates = [] 
        self.updated = True
    
    def add_direct_node(self,node, distance):
        self.connections[node.name] = {"distance":distance, "node":node}
        self.distance_vector_table[node.name] = { "link": node.name, "distance" : distance}

    def update_table(self,sender, distance_vector_table):
        self.updates.append([sender, distance_vector_table])

    def apply_updates(self, infinite):
        self.updated = False
        #Iterate through all recived distance vector tables
        for update in self.updates:
            sender = update[0]
            table = update[1]
            for route in table:
                #If new route add it to routing table
                if route != self.name and route not in self.distance_vector_table:
                    self.distance_vector_table[route] = {"distance": table[route]["distance"], "link":sender}
                    self.updated = True
        #Go through all routes and compare with recieved distance vector routes
        for route in self.distance_vector_table:
            distances = []
            senders = []
            for update in self.updates: 
                sender = update[0]
                table = update[1]
                if route in table:
                    c = table[route]["distance"]+ self.distance_vector_table[sender]["distance"] 
                    if c > infinite:
                        c = float("inf")
                    distances.append(c) 
                    senders.append(sender)

            if route in self.connections:
                distances.append(self.connections[route]["distance"])
                senders.append(route)
            if len(distances) == 0:
                continue
            min_distance = min(distances)
            #Check if minimum has remainded the same, if it hasn't update to new minimum distance, even if bigger than previous. Assume this is due to change in links elsewhere
            if  self.distance_vector_table[route]["distance"]  != min_distance:  
                self.distance_vector_table[route] = {"link" : senders[distances.index(min_distance)], "distance" : min_distance}
                self.updated = True
        self.updates = []
        return self.updated  

    def advertise_updates(self,split_horizon):
        if split_horizon == True:
            for n in self.connections:
                new_table = {}
                node = self.connections[n]["node"]
                for route in self.distance_vector_table:
                    if self.distance_vector_table[route]["link"] != node.name:
                        new_table[route] = copy.deepcopy(self.distance_vector_table[route])
                node.update_table(self.name, new_table)
        else:
            for node in self.connections:
                self.connections[node]["node"].update_table(self.name, copy.deepcopy(self.distance_vector_table))

            
    def downed_link(self, node):
        for route in self.distance_vector_table:
            if self.distance_vector_table[route]["link"] == node:
                self.distance_vector_table[route]["distance"] = float("inf") 
        del self.connections[node]

    def update_distance(self,node, distance):
        self.connections[node]["distance"] = distance

    def get_link(self,node):
        return self.distance_vector_table[node]["link"]
    
    def get_distance(self,node):
        return self.distance_vector_table[node]["distance"]
    
    def get_next_hop(self,node):
        return self.distance_vector_table[self.distance_vector_table[node]["link"]]

    def pprint(self):
        print (self.name)
        print("--------------------")
        print("Node | Link | Distance |")
        for connection in self.distance_vector_table.keys():
            distance = self.distance_vector_table[connection]["distance"]
            link = self.distance_vector_table[connection]["link"] 
            print( "{n}     {l}     {c}    ".format(n = connection, l = self.distance_vector_table[connection]["link"] ,c = self.distance_vector_table[connection]["distance"]))
        print("\n")

class NodeHandler():

    def __init__(self, initial_nodes=[], initial_connections=[]):
        self.infinite = 0
        self.add_inital_network(initial_nodes, initial_connections)
    
    def add_inital_network(self,nodes, connections): 
        self.nodes = {}
        
        self.initial_nodes = nodes
        self.initial_connections = connections
        
        self.split_horizon = False
        self.converged = False
        
        for n in nodes:
            self.nodes[n] = Node(n)

        for connection in connections:
            self.add_connection(connection[0], connection[1], connection[2])

        self.infinite = 0
        
        for connection in connections:
            self.infinite += connection[2]
        self.infinite +=1


    def reset(self):
        self.add_inital_network(self.initial_nodes, self.initial_connections)

    def check_converged(self):
        return self.converged
    
    def add_node(self, n):
        self.nodes[n] = Node(n)

    def add_connection(self, n1,n2,distance):
        self.converged = False
        self.nodes[n1].add_direct_node(self.nodes[n2], distance)
        self.nodes[n2].add_direct_node(self.nodes[n1], distance)
        self.infinite += distance
    
    def update_distance(self,n1,n2, distance):
        self.converged = False
        self.nodes[n1].update_distance(n2,distance) 
        self.nodes[n2].update_distance(n1,distance) 
    
    def get_node(self, n):
        return self.nodes[n]

    def current_nodes(self):
        return self.nodes.values()

    def update_nodes(self):
        self.not_converged = False
        for node in self.current_nodes():
            node.advertise_updates(self.split_horizon)
        
        for node in self.current_nodes():
            update = node.apply_updates(self.infinite)
            self.not_converged = self.not_converged or update

        return not self.not_converged
    
    def downed_link(self,n1, n2):
        self.converged = False
        node1 = self.get_node(n1)
        node2 = self.get_node(n2)
        
        node1.downed_link(n2)
        node2.downed_link(n1)

    def remove_node(self,n):
        self.converged = False
        node = self.nodes[n]
        connections = copy.deepcopy(node.connections)
        for con in connections:
            self.downed_link(n, con)
        
        del self.nodes[n]
    
    def run_updates(self, limit, trace=[]):
        i = 0
        converged = False

        while  i < limit:
            converged = self.update_nodes()
            
            if trace != []:
                print("Exchange {i}".format(i=i+1))
                for node in trace:
                    self.get_node(node).pprint()
            i += 1        
        
            if converged:
                break

        self.converged = converged
        
        if converged:
            if limit != float("inf"):
                print ("Converged distance vector tables after {n} of {l} exchanges".format(n=i, l=limit))
            else:    
                print ("Converged distance vector tables after {n} exchanges".format(n=i))
        else:
            print  ("Ran for {l} exchanges, did not fully converge".format(l=limit))

    def converge(self,trace = []):
        self.run_updates(float("inf"), trace)

    def get_route(self,start, end):
        routes = [start]
        distance = 0
        current = start
        while current != end:
            current_node = self.get_node(current)
            next_hop = current_node.get_next_hop(end)
            current = next_hop["link"]
            distance += next_hop["distance"]
            routes.append(current)
        route = " -> ".join(routes)
        if distance > self.infinite:
            if distance == float("inf"):
                return "Link along route ({r}) between {n1} and {n2} is down".format(r = route, n1=start, n2=end)
            return "Route between {n1} and {n2}  does not exist as the total route distance is great than the current value for infinitity ({r} distance {c}  > {i})".format(n1=start, n2=end, r=route, c = distance, i=self.infinite)
        return "The best route is {r} with distance {c}".format(r=route,c=distance)

    def activate_split_horizon(self):
        self.split_horizon = True

    def deactivate_split_horizon(self):
        self.split_horizon = False

    def set_infinite(self, val):
        self.infinite = val
   
    def pprint_node(self,node):
       self.nodes[node].pprint()

    def pprint(self):
        for node in self.current_nodes():
            node.pprint()

    def write_to_file(self,filename):
        connections = set()
        nodes = []
        for n in self.nodes:
            nodes.append(n)
            node = self.nodes[n]
            for connection in node.connections:
                if node.name < connection:
                    connections.add((node.name, connection, node.connections[connection]["distance"]))
                else:
                    connections.add((connection, node.name, node.connections[connection]["distance"]))
        
        data = {"nodes" : nodes, "connections": list(connections)}
        
        with open(filename, 'w') as json_file:
            json.dump(data, json_file)

    def load_from_file(self,filename):
        with open(filename) as json_file:
            data = json.load(json_file)
        nodes = data["nodes"]
        connections = data["connections"]
        
        self.add_inital_network(nodes, connections)
