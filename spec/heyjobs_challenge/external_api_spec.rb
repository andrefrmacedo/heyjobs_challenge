# frozen_string_literal: true

require 'heyjobs_challenge/external_api'

RSpec.describe ExternalApi do
  context 'get campaigns' do
    it 'should get the correct campaign data' do
      stub_request(:get, external_api_url)
        .to_return(
          status: 200,
          body: external_campaigns.to_json,
          headers: { "Content-Type": 'application/json' }
        )

      campaign_list = ExternalApi.campaigns

      expect(campaign_list.count).to eq(2)
      expect(campaign_list[0][:reference]).to eq(1)
      expect(campaign_list[0][:status]).to eq('enabled')
      expect(campaign_list[0][:description]).to eq('First description')
      expect(campaign_list[1][:reference]).to eq(2)
      expect(campaign_list[1][:status]).to eq('paused')
      expect(campaign_list[1][:description]).to eq('Second description')
    end

    it 'should return false when an error occurs' do
      stub_request(:get, external_api_url)
        .to_return(
          status: 404,
          body: '',
          headers: { "Content-Type": 'application/json' }
        )

      campaign_list = ExternalApi.campaigns

      expect(campaign_list).to eq(false)
    end
  end
end
