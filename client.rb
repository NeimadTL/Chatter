require 'socket'

class Client
  def initialize(hostname, port)
    @hostname = hostname
    @port = port
    @tcp_socket = TCPSocket.new(hostname, port)
  end

  def send_message(message)
    @tcp_socket.puts(message)
  end

  def read_message
    puts "Server is typing in..."
    puts @tcp_socket.gets   # Read lines from socket
  end

  def close_connection
    @tcp_socket.close
  end
end


client = Client.new('localhost', 2000)
client.send_message("Hey server, I'm trying to connect")
client.read_message
client.send_message("Thanks for letting me me, appreciate that.")
client.read_message
client.close_connection
