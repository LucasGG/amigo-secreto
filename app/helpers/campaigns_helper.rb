# frozen_string_literal: true

module CampaignsHelper
  def open_number(campaign)
    "#{campaign.members.opened.count}/#{campaign.members.count}"
  end
end
