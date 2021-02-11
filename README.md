Run `bundle install` for gems installation

Run `bundle exec rake db:create` to create local database for development

Run `bundle exec rake db:migrate` to migrate migration to the schema

If it's the first time you work on this module on your local system,
run `bundle exec rake db:schema:load` to load the schema instead of `db:migrate` before
attempting to make another migration.

Run `bundle exec shotgun` to runserver.

Use `binding.pry` for testing. 

Use `bundle exec rspec` to run rspec testing.

Remember to start postgresql on local machine to get access to
the database named development for development phase.

See the notes.txt for some pre-determined SQL statements to test
development database.
