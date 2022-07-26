# frozen_string_literal: true

require_relative 'interface'

class Parser
  FILE_NOT_FOUND = 'File not found.'

  def initialize(options:)
    @options = options
    @file = open_file
  end

  def parse
    options[:uniq] ? print_views(:unique) : print_views
  end

  private

  attr_accessor :file, :options

  def open_file
    if options[:file]
      File.open(options[:file])
    else
      exit
    end
  rescue Errno::ENOENT
    puts FILE_NOT_FOUND
    exit
  end

  def print_views(option = :all)
    adjective = option == :unique ? 'unique ' : ''

    puts "List of webpages with most #{adjective}views:"

    send(option).each_with_index do |pair, i|
      puts "#{i + 1}. #{pair[0]} ".ljust(20, '.') + "#{pair[1]} #{adjective}views"
    end
  end

  def unique
    views = @file.each_with_object({}) do |line, hash|
      path, ip = line.split(' ')
      hash[path] ||= []
      hash[path] << ip unless hash[path].include? ip
    end

    views.each { |k, v| views[k] = v.size }
    views.sort_by { |_k, v| -v }
  end

  def all
    views = @file.each_with_object(Hash.new(0)) do |line, hash|
      path, = line.split(' ')
      hash[path] += 1
    end

    views.sort_by { |_k, v| -v }
  end
end
