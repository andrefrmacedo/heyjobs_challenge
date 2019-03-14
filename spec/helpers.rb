# frozen_string_literal: true

module Helpers
  def external_api_url
    'https://mockbin.org/bin/fcb30500-7b98-476f-810d-463a0b8fc3df'
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
          status: 'paused',
          description: 'Second description'
        }
      ]
    }
  end

  def remote_ad
    {
      reference: 1,
      status: 'enabled',
      description: 'First description'
    }
  end

  def local_ad
    {
      id: 1,
      job_id: 1,
      status: 'paused',
      external_reference: 1,
      ad_description: 'Description for campaign 11'
    }
  end

  def local_ad_no_discrepancies
    {
      id: 1,
      job_id: 1,
      status: 'enabled',
      external_reference: 1,
      ad_description: 'First description'
    }
  end

  def local_campaigns
    [
      {
        id: 1,
        job_id: 1,
        status: 'enabled',
        external_reference: 1,
        ad_description: 'First description'
      },
      {
        id: 2,
        job_id: 2,
        status: 'paused',
        external_reference: 2,
        ad_description: 'Description for campaign 12'
      }
    ]
  end

  def local_campaigns_no_discrepancies
    [
      {
        id: 1,
        job_id: 1,
        status: 'enabled',
        external_reference: 1,
        ad_description: 'First description'
      },
      {
        id: 2,
        job_id: 2,
        status: 'paused',
        external_reference: 2,
        ad_description: 'Second description'
      }
    ]
  end
end
