# -*- encoding: utf-8 -*-
# stub: mailgun_rails 0.8.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mailgun_rails"
  s.version = "0.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jorge Manrubia"]
  s.date = "2015-10-15"
  s.description = "An adapter for using Mailgun with Rails and Action Mailer"
  s.email = ["jorge.manrubia@gmail.com"]
  s.homepage = "https://github.com/jorgemanrubia/mailgun_rails/"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Rails Action Mailer adapter for Mailgun"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionmailer>, [">= 3.2.13"])
      s.add_runtime_dependency(%q<json>, [">= 1.7.7"])
      s.add_runtime_dependency(%q<rest-client>, [">= 1.6.7"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14.1"])
      s.add_development_dependency(%q<rails>, [">= 3.2.13"])
    else
      s.add_dependency(%q<actionmailer>, [">= 3.2.13"])
      s.add_dependency(%q<json>, [">= 1.7.7"])
      s.add_dependency(%q<rest-client>, [">= 1.6.7"])
      s.add_dependency(%q<rspec>, ["~> 2.14.1"])
      s.add_dependency(%q<rails>, [">= 3.2.13"])
    end
  else
    s.add_dependency(%q<actionmailer>, [">= 3.2.13"])
    s.add_dependency(%q<json>, [">= 1.7.7"])
    s.add_dependency(%q<rest-client>, [">= 1.6.7"])
    s.add_dependency(%q<rspec>, ["~> 2.14.1"])
    s.add_dependency(%q<rails>, [">= 3.2.13"])
  end
end
