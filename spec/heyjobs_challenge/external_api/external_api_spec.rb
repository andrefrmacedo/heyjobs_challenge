# frozen_string_literal: true

require 'heyjobs_challenge/external_api/api_wrapper'

RSpec.describe ApiWrapper do
  context 'get campaings' do
    it 'call the external enpoint' do
      stub_request(:get, external_api_url)
        .to_return(
          status: 200,
          body: '',
          headers: { "Content-Type": 'application/json' }
        )

      ApiWrapper.new.campaigns

      expect(WebMock).to have_requested(:get, external_api_url).once
    end
  end
end
