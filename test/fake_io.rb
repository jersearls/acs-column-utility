class FakeIo
  attr_reader :log
  def initialize(stubbed_gets = [])
    @log = []
    @stubbed_gets = []

    stubbed_gets.each { |s| stub_gets(s) }
  end

  def puts(*args, &blk)
    @log << line = args.map(&:to_s).join
    Kernel.puts("FakeIo DEBUG: #{line}") if ENV['DEBUG_IO']
    nil
  end
  alias_method :print, :puts

  def gets
    @stubbed_gets.shift || ""
  end

  def stub_gets(stubbing)
    @stubbed_gets << stubbing + "\n"
  end
end

