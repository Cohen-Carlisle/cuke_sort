Given(/^a list of ints$/) do
  puts @a = 100.times.map { (Random.new.rand*100+1).to_i }
end

When(/^I sort the list "(.*?)" to "(.*?)"$/) do |l, h|
  h,l = h == 'end' ? @a.size-1 : h.to_i, l.to_i
  if l < h
    pivot, p = @a[l], l
    (l+1..h).each { |i| p, @a[i], @a[p] = p+1, @a[p+1], @a[i] if @a[i] < pivot } # WTF
    @a[p], @a[l] = @a[l], @a[p]
    step %Q(I sort the list "#{l}" to "#{p-1}")
    step %Q(I sort the list "#{p+1}" to "#{h}")
  end
end

Then(/^the list is sorted$/) do
  expect(@a).to eq(@a.sort)
  puts @a
end

And(/^I do the sort by stepcalls within stepcalls$/) do |table|
  table.raw.each do |stepcall|
    step stepcall[0]
  end
end
