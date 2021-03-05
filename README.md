# Context
This is a learning project by some Launch School students, using Sinatra and ActiveRecord. 

We intend to build an app to help students at Launch School sign up for study groups together. 

Spot (study, practice, overlearn, teach) is a vibrant group of students at Launch School. It provides two main functions: 

1. an easy way for students to get in touch with each other to meet to study together online
2. set up study groups with approved 'leads' (students further along the course who have done well so far and volunteer to help others) and 'students' (students at the same stage in the course) at a time that works for everyone. 

The idea is to help the Spot group by:

 - letting students and leads easily and fast set up sessions, and 
 - maybe set up a chatroom or comments section 
 - (and maybe other features as well if Sinatra, and we, are up to it). 

# Main learning goals: 
 - Gain experience collaborating on a tech project
 - Gain experience with Github collaborating
 - Gain familiarity with ActiveRecord and RSpec

# Join us?
If you are a Launch School student, feel free to get involved. 

# Setup
1. Download this to your computer (use `git clone` and the link you get when you click the green Code button at the top of the page ([more info](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository))
2. `cd` into the directory and run `bundle install` for gems installation
3. Run `bundle exec rake db:create` to create local database for development (dbs will be called spot_development, spot_testing)
4. If it's the first time you work on this module on your local system:
    - run `bundle exec rake db:schema:load` to load the schema 
5. If it's not the first time: 
    - Run `bundle exec rake db:migrate` to migrate migration to the schema
6. Run `bundle exec shotgun` to runserver.

Use `binding.pry` for testing. 

Use `bundle exec rspec` to run rspec testing. Remember to set up your development database in
spec/spec_helper.rb.

Remember to start postgresql on local machine to get access to
the database named development for development phase.

See the notes.txt for some pre-determined SQL statements to test
development database.

# Steps to drop and create database
1. Run `bundle exec rake db:drop` if you have the spot_development database on your local to drop it (add RAILS_ENV=development if there is any error).
2/ Run `bundle exec rake db:create RAILS_ENV=development`  to create databases.
3/ Run `bundle exec rake db:migrate` to apply migrations from migrations changes to the schema.db.
4/ Run `bundle exec rake db:seed RAILS_ENV=development` to populate the database `spot_development`.
