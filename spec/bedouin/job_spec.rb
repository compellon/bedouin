require 'spec_helper'
require 'bedouin/job'

describe Bedouin::Job do
  subject(:job) do
    environment = instance_double("environment", name: "test")
    template = instance_double("template", name: "foo", run: "bar")
    Bedouin::Job.new(environment,template)
  end

  it 'has a name' do
    expect(job.name).to match("foo_test")
  end

  it 'has accessors for job status results' do
    job.status = 2
    expect(job.status).to match 2
  end

  it 'has accessors for job stdout results' do
    job.stdout = 'foo'
    expect(job.stdout).to match('foo')
  end

  it 'has accessors for job stderr results' do
    job.stderr = 'bar'
    expect(job.stderr).to match('bar')
  end

  it 'creates a tempfile with the templated content' do
    file_path = job.file_path
    expect(file_path).to satisfy("be a valid file") {|v| File.exists? v}
    expect(File.read file_path).to match("bar")
  end
end
