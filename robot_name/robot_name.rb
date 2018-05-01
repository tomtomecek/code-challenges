class Robot
  LETTERS = ("A".."Z").to_a.freeze
  NUMBERS = ("0".."9").to_a.freeze
  attr_reader :name

  def initialize
    reset
  end

  def reset
    Robot.delete(name)
    @name = nil
    @name = generate_name while Robot.used_names.include? name
    Robot.used_names << name
  end

  def self.used_names
    @used_names ||= []
  end

  def self.delete(name) # Optional for challenge
    @used_names.delete(name) if name
  end

private
  def generate_name
    letters + numbers
  end

  def letters
    LETTERS.sample + LETTERS.sample
  end

  def numbers
    NUMBERS.sample + NUMBERS.sample + NUMBERS.sample
  end
end
