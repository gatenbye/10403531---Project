require 'lib'
require 'socket'

u1 = UDPSocket.new
u1.bind('localhost', 4913)
n1 = Node.new(u1)
u2 = UDPSocket.new
u2.bind('localhost', 4914)
n2 = Node.new(u2)
u3 = UDPSocket.new
u3.bind('localhost', 4915)
n3 = Node.new(u3)
while true do
  n1.indexPage('localhost', 4913, "www.asd.com")
  n1.indexPage('localhost', 4913, "www.qwe.com")
  n1.indexPage('localhost', 4913, "www.asd.com")
  n2.indexPage('localhost', 4913, "www.qwe.com")
  n3.indexPage('localhost', 4913, "www.asd.com")
  n3.indexPage('localhost', 4913, "www.asd.com")
  n2.search('localhost', 4913)
end
