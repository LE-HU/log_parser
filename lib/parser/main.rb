# frozen_string_literal: true

module Parser
  class Main
    def initialize(options:)
      @options = options
    end

    def parse
      Parser::Printer.new(data: sorted_views, uniq: options[:uniq]).print
    end

    private

    attr_accessor :options

    def sorted_views
      @sorted_views ||= Parser::Sorter.new(views: views).sort
    end

    def views
      @views ||= Parser::Counter.new(log: log, uniq: options[:uniq]).count
    end

    def log
      @log ||= Parser::FileHandler.new(filepath: options[:file]).open
    end
  end
end
