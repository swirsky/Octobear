class Obstacle < ActiveRecord::Base
  
  belongs_to :chase

  validates_uniqueness_of :order, :uniqueness => {:scope => :chase_id}

  before_save :set_dc, :set_order
  after_destroy :cascade_order_update

  attr_accessor :difficulty
  attr_accessor :select_order

  PRIMARY_SKILLS = %w(Acrobatics Climb EscapeArtist Ride Swim Fortitude Reflex Will)
  SECONDARY_SKILLS = %w(Bluff Diplomacy Intimidate Perception Fortitude Reflex Will)
  DIFFICULTIES = %w(Trivial Simple Standard Difficult VeryDifficult)
  DC_TO_DIFFICULTY = {10 => "Trivial", 15 => "Simple", 20 => "Standard", 25 => "Difficult", 30 => "VeryDifficult"}

  def order_options(chase=nil)
    chase ||= self.chase if self.chase
    opt = []
    opt << ["Add to the Start", "Add to the End"] unless self.order
    opt << (1..chase.obstacles.count).to_a if chase
    opt.flatten
  end

  def order_plus_one!
    self.update_column(:order, (self.order += 1))
  end

  def order_minus_one!
    self.update_column(:order, (self.order -= 1))
  end

  private

  def set_dc
    if !self.difficulty.nil?
      self.dc = case self.difficulty
                when "Trivial"
                  10
                when "Simple"
                  15
                when "Standard"
                  20
                when "Difficult"
                  25
                when "VeryDifficult"
                  30
                end
    end
  end

  def set_order
    last_order = self.chase.obstacles.pluck(:order).max
    puts "Setting Order!"
    puts self.select_order
    case self.select_order
    when "Add to the Start"
      self.chase.obstacles.order(:order).each(&:order_plus_one!)
      self.order = 1
    when "Add to the End"
      self.order = last_order + 1
    else
      self.order = self.select_order.to_i
      self.chase.obstacles.where("obstacles.order >= ?", self.select_order.to_i).order(:order).each(&:order_plus_one!)
    end
  end

  def cascade_order_update
    self.chase.obstacles.where("obstacles.order > ?", self.order).order(:order).each(&:order_minus_one!)
  end
end
