require 'socket'

class Server
  def initialize(port)
    @port = port
    @server_socket = TCPServer.new(port) # Server bound to port 2000
    @client = nil
  end

  def start
    puts 'Server started...'
    loop do
      @client = @server_socket.accept   # Wait for a client to connect
      self.read_message_from_client
      self.send_message_to_client("Hello client !")
      @client.close
    end
  end

  def send_message_to_client(message)
    @client.puts(message)
  end

  def read_message_from_client
    puts @client.gets
  end

  def stop
    @server_socket.close
  end
end

# puts 'Server started...'
# server = TCPServer.new 2000 # Server bound to port 2000
# loop do
#   client = server.accept    # Wait for a client to connect
#   puts client.gets
#   client.puts "Hello client !"
#   client.close
# end


server = Server.new(2000)
server.start
