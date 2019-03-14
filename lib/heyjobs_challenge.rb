# frozen_string_literal: true

require_relative 'heyjobs_challenge/external_api'
require_relative 'heyjobs_challenge/discrepancy_detector'

module HeyjobsChallenge
  extend self

  def call(local_state)
    remote_state = ExternalApi.campaigns

    if remote_state
      find_discrepancies(local_state, remote_state)
    else
      error
    end
  end

  private

  def find_discrepancies(local, remote)
    discrepancy_list = []

    local.each do |local_ad|
      remote_ad = remote.find { |ad| ad[:reference].to_i == local_ad[:external_reference].to_i }
      ad_discrepancy = DiscrepancyDetector.call(local_ad, remote_ad) if remote_ad
      discrepancy_list << parse(remote_ad[:reference], ad_discrepancy) if ad_discrepancy&.any?
    end
    discrepancy_list
  end

  def parse(reference, discrepancies)
    {
      remote_reference: reference,
      discrepancies: discrepancies
    }
  end

  def error
    {
      error: 'An unexpected error occurred'
    }
  end
end
