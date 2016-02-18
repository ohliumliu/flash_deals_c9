# -*- encoding: utf-8 -*-
# stub: mailgun-ruby 1.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "mailgun-ruby"
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mailgun", "Travis Swientek"]
  s.date = "2014-11-20"
  s.description = "Mailgun's Official Ruby SDK for interacting with the Mailgun API."
  s.email = "support@mailgunhq.com"
  s.homepage = "http://www.mailgun.com"
  s.licenses = ["Apache"]
  s.rubygems_version = "2.5.1"
  s.summary = "Mailgun's Official Ruby SDK"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14"])
      s.add_development_dependency(%q<rake>, ["~> 10.1"])
      s.add_runtime_dependency(%q<rest-client>, ["~> 1.6"])
      s.add_runtime_dependency(%q<json>, ["~> 1.8"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rspec>, ["~> 2.14"])
      s.add_dependency(%q<rake>, ["~> 10.1"])
      s.add_dependency(%q<rest-client>, ["~> 1.6"])
      s.add_dependency(%q<json>, ["~> 1.8"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rspec>, ["~> 2.14"])
    s.add_dependency(%q<rake>, ["~> 10.1"])
    s.add_dependency(%q<rest-client>, ["~> 1.6"])
    s.add_dependency(%q<json>, ["~> 1.8"])
  end
end
