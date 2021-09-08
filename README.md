Personal finance
======================
Simple demo api-only rails app for personal finance. It is for development mode only. Use [Postman](https://www.postman.com/downloads/) for the app exploring.
----------------------
## Configuration

+ Ruby version: 2.7.2
+ Rails versin: 6.1.4
+ PostgreSQL (for production)
+ RSpec

## Installation

1. Clone the repo.
2. Execute: 
```
$ bundle install
```
3. Execute: 
```
$ rails db:migrate
$ rails s
```
4. Register any user through Postman: `POST` request for `localhost:3000/api/v1/sign_up` and with JSON body, like this one
```
{
 "user": {
  "email":"ceo@mu.com",
  "password":"password7",
  "password_confirmation":"password7"
 }
}
```
5. Check if user is registred and can be logged in through Postman: `POST` request for `localhost:3000/api/v1/sign_in` and with JSON body
```
{
 "user": {
  "email":"ceo@mu.com",
  "password":"password7"
 }
}
```
6. The app has transactions examples for user with `id = 3`, so if you create user with another id just change `user_id` parameters in `db/seed.rb` and execute:
```
$ rails db:seed
```
7. Let's check statement for your transactions. You should use query params for this purpose, for example you want to get statement from 2021, September 1 to 2021, September 8, so you just use next `GET` request through Postman or browser (Mozilla preferably): `http://localhost:3000/api/v1/statement?dates=2021-09-01,2021-09-08&user_email=ceo@mu.com&user_token=qoMyyZmtaRH3DoNxUVCy`. Where `dates` query is for start and end dates of statement period, `user_email` and `user_token` queries are used according to [`simple_token_authentication` gem](https://github.com/gonzalo-bulnes/simple_token_authentication#authentication-method-1-query-params). 
