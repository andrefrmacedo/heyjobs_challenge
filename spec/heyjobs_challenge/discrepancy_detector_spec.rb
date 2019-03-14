# frozen_string_literal: true

require 'heyjobs_challenge/discrepancy_detector'

RSpec.describe DiscrepancyDetector do
  context 'detects discrepancies' do
    it 'detects the correct discrepancies in the correct format' do
      discrepancy = DiscrepancyDetector.call(local_ad, remote_ad)

      expect(discrepancy.count).to eq(2)
      expect(discrepancy[0][:status][:local]).to eq('paused')
      expect(discrepancy[0][:status][:remote]).to eq('enabled')
      expect(discrepancy[1][:ad_description][:local]).to eq('Description for campaign 11')
      expect(discrepancy[1][:ad_description][:remote]).to eq('First description')
    end

    it 'returns empty when no discrepancy' do
      discrepancy = DiscrepancyDetector.call(local_ad_no_discrepancies, remote_ad)

      expect(discrepancy.count).to eq(0)
    end
  end
end
