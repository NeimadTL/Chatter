class ServerManager

  # @@server_instance = nil


  # def self.server_instance
  #   @@server_instance
  # end
  #
  # def self.server_instance=(server)
  #   puts "set"
  #   @@server_instance = server
  #   puts "set server -> #{server}"
  #   puts "set @@server_instance -> #{@@server_instance}"
  # end

  attr_accessor :server_instance

  def self.manage(server)
    server_instance = server
    puts "server clients -> #{server_instance.clients}"
  end

  def self.notify_message_for(from_who, to_who)
    puts "from_who -> #{from_who.inspect}"
    puts "to_who -> #{to_who.inspect}"

    puts " @server ->#{@@server_instance.inspect}"
    # message = @server.read_message_of(from_who)
    # @server.send_message_to(to_who)
  end

end
