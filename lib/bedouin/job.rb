require 'tempfile'
module Bedouin
  class Job
    attr_accessor :status, :stdout, :stderr
    attr_reader :name

    def initialize(environment,template)
      @name = (template.name + '_' + environment.name).freeze
      @environment = environment
      @template = template
    end

    def file_path
      tempfile.path
    end

    def to_s
      [stdout, stderr].each do |output|
        output.each_line do |l|
          puts @name + ": " + l
        end
      end
    end

    private
    def tempfile
      unless @tempfile
        @tempfile = Tempfile.new(@name)
        f = @tempfile.open
        f.write @template.run(@environment)
        f.close
      end

      @tempfile
    end
  end
end
