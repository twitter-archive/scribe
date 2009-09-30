
require 'test/unit'
require "#{File.expand_path(File.dirname(__FILE__))}/../lib/scribe"
begin; require 'ruby-debug'; rescue LoadError; end

begin
  @test_client = Scribe.new
rescue Thrift::TransportException => e
  #FIXME Make server automatically start if not running
  if e.message =~ /Could not connect/
    puts "*** Please start the Scribe server by running 'rake scribe'. ***" 
    exit 1
  end
end
