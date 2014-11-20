# Wine IMS
## Background
This rails app is a prototype of a basic Wine inventory management system that makes use of the [Wine.com API](https://api.wine.com/) 

Dashboard currently allows the creation of new Wines as well as the ability to update existing wines. 

Wine IMS also has an API that currently allows you to list all wines found in the database and update an existing wine in the database. 

## Setup Instructions

1. git clone the repo to your local development environment ``git clone https://github.com/kareemgrant/wine-ims.git``
2. Navigate to project folder and run ``rake db:setup`` from the command line
3. Run ``bundle install`` to download all needed gems
4. Pull initial 200 Wine records from database by running ``rake fetch_wine_data`` from the command line
5. Start your local server ``rails s``
6. In your browser navigate to http://localhost:3000
7. To run the tests (Currently only api tests), run ``bundle exec rspec`` from the command line
