require 'spec_helper'
require 'bedouin/runner'
require 'open3'

describe Bedouin::Runner do
  it "runs nomad's 'run' command with the job's tempfile" do
    job = instance_double("job", file_path: "/foo/bar")

    expect(Open3).to receive(:popen3) { ["nomad", "run", "/foo/bar"] }

    r = Bedouin::Runner.new
    r.run(job)
  end

  it "returns the job with status, stdout, and stderr set" do
    job = instance_double("job", file_path: "/foo/bar")
    expect(job).to receive(:status=).with(0)
    expect(job).to receive(:stdout=).with("run /foo/bar\n")
    expect(job).to receive(:stderr=).with("")

    runner = Bedouin::Runner.new({ nomad: "echo" })
    expect(runner.run(job)).to be job
  end
end
