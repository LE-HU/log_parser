# frozen_string_literal: true

describe Interface do
  before(:all) do
    Object.send(:remove_const, :ARGV) if ARGF.argv.include?('spec/unit/main_spec.rb')
  end

  before do
    allow($stdout).to receive(:write)
  end

  after do
    Object.send(:remove_const, :ARGV)
  end

  describe '#options' do
    before do
      ARGV = ['-f', 'specs/fixtures/example.log']
    end

    it 'parses options input via the cli' do
      options = Interface.new.options
      expect(options).to eq({ file: 'specs/fixtures/example.log' })
    end
  end

  describe 'no ARGV passed' do
    before do
      ARGV = []
    end

    it 'prints help to stdout' do
      expect { Interface.new.options }.to output(/Usage: parse.rb/).to_stdout
    end
  end

  describe 'wrong option passed as ARGV' do
    before do
      ARGV = ['-f', 'specs/fixtures/example.log', '-rb']
    end

    it 'exits the program' do
      expect { Interface.new.options }.to raise_error SystemExit
    end
  end

  describe 'no file passed as ARGV' do
    before do
      ARGV = ['-f']
    end

    it 'exits the program' do
      expect { Interface.new.options }.to raise_error SystemExit
    end
  end
end
