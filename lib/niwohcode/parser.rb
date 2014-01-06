require 'treetop'

# Load our custom syntax node classes so the parser can use them
require File.expand_path(File.join(File.dirname(__FILE__), 'nodes.rb'))

class Parser
  Treetop.load(File.expand_path(File.join(File.dirname(__FILE__), 'niwohcode_parser.treetop')))
  @@parser = NiwohcodeParserParser.new

  # Parse an input string and return a Ruby array like:
  # [:this, :is, [:a, :test]]
  def self.parse(data)
    tree = @@parser.parse(data)

    if(tree.nil?)
      raise Exception, "Parse error at offset: #{@@parser.index}"
    end

    # Remove all syntax nodes that aren't one of our custom
    # classes. If we don't do this we will end up with a *lot*
    # of essentially useless nodes
    self.clean_tree(tree)

    # Convert the AST into an array representation of the input
    # structure and return it
    return tree.to_array
  end

  private

  def self.clean_tree(root_node)
    return if(root_node.elements.nil?)
    root_node.elements.delete_if{|node| node.class.name == "Treetop::Runtime::SyntaxNode" }
    root_node.elements.each {|node| self.clean_tree(node) }
  end
end