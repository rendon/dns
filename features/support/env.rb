require 'aruba/cucumber'
require 'rspec/expectations'

DNSMAN_HOME = '/tmp/.dnsman'
DNS_FILE = "#{DNSMAN_HOME}/dns.yml"

Before do
  # clean up
  FileUtils.rm_rf DNSMAN_HOME
  ENV['DNSMAN_HOME'] = DNSMAN_HOME
end
