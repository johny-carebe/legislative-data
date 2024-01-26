# frozen_string_literal: true

module LegislativeData
  module Models
    class Vote
      attr_reader :id, :bill_id

      def initialize(id:, bill_id:)
        @id = id
        @bill_id = bill_id
      end

      def self.attrs
        %i[id bill_id]
      end

      def vote_results(vote_results)
        vote_results.select { |vote_result| vote_result.vote_id == @id }
      end
    end
  end
end
