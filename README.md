# Slack Custom Emoji Downloader

This is a little bash script to download all custom emojis from a Slack Workspace.

Before you can use it, you have to create a Slack App and an OAuth Token.

## Create a Slack App

- Login to Slack as an admin
- Go to [Slack API Apps](https://api.slack.com/apps)
- Click **"Create New App"** → **From scratch**
- Select your Slack workspace

## Enable OAuth Permissions

- In your app settings, go to **OAuth & Permissions**
- Under **Scopes**, add the following **User Token Scope**: `emoji.read`
- Install the app to your workspace and authorize it
- Copy the OAuth Token (starts with xoxp-)

## Use the script

```bash slack_custom_emoji_downloader.sh xoxp-YOUR-TOKEN```

A directory called **emojis** should be created and all the custom emojis should be downloaded there.
