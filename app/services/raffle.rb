class Raffle < ApplicationService
  def initialize(campaign:)
    @campaign = campaign
  end

  def call
    return false unless @campaign.members.length > 2

    shuffed_members = @campaign.members.shuffle
    shuffed_members << shuffed_members.first
    shuffed_members.each_cons(2).to_h
  end
end
