require 'ostruct'
module Bedouin
  class Environment < OpenStruct
    def self.parse(filename)
      DSL.new.instance_eval File.read(filename)
    end

    def self.resolve_parent(parent)
        parent_hash = case parent
        when String, File
          Environment.parse(parent)
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

    def initialize(n,base={})
      super(base)
      name = n
    end

    class DSL
      def environment(name,parent=nil,&block)
        parent_hash = Environment.resolve_parent(parent)
        e = Environment.new(name,parent_hash)
        e.instance_eval &block if block_given?
        return e
      end
    end
  end
end
