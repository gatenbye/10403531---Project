10403531---Project

I chose to implement the simplified protocol. I didn't get as far as routing
but instead saw how a search engine could be distributed between threads in my
computer. It doesn't compile at the moment but i did try to get it working by 
making some assumptions.  I assumed a central routing server which knew which
ip addresses mapped to which words and would allow nodes to index urls at nodes 
and search for url count pairs at other nodes. 

Ruby doesn't have an interface construct and I didn't stick too closely
to the interface so the methods are simply implemented in a class Node. 
I didn't implement the joining or leaving methods or implement any
acknowledging or routing but instead worked from the bottom up. 
