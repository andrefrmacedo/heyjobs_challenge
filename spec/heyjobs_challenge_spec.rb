# frozen_string_literal: true

require 'heyjobs_challenge'

RSpec.describe HeyjobsChallenge do
  context 'heyjobs_challenge' do
    it 'finds discrepancies with the correct output format' do
      stub_request(:get, external_api_url)
        .to_return(
          status: 200,
          body: external_campaigns.to_json,
          headers: { "Content-Type": 'application/json' }
        )

      discrepancies = HeyjobsChallenge.call(local_campaigns)

      expect(discrepancies.count).to eq(1)
      expect(discrepancies.first[:remote_reference]).to eq(2)
      expect(discrepancies.first[:discrepancies].count).to eq(1)
      expect(discrepancies.first[:discrepancies].first[:ad_description][:local]).to eq('Description for campaign 12')
      expect(discrepancies.first[:discrepancies].first[:ad_description][:remote]).to eq('Second description')
    end

    it 'finds no discrepancies' do
      stub_request(:get, external_api_url)
        .to_return(
          status: 200,
          body: external_campaigns.to_json,
          headers: { "Content-Type": 'application/json' }
        )

      discrepancies = HeyjobsChallenge.call(local_campaigns_no_discrepancies)

      expect(discrepancies.count).to eq(0)
      expect(discrepancies).to eq([])
    end

    it 'outputs an error messsage when external api does not work' do
      stub_request(:get, external_api_url)
        .to_return(
          status: 500,
          body: '',
          headers: { "Content-Type": 'application/json' }
        )

      discrepancies = HeyjobsChallenge.call(local_campaigns)

      expect(discrepancies[:error]).to eq('An unexpected error occurred')
    end
  end
end
