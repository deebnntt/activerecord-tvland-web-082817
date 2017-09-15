
class Actor < ActiveRecord::Base

  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    Character.all.select do |character|
      character.actor == self
    end.map do |character_info|
      "#{character_info.name} - #{character_info.show.name}"
    end
  end



end
