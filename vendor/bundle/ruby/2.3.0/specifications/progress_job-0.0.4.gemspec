# -*- encoding: utf-8 -*-
# stub: progress_job 0.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "progress_job"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Stjepan Hadjic"]
  s.date = "2014-11-07"
  s.description = "Add progress feature to delayed jobs"
  s.email = ["d4be4st@gmail.com"]
  s.homepage = "https://github.com/d4be4st/progress_job"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Delayed jobs with progress."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.5"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<delayed_job>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.5"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<delayed_job>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.5"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<delayed_job>, [">= 0"])
  end
end
