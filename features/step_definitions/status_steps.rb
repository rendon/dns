Then /^I shoud get an error$/ do
  assert_failing_with 'No DNS file found'
end

Given /^I my current environment is dev$/ do
  run 'dnsman set dev'
end

When /^I call the status command$/ do
  run 'dnsman status'
end

Then /^I should see the current environment$/ do
  assert_passing_with 'dev'
end
