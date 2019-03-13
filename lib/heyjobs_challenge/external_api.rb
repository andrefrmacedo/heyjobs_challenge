require_relative 'external_api/api_wrapper'

module ExternalApi
  extend self

  def get_campaigns
    begin
      response = ApiWrapper.new.get_campaigns
      JSON.parse(response.body)
    rescue => e
      p e
      false
    end
  end
end
