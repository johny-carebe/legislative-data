# frozen_string_literal: true

require_relative '../../../../lib/legislative_data/models/vote_result'

describe LegislativeData::Models::VoteResult do
  describe '#initialize' do
    subject { described_class.new(**vote_result_params) }

    let(:id) { 92516784 }
    let(:legislator_id) { 400440 }
    let(:vote_id) { 3321166 }
    let(:vote_type) { 2 }
    let(:vote_result_params) { { id:, legislator_id:, vote_id:, vote_type: } }

    let(:vote_result_attrs) do
      {
        id: subject.id,
        legislator_id: subject.legislator_id,
        vote_id: subject.vote_id,
        vote_type: subject.vote_type
      }
    end

    it { expect(vote_result_attrs).to eq(vote_result_params) }
  end
end
