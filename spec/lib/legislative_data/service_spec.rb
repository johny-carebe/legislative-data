# frozen_string_literal: true

require_relative '../../../lib/legislative_data/service'

describe LegislativeData::Service do
  describe '#voted_bills_by_legislators' do
    subject { described_class.new.voted_bills_by_legislators }

    let(:voted_by_legislators_sample) do
      {
        legislator_id: 400440,
        legislator_name: 'Rep. Don Young (R-AK-1)',
        supported: 1,
        opposed: 1
      }
    end

    it { is_expected.to include(voted_by_legislators_sample) }
  end

  describe '#bills_support' do
    subject { described_class.new.bills_support }

    let(:bills_support_sample) do
      subject.find do |bills_support|
        bills_support[:bill_title] == 'H.R. 5376: Build Back Better Act'
      end
    end

    let(:supporters) do
      [
        'Rep. Alexandria Ocasio-Cortez (D-NY-14)',
        'Rep. Ayanna Pressley (D-MA-7)',
        'Rep. Cori Bush (D-MO-1)',
        'Rep. Ilhan Omar (D-MN-5)',
        'Rep. Jamaal Bowman (D-NY-16)',
        'Rep. Rashida Tlaib (D-MI-13)'
      ]
    end

    let(:opposers) do
      [
        'Rep. Adam Kinzinger (R-IL-16)',
        'Rep. Andrew Garbarino (R-NY-2)',
        'Rep. Anthony Gonzalez (R-OH-16)',
        'Rep. Brian Fitzpatrick (R-PA-1)',
        'Rep. Chris Smith (R-NJ-4)',
        'Rep. David McKinley (R-WV-1)',
        'Rep. Don Bacon (R-NE-2)',
        'Rep. Don Young (R-AK-1)',
        'Rep. Fred Upton (R-MI-6)',
        'Rep. Jeff Van Drew (R-NJ-2)',
        'Rep. John Katko (R-NY-24)',
        'Rep. Nicole Malliotakis (R-NY-11)',
        'Rep. Tom Reed (R-NY-23)'
      ]
    end

    it { puts subject.inspect }
    it { expect(bills_support_sample[:supporters]).to include(*supporters) }
    it { expect(bills_support_sample[:opposers]).to include(*opposers) }
    it { expect(bills_support_sample[:principal_sponsor]).to eq('Rep. John Yarmuth (D-KY-3)') }
  end
end
