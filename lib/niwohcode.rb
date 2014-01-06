require 'rubygems'
require 'bundler/setup'
require 'niwohcode/parser'

class Niwohcode
  def initialize
    @parser = Parser.new
  end

  def self.run(code)
    @parser.parse(code)
  end
end