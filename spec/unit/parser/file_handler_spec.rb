# frozen_string_literal: true

describe Parser::FileHandler do
  describe '#open' do
    let(:log) { File.open("#{RSPEC_ROOT}/fixtures/example.log") }

    it 'counts hash with url-ip pairs of all views' do
      file_handle = described_class.new(filepath: "#{RSPEC_ROOT}/fixtures/example.log").open
      expect(file_handle.class).to eq(File)
      expect(file_handle.path).to eq(log.path)
    end
  end
end
