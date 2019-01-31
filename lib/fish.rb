class Fish
  # code goes here
  def initialize(name)
    @name = name
    @mood = 'nervous'
  end
  attr_reader :name
  attr_accessor :mood
end
