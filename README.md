# Make it or Break it

Make it or Break it is a web app for making new habits and breaking bad habits. This app came about because I wanted a way to track my habits and have incentive to check-in.

Features: 
* Sign in and sign up using Google Oauth2
* Reminder emails sent out with SendGrid and Heroku Scheduler.
* Weekly progress tracked with a progress bar 
* Long term progress tracked with a calendar 
* Marshmallow character to cheer users on towards their goal
* See step count using the Google Fit API

See it deployed at https://makeitorbreakit.herokuapp.com/

## Technology used

This is a Ruby on Rails application using
Ruby (version 2.4.0)
JavaScript
SASS
Scrollmagic
Database: SQLite 3 in development and PostgreSQL in produciton

### Gems used

* devise
* simple calendar
* omniauth-google-oauth2
* sendgrid-ruby

### APIs used

* Google Oauth 2
* Google Fit
* SendGrid


