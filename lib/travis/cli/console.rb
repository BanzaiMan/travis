require 'travis/cli'
Travis::CLI.silent { require 'pry' }

module Travis
  module CLI
    class Console < ApiCommand
      description "interactive shell"

      def run
        Object.send(:include, Client::Namespace.new(session))
        binding.pry(:quiet => true, :prompt => Pry::SIMPLE_PROMPT, :output => $stdout)
      end
    end
  end
end
