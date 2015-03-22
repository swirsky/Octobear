class SummonedCreature < ActiveRecord::Base

  serialize :weak_against
  serialize :resistant_against
  serialize :attacks

  #SUMMON_ARCHETYPES = [DEMON]

  def attack(target)

  end

  def suffer(attack)

  end

  TYPES = %w(Acid Bludgeoning Cold Electric Force Fire Holy Piercing Unholy Slashing Sonic)

  ANGEL = {
    type:"Holy",
    hp:12,
    str:14,
    dex:4,
    con:14,
    intel:10,
    wis:10,
    cha:12,
    weak_against: [],
    resistant_against: %w(Cold Fire Holy Unholy)
  }

  DEMON = {
    type:"Unholy",
    hp:15,
    str:16,
    dex:8,
    con:14,
    intel:8,
    wis:8,
    cha:12,
    weak_against: %w(Holy),
    resistant_against: %w(Fire Unholy)
  }

end
