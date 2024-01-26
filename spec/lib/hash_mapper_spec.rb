# frozen_string_literal: true

require 'csv'
require_relative '../../lib/hash_mapper'

describe HashMapper do
  let(:instance) { described_class.new }

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
