class Owner

	attr_accessor :name, :pets
	attr_reader :species

	@@all = []

	def initialize(species)
		@species = species
		@@all << self
		@name = nil
		@pets = { cats: [], dogs: [], fishes: [] }
	end

	def say_species
		"I am a #{@species}."
	end

	def buy_fish(name)
		my_fish = Fish.new(name)
		self.pets[:fishes] << my_fish
	end

	def buy_cat(name)
		my_cat = Cat.new(name)
		self.pets[:cats] << my_cat
	end

	def buy_dog(name)
		my_dog = Dog.new(name)
		self.pets[:dogs] << my_dog
	end

	def walk_dogs
		self.pets[:dogs].each { |dog| dog.mood = "happy" }
	end

	def play_with_cats
		self.pets[:cats].each { |cat| cat.mood = "happy" }
	end

	def feed_fish
		self.pets[:fishes].each { |fish| fish.mood = "happy" }
	end

	def sell_pets
		self.pets.each do |type, pets|
			pets.each do |pet|
				pet.mood = "nervous"
			end
		end
		self.pets.each { |type, pets| pets.clear }
	end

	def list_pets
		fish_count = self.pets[:fishes].length
		dog_count = self.pets[:dogs].length
		cat_count = self.pets[:cats].length
		"I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
	end
  
	def self.all
		@@all
	end

	def self.count
		@@all.length
	end

	def self.reset_all
		@@all.clear
	end

end