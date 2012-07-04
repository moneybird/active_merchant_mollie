# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = %q{active_merchant_mollie}
  s.version     = "0.1.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Berend"]
  s.email       = ["info@bluetools.nl"]
  s.homepage    = ""
  s.summary     = %q{ActiveMerchant extension to support the Dutch PSP Mollie with iDeal transactions}
  s.description = %q{ActiveMerchant extension to support the Dutch PSP Mollie with iDeal transactions}

  s.rubyforge_project = "active_merchant_mollie"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('activemerchant')
  s.add_dependency('nokogiri')
  s.add_dependency('rspec')
end
