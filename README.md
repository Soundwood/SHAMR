# SHAMR FLATIRON SPA w/ API BACKEND

## About

SHAMR is meant to be an exercise in 'bad tech' in that this is not expected to be taken entirely seriously. While watching a PBS broadcast, the topic of the 'Chinese Social Credit System' was covered. You can read more about it [here](https://en.wikipedia.org/wiki/Social_Credit_System). I undertook this project to explore how tech can be used against us and ways in which it might go wrong.

SHAMR can be used to create 'offenders' and associated 'offenses'. These elements are persisted to the backend API and viewable by anyone that visits the site. A user can also enter a twitter user to check if that user follows anyone in the 'offenders' list. 

Have fun and don't take this too seriously.

![Shamer GIF](app/assets/images/SHAMR_SCROLL.gif)

## Installation

Navigate to the `SHAMR` folder and run the following command:

```ruby
bundle install
```

In the `app` folder open `index.html`

Navigate back to the `SHAMR` folder and run:
```ruby
rails db:create

rails db:migrate

rails db:seed

rails s
```
Use control+c to exit.