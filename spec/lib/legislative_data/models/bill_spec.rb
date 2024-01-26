# frozen_string_literal: true

require_relative '../../../../lib/legislative_data/models/bill'

describe LegislativeData::Models::Bill do
  describe '#initialize' do
    subject { described_class.new(**bill_params) }

    let(:id) { 2952375 }
    let(:title) { 'H.R. 5376: Build Back Better Act' }
    let(:sponsor_id) { 412211 }
    let(:bill_params) { { id:, title:, sponsor_id: } }

    let(:bill_attrs) do
      {
        id: subject.id,
        title: subject.title,
        sponsor_id: subject.sponsor_id
      }
    end

    it { expect(bill_attrs).to eq(bill_params) }
  end
end
