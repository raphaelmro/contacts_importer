# Contacts Importer 

## Requirements 📄
- Ruby 3.0.2
- Rails 6.1.6
- Postgres
- Sidekiq
- Redis

## Preparing the project 🔨

1. Clone the repository:
   * `git clone https://github.com/raphaelmro/contacts_importer.git`
2. Inside the project folder, run:
   * `bundle install`
3. Run the database creations/migrations:
   * `rails db:create`
   * `rails db:migrate`
4. Create an test user:
   * `rails db:seed`
   * Credentials:
     * `email: test@test.com`
     * `password: 123456`
6. Run Sidekiq:
   * `bundle exec sidekiq`
7. Run the tests:
   * `bundle exec rspec`
8. Run the server:
   * `rails s`

* The test file is included inside the /spec/fixtures path


## URLs 🔗
| Ambiente    | URL                   |
|-------------|-----------------------|
| Development | http://localhost:3000 |
| Staging     | Coming soon..         |
| Production  | Coming soon...        |


## Additional information ℹ️
- Currently the current app is on the development phase.
- Please, if you find any bug, please, report it on the [Github repository].
- Feel free to send me any suggestion or feedback. 
