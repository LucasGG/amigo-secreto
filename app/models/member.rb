# frozen_string_literal: true

class Member < ApplicationRecord
  belongs_to :campaign

  after_save -> { campaign.pending! }
  after_destroy -> { campaign.pending! }

  validates :name, :email, :campaign, presence: true

  def set_pixel
    self.open = false
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Member.exists?(token: random_token)
    end
    save!
  end

  scope :opened, -> { where(open: true) }
end
