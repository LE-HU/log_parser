# frozen_string_literal: true

module Parser
  class FileHandler
    FILE_NOT_FOUND = 'File not found.'

    def initialize(filepath:)
      @filepath = filepath
    end

    def call
      if filepath
        File.open(filepath)
      else
        exit
      end
    rescue Errno::ENOENT
      puts FILE_NOT_FOUND
      exit
    end

    private

    attr_reader :filepath
  end
end
