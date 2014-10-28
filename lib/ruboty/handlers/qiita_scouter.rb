require 'ruboty/qiita_scouter/actions/analyze'

module Ruboty
  # Handlers
  module Handlers
    # QiitaScouter
    class QiitaScouter < Base
      on(
        /qiita scouter (?<id>.+?)\z/,
        name: 'analyze',
        description: 'analyze qiita power'
      )

      def analyze(message)
        Ruboty::QiitaScouter::Actions::Analyze.new(message).call
      end
    end
  end
end
