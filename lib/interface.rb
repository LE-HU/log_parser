# frozen_string_literal: true

require 'optparse'

class Interface
  INVALID_OPTION = 'Option not supported. Please see --help for available options.'
  MISSING_ARGUMENT = 'Please provide a valid filename.'

  attr_accessor :options

  def initialize
    @options = {}
    user_options
  end

  private

  def user_options
    non_option_arguments = argv_parser.parse!(into: options)
    options.merge!({ file: ARGV[0] }) unless non_option_arguments.empty?
  rescue OptionParser::InvalidOption
    puts INVALID_OPTION
    exit
  rescue OptionParser::MissingArgument
    puts MISSING_ARGUMENT
    exit
  end

  def argv_parser
    OptionParser.new do |parser|
      parser.banner = 'Usage: parse.rb [options]'

      parser.on('-f', '--file FILE', 'Specify log file', "Lists all views by default\n")
      parser.on('-u', '--uniq', 'List unique views')

      puts parser if parser.default_argv.empty?
    end
  end
end
