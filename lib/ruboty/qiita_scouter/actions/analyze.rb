# encoding: utf-8
# rubocop:disable LineLength
module Ruboty
  module QiitaScouter
    # Actions
    module Actions
      # Analyze Qiita power
      class Analyze < Ruboty::Actions::Base
        def call
          message.reply(analyze)
        end

        private

        def analyze
          power_levels = ::QiitaScouter::Core.new.analyze(id)
          format("ユーザー名: %s 戦闘力: %s 攻撃力: %s 知力: %s すばやさ: %s", id, *power_levels)
        rescue => e
          format("Failed by %s", e.class.name)
        end

        def id
          message[:id]
        end
      end
    end
  end
end
# rubocop:enable LineLength
