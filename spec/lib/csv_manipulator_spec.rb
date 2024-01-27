# frozen_string_literal: true

require_relative '../../lib/csv_manipulator'

describe CsvManipulator do
  describe '#to_hash_list' do
    subject { described_class.to_hash_list(file_path, attrs) }

    context 'when parsing from a csv file' do
      let(:file_path) { 'spec/fixtures/csv/bills.csv' }
      let(:attrs) { %i[id title sponsor_id] }

      let(:to_hash_list_params) do
        [
          {
            id: 2952375,
            title: 'H.R. 5376: Build Back Better Act',
            sponsor_id: 412211
          },
          {
            id: 2900994,
            title: 'H.R. 3684: Infrastructure Investment and Jobs Act',
            sponsor_id: 400100
          }
        ]
      end

      it { is_expected.to eq(to_hash_list_params) }
    end
  end
end
