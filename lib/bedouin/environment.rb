require 'ostruct'
module Bedouin
  class Environment < OpenStruct
    def self.parse(filename)
      DSL.new.instance_eval File.read(filename)
    end

    def initialize(n,base={})
      super(base)
      name = n
    end

    class DSL
      def environment(name,&block)
        e = Environment.new(name)
        e.instance_eval &block if block_given?
        return e
      end
    end
  end
end
