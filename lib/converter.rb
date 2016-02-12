require 'json'
require 'pry'

title_string = File.read('../data/temp.json')
title_hash = JSON.parse(title_string)

binding.pry
