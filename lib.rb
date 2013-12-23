require 'rubygems'
require 'json'
require 'socket'

class Node
  def initialize(socket)
    @socket = socket
    @linkCount = Hash.new 
    Thread.new{waitLoop}
  end
  def indexPage(ip, port, url)
    indexMessage = Hash.new
    indexMessage["type"] = "INDEX"
    indexMessage["url"] = url
    @socket.send(JSON.generate(indexMessage), 0, port, ip)
  end
  def search(ip, port)
    searchMessage = Hash.new
    searchMessage["type"] = "SEARCH"
    searchMessage["ip"] = @socket[ip]
    searchMessage["port"] = @socket[port]
    @socket.send(JSON.generate(hash), 0, port, ip)
  end
  def waitLoop
    while true do
      message1, adr = @socket.recvfrom(10)
      message = JSON.parse(message1)
      if message["type"] == "INDEX"
        url = message["url"]
        if wordLink.has_key?(url)
          wordLink[url] += 1
        else
          wordLink[url] = 1
        end
      elsif message["type"] == "SEARCH"
        searchResultMessage = Hash.new
        searchResultMessage["type"] = "SEARCH RESULT"
        searchResultMessage["values"] = @wordLink.inspect
        @socket.send(JSON.generate(searchResultMessage), 0, message["ip"], message["port"])
      else #message type SEARCH RESULT
        p message["values"]
      end
    end
  end
end
