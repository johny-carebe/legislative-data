# frozen_string_literal: true

require_relative '../../../lib/legislative_data/vote_results'

describe LegislativeData::VoteResults do
  describe '#ping' do
    subject { described_class.ping }

    it { is_expected.to eq(:ok) }
  end
end