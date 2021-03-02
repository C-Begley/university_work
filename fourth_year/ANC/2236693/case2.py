from routing import NodeHandler 

nodes = ["A", "B", "C", "D"]
initial_connections = [ ("A", "B",1),("B", "C", 1), ("C", "D" , 1)]

handler = NodeHandler(nodes,initial_connections)
handler.set_infinite(16)
print("Inital nodes : {n}".format(n=nodes))
print()
print("Inital connnections : {c}".format(c=initial_connections))
print()

print("Inital Routing tables")
handler.pprint()

handler.converge()

print("Final Routing tables")
handler.pprint()

print("Link A, B fails")
handler.downed_link("A", "B")
handler.converge( ["B", "C", "D"])
print()
print("Tables after handling downed_link")
handler.pprint()