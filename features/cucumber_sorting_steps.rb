Given(/^a list of ints$/) do
  puts @list = 100.times.map { |i| (Random.new.rand*100+1).to_i }
end

When(/^I sort the list "(.*?)" to "(.*?)"$/) do |lo, hi|
  hi = (lo == 'start' && hi == 'end') ? @list.size-1 : hi.to_i
  lo = lo.to_i
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
