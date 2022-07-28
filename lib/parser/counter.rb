# frozen_string_literal: true

module Parser
  class Counter
    INVALID_DATA = 'File cannot be processed. Please check data integrity per <path> <ip> pairs.'

    def initialize(log:, uniq:)
      @log = log
      @uniq = uniq
    end

    def call
      uniq.nil? ? all_views : uniq_views
    rescue StandardError
      puts INVALID_DATA
      exit
    end

    private

    attr_reader :log, :uniq

    def uniq_views
      list = log.each_with_object({}) do |line, hash|
        path, ip = path_ip_pair(line)
        hash[path] ||= []
        hash[path] << ip unless hash[path].include? ip
      end

      list.each { |path, ip_array| list[path] = ip_array.size }
    end

    def path_ip_pair(line)
      path_ip_pair = line.split
      raise StandardError if path_ip_pair.size != 2

      path_ip_pair
    end

    def all_views
      log.each_with_object(Hash.new(0)) do |line, hash|
        path, = path_ip_pair(line)
        hash[path] += 1
      end
    end
  end
end
