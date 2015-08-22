Gem::Specification.new do |s|
  s.name          = 'dnsman'
  s.version       = '0.0.1'
  s.date          = '2015-08-22'
  s.summary       = 'Manage your host names according to your needs.'
  s.description   = 'Use this if you have domain names whose IP change \
                     according to your environment, development, testing,\
                     production, etc.'
  s.authors       = ['Rafael Rendón Pablo']
  s.email         = 'rafaelrendonpablo@gmail.com'
  s.files         = `git ls-files -- lib/*`.split("\n")
  
  s.bindir        = 'bin'
  s.executables   = `git ls-files -- bin/*`.split("\n").map do |f|
    File.basename(f)
  end
  s.require_path  = 'lib'
  s.homepage      = 'https://github.com/rendon/dnsman'
  s.license       = 'GNU GPL v3.0'
end
