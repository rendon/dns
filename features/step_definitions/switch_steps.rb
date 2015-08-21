Given /^environment A is not defined$/ do
  run 'dnsman --init'
end

When /^I switch to environment A$/ do
  run 'dnsman A'
end

Then /^I should get an error$/ do
  assert_failing_with('not defined')
end

Given /^env A is defined$/ do
  run 'dnsman --init'
  stdout_from('dnsman --init')
  f = File.open(DNS_FILE, 'a')
  f.puts "A:"
  f.close
end

When /^I switch environment$/ do
  run 'dnsman A'
end

Then /^I should be using env A$/ do
  run 'dnsman --status'
  stdout_from 'dnsman --status'
  assert_passing_with("A")
end
