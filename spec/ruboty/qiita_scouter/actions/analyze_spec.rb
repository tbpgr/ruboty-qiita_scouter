# encoding: utf-8
require 'spec_helper'
require 'qiita_scouter_core'
require 'ruboty/qiita_scouter/actions/analyze'

# rubocop:disable LineLength, UnusedMethodArgument
describe Ruboty::QiitaScouter::Actions::Analyze do
  context :analyze do
    let(:message) do
      # Dummy Message
      class Message < Hash
        def reply(message)
          message
        end
      end
      Message.new
    end

    let(:qiita_scouter) do
      ::QiitaScouter::Core
    end

    cases = [
      {
        case_no: 1,
        case_title: 'exist user case',
        id: 'tbpgr',
        power_levels: [600, 200, 300, 100],
        expected: "ユーザー名: tbpgr 戦闘力: 600 攻撃力: 200 知力: 300 すばやさ: 100\n"
      },
      {
        case_no: 2,
        case_title: 'not exist user case',
        id: 'tbpgr',
        expected: 'Failed by NoMethodError',
        expect_error: true
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          message[:id] = c[:id]
          if c[:expect_error]
            allow_any_instance_of(qiita_scouter).to receive(:analyze).with(c[:id]).and_raise(NoMethodError)
          else
            allow_any_instance_of(qiita_scouter).to receive(:analyze).with(c[:id]).and_return(c[:power_levels])
          end
          action = Ruboty::QiitaScouter::Actions::Analyze.new(message)

          # -- when --
          actual = action.send(:analyze)

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(_c)
        # implement each case before
      end

      def case_after(_c)
        # implement each case after
      end
    end
  end
end
# rubocop:enable LineLength, UnusedMethodArgument
