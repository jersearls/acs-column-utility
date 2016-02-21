class Log
  def self.gets(*args, &blk)
    provider.gets(*args, &blk)
  end

  def self.puts(*args, &blk)
    provider.puts(*args, &blk)
  end

  def self.print(*args, &blk)
    provider.print(*args, &blk)
  end

  def self.provider
    @provider || Kernel
  end

  def self.provider=(provider)
    @provider = provider
  end
end

