-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "alacritty"
local fileManager = "dolphin"
local menu = "rofi -show run"

require("monitors")
require("autostart")
require("env_variables")
require("permissions")
require("look_feel")
require("misc")
require("input")
require("keybindings")
require("look_feel")
require("windows_workspaces")
