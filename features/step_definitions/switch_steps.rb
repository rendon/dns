Given /^environment A is not defined$/ do
  run 'dnsman init'
end

When /^I switch to environment A$/ do
  run 'dnsman set A'
end

Then /^I should get an error$/ do
  assert_failing_with('not defined')
end

Given /^env A is defined$/ do
  run 'dnsman init'
  assert_passing_with ''
  f = File.open(DNS_FILE, 'a')
  f.puts <<-EOF
  A:
    localhost: 127.0.0.1
  EOF
  f.close
end


# Doesn't work :(
Then /^I should be using env A$/ do
  run 'dnsman status'
  assert_failing_with ''
  out = stdout_from 'dnsman status'
end
