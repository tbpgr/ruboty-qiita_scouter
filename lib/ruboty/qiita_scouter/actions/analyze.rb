module Ruboty
  module QiitaScouter
    # Actions
    module Actions
      DISPLAY_FORMAT = "ユーザー名: %s 戦闘力: %s 攻撃力: %s 知力: %s すばやさ: %s"
      NOT_EXIST_MESSAGE = 'Failed by %s'

      # Analyze Qiita power
      class Analyze < Ruboty::Actions::Base
        def call
          message.reply(analyze)
        end

        private

        def analyze
          power_levels = ::QiitaScouter::Core.new.analyze(id)
          format(DISPLAY_FORMAT, id, *power_levels)
        rescue => e
          format(NOT_EXIST_MESSAGE, e.class.name)
        end

        def id
          message[:id]
        end
      end
    end
  end
end
