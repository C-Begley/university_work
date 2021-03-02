from routing import NodeHandler 

nodes = ["N3", "N4", "N5"]
initial_connections = [ ("N3", "N5",50),("N3", "N4", 7), ("N4", "N5" , 7)]

handler = NodeHandler(nodes,initial_connections)

handler.pprint()

handler.run_updates(10)

handler.downed_link("N4", "N3")
handler.run_updates(10))
handler.pprint():q

