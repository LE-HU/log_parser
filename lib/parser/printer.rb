# frozen_string_literal: true

module Parser
  class Printer
    def initialize(data:, uniq:)
      @data = data
      @uniq = uniq
    end

    def call
      adjective = (uniq.nil? ? '' : 'unique ')

      puts "List of webpages with most #{adjective}views:"

      data.each_with_index do |path_ip_pair, i|
        puts "#{i + 1}. #{path_ip_pair[0]} ".ljust(20, '.') + "#{path_ip_pair[1]} #{adjective}views"
      end
    end

    private

    attr_reader :data, :uniq
  end
end
