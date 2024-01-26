# frozen_string_literal: true

require 'legislative_data/models'

module LegislativeData
  class Service
    def initialize
      @legislative_data = legislative_data
      @bills = @legislative_data[:bills]
      @legislators = @legislative_data[:legislators]
      @vote_results = @legislative_data[:vote_results]
      @votes = @legislative_data[:votes]
    end

    def voted_bills_by_legislators
      @legislators.map do |legislator|
        vote_results = legislator.vote_results(@vote_results)

        voted_bills_by_legislator(legislator)
          .tap { |legislator_hash| sum_legislator_votes(legislator_hash, vote_results) }
      end
    end

    private

    def legislative_data
      LegislativeData::Models.populate
    end

    def voted_bills_by_legislator(legislator)
      HashMapper.new
                .voted_bills_by_legislator(legislator)
                .hash_map
    end

    def sum_legislator_votes(legislator, vote_results)
      vote_results.each do |vote_result|
        vote_for = vote_result.vote_type == 1 ? :supported : :opposed
        legislator[vote_for] += 1
      end

      legislator
    end
  end
end
