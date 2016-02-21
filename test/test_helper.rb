require 'simplecov'
SimpleCov.start

require "minitest/autorun"
require "minitest/pride"
require "pry"

# Add script and lib to the load path
['script', 'lib'].each do |dir|
  $LOAD_PATH << File.join(File.dirname(__FILE__), '..', dir)
end

