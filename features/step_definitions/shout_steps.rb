require 'shouty'
require 'coordinate'

ARBITRARY_MESSAGE = "Hello, world"

When("{word} shouts") do |name|
  @shouty.shout(name, ARBITRARY_MESSAGE)
end

Then('{word} should hear {word}') do |name1, name2|
  if name2 == 'nothing'
    expect(@shouty.shouts_heard_by(name1).include?(name2)).to be false
  else
    expect(@shouty.shouts_heard_by(name1).include?(name2)).to be true
  end
end

Then('{word} should not hear {word}') do |name1, name2|
  expect(@shouty.shouts_heard_by(name1).include?(name2)).to be false
end

Then("{word} should hear {int} shouts from {word}") do |name1, amount, name2|
  expect(@shouty.shouts_heard_by(name1)[name2].count).to eq(amount)
end

