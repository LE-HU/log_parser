# frozen_string_literal: true

module Parser
  class Sorter
    def initialize(views:)
      @views = views
    end

    def sort
      views.sort_by { |_k, v| -v }
    end

    private

    attr_reader :views
  end
end
