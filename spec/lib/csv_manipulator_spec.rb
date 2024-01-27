# frozen_string_literal: true

require_relative '../../lib/csv_manipulator'

describe CsvManipulator do
  describe '#from_csv_to_hash_list' do
    subject { described_class.from_csv_to_hash_list(file_path, attrs) }

    context 'when parsing from a csv file' do
      let(:file_path) { 'spec/fixtures/csv/bills.csv' }
      let(:attrs) { %i[id title sponsor_id] }

      let(:from_csv_to_hash_list_params) do
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

      it { is_expected.to eq(from_csv_to_hash_list_params) }
    end
  end

  describe '#from_hash_list_to_csv' do
    subject { described_class.from_hash_list_to_csv(file_name, hash_list, accessors, attrs) }

    context 'when parsing from a csv file' do
      let(:file_name) { 'test_file' }
      let(:file_path) { "files/output/csv/#{file_name}.csv" }
      let(:csv_content) { File.read(file_path) }

      let(:hash_list) do
        [
          { id: 1, name: 'John', age: 'unknown' },
          { id: 2, name: 'Titor', age: 'unknown' }
        ]
      end

      let(:accessors) { %i[id name age] }
      let(:attrs) { %w[id name age] }

      let(:expected_csv_data) do
        "id,name,age\n" \
          "1,John,unknown\n" \
          "2,Titor,unknown\n"
      end

      after { File.delete(file_path) }

      it 'writes data from hash list to CSV file' do
        subject

        expect(File.exist?(file_path)).to be_truthy
        expect(csv_content).to eq(expected_csv_data)
      end
    end
  end
end
