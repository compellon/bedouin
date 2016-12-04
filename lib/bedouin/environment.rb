require 'ostruct'
module Bedouin
  class Environment < OpenStruct
    def self.parse(filename)
      DSL.new(filename).evaluate
    end

    def initialize(n,base={})
      super(base)
      self.name = n
    end

    class DSL
      def initialize(filename)
        @filename=filename
      end

      def evaluate
        self.instance_eval(File.read(@filename), @filename)
      end

      def resolve_parent(parent)
        parent_hash = case parent
        when String
          parent_path = File.expand_path(parent, File.dirname(@filename))
          Environment.parse(parent_path)
        when NilClass
          nil
        else
          parent
        end

        unless parent_hash.respond_to? :to_h
          raise ArgumentError.new "#{parent.class} not a valid type for environment parent"
        end

        parent_hash
      end

      def environment(name,parent=nil,&block)
        parent_hash = resolve_parent(parent)
        e = Environment.new(name,parent_hash)
        e.instance_eval &block if block_given?
        return e
      end
    end
  end
end
