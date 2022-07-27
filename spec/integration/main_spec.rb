# frozen_string_literal: true

describe Parser::Main do
  describe '#parse' do
    before(:all) do
      Object.send(:remove_const, :ARGV) if ARGF.argv.include?('spec/integration/main_spec.rb')
    end

    before do
      allow($stdout).to receive(:write)
    end

    after do
      Object.send(:remove_const, :ARGV)
    end

    describe 'without any flag' do
      before do
        ARGV = ['-f', 'spec/fixtures/example.log']
      end

      it 'prints list of webpages with most views' do
        parser = Parser::Main.new(options: Interface.new.options)
        expect { parser.parse }.to output(/List of webpages with most views/).to_stdout
      end
    end

    describe 'with unique flag' do
      before do
        ARGV = ['-f', 'spec/fixtures/example.log', '-u']
      end

      it 'prints list of webpages with most unique views' do
        parser = Parser::Main.new(options: Interface.new.options)
        expect { parser.parse }.to output(/List of webpages with most unique views/).to_stdout
      end
    end

    describe 'with non existing file passed as an argument' do
      before do
        ARGV = ['-f', 'non_existing_file.log']
      end

      it 'exits the program' do
        parser = Parser::Main.new(options: Interface.new.options)
        expect { parser.parse }.to raise_error SystemExit
      end
    end
  end
end
