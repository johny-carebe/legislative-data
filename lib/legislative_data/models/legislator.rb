# frozen_string_literal: true

module LegislativeData
  module Models
    class Legislator
      attr_accessor :id, :name

      def initialize(id:, name:)
        @id = id
        @name = name
      end

      def self.attrs
        %i[id name]
      end

      def vote_results(vote_results)
        vote_results.find { |vote_result| vote_result.legislator_id == @id }
      end
    end
  end
end
