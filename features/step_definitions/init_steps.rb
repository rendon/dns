Given /^dnsman init has not been executed before$/ do
end

When /^I call the init command$/ do
  run 'dnsman --init'
end

Then /^A new dns\.yml file should have been created at dnsman config directory\.$/ do
  assert_passing_with("")
  expect(File).to exist(DNS_FILE)
end

Given /^dnsman has been already initialized$/ do
  run 'dnsman --init'
  assert_passing_with("")
  @birthtime = File.open(DNS_FILE).birthtime.to_i
end

Then /^the current dns\.yml file should remain untouched\.$/ do
  expect(@birthtime).to eq File.open(DNS_FILE).birthtime.to_i
end
