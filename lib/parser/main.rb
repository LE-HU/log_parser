# frozen_string_literal: true

module Parser
  class Main
    def initialize(options:)
      @options = options
    end

    def parse
      Parser::Printer.new(data: sorted_views, uniq: options[:uniq]).call
      log.close
    end

    private

    attr_reader :options

    def sorted_views
      Parser::Sorter.new(views: views).call
    end

    def views
      Parser::Counter.new(log: log, uniq: options[:uniq]).call
    end

    def log
      Parser::FileHandler.new(filepath: options[:file]).call
    end
  end
end
