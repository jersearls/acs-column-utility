require "minitest/autorun"
require "minitest/pride"

require 'simplecov'
SimpleCov.start

# Add script and lib to the load path
['script', 'lib'].each do |dir|
  $LOAD_PATH << File.join(File.dirname(__FILE__), '..', dir)
end

