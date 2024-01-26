# frozen_string_literal: true

require 'csv_extractor'
require 'hash_mapper'
require 'legislative_data/models/bill'
require 'legislative_data/models/legislator'
require 'legislative_data/models/vote_result'
require 'legislative_data/models/vote'

module LegislativeData
  module Models
    class << self
      def bulk_create(model)
        class_name = Object.const_get(class_name(model))

        CsvExtractor
          .to_hash_list(csv_file_path(model), class_name.attrs)
          .map { |attrs| class_name.new(**attrs) }
      end

      def populate
        HashMapper.new
                  .populate_models(models_list)
                  .hash_map
      end

      def models_list
        LegislativeData::Models.constants.map(&:to_s)
      end

      def class_name(model)
        "LegislativeData::Models::#{model}"
      end

      def csv_file_path(model)
        "files/csv/#{underscore(model)}s.csv"
      end

      def underscore(string)
        string
          .gsub('::', '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr('-', '_')
          .downcase
      end
    end
  end
end
