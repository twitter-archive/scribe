
class Scribe
  def initialize(host = "127.0.0.1", port = 1463, category = "Ruby")
    @host = host
    @port = port
    @category = category

    transport = Thrift::FramedTransport.new(Thrift::Socket.new(@host, @port))
    transport.open
    
    @client = ScribeThrift::Client.new(
      ScribeThrift::Client.new(Thrift::BinaryProtocol.new(transport, false)),
      transport)
  end

  def log(message, category = @category)
    raise ArgumentError, "Message must be a string" unless message.is_a?(String)
    raise ArgumentError, "Category must be a string" unless category.is_a?(String)
    
    entry = ScribeThrift::LogEntry.new(:message => message, :category => category)
    @batch ? @batch << entry : @client.Log(Array(entry))
  end
  
  def batch
    @batch = []
    yield
    @client.Log(@batch)
  ensure
    @batch = nil
  end
end
