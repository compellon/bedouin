require 'open3'
module Bedouin
  class Runner
    def initialize(cfg = { nomad: "nomad" })
      @cfg = cfg
    end

    def run(job)
      Open3.popen3(@cfg[:nomad], "run", job.file_path) do |stdin, stdout, stderr, wait_thr|
        job.status = wait_thr.value
        job.stdout = stdout.read
        job.stderr = stderr.read
      end

      job
    end
  end
end
