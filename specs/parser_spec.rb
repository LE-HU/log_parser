# frozen_string_literal: true

require_relative '../lib/parser'
require 'pry'

describe Parser do
  describe '#parse' do
    before(:all) do
      Object.send(:remove_const, :ARGV) if ARGF.argv.include?('specs/parser_spec.rb')
    end

    before do
      allow($stdout).to receive(:write)
    end

    after do
      Object.send(:remove_const, :ARGV)
    end

    describe 'without any flag' do
      let(:expected_default_output) do
        [['/help_page/1', 2], ['/contact', 1], ['/about/2', 1]]
      end

      before do
        ARGV = ['-f', 'specs/fixtures/example.log']
      end

      it 'returns an array of parsed views' do
        parser = Parser.new(options: Interface.new.options)
        expect(parser.parse).to eq(expected_default_output)
      end

      it 'prints list of webpages with most views' do
        parser = Parser.new(options: Interface.new.options)
        expect { parser.parse }.to output(/List of webpages with most views/).to_stdout
      end
    end

    describe 'with unique flag' do
      let(:expected_default_output) do
        [['/help_page/1', 1], ['/contact', 1], ['/about/2', 1]]
      end

      before do
        ARGV = ['-f', 'specs/fixtures/example.log', '-u']
      end

      it 'returns an array of parsed unique views' do
        parser = Parser.new(options: Interface.new.options)
        expect(parser.parse).to eq(expected_default_output)
      end

      it 'prints list of webpages with most unique views' do
        parser = Parser.new(options: Interface.new.options)
        expect { parser.parse }.to output(/List of webpages with most unique views/).to_stdout
      end
    end

    describe 'with non existing file passed as an argument' do
      before do
        ARGV = ['-f', 'non_existing_file.log']
      end

      it 'exits the program' do
        expect { Parser.new(options: Interface.new.options) }.to raise_error SystemExit
      end
    end
  end
end
