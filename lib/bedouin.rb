require "bedouin/version"
require "bedouin/template"
require "bedouin/environment"
require "bedouin/job"
require "bedouin/runner"

module Bedouin
  def self.template_for(template_path)
    Template.new(File.open(template_path))
  end

  def self.environment_for(environment_path)
    Environment.parse(environment_path)
  end
end
