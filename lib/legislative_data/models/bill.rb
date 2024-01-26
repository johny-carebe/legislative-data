# frozen_string_literal: true

module LegislativeData
  module Models
    class Bill
      attr_reader :id, :title, :sponsor_id

      def initialize(id:, title:, sponsor_id:)
        @id = id
        @title = title
        @sponsor_id = sponsor_id
      end

      def self.attrs
        %i[id title sponsor_id]
      end

      def sponsor(legislators)
        legislators.find { |legislator| legislator.id == @sponsor_id }
      end

      def supporters(legislators, vote_results, votes)
        vote_results(votes, vote_results)
          .select(&:supporter?)
          .map { |vote_result| vote_result.legislator(legislators).name }
      end

      def opposers(legislators, vote_results, votes)
        vote_results(votes, vote_results)
          .reject(&:supporter?)
          .map { |vote_result| vote_result.legislator(legislators).name }
      end

      def vote_results(votes, vote_results)
        vote(votes).vote_results(vote_results)
      end

      def vote(votes)
        votes.find { |vote| vote.bill_id == @id }
      end
    end
  end
end
