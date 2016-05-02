# slack-tadobot

Slack integration with Tado. Ask your Tado smart thermostat whats happening.

> This project is not affiliated with [Tado](https://www.tado.com/) in anyway. The Tado API is not public and therefore cannot be considered stable and so this project may cease to work or have unintended behaviour. Use at your own risk!!

![status command](t1.gif?raw=true "Show status command")

# Installation

You need to run this bot somewhere - you can run this with any standard Ruby stack. Heroku is the easiest place to give it a go.

**At the moment** we have **1x bot per Tado user** in the form of a Team bot, this means **one bot controls one Tado**. If you invite `tadobot` to a Slack room then anyone can control it.

We need two bits of information to get going, your Tado details and Slack bot authentication key.

## Tado

The Tado API is not public (as of 2 May 2016) but we do seem to be able to use the username and password you use to log into the [my.tado](https://my.tado.com/webapp) web panel to perform authenticated requests.

All requests are sent over HTTPS. Keep your username and password private!

**Requirements**

* Username and password for *my.tado*
* The Tado device `home_id` for which to associate the bot with - TBC

## Slack

### Installation

Create a new Bot Integration under [services/new/bot](http://slack.com/services/new/bot). On the next screen, note the API token.

### Deploy Slack-Mathbot

1. Create a new Heroku app
2. Git clone & deploy this repo to your new app
3. Set Environment variables

#### Environment

Set `SLACK_API_TOKEN, TADO_USERNAME, TADO_PASSWORD, TADO_HOME_ID` from the Bot integration settings on Slack and your *my.tado* config.

```
heroku config:add SLACK_API_TOKEN=... \
  SLACK_API_TOKEN=... \
  TADO_USERNAME=... \
  TADO_PASSWORD=... \
  TADO_HOME_ID=... \
  -a app-name
```

# Usage

Invite the bot to a channel or send a direct message. `tadobot` responds to the following commands:

## Commands

`tadobot status`

Show the current status of your Tado.

`tadobot weather`

Show the current weather at the Tado device location.

`tadobot`

Shows tadobot version and links.

`tadobot hi`

Politely says 'hi' back.

`tadobot help`

How to get some help.

# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rob-murray/slack-tadobot. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


# License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
