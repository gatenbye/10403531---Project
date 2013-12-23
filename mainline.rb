require 'lib'
require 'socket'

u1 = UDPSocket.new
u1.bind("127.0.0.1", 4913)
n1 = Node.new(u1)
u2 = UDPSocket.new
u2.bind("127.0.0.1", 4914)
n2 = Node.new(u2)
u3 = UDPSocket.new
u3.bind("127.0.0.1", 4915)
n3 = Node.new(u3)
while true do
  n1.instance_variable_get(:@socket).send("aaaa", 0, '127.0.0.1', 4914)
  n2.instance_variable_get(:@socket).send("uuuu", 0, '127.0.0.1', 4913)
  n3.instance_variable_get(:@socket).send("zzzz", 0, '127.0.0.1', 4913)
end
