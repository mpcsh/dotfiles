#!/usr/bin/env python3

import iterm2
import os
import re
import socket

LIGHT_THEME_NAME = "Solarized Light"
DARK_THEME_NAME = "Solarized Dark"

FAKE_NVIM_ATTACH = b'\x93\x02\xc4\x14nvim_set_client_info\x95\xaepython3-client\x80\xa6remote\x80\x80'
FAKE_NVIM_SET_COLORSCHEME = b'\x94\x00\x02\xacnvim_command\x91\xb6:call SetColorscheme()'

async def select_preset(connection, theme):
    theme_name = DARK_THEME_NAME if "dark" in theme else LIGHT_THEME_NAME
    return await iterm2.ColorPreset.async_get(connection, theme_name)


async def set_profiles(connection, preset):
    profiles = await iterm2.PartialProfile.async_query(connection)
    for partial in profiles:
        profile = await partial.async_get_full_profile()
        await profile.async_set_color_preset(preset)


def set_nvim():
    for base in filter(lambda f: re.match("^nvimsocket-[0-9]+$", f) is not None, os.listdir("/tmp")):
        path = "/tmp/" + base
        sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        sock.connect(path)
        sock.sendall(FAKE_NVIM_ATTACH)
        sock.sendall(FAKE_NVIM_SET_COLORSCHEME)
        sock.close()


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
