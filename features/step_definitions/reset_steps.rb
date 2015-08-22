Given /^I never started using dnsman$/ do
end

When /^I call the reset command$/ do
  run 'dnsman reset'
  @access_time = File.atime('/etc/hosts').to_i
end

Then /^nothing should happen to my hosts file$/ do
  assert_failing_with 'Nothing to reset'
  #expect(@access_time).to eq File.atime('/etc/hosts').to_i
end

Given /^I used dnsman at least once$/ do
  run 'dnsman init'
  assert_passing_with ''
  expect(File.ftype('/etc/hosts')).to eq 'link'
end

Then /^my hosts file should be restored$/ do
  expect(File.ftype('/etc/hosts')).to eq 'file'
end
