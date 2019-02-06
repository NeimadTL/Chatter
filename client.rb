require 'socket'
require './server_manager'

class Client
  attr_reader :tcp_socket
  def initialize(hostname, port)
    @hostname = hostname
    @port = port
    @tcp_socket = TCPSocket.new(hostname, port)
  end

  def self.client_for(socket)
    Client.new('localhost', 2000)
  end

  def send_message(message, client)
    @tcp_socket.puts(message)
    ServerManager.notify_message_for(self, client)
  end

  def read_message
    puts "Server is typing in..."
    @tcp_socket.gets   # Read lines from socket
  end

  def close_connection
    @tcp_socket.close
  end
end


client_1 = Client.new('localhost', 2000)
client_2 = Client.new('localhost', 2000)
client_1.send_message("message", client_2)
# puts "client_1 -> #{client_1.tcp_socket.inspect}"



# client_1.send_message("Hey server, I'm client #1")
# client_1.send_message("2")
# client_1.send_message("Yo")
#
#
# client_2 = Client.new('localhost', 2000)
# client_2.send_message("Hey server, I'm client #2")
# puts "client_2 has received : #{client_2.read_message}"
#
# puts "client_1 client side #{client_1.tcp_socket.inspect}"
# puts "client_1 client side #{client_2.tcp_socket.inspect}"




# client.send_message("Thanks for letting me in, appreciate that.")
# client.read_message
# client.close_connection
#
#
# client.read_message
# client.send_message("Thanks brother")
# client.read_message
# client.close_connection
