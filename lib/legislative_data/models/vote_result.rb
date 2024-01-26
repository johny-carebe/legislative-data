# frozen_string_literal: true

module LegislativeData
  module Models
    class VoteResult
      attr_reader :id, :legislator_id, :vote_id, :vote_type

      SUPPORTER_VOTE_TYPE = 1

      def initialize(id:, legislator_id:, vote_id:, vote_type:)
        @id = id
        @legislator_id = legislator_id
        @vote_id = vote_id
        @vote_type = vote_type
      end

      def self.attrs
        %i[id legislator_id vote_id vote_type]
      end

      def legislator(legislators)
        legislators.find { |legislator| legislator.id == @legislator_id }
      end

      def supporter?
        @vote_type == SUPPORTER_VOTE_TYPE
      end
    end
  end
end
