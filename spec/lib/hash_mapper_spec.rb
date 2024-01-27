# frozen_string_literal: true

require 'csv'
require_relative '../../lib/hash_mapper'

describe HashMapper do
  let(:instance) { described_class.new }
  let(:models) { LegislativeData::Models }
  let(:legislator) { models::Legislator.new(id: 1, name: 'Legis Lator') }
  let(:supporter) { legislator.id }
  let(:opposer) { 2 }
  let(:bill) { models::Bill.new(id: 1, title: 'Bill Title', sponsor_id: supporter) }
  let(:legislators) { [legislator, models::Legislator.new(id: opposer, name: 'Lator Legis')] }
  let(:vote) { models::Vote.new(id: 1, bill_id: bill.id) }
  let(:votes) { [vote, models::Vote.new(id: 2, bill_id: bill.id + 1)] }

  let(:vote_results) do
    [
      models::VoteResult.new(id: 1,
                             legislator_id: supporter,
                             vote_id: vote.id,
                             vote_type: supporter),
      models::VoteResult.new(id: 2, legislator_id: opposer, vote_id: vote.id, vote_type: opposer)
    ]
  end

  describe '#from_csv_row' do
    subject do
      instance
        .from_csv_row(csv_row, attrs_symbols_list)
        .hash_map
    end

    context 'when a csv row and attributes symbols list is received' do
      let(:attrs_symbols_list) { %i[id title sponsor_id] }
      let(:csv_values) { ['2952375', 'H.R. 5376: Build Back Better Act', '412211'] }
      let(:csv_row) { CSV::Row.new(attrs_symbols_list.map(&:to_s), csv_values) }

      let(:from_csv_row_params) do
        {
          id: 2952375,
          title: 'H.R. 5376: Build Back Better Act',
          sponsor_id: 412211
        }
      end

      it { is_expected.to eq(from_csv_row_params) }
    end
  end

  describe '#populate_models' do
    subject do
      instance
        .populate_models(models_list)
        .hash_map
    end

    context 'when populate_models() is called with a list of models name' do
      let(:models_list) { %w[Bill Legislator VoteResult Vote] }

      let(:models_are_populated) do
        subject.values.all? { |model_list| model_list.is_a?(Array) && !model_list.empty? }
      end

      it 'populates all models' do
        expect(subject.length).to eq(models_list.count)
        expect(models_are_populated).to be_truthy
      end
    end
  end

  describe '#voted_bills_by_legislator' do
    subject do
      instance
        .voted_bills_by_legislator(legislator)
        .hash_map
    end

    let(:voted_bills_by_legislator_params) do
      {
        legislator_id: 1,
        legislator_name: 'Legis Lator',
        supported: 0,
        opposed: 0
      }
    end

    it { is_expected.to eq(voted_bills_by_legislator_params) }
  end

  describe '#bill_support' do
    subject do
      instance
        .bill_support(bill, legislators, vote_results, votes)
        .hash_map
    end

    let(:bill_support_params) do
      {
        bill_id: 1,
        bill_title: 'Bill Title',
        principal_sponsor: 'Legis Lator',
        supporters: ['Legis Lator'],
        opposers: ['Lator Legis']
      }
    end

    it { is_expected.to eq(bill_support_params) }
  end

  describe '#hash_map' do
    context 'when mapping with no attributes' do
      subject { instance.hash_map }

      it { is_expected.to eq({}) }
    end

    context 'when mapping with attributes' do
      subject { described_class.new(attrs).hash_map }

      let(:attrs) { { status: :ok } }

      it { is_expected.to eq(attrs) }
    end
  end
end
