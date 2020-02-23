import discord

from discord.ext import commands

bot = commands.Bot("ver ")

with open("token.txt", "r") as file:
    TOKEN = file.read()

@bot.event
async def on_ready():
    bot.user_cogs = ["cogs.verona"]
    for cog in bot.user_cogs:
        bot.load_extension(cog)

    print('Logged in as')
    print(bot.user.name)
    print(bot.user.id)
    print('------')
    print(discord.utils.oauth_url(bot.user.id))

bot.run(TOKEN)