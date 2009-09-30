require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class ScribeTest < Test::Unit::TestCase
  def setup
    @scribe = Scribe.new
  end
  
  def test_logging
    @scribe.log("test_logging")
    @scribe.log("test_logging with category", "Test")  
  end
  
  def test_batch
    @scribe.batch do
      @scribe.log("test_batch 1")
      @scribe.log("test_batch 2")    
    end
  end
end
