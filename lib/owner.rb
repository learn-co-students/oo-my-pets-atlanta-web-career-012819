require 'pry'

class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []
  @@count = 0

  def initialize(species)
    @species = species
    @pets = {
      fishes: [],
      dogs: [],
      cats: []
    }

    @@all << self
    @@count += 1
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    @pets[:dogs].each { |dog| dog.mood = "happy" }
  end

  def play_with_cats
    @pets[:cats].each { |cat| cat.mood = "happy" }
  end

  def feed_fish
    @pets[:fishes].each { |fish| fish.mood = "happy" }
  end

  def sell_pets
    @pets.each do |species, pets_arr|
      # binding.pry
      pets_arr.each { |pet| pet.mood = "nervous" }
      pets_arr.clear
    end
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end

  ## Class Methods

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
  end
end
