require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "active_merchant_mollie"
    gem.summary = "ActiveMerchant extension to support the Dutch PSP Mollie with iDeal transactions"
    gem.email = "info@moneybird.com"
    gem.homepage = "http://github.com/bluetools/active_merchant_mollie"
    gem.description = "ActiveMerchant extension to support the Dutch PSP Mollie with iDeal transactions"
    gem.authors = ["Edwin Vlieg"]
    gem.files =  FileList["[A-Z]*", "{bin,generators,lib,test}/**/*"]
    gem.add_dependency 'active_merchant'
    gem.add_dependency 'hpricot'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end


require 'spec/rake/spectask'
desc "Run all examples"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/*_spec.rb']
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "active_merchant_mollie #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
