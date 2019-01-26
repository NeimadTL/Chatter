require 'socket'

puts 'Server started...'
server = TCPServer.new 2000 # Server bound to port 2000

loop do
  client = server.accept    # Wait for a client to connect
  puts client.gets
  client.puts "Hello client !"
  client.close
end
