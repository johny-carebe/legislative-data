# frozen_string_literal: true

require_relative '../../../../lib/legislative_data/models/vote'

describe LegislativeData::Models::Vote do
  describe '#initialize' do
    subject { described_class.new(**vote_params) }

    let(:id) { 3314452 }
    let(:bill_id) { 2900994 }
    let(:vote_params) { { id:, bill_id: } }

    let(:vote_attrs) do
      {
        id: subject.id,
        bill_id: subject.bill_id
      }
    end

    it { expect(vote_attrs).to eq(vote_params) }
  end
end
