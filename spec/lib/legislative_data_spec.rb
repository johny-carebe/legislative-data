# frozen_string_literal: true

require_relative '../../lib/legislative_data'

describe LegislativeData do
  let(:generated_csv) { File.read(generated_csv_file_path) }
  let(:fixture_csv) { File.read(fixture_csv_file_path) }
  let(:generated_csv_file_path) { "files/output/csv/#{file_name}.csv" }
  let(:fixture_csv_file_path) { "spec/fixtures/csv/#{file_name}-output.csv" }

  before { subject }

  describe '#legislators_support_oppose_count' do
    subject { described_class.legislators_support_oppose_count }

    let(:file_name) { 'legislators-support-oppose-count' }

    it 'generates a csv file equals to fixture file' do
      expect(generated_csv).to eq(fixture_csv)
    end
  end

  describe '#bills' do
    subject { described_class.bills }

    let(:file_name) { 'bills' }

    it 'generates a csv file equals to fixture file' do
      expect(generated_csv).to eq(fixture_csv)
    end
  end
end
