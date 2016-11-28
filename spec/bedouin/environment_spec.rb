require 'spec_helper'
require 'bedouin/job'

describe Bedouin::Environment do
  it "supports Hash-like parent objects" do
    hashlike = Object.new
    hashlike.define_singleton_method(:to_h) do
      { hashlike: "foo" }
    end
    expect(Bedouin::Environment.resolve_parent(hashlike).to_h).to eq({ hashlike: "foo" })
  end

  it "raises an ArgumentError for parent objects that aren't hash-like or strings/files" do
    expect { Bedouin::Environment.resolve_parent(Object.new) }.to raise_error(ArgumentError)
  end
end
