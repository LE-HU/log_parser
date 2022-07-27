# frozen_string_literal: true

module Parser
  class Counter
    def initialize(log:, uniq:)
      @log = log
      @uniq = uniq
    end

    def count
      uniq.nil? ? all_views : uniq_views
    end

    private

    attr_reader :log, :uniq

    def uniq_views
      list = log.each_with_object({}) do |line, hash|
        path, ip = line.split
        hash[path] ||= []
        hash[path] << ip unless hash[path].include? ip
      end

      list.each { |path, ip_array| list[path] = ip_array.size }
    end

    def all_views
      log.each_with_object(Hash.new(0)) do |line, hash|
        path, = line.split
        hash[path] += 1
      end
    end
  end
end
