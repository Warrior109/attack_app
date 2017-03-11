class Fight < ApplicationRecord
  validates_presence_of :attacker, :defender
  validates_uniqueness_of :attacker, scope: :defender

  belongs_to :attacker, class_name: User
  belongs_to :defender, class_name: User

  after_save :attack!

  class << self
    def start!(attacker, defender)
      fight = find_by(defender_id: defender.id, attacker_id: attacker.id) || \
                new(setup_attributes(attacker, defender))
      fight.save
    end

    def setup_attributes(attacker, defender)
      {
        attacker: attacker,
        attack: attacker.attack,
        defender: defender,
        defence: defender.defence
      }
    end
  end

  private

  def attack!
    defender.update(hp: [0, defender.hp - attack_value].max, defence: [defender.defence + 1, 99].min)
    attacker.update(attack: attacker.attack + 1) if attacker.attack < 100
  end

  def attack_value
    [0, attacker.attack - defender.defence].max
  end
end
