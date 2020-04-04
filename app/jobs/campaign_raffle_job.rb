# frozen_string_literal: true

class CampaignRaffleJob < ApplicationJob
  queue_as :emails

  def perform(campaign)
    friend_relations = Raffle.call(campaign: campaign)

    if friend_relations
      friend_relations.each do |member, secret_friend|
        member.set_pixel

        CampaignMailer.raffle(campaign, member, secret_friend)
                      .deliver_now
      end

      campaign.update(status: :finished)
    else
      # Send mail to owner of campaign (desafio)
    end
  end
end
