class User < ApplicationRecord
  default_scope { where(deleted_at: nil) }

  validates_presence_of :ip, :nickname, :defence, :attack, :hp
  validates_uniqueness_of :ip, :nickname
  validates :attack, inclusion: { in: 1..100 }
  validates :defence, inclusion: { in: 0..99 }
  validates :hp, inclusion: { in: 0..1000 }

  has_many :attack_fights, class_name: Fight
  has_many :defence_fights, class_name: Fight

  after_update :kill!, if: -> { hp.zero? }

  scope :with_deleted, -> { unscoped }

  private

  def kill!
    update_attribute(:deleted_at, DateTime.now)
    UserRecoverJob.set(wait: 1.minute).perform_later(id)
  end
end
