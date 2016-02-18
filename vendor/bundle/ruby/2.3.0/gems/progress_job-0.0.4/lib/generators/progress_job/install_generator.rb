require "rails/generators"

module ProgressJob

  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      def install
        migration_template "migration.rb", "db/migrate/add_progress_to_delayed_jobs.rb"
      end

      def self.next_migration_number(path)
        @migration_number = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i.to_s
      end
    end
  end
end