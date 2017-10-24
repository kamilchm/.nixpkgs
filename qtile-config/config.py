#!/usr/bin/env python
# coding: utf-8

from threading import Thread
from time import sleep
import subprocess

from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook

mod = "mod4"

keys = [
    # Switch between windows in current stack pane
    Key(
        [mod], "k",
        lazy.layout.down()
    ),
    Key(
        [mod], "j",
        lazy.layout.up()
    ),

    # Move windows up or down in current stack
    Key(
        [mod, "shift"], "k",
        lazy.layout.shuffle_down()
    ),
    Key(
        [mod, "shift"], "j",
        lazy.layout.shuffle_up()
    ),

    # Switch window focus to other pane(s) of stack
    Key(
        [mod], "space",
        lazy.layout.next()
    ),

    # Flip panes of stack
    Key(
        [mod, "shift"], "space",
        lazy.layout.flip()
    ),

    Key([mod], "n", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),

    Key(
        [mod], "F11",
        lazy.window.toggle_fullscreen()
    ),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"], "Return",
        lazy.layout.toggle_split()
    ),
    Key([mod], "Return", lazy.spawn("termite")),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "w", lazy.window.kill()),

    Key([mod], "l", lazy.spawn("xscreensaver-command --lock")),
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),

    Key([mod], "r", lazy.spawncmd()),
    Key([mod], "q", lazy.spawn("xfce4-appfinder --disable-server")),

    Key([], 'Print', lazy.spawn("xfce4-screenshooter")),

    Key([], "XF86AudioRaiseVolume",
        lazy.spawn("amixer -c 0 -q set Master 2dB+")),
    Key([], "XF86AudioLowerVolume",
        lazy.spawn("amixer -c 0 -q set Master 2dB-")),
    Key([], "XF86AudioMute",
        lazy.spawn("amixer -D pulse set Master 1+ toggle")),
]

groups = [Group(i) for i in "asdfuiop"]

for i in groups:
    # mod1 + letter of group = switch to group
    keys.append(
        Key([mod], i.name, lazy.group[i.name].toscreen())
    )

    # mod1 + shift + letter of group = switch to & move focused window to group
    keys.append(
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name))
    )

layouts = [
    layout.Max(),
    layout.MonadTall(border_focus="#0000ff")
]

widget_defaults = dict(
    font='Arial',
    fontsize=16,
    padding=3,
)

screens = []


def setup_screens(qtile):
    global screens
    screens.append(
        Screen(
            bottom=bar.Bar(
                [
                    widget.GroupBox(),
                    widget.Prompt(),
                    widget.WindowName(),
                    widget.Clipboard(),
                    widget.Battery(hide_threshold=99),
                    widget.CPUGraph(graph_color='F8FF33',
                                    fill_color='FCFFAD.3'),
                    widget.MemoryGraph(graph_color='31F500',
                                       fill_color='9DFF85.3'),
                    widget.NetGraph(),
                    widget.DF(warn_space=10, update_interval=300),
                    widget.Volume(),
                    widget.Systray(),
                    widget.Notify(),
                    widget.Clock(format='%Y-%m-%d %a %H:%M'),
                ],
                30,
            ),
        ),
    )
    if len(qtile.conn.pseudoscreens) > 1:
        screens.append(
            Screen(
                bottom=bar.Bar(
                    [
                        widget.GroupBox(),
                        widget.WindowName(),
                        widget.Clock(format='%H:%M'),
                    ],
                    30,
                ),
            ),
        )


# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating()
auto_fullscreen = False


def is_running(process):
    return subprocess.call(["pgrep", "-f", " ".join(process)]) == 0


def execute_once(process):
    if not is_running(process):
        Thread(target=lambda: subprocess.check_call(process)).start()


@hook.subscribe.startup
def startup():
    def blocking():
        sleep(1)
        execute_once(['clipit'])
        execute_once(['nm-applet'])
        execute_once(['pasystray'])

    Thread(target=blocking).start()


@hook.subscribe.screen_change
def restart_on_randr(qtile, ev):
    qtile.cmd_restart()


def main(qtile):
    setup_screens(qtile)
