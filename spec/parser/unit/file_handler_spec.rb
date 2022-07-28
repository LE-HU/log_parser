# frozen_string_literal: true

describe Parser::FileHandler do
  describe '#call' do
    describe 'when filepath is valid' do
      let(:log) { File.open("#{RSPEC_ROOT}/parser/fixtures/valid.log") }

      it 'opens the log file' do
        file_handle = described_class.new(filepath: "#{RSPEC_ROOT}/parser/fixtures/valid.log").call
        expect(file_handle.class).to eq(File)
        expect(file_handle.path).to eq(log.path)
      end
    end

    describe 'when filepath is invalid' do
      it 'exits the program' do
        expect { described_class.new(filepath: 'foo').call }.to raise_error SystemExit
      end
    end
  end
end
