# frozen_string_literal: true

module DiscrepancyDetector
  extend self

  def call(local, remote)
    discrepancies = []

    key_mapper.each do |key, value|
      obj = {}
      if local[key] != remote[value]
        obj[key] = { local: local[key], remote: remote[value] }
        discrepancies << obj
      end
    end
    discrepancies
  end

  private

  # maps local keys to remote keys
  def key_mapper
    {
      status: :status,
      ad_description: :description
    }
  end
end
