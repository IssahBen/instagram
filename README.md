# README

Objective: My aim building this application is to build an instagram clone with the basic functionalities of the instagram app.

About:This is social media web  Application written in Ruby on Rails 7 and bootstrap. The application replicates the basic functioality of the instagram application.It uses hotwire(turbo-streams and broadcast) to implement real time functionalities sucha s messaging ,liking
 and commenting.I aim to add more features over time as this is the first version 

..*FEATURES.

Built a User authentication system using the devise gem with a few customizations.
Built a real time liking and commenting  feature using hotwire broadcast from scratch.
BUilt a User Searching system from scratch using User Model helper methods and Stimulus js to provide real time search result update.
Users can follow other users through a following and follow system
Built a suggestion system based on a the followings and followers of ones followers and followings
Constructed a database that can easily be extended with features such as group chats  and more .
Users can edit their account details such as password ,email and Username.



..*Steps to Reproduce the code in the development in Environment

1 Go to config/database.yml
gem 'sqlite3', '~> 1.4' is already in the gem file so you wouldn't need to add it
Run bundle 