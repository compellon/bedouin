require 'erubis'
module Bedouin
  class Template
    attr_reader :name

    def initialize(template_file)
      @template_file = template_file
      @name = File.basename(@template_file.path).sub(/\.[^.]*$/, '').freeze
    end

    def run(environment)
      @eruby ||= Erubis::Eruby.new(@template_file.read)
      @template_file.close
      @eruby.evaluate(environment.to_h)
    end
  end
end
