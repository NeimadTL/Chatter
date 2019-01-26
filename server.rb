require 'socket'

class Server
  def initialize(port)
    @port = port
    @server_socket = TCPServer.new(port) # Server bound to port 2000
    @client = nil
  end

  def start
    puts 'Server started...'
    @client = @server_socket.accept   # Wait for a client to connect
    self.read_message_from_client
    self.send_message_to_client("Hello client !")
    self.read_message_from_client
    self.send_message_to_client("you're welcome")
    @client.close
  end

  def send_message_to_client(message)
    @client.puts(message)
  end

  def read_message_from_client
    puts "Client is typing in..."
    puts @client.gets
  end

  def stop
    @server_socket.close
  end
end

server = Server.new(2000)
server.start
