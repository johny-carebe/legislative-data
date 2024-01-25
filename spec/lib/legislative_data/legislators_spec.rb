# frozen_string_literal: true

require_relative '../../../lib/legislative_data/legislators'

describe LegislativeData::Legislators do
  describe '#ping' do
    subject { described_class.ping }

    it { is_expected.to eq(:ok) }
  end
end
