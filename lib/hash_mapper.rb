# frozen_string_literal: true

require 'legislative_data/models'
class HashMapper
  attr_reader :hash_map

  def initialize(hash_map = {})
    @hash_map = hash_map
  end

  def from_csv_row(csv_row, attrs_symbols_list)
    attrs_symbols_list.each do |attr|
      attr_value = csv_row[attr.to_s]
      @hash_map[attr] = to_i_or_self(attr_value)
    end

    self
  end

  def populate_models(models_list)
    models_list.each do |model|
      models_sym = :"#{model.downcase}s"

      @hash_map[models_sym] = populate_model(model)
    end

    self
  end

  private

  def to_i_or_self(value)
    Integer(value)
  rescue ArgumentError
    value
  end

  def populate_model(model)
    LegislativeData::Models.bulk_create(model)
  end
end
