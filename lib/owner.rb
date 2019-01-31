class Owner
  # code goes here
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
    @species = 'human'
    @pets = {
              fishes: [],
              dogs: [],
              cats: []
    }
  end
  attr_reader :species
  attr_accessor :name
  attr_accessor :pets

  def self.count
    @@all.count
  end
  def self.reset_all
    @@all = []
  end
  def self.all
    @@all
  end
  def say_species
    "I am a #{species}."
  end
  def buy_fish(pet_name)
    pet = Fish.new(pet_name)
    @pets[:fishes] << pet
  end

  def buy_cat(pet_name)
    pet = Cat.new(pet_name)
    @pets[:cats] << pet
  end

  def buy_dog(pet_name)
    pet = Dog.new(pet_name)
    @pets[:dogs] << pet
  end

  def walk_dogs
    pets = @pets[:dogs]
    change_moods(pets,'happy')
  end
  def play_with_cats
    pets = @pets[:cats]
    change_moods(pets,'happy')
  end
  def feed_fish
    pets = @pets[:fishes]
    change_moods(pets,'happy')
  end
  def sell_pets
    @pets.each do |type,pets|
      change_moods(pets,'nervous')
    end
    @pets = {
              fishes: [],
              dogs: [],
              cats: []
    }
  end
  def change_mood(pet,mood)
    pet.mood = mood
  end
  def change_moods(pets,mood)
    pets.each {|pet| change_mood(pet,mood)}
  end
  def list_pets
    fish = @pets[:fishes].count
    dogs = @pets[:dogs].count
    cats = @pets[:cats].count
    "I have #{fish} fish, #{dogs} dog(s), and #{cats} cat(s)."
  end
end
