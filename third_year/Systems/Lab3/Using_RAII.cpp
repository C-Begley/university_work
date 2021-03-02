#include <memory>
#include <vector>
#include <stdio.h>

struct node {
	const void * value_ptr;
	std::vector<std::shared_ptr<struct node>> neighbours;

	//constructor
	node (const void * value_ptr_){
		value_ptr = value_ptr_;
	}

	~node() { }

	void add_edge_to(std::shared_ptr<struct node> node_ptr){	    
		neighbours.push_back(node_ptr);
	}

	void print_node() {
		printf("Node: %c \nNeighbours : \n",*(char *)value_ptr);
		for(int i = 0; i<neighbours.size();i++){
			printf(" - %s \n", (char *)neighbours.at(i)->value_ptr);
		}
		printf("\n");
	}
};
typedef struct node node;
int main() {
	std::shared_ptr<node> a = std::make_shared<node>("a");
	std::shared_ptr<node> b = std::make_shared<node>("b");
	std::shared_ptr<node> c = std::make_shared<node>("c");
	std::shared_ptr<node> d = std::make_shared<node>("d");
	std::shared_ptr<node> e = std::make_shared<node>("e");
	std::shared_ptr<node> f = std::make_shared<node>("f");
	
	a->add_edge_to(b);
	a->add_edge_to(d);
	b->add_edge_to(c);
	b->add_edge_to(d);
	c->add_edge_to(e);
	d->add_edge_to(f);
	e->add_edge_to(f);

	a->print_node();
    b->print_node();
    c->print_node();
   	d->print_node();
	e->print_node();
    f->print_node();
}
