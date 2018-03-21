# Given('{word} is at {int}, {int}') do |name, x, y|
#   @shouty.set_location(name, Coordinate.new(x, y))
# end
#
# ^ this step works, but using the paramterType in the step below, a nil regexp occurs

Given('{word} is at {coordinate}') do |name, coordinate|
  @shouty.set_location(name, coordinate)
end

Given('people are located at') do |table|
  table.hashes.each do |row|
    @shouty.set_location(row['name'], Coordinate.new(row['x'].to_i, row['y'].to_i))
  end
end