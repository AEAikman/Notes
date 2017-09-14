

import praw

bot = praw.Reddit(user_agent='InconspicuousHuman',
                  client_id='h14_mF9hf1LIfQ',
                  client_secret='VauL7z5IQG6J7yBSxa2F2eM8Vpc',
                  username='InconspicuousHuman',
                  password='Lemonade!')



StrToFind = "every account on reddit is a bot except you."

message = "and also me..."

subreddit = bot.subreddit('awesomebots')

comments = subreddit.stream.comments()

for comment in comments:
    text = comment.body # Fetch body
    author = comment.author # Fetch author
    if StrToFind in text.lower():
        # Generate a message
        comment.reply(message) # Send message