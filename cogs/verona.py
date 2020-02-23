"""
Verona compiler cog
"""

from discord.ext import commands
from docker_runner import verona

class Verona(commands.Cog, name="Verona"):
    """
    Commands made for Verona
    Don't abuse these.
    """

    def __init__(self, bot):
        self.bot = bot

    def sanitize(self, code: str) -> str:
        begin_strip = ["```verona", "```"]
        end_strip = ["```"]
        for each in begin_strip:
            if code.startswith(each):
                code = code[len(each):]

        for each in end_strip:
            if code.endswith(each):
                code = code[:len(code) - len(each)]

        return code

    @commands.command()
    async def eval(self, ctx, *, code: str):
        code = self.sanitize(code)
        num = verona.get_num_and_inc()
        verona.set_code(num, code)
        success, result = await verona.run_container(num)

        await ctx.send(f"Success? {success}")
        await ctx.send(result)


def setup(bot):
    bot.add_cog(Verona(bot))