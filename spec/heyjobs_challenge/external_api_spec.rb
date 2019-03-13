require 'heyjobs_challenge/external_api'
require 'byebug'

RSpec.describe ExternalApi do
  context 'get campaigns' do
    it 'should get the correct campaign data' do
      stub_request(:get, "https://mockbin.org/bin/fcb30500-7b98-476f-810d-463a0b8fc3df").
       to_return(
        status: 200, 
        body: external_campaigns.to_json,
        headers: { "Content-Type": 'application/json' }
      )

      campaign_list = ExternalApi.get_campaigns
      
      expect(campaign_list['ads'].count).to eq(2)
      expect(campaign_list['ads'][0]['reference']).to eq(1)
      expect(campaign_list['ads'][0]['status']).to eq('enabled')
      expect(campaign_list['ads'][0]['description']).to eq('First description')
      expect(campaign_list['ads'][1]['reference']).to eq(2)
      expect(campaign_list['ads'][1]['status']).to eq('disabled')
      expect(campaign_list['ads'][1]['description']).to eq('Second description')
    end

    it 'should return false when an error occurs' do
      stub_request(:get, "https://mockbin.org/bin/fcb30500-7b98-476f-810d-463a0b8fc3df").
       to_return(
        status: 404, 
        body: '',
        headers: { "Content-Type": 'application/json' }
      )

       campaign_list = ExternalApi.get_campaigns
       
       expect(campaign_list).to eq(false)
    end
  end
  
end

def external_campaigns
  {
    ads: [
      {
        reference: 1,
        status: 'enabled',
        description: 'First description'
      },
      {
        reference: 2,
        status: 'disabled',
        description: 'Second description'
      }
    ]
  }
end