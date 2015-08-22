CONFIG_SAMPLE = <<-EOF
# dns.yml
# Example:
# prod:
#   db-server: 10.10.10.10
#   api-server: 10.10.10.20
#
# test:
#   db-server: 127.0.0.1
#   api-server: 127.0.0.1
EOF

DNSMAN_HOME = ENV['DNSMAN_HOME'] || "#{ENV['HOME']}/.dnsman"
DNS_FILE = "#{DNSMAN_HOME}/dns.yml"

class DNSManager
  def self.init
    FileUtils.mkdir_p DNSMAN_HOME
    if File.exists?(DNS_FILE)
      puts 'dnsman has been already initialized.'
      return false
    else
      FileUtils.touch "#{DNSMAN_HOME}/hosts"
      f = File.new(DNS_FILE, 'w')
      f.puts CONFIG_SAMPLE
      f.close

      puts '# This program requires sudo permissions to edit /etc/hosts:'
      puts "> cp /etc/hosts /etc/hosts.orig"
      puts "> cp /etc/hosts #{DNSMAN_HOME}/hosts.orig"
      puts "> ln -sf #{DNSMAN_HOME}/hosts /etc/hosts"

      cmd = "cp /etc/hosts /etc/hosts.orig && "
      cmd += "cp /etc/hosts #{DNSMAN_HOME}/hosts.orig && "
      cmd += "ln -sf #{DNSMAN_HOME}/hosts /etc/hosts"
      system("sudo -H -u root bash -c '#{cmd}'")
    end
  end

  def self.set args
    unless File.exists?(DNS_FILE)
      STDERR.puts 'Error reading config file.'
      return false
    end

    unless args.length == 2
      STDERR.puts 'set needs exactly one parameter' 
      return false
    end

    env = args[1]
    config = YAML.load(File.read(DNS_FILE)) || {}
    unless config.has_key?(env)
      STDERR.puts "'#{env}' environment is not defined." 
      return false
    end

    f = File.new("#{DNSMAN_HOME}/hosts", 'w')

    # Add an entry for localhost
    f.puts "127.0.0.1\tlocalhost" unless config.has_key?('localhost')

    config[env].each do |k, v|
      puts "#{v}\t#{k}"
      f.puts "#{v}\t#{k}"
    end
    f.close
    true
  end

  def self.reset
    unless File.exists?("#{DNSMAN_HOME}/hosts.orig")
      STDERR.puts 'Nothing to reset'
      return false
    end

    cmd = "ln -sf #{DNSMAN_HOME}/hosts.orig /etc/hosts"
    puts "> #{cmd}"
    system("sudo -H -u root bash -c '#{cmd}'")
  end

  def self.status
    config = YAML.load(File.read(DNS_FILE)) || {}
    unless config.has_key?('current')
      STDERR.puts 'Error reading config file.' 
      return false
    end
    puts config['current']
    true
  end
end
