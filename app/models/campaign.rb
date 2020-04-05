# frozen_string_literal: true

class Campaign < ApplicationRecord
  belongs_to :user

  has_many :members, dependent: :destroy

  before_create :set_member
  before_create :set_status

  enum status: { pending: 0, finished: 1 }

  validates :title, :description, :user, :status, presence: true

  protected

  def set_status
    self.status = :pending
  end

  def set_member
    members << Member.create(name: user.name, email: user.email)
  end
end
