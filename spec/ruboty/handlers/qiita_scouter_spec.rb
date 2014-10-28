# encoding: utf-8
require 'spec_helper'
require 'ruboty/handlers/qiita_scouter'
require 'ruboty/qiita_scouter/actions/analyze'

# rubocop:disable LineLength, UnusedMethodArgument
describe Ruboty::Handlers::QiitaScouter do
  context :analyze do
    let(:robot) do
      Ruboty::Robot.new
    end

    let(:analyze) do
      Ruboty::QiitaScouter::Actions::Analyze
    end

    cases = [
      {
        case_no: 1,
        case_title: 'exist id case',
        body: 'ruboty qiita scouter tbpgr',
        expected: 'expected message',
        hit: true
      },
      {
        case_no: 2,
        case_title: 'not hit message case',
        body: 'ruboty not_exist message',
        expected: 'expected message',
        hit: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          allow_any_instance_of(analyze).to receive(:analyze).and_return(c[:expected])

          # -- then --
          if c[:hit]
            Ruboty.logger.should_receive(:info).with(c[:expected])
          else
            Ruboty.logger.should_not_receive(:info)
          end

          # -- when --
          robot.receive(body: c[:body], from: 'sender', to: 'channel')
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
