-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar &")
	hl.exec_cmd("dunst &")
	hl.exec_cmd("hyprtoolkit &")
	hl.exec_cmd("hyprpaper &")
	hl.exec_cmd("hyprpolkitagent &")
	hl.exec_cmd("hyprpm reload -n")
end)
