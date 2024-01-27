# frozen_string_literal: true

require 'csv'
require 'hash_mapper'

module CsvManipulator
  class << self
    def from_csv_to_hash_list(file_path, attrs)
      hash_list = []

      CSV.foreach(file_path, headers: true) do |row|
        hash = HashMapper.new
                         .from_csv_row(row, attrs)
                         .hash_map

        hash_list << hash
      end

      hash_list
    end

    def from_hash_list_to_csv(file_name, hash_list, accessors, attrs)
      CSV.open("files/output/csv/#{file_name}.csv", 'w') do |csv|
        csv << attrs

        hash_list.each do |hash|
          row = accessors.map { |accessor| hash[accessor] }
          csv << row
        end
      end
    end
  end
end
