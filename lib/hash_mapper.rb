# frozen_string_literal: true

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

  private

  def to_i_or_self(value)
    Integer(value)
  rescue ArgumentError
    value
  end
end
