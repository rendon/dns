Given /^dnsman init has not been executed before$/ do
  FileUtils.rm_rf(DNSMAN_HOME)
end

When /^I call the init command$/ do
  run 'dnsman init'
  assert_passing_with ''
end

Then /^A new dns\.yml file should have been created at dnsman config directory\.$/ do
  expect(File).to exist(DNS_FILE)
end

Given /^dnsman has been already initialized$/ do
  run 'dnsman init'
  assert_passing_with ''
  @access_time = File.atime(DNS_FILE).to_i
end

Then /^the current dns\.yml file should remain untouched\.$/ do
  expect(@access_time).to eq File.atime(DNS_FILE).to_i
end
