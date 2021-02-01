class Players
  attr_accessor :lives, :name

  def initialize(name)
    @lives = 3
    @name = name
  end

  def alive?
    @lives > 0
  end
end