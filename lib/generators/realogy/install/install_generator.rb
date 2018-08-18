module Realogy
  module Generators
    class InstallGenerator < Rails::Generators::Base

      include Rails::Generators::Migration
      source_root File.expand_path("../templates", __FILE__)

      desc "Copy migration file to your application."

      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S%L")
      end

      def create_model_file
        %w[realogy_entities].each do |name|
          migration_template "create_#{name}.rb", "db/migrate/create_#{name}.rb"
          sleep 0.1
        end
      end

    end
  end
end
