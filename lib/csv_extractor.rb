# frozen_string_literal: true

require 'csv'
require 'hash_mapper'

module CsvExtractor
  class << self
    def to_hash_list(file_path, attrs)
      hash_list = []

      CSV.foreach(file_path, headers: true) do |row|
        hash = HashMapper.new
                         .from_csv_row(row, attrs)
                         .hash_map

        hash_list << hash
      end

      hash_list
    end
  end
end
