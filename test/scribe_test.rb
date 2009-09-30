require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class ScribeTest < Test::Unit::TestCase
  def setup
    @scribe = Scribe.new
  end

  def test_logging
    @scribe.log("test_logging")
    assert_equal "test_logging", last_line("Ruby")
    @scribe.log("test_logging with category", "Test")
    assert_equal "test_logging with category", last_line("Test")
  end

  def test_batch
    @scribe.log("test_batch 1")    
    @scribe.batch do
      @scribe.log("test_batch 2")
      @scribe.log("test_batch 3")    
      assert_not_equal "test_batch 3", last_line("Ruby")
    end
    assert_equal "test_batch 3", last_line("Ruby")
  end

  def last_line(category)
    sleep(3)
    `tail -n1 /tmp/scribetest/#{category}/#{category}_current`.chomp
  end
end
