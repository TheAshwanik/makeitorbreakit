#README

##Make it or Break it

Make it or Break it is a web app for making new habits and breaking bad habits. Users can set their goals and how often they want to do those habits per week. They can also opt in to reminder emails sent out with SendGrid and Heroku Scheduler. Their weekly progress is tracked with a progress bar and they can see their long term progress via the calendar. There is also a marshmallow character that helps cheer them on towards their goal. Users can sign in and sign up using Google Oauth2. If they have signed in with Google they can see their step count using the Google Fit API.

See it deployed at https://makeitorbreakit.herokuapp.com/

###Technology used

This is a Ruby on Rails application using Ruby version 2.4.0

####Gems used

* devise
* simple calendar
* omniauth-google-oauth2
* sendgrid-ruby

#####APIs used

* Google Oauth 2
* Google Fit
* SendGrid
