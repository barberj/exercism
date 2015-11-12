class FoodChain
  VERSION = 2

  FOOD = {
    fly: "I don't know why she swallowed the fly. Perhaps she'll die.",
    spider: "It wriggled and jiggled and tickled inside her.",
    bird: "How absurd to swallow a bird!",
    cat: "Imagine that, to swallow a cat!",
    dog: "What a hog, to swallow a dog!",
    goat: "Just opened her throat and swallowed a goat!",
    cow: "I don't know how she swallowed a cow!",
    horse: "She's dead, of course!"
  }

  def self.song
    swallowed = []
    aggregate = []

    FOOD.each do |animal, verse|
      aggregate << "I know an old lady who swallowed a #{animal}."
      aggregate << verse unless swallowed.empty?
      last_eaten = animal

      break if FOOD.length - 1 == swallowed.length

      swallowed.each do |eaten|
        catch_phrase = "She swallowed the #{last_eaten} to catch the #{eaten}."
        catch_phrase = "#{catch_phrase[0...-1]} that #{FOOD[eaten][3..-1]}" if eaten == swallowed[-2]

        aggregate << catch_phrase
        last_eaten = eaten
      end
      swallowed.unshift(animal)

      aggregate << "#{FOOD[last_eaten]}\n"
    end

    aggregate.join("\n") + "\n"
  end
end
