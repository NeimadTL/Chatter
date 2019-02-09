require 'Singleton'

class ServerManager
  include Singleton

  # attr_reader :server
  # attr_writer :server

  @server = nil
  # def initialize
  #
  #   puts "initialize got called"
  # end

  attr_accessor :server

  # def initialize
  #   @server
  # end

  # def server
  #   @server
  # end
  #
  # def server=(server)
  #   puts "set"
  #   @server = server
  # end

  def manage(server)
    self.server = server
    puts "server param -> #{server.clients}"
    puts "server_instance -> #{self.server.clients}"
  end

  def notify_message_for(from_who, to_who)
    puts "from_who -> #{from_who.inspect}"
    puts "to_who -> #{to_who.inspect}"

    puts " @server ->#{server.inspect}"
    # message = @server.read_message_of(from_who)
    # @server.send_message_to(to_who)
  end

end
