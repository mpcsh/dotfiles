#!/usr/bin/env python3

import iterm2
import os
import pynvim
import re
import threading

LIGHT_THEME_NAME = "Solarized Light"
DARK_THEME_NAME = "Solarized Dark"

async def select_preset(connection, theme):
    theme_name = DARK_THEME_NAME if "dark" in theme else LIGHT_THEME_NAME
    return await iterm2.ColorPreset.async_get(connection, theme_name)


async def set_profiles(connection, preset):
    profiles = await iterm2.PartialProfile.async_query(connection)
    for partial in profiles:
        profile = await partial.async_get_full_profile()
        await profile.async_set_color_preset(preset)


def set_nvim_helper(cookie):
    os.environ["ITERM2_COOKIE"] = cookie
    for socket_id in filter(lambda f: re.match("^nvimsocket-[0-9]+$", f) is not None, os.listdir("/tmp")):
        socket = "/tmp/" + socket_id
        nvim = pynvim.attach('socket', path=socket)
        nvim.command(':call SetColorscheme()')

def set_nvim():
    t = threading.Thread(target=set_nvim_helper, args=(os.getenv("ITERM2_COOKIE"),))
    t.start()
    t.join()


async def main(connection):
    app = await iterm2.async_get_app(connection)

    # set the appropriate theme on launch
    theme = await app.async_get_theme()
    preset = await select_preset(connection, theme)
    set_nvim()
    await set_profiles(connection, preset)

    # monitor for theme changes
    async with iterm2.VariableMonitor(connection, iterm2.VariableScopes.APP, "effectiveTheme", None) as mon:
        while True:
            theme = await mon.async_get()
            preset = await select_preset(connection, theme.split(" "))
            set_nvim()
            await set_profiles(connection, preset)


iterm2.run_forever(main)
