require 'socket'
require './server_manager'

class Server

  attr_reader :clients

  def initialize(port)
    @port = port
    @server_socket = TCPServer.new(port) # Server bound to port 2000
    @clients = []
  end

  def start
    puts 'Server started...'

    loop do
      ServerManager.instance.manage(self)
      socket = @server_socket.accept   # Wait for a client to connect
      @clients.push(socket)

      if clients_count == 2
        break
      end
    end
    # puts "clients count -> #{self.clients_count}"


    # client_1 = @clients[0]
    # client_2 = @clients[1]
    # puts "Client 1 is typing in..."
    # first_message = read_message_of(client_1)
    # puts "first_message : #{first_message}"
    # second_message = read_message_of(client_1)
    # puts "second_message : #{second_message}"
    # last_message = read_message_of(client_1)
    # puts "last_message to send : #{last_message}"
    # puts "Client 1 has done...\n\n"
    #
    # puts "Client 2 is typing in..."
    # puts "first message of client_2 : #{read_message_of(client_2)}"
    # puts "Client 2 has done..."
    #
    # puts "client_1 #{client_1.tcp_socket.inspect}"
    # puts "client_2 #{client_2.tcp_socket.inspect}"
    # if second_message.chomp.eql?('2')
    #   puts "sending the message to client_2 "
    #   send_message_to(last_message, client_2)
    # end






    # puts "nil? --> #{client_2.gets.nil?}"


    # puts "nil? --> #{client_2.gets.nil?}"

    # puts "all line : #{client_2.readlines}"
    # self.send_message_to("yaaaas", client_2)
    # puts "all line : #{client_2.readlines}"


    # self.read_message_from_client
    # self.send_message_to_client("Hello client !")
    # self.read_message_from_client
    # self.send_message_to_client("you're welcome")
    # @client.close
  end

  def clients_count
    @clients.length
  end

  def send_message_to(message, client)
    client.puts(message)
  end

  def read_message_of(client)
    client.gets
  end

  def stop
    @server_socket.close
  end
end

server = Server.new(2000)
server.start
