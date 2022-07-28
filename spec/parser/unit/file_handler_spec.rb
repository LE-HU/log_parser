# frozen_string_literal: true

describe Parser::FileHandler do
  describe '#call' do
    let(:log) { File.open("#{RSPEC_ROOT}/parser/fixtures/example.log") }

    it 'counts hash with url-ip pairs of all views' do
      file_handle = described_class.new(filepath: "#{RSPEC_ROOT}/parser/fixtures/example.log").call
      expect(file_handle.class).to eq(File)
      expect(file_handle.path).to eq(log.path)
    end
  end
end
