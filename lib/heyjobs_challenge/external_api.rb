# frozen_string_literal: true

require_relative 'external_api/api_wrapper'

module ExternalApi
  module_function

  def campaigns
    response = ApiWrapper.new.campaigns
    json = JSON.parse(response.body, symbolize_names: true)
    json[:ads]
  rescue StandardError
    false
  end
end
