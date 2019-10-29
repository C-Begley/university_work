dependencyDiscoverer: dependencyDiscoverer.cpp
	clang++ -fsanitize=thread -Wall -Werror -std=c++11 -g -o dependencyDiscoverer dependencyDiscoverer.cpp -lpthread

clean:
	rm -f *.o dependencyDiscoverer *~
