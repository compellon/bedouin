module Bedouin
  class CLI
    def execute(env_path, *template_paths)
      e = Bedouin.environment_for(env_path)

      template_paths.lazy.map do |path|
        t = Bedouin.template_for(path)
        j = Bedouin::Job.new(e, t)
        Bedouin::Runner.new.run(j)
      end.reduce(0) do |m,j|
        puts j.to_s
        j.status == 0 ? m : 1
      end
    end
  end
end
