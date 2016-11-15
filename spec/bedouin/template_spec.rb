require 'spec_helper'
require 'bedouin/template'

describe Bedouin::Template do
  before(:example) do
    @environment = instance_double("environment", name: "test")
    @template_file = instance_double("file", path: "/foo/bar.erb")
  end

  it "has a name" do
    template = Bedouin::Template.new(@template_file)
    expect(template.name).to match("bar")
  end
end
