

from typing import List  # noqa: F401
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os
import subprocess



@hook.subscribe.startup_once
def autostart():
	home = os.path.expanduser('~/.config/qtile/autostart.sh')
	subprocess.run([home])


# -- GLOBAL VARIABLES --

mod = "mod4"
alt = "mod1"
terminal = guess_terminal()
groups = [Group(i) for i in "123"]


# /-- --


def move_every_window_to_screen(qtile, screen):
    screen_id = [2, 0, 1]
    group = qtile.screens[screen_id[screen]].group
    qtile.current_screen.set_group(group)


def move_current_window_to_screen(qtile, screen):
    screen_id = [2, 0, 1]
    group = qtile.screens[screen_id[screen]].group
    qtile.current_window.togroup(group.name)
    lazy.to_screen(0)
    


def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)

def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)


def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)


# ....!!!!....
""" My precious keybindings """
# ....!!!!....


keys = [
    # Launch terminal, kill window, restart and exit Qtile
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Volume keys
    # Key([alt], "m", lazy.spawn("amixer -D pulse sset Master toggle")),
    Key([], "KP_Add", lazy.spawn("amixer set Master playback 3+"), desc="Increase Master volume"),
    Key([], "KP_Enter", lazy.spawn("amixer set Master playback 3-"), desc="Decrease Master volume"),

    # Move windows
    Key([mod], "h", lazy.layout.grow_left(), desc="Grow (resize) window left"),
    Key([mod], "l", lazy.layout.grow_right(), desc="Grow (resize) window right"),
    Key([mod], "j", lazy.layout.grow_down(), desc="Grow (resize) window down"),
    Key([mod], "k", lazy.layout.grow_up(), desc="Grow (resize) window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([alt], "Tab", lazy.layout.next(), desc="Move window focus to other window"),

    # Switch focus to a physical monitor (dual/triple set up)
    Key([mod], "1", lazy.to_screen(2), desc="Switch focus to the 1st monitor"),
    Key([mod], "2", lazy.to_screen(0), desc="Switch focus to the 2nd monitor"),
    Key([mod], "3", lazy.to_screen(1), desc="Switch focus to the 3rd monitor"),

    # Move windows to different physical screens
    Key([mod, "shift"], "1", lazy.function(move_current_window_to_screen, 0), desc="Move window to the 1st monitor"),
    Key([mod, "shift"], "2", lazy.function(move_current_window_to_screen, 1), desc="Move window to the 2nd monitor"),
    Key([mod, "shift"], "3", lazy.function(move_current_window_to_screen, 2), desc="Move window to the 3rd monitor"),
    Key([mod, "shift"], "t", lazy.function(switch_screens), desc="Switch screens"),

    # Moving windows between left/right columns or move up/down in current stack.
    Key([alt], "h", lazy.layout.shuffle_left(), desc="Move window left"),
    Key([alt], "l", lazy.layout.shuffle_right(), desc="Move window right"),
    Key([alt], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([alt], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # stack panels
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts (maximize window)"),
]

# Mouse bindings
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.toggle_floating()),
]

# ....!!!!....
""" My precious Screens """
# ....!!!!....

dark_background = "#202a3b"
bright_foreground = "#ffffff"
clock_background = "#35425c"

basic_green = "#3bff90"
basic_red = "#ff004c"

colors = [
    [bright_foreground, bright_foreground],  # 0
    [dark_background, dark_background],  # 1
    [clock_background, clock_background],  # 2
    [basic_red, basic_red],  # 3 red
    [basic_green, basic_green],  # 4 green
    ["#ebcb8b", "#ebcb8b"],  # 5 yellow
    ["#81a1c1", "#81a1c1"],  # 6 blue
    ["#e5e9f0", "#e5e9f0"],  # 7 white
    ["#88c0d0", "#88c0d0"],  # 8 cyan
    ["#b48ead", "#b48ead"],  # 9 magenta
    ["#4c566a", "#4c566a"],  # 10 grey
    ["#d08770", "#d08770"],  # 11 orange
    ["#8fbcbb", "#8fbcbb"],  # 12 super cyan
    ["#5e81ac", "#5e81ac"],  # 13 super blue
    ["#242831", "#242831"],  # 14 super dark background
]

widget_defaults = dict(
    font="Arial",
    fontsize=14,
    padding=3,
    foreground=colors[0],
    background=colors[1],
)
extension_defaults = widget_defaults.copy()


def calendar_wrapper(qtile):
    qtile.spawn_cmd('alacritty -e calcure')


def calendar():
    lazy.function(calendar_wrapper)


def init_widgets(screen_id):
    return [
        widget.CurrentScreen(
            padding=10,
	    	active_color=basic_green.split("#")[1],
	    	inactive_color=basic_red.split("#")[1]
        ),

        widget.CurrentLayout(
        ),

		#widget.WindowName(
		#	max_chars=15
		#),
		
		widget.TaskList(
			max_title_width=150
		),

		widget.Systray(
		),

        widget.Volume(
            padding=10,
            mute_command='amixer -D pulse set Master 1+ toggle',
        ),

        widget.Clipboard(
            padding=10,
	    	timeout=1,
        ),
        
        widget.Clock(
            format='%d.%m.%Y %a %H:%M',
            foreground=colors[0],
            background=colors[1],
            padding=10,
            mouse_callbacks={'Button1': calendar},
        ),
    ]


def init_screen(screen_id):
    return Screen(
        bottom=bar.Bar(widgets=init_widgets(screen_id), size=27)
    )


screens = [
    init_screen(2),
    init_screen(3),
    init_screen(1),
]

# ....!!!!....
""" My precious Screens """
# ....!!!!....

default_theme = {"border_width": 2,
                 "margin": 12,
                 "border_focus": "e5e9f0",
                 "border_normal": "3b4252"
                 }

layouts = [
    layout.Columns(**default_theme),
    layout.Max(**default_theme),
]

# ....!!!!....
""" FUCKING WASTE """
# ....!!!!....


# for i in groups:
#    keys.extend([
# mod1 + letter of group = switch to group
# Key([mod], i.name, lazy.group[i.name].toscreen(),
#    desc="Switch to group {}".format(i.name)),

# mod1 + shift + letter of group = switch to & move focused window to group
# Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
#    desc="Switch to & move focused window to group {}".format(i.name)),
# Or, use below if you prefer not to switch to that group.
# # mod1 + shift + letter of group = move focused window to group
# Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
#     desc="move focused window to group {}".format(i.name)),
#    ])

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = False
bring_front_click = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

cursor_warp = True
bring_front_click = True
follow_mouse_focus = True
