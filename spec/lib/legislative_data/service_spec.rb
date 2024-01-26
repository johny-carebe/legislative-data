# frozen_string_literal: true

require_relative '../../../lib/legislative_data/service'

describe LegislativeData::Service do
  describe '#voted_bills_by_legislators' do
    subject { described_class.new.voted_bills_by_legislators }

    let(:voted_by_legislators_sample) do
      {
        legislator: 'Rep. Don Young (R-AK-1)',
        supported: 1,
        opposed: 1
      }
    end

    it { is_expected.to include(voted_by_legislators_sample) }
  end
end
