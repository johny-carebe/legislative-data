# frozen_string_literal: true

require_relative '../../../../lib/legislative_data/models/legislator'

describe LegislativeData::Models::Legislator do
  describe '#initialize' do
    subject { described_class.new(**legislator_params) }

    let(:id) { 904789 }
    let(:name) { 'Rep. Don Bacon (R-NE-2)' }
    let(:legislator_params) { { id:, name: } }

    let(:legislator_attrs) do
      {
        id: subject.id,
        name: subject.name
      }
    end

    it { expect(legislator_attrs).to eq(legislator_params) }
  end
end
