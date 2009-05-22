require 'rubygems'
require 'rake'
require 'rake/rdoctask'
require 'rake/packagetask'
require 'rake/gempackagetask'
require 'lib/skip_embedded'

desc 'Default: run unit tests.'
task :default => :spec

require 'spec/rake/spectask'

desc "Run all specs in spec directory"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts = %w[--colour --format progress --loadby --reverse]
  t.spec_files = FileList['spec/**/*_spec.rb']
end

desc 'Generate documentation for the skip_embedded plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'SkipEmbedded'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

NAME              = ENV["GEMNAME"] || "skip_embedded"
AUTHORS           = ["MAEDA Naoki", "MOROHASHI Kyosuke"]
EMAIL             = "k-morohashi@esm.co.jp"
DESCRIPTION       = "Utilities to collabolate SKIP, opensource buisiness SNS."
HOMEPATH          = "http://github.com/openskip/skip_embedded/tree/master"
BIN_FILES         = %w(skip-gen)

VERS              = SkipEmbedded::Version
REV = File.read(".svn/entries")[/committed-rev="(d+)"/, 1] rescue nil
RDOC_OPTS = [
  '--title', "#{NAME} documentation",
  "--charset", "utf-8",
  "--opname", "index.html",
  "--line-numbers",
  "--main", "README.rdoc",
  "--inline-source",
]

spec = Gem::Specification.new do |s|
  s.name              = NAME
  s.version           = VERS
  s.platform          = Gem::Platform::RUBY
  s.has_rdoc          = true
  s.extra_rdoc_files  = ["README.rdoc", "ChangeLog"]
  s.rdoc_options     += RDOC_OPTS + ['--exclude', '^(examples|extras)/']
  s.summary           = DESCRIPTION
  s.description       = DESCRIPTION
  s.authors           = AUTHORS
  s.email             = EMAIL
  s.homepage          = HOMEPATH
  s.executables       = BIN_FILES
  s.bindir            = "bin" unless BIN_FILES.empty?
  s.require_path      = "lib"
  s.test_files        = Dir["spec/**/*_spec.rb"]

  s.add_dependency "moro-repim", ">=0.1.7"
  s.add_dependency "json"
  s.add_dependency "oauth"

  s.files = %w(README.rdoc ChangeLog Rakefile) +
    Dir.glob("{bin,doc,test,lib,templates,generators,extras,website,script}/**/*") + 
    Dir.glob("spec/**/*.rb") +
    Dir.glob("ext/**/*.{h,c,rb}") +
    Dir.glob("examples/**/*.rb") +
    Dir.glob("tools/*.rb") +
    Dir.glob("rails/*.rb") +
    Dir.glob("lib/tasks/*.rake")

  s.extensions = FileList["ext/**/extconf.rb"].to_a
end

Rake::GemPackageTask.new(spec) do |p|
  p.need_tar = true
  p.gem_spec = spec
end

desc 'Show information about the gem.'
task :debug_gem do
  puts spec.to_ruby
end

desc 'Update gem spec'
task :gemspec do
  open("#{NAME}.gemspec", 'w').write spec.to_ruby
end
