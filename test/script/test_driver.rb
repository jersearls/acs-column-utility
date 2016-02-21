require "test_helper"

ENV['DEFER_DRIVER'] = "true"
require "driver"

class TestDriver < Minitest::Test
  def test_browse
    assert false, "write a test."
  end
end
