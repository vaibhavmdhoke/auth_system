# README

* Ruby version: ruby-2.3.1

* System dependencies: postgres, 
                       bundle install # for installing gems

* Database creation: rake db:create

* Database migrations: rake db:migrate

* How to run the test suite: rake test


Build an Authentication application using only Ruby and Ruby on Rails.
Please do not use Devise or any other gems/libraries.

1. The application should show sign-in form and sign up link on the home page.
2. Sign up will require Email, Password, Password Confirmation and acceptance of terms.
3. The password must be encrypted before storing it in the database. Choose the best encryption algorithm you know.
4. Sign-in will require Users to fill Email, Password and Remember me(optional).
5. If the user has checked "remember me", then the session should be remembered for 2 weeks period
