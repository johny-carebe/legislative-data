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
      model_string = LegislativeData::Models.underscore(model.to_s)
      models_sym = :"#{model_string}s"

      @hash_map[models_sym] = populate_model(model)
    end

    self
  end

  def voted_bills_by_legislator(legislator)
    @hash_map[:legislator_id] = legislator.id
    @hash_map[:legislator_name] = legislator.name
    @hash_map[:supported] = 0
    @hash_map[:opposed] = 0

    self
  end

  def bill_support(bill, legislators, vote_results, votes)
    @hash_map[:bill_id] = bill.id
    @hash_map[:bill_title] = bill.title
    @hash_map[:principal_sponsor] = bill&.sponsor(legislators)&.name
    @hash_map[:supporters] = bill.supporters(legislators, vote_results, votes)
    @hash_map[:opposers] = bill.opposers(legislators, vote_results, votes)

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
