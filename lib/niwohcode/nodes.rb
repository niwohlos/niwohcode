require 'pp'

module NiwohcodeParser
  class Treetop::Runtime::SyntaxNode
    def to_hash
      hash = {}
      hash[:text_value] = self.text_value
      hash[:name] = self.class.name.split("::").last
      unless(self.elements.nil?)
        hash[:elements] = self.elements.map {|element| element.to_hash() }
      else
        hash[:elements] = nil
      end
      return hash
    end
  end

  class IntegerLiteral < Treetop::Runtime::SyntaxNode
  end

  class StringLiteral < Treetop::Runtime::SyntaxNode
  end

  class FloatLiteral < Treetop::Runtime::SyntaxNode
  end

  class Identifier < Treetop::Runtime::SyntaxNode
  end

  class Expression < Treetop::Runtime::SyntaxNode
  end

  class Block < Treetop::Runtime::SyntaxNode
  end

  class Statement < Treetop::Runtime::SyntaxNode
  end

  class Require < Treetop::Runtime::SyntaxNode
  end

  class ProgramIdentifier < Treetop::Runtime::SyntaxNode
  end

  class Body < Treetop::Runtime::SyntaxNode
  end

  class If < Treetop::Runtime::SyntaxNode
  end
end