Given(/^a list of ints$/) do
  @list = []
  prng = Random.new
  100.times { |i| @list[i] = (prng.rand*100+1).to_i }
  puts @list
end

When(/^I sort the list "(.*?)" to "(.*?)"$/) do |lo, hi|
  if lo == 'start' && hi == 'end'
    lo, hi = 0, @list.size-1
  else
    lo, hi = lo.to_i, hi.to_i
  end
  if lo < hi
    pivot = @list[lo]
    p = lo
    (lo+1..hi).each do |i|
      if @list[i] < pivot
        p += 1
        @list[i], @list[p] = @list[p], @list[i]
      end
    end
    @list[p], @list[lo] = @list[lo], @list[p]
    step %Q(I sort the list "#{lo}" to "#{p-1}")
    step %Q(I sort the list "#{p+1}" to "#{hi}")
  end
end

Then(/^the list is sorted$/) do
  expect(@list).to eq(@list.sort)
  puts @list
end

And(/^I do the sort by "(.*?)"$/) do |step_call|
  step step_call
end
