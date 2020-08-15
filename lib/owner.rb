require 'pry'
class Owner

  attr_reader :name, :species
  # attr_accessor :cat, :dog

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def say_species 
    "I am a #{self.species}."
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
    # binding.pry
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs 
    Dog.all.select {|dog| dog.owner == self}
    # binding.pry
  end

  def buy_cat(name)
    cat_new = Cat.new(name, self)
    # binding.pry
  end

  def buy_dog(name)
    dog_new = Dog.new(name, self)
    # binding.pry
  end

  def walk_dogs
    Dog.all.map {|dog| dog.mood = "happy"}
    # binding.pry
  end

  def feed_cats
    Cat.all.map {|cat| cat.mood = "happy"} 
  end

  def sell_pets
    Cat.all.map {|cat| cat.mood = "nervous"} 
    Cat.all.each {|cat| cat.owner = nil}

    Dog.all.map {|dog| dog.mood = "nervous"} 
    Dog.all.each {|dog| dog.owner = nil}

    # binding.pry
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end