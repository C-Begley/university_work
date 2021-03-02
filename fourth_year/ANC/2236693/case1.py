from routing import NodeHandler 

nodes = ["N1", "N2", "N3", "N4", "N5", "N6"]
initial_connections = [("N1", "N2" , 3), ("N2", "N3" , 4), ("N3", "N1", 4) ,("N3", "N4", 2), ("N4", "N5" , 5),     ("N4", "N6", 13,), ("N5", "N6", 6), ("N1", "N6", 19)]

handler = NodeHandler(nodes,initial_connections)
print("Inital nodes : {n}".format(n=nodes))
print()
print("Inital connnections : {c}".format(c=initial_connections))
print()

print("Inital Routing tables")
handler.pprint()

handler.run_updates(10, [ "N1"])
print()

print("Final Routing tables")
handler.pprint()
