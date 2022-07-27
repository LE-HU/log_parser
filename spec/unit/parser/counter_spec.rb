# frozen_string_literal: true

describe Parser::Counter do
  describe '#count' do
    let(:log) { File.open("#{RSPEC_ROOT}/fixtures/example.log") }
    let(:views) do
      {
        '/contact' => 1,
        '/about/2' => 1,
        '/help_page/1' => 2
      }
    end

    let(:uniq_views) do
      {
        '/help_page/1' => 1,
        '/contact' => 1,
        '/about/2' => 1
      }
    end

    describe 'when no options provided' do
      it 'counts hash with url-ip pairs of all views' do
        expect(described_class.new(log: log, uniq: nil).count).to eq(views)
      end
    end

    describe 'when uniq option provided' do
      it 'counts hash with url-ip pairs of unique views' do
        expect(described_class.new(log: log, uniq: true).count).to eq(uniq_views)
      end
    end
  end
end
