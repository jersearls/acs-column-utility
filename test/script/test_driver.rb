require "test_helper"
require "fake_io"

ENV['DEFER_DRIVER'] = "true"
require "driver"

class TestDriver < Minitest::Test
  def setup
    @fake_io = FakeIo.new(["1","1","c","f","n","4"])
    Log.provider = @fake_io
  end

  def test_browse
    Driver.start

    binding.pry
  end

  def teardown
    Log.provider = Kernel
  end
end
