
class Scribe
  # Created a new client instance. Accepts an optional host, port, default 
  # category, flag to control whether newlines are added to each line, and
  # additional settings to be passed to ThriftClient.
  def initialize(servers = "127.0.0.1:1463", category = "Ruby", add_newlines = true, thrift_client_options = {})
    @servers = servers
    @category = category
    @add_newlines = add_newlines
    @client = ThriftClient.new(ScribeThrift::Client, @servers, thrift_client_options)
  end

  # Log a message. Accepts a string and an optional category.
  def log(message, category = @category)
    raise ArgumentError, "Message must be a string" unless message.is_a?(String)
    raise ArgumentError, "Category must be a string" unless category.is_a?(String)

    message << "\n" if @add_newlines
    entry = ScribeThrift::LogEntry.new(:message => message, :category => category)
    @batch ? @batch << entry : @client.Log(Array(entry))
  end
  
  # Batch several calls to Scribe#log together. Yields to a block.
  def batch
    @batch = []
    yield
    @client.Log(@batch)
  ensure
    @batch = nil
  end
  
  alias :debug :log
  alias :error :log
  alias :fatal :log
  alias :info :log
  alias :warn :log  
end
