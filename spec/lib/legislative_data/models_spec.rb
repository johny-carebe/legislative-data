# frozen_string_literal: true

require_relative '../../../lib/legislative_data/models'
require_relative '../../../lib/legislative_data/models/bill'
require_relative '../../../lib/legislative_data/models/legislator'
require_relative '../../../lib/legislative_data/models/vote_result'
require_relative '../../../lib/legislative_data/models/vote'

describe LegislativeData::Models do
  let(:model) { 'Bill' }

  describe '#bulk_create' do
    subject { described_class.bulk_create(model) }

    let(:first_bill) do
      {
        id: 2952375,
        title: 'H.R. 5376: Build Back Better Act',
        sponsor_id: 412211
      }
    end

    let(:second_bill) do
      {
        id: 2900994,
        title: 'H.R. 3684: Infrastructure Investment and Jobs Act',
        sponsor_id: 400100
      }
    end

    let(:expected_params) do
      [
        {
          id: subject.first.id,
          title: subject.first.title,
          sponsor_id: subject.first.sponsor_id
        },
        {
          id: subject.last.id,
          title: subject.last.title,
          sponsor_id: subject.last.sponsor_id
        }
      ]
    end

    before do
      allow(described_class)
        .to receive(:csv_file_path)
        .and_return('spec/fixtures/csv/bills.csv')
    end

    it { expect(expected_params).to include(first_bill, second_bill) }
  end

  describe '#populate' do
    subject { described_class.populate }

    let(:models_sym) { :"#{model.downcase}s" }
    let(:model_class) { Object.const_get(described_class.class_name(model)) }

    it 'populates models' do
      expect(subject[models_sym].first).to be_instance_of(model_class)
    end
  end

  describe '#models_list' do
    subject { described_class.models_list }

    let(:models_list) { %w[Bill Legislator VoteResult Vote] }

    it { is_expected.to include(*models_list) }
  end

  describe '#csv_file_path' do
    subject { described_class.csv_file_path(model) }

    it { expect(subject).to end_with("#{model.downcase}s.csv") }

    context 'when model is multiple camel case' do
      let(:model) { 'VeryLongCamelCaseString' }

      it { expect(subject).to end_with('very_long_camel_case_strings.csv') }
    end
  end

  describe '#class_name' do
    subject { described_class.class_name(model) }

    it { expect(subject).to eq("LegislativeData::Models::#{model}") }
  end
end
