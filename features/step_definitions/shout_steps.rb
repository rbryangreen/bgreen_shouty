require 'shouty'
require 'coordinate'

ARBITRARY_MESSAGE = "Hello, world"

Before do
  @shouty = Shouty.new
end

Given('{word} is at {int}, {int}') do |name, x, y|
  @shouty.set_location(name, Coordinate.new(x, y))
end

When("{word} shouts") do |name|
  @shouty.shout(name, ARBITRARY_MESSAGE)
end

Then('{word} should hear {word}') do |name1, name2|
  expect(@shouty.shouts_heard_by(name1).include?(name2)).to be true
end

Then('{word} should not hear {word}') do |name1, name2|
  expect(@shouty.shouts_heard_by(name1).include?(name2)).to be false
end

Then('{word} should hear nothing') do |name|
  expect(@shouty.shouts_heard_by(name).size).to eq(0)
end
