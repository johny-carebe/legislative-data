# frozen_string_literal: true

require 'csv_manipulator'
require 'legislative_data/service'

module LegislativeData
  class << self
    def legislators_support_oppose_count
      file_name = 'legislators-support-oppose-count'
      hash_list = service.voted_bills_by_legislators
      accessors = %i[legislator_id legislator_name supported opposed]
      attrs = %w[id name num_supported_bills num_opposed_bills]

      CsvManipulator.from_hash_list_to_csv(file_name, hash_list, accessors, attrs)
    end

    def bills
      file_name = 'bills'
      hash_list = service.bills_support

      hash_list.each do |hash|
        hash[:supporters] = hash[:supporters].count
        hash[:opposers] = hash[:opposers].count
      end

      accessors = %i[bill_id bill_title supporters opposers principal_sponsor]
      attrs = %w[id title supporter_count opposer_count primary_sponsor]

      CsvManipulator.from_hash_list_to_csv(file_name, hash_list, accessors, attrs)
    end

    private

    def service
      @service ||= LegislativeData::Service.new
    end
  end
end
