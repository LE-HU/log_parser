# frozen_string_literal: true

describe Parser::Counter do
  describe '#call' do
    describe 'when log file has valid structure' do
      let(:valid_log) { File.open("#{RSPEC_ROOT}/parser/fixtures/valid.log") }

      describe 'when no uniq option provided' do
        let(:views) do
          {
            '/contact' => 1,
            '/about/2' => 1,
            '/help_page/1' => 2
          }
        end

        it 'counts hash with path-ip pairs of all views' do
          expect(described_class.new(log: valid_log, uniq: nil).call).to eq(views)
        end
      end

      describe 'when uniq option provided' do
        let(:uniq_views) do
          {
            '/help_page/1' => 1,
            '/contact' => 1,
            '/about/2' => 1
          }
        end

        it 'counts hash with path-ip pairs of unique views' do
          expect(described_class.new(log: valid_log, uniq: true).call).to eq(uniq_views)
        end
      end
    end

    describe 'when log file has invalid structure' do
      let(:invalid_log) { File.open("#{RSPEC_ROOT}/parser/fixtures/invalid.log") }

      it 'exits the program' do
        expect { described_class.new(log: invalid_log, uniq: nil).call }.to raise_error SystemExit
      end
    end
  end
end
