Given(/^a list of ints$/) do
  puts @l = 100.times.map { |i| (Random.new.rand*100+1).to_i }
end

When(/^I sort the list "(.*?)" to "(.*?)"$/) do |x, y|
  y = (x == 'start' && y == 'end') ? @l.size-1 : y.to_i
  x = x.to_i
  if x < y
    z, p = @l[x], x
    (x+1..y).each { |i| p, @l[i], @l[p] = p+1, @l[p+1], @l[i] if @l[i] < z }
    @l[p], @l[x] = @l[x], @l[p]
    step %Q(I sort the list "#{x}" to "#{p-1}")
    step %Q(I sort the list "#{p+1}" to "#{y}")
  end
end

Then(/^the list is sorted$/) do
  expect(@l).to eq(@l.sort)
  puts @l
end

And(/^I do the sort by stepcalls within stepcalls$/) do |table|
  table.raw.each do |stepcall|
    step stepcall[0]
  end
end
