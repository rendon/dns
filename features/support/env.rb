require 'aruba/cucumber'
require 'rspec/expectations'

DNSMAN_HOME = '/tmp/.dnsman'
DNS_FILE = "#{DNSMAN_HOME}/dns.yml"

Before do
  # clean up
  FileUtils.rm_rf DNSMAN_HOME
  ENV['DNSMAN_HOME'] = DNSMAN_HOME
end

After do
  cmd ='rm /etc/hosts && cp /etc/hosts.bk /etc/hosts'
  system("sudo -H -u root bash -c '#{cmd}'")
end
