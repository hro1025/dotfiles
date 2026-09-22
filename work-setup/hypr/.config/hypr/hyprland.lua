------------------------------------------------------------------------------------------
--                               ENVIRONMENT & SYSTEM
------------------------------------------------------------------------------------------

-- Cursor & theme environment variables (old `env = ...`)
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Old `exec = ...` (runs on every config load/reload, not just once)
hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3"')

-- Old `exec-once = ...` (only runs once, at Hyprland startup)
hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

  hl.exec_cmd("hyprctl setcursor hypr-dots-blue 24")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'hypr-dots-blue' &> /dev/null")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'JetBrains Mono Nerd Font 11'")

  -- Startup services (old separate AUTOSTART section, folded in here)
  hl.exec_cmd("waybar")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("awww img /home/roan/Pictures/wallpaper.jpg")
  hl.exec_cmd("hyprpm reload")
  hl.exec_cmd("dunst")
  hl.exec_cmd("blueman-applet")
end)

------------------------------------------------------------------------------------------
--                                    MONITORS
------------------------------------------------------------------------------------------

hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "1920x0", scale = 1 })

-- Workspace -> monitor assignment
hl.workspace_rule({ workspace = "1", monitor = "eDP-1" })

------------------------------------------------------------------------------------------
--                                   MY PROGRAMS
------------------------------------------------------------------------------------------

local terminal = "alacritty"
local fileManager = "nemo"
local menu = "rofi -show drun"
local powermenu = "bash ~/.config/rofi/powermenu.sh"
local screenshot = "hyprshot -m region -m active --clipboard-only"
local hyprlock = "hyprlock"

-- Panels
local killpanel = "killall waybar"
local startpanel = "waybar"

------------------------------------------------------------------------------------------
--                                   KEYBINDINGS
------------------------------------------------------------------------------------------

local mainMod = "SUPER"

-- Applications & essentials
hl.bind("ALT + Return", hl.dsp.exec_cmd(terminal))
hl.bind("ALT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen()) -- verify: may need an { action = ... } arg
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind("ALT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind("ALT + D", hl.dsp.exec_cmd(menu))
hl.bind("ALT + Delete", hl.dsp.exec_cmd(powermenu))
hl.bind(mainMod .. " + A", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + D", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + W", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + S", hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + F1", hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd(killpanel))
hl.bind(mainMod .. " + J", hl.dsp.exec_cmd(startpanel))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(hyprlock))

-- Workspace navigation (ALT + 1..9)
for i = 1, 9 do
  hl.bind("ALT + " .. i, hl.dsp.focus({ workspace = i }))
end

-- Move window to workspace
for i = 1, 5 do
  hl.bind(mainMod .. " + " .. i, hl.dsp.window.move({ workspace = i }))
end
for i = 1, 5 do
  hl.bind("CTRL + SHIFT + " .. i, hl.dsp.window.move({ workspace = i + 5 }))
end

-- Mouse bindings
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true }) -- move
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- resize
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

------------------------------------------------------------------------------------------
--                                  LOOK AND FEEL
------------------------------------------------------------------------------------------

hl.config({
  general = {
    gaps_in = 0,
    gaps_out = 0,
    border_size = 1,
    col = {
      -- gradient colors need a structured table, not a single string, since 0.55+
      active_border = { colors = { "rgba(89b4faff)", "rgba(89b4faff)" }, angle = 45 },
      inactive_border = "rgba(00000000)",
    },
    resize_on_border = false,
    allow_tearing = false,
    layout = "dwindle",
  },

  decoration = {
    rounding = 2,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled = false,
      range = 25,
      render_power = 1000,
      color = "rgba(89b4faff)",
      color_inactive = "rgba(00000000)",
    },
    blur = {
      enabled = true,
      size = 1,
      passes = 5,
      vibrancy = 0.1696,
      new_optimizations = true,
    },
  },

  dwindle = {
    force_split = 2,
    preserve_split = true,
  },

  opengl = {
    nvidia_anti_flicker = true,
  },
})

-- Bezier curves
hl.curve("winIn", { type = "bezier", points = { { 0.1, 1.0 }, { 0.1, 1.0 } } })
hl.curve("winOut", { type = "bezier", points = { { 0.1, 1.0 }, { 0.1, 1.0 } } })
hl.curve("smoothOut", { type = "bezier", points = { { 0.5, 0 }, { 0.99, 0.99 } } })
hl.curve("layerOut", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })

-- Animations
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 7, bezier = "winIn", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "smoothOut", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 7, bezier = "winIn", style = "slide" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 8, bezier = "winIn", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 8, bezier = "winOut", style = "slide" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 10, bezier = "winIn", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3, bezier = "layerOut", style = "popin 50%" })

------------------------------------------------------------------------------------------
--                                      INPUT
------------------------------------------------------------------------------------------

hl.config({
  input = {
    kb_layout = "no",
    kb_variant = "",
    kb_model = "",
    kb_options = "grp:ctrl_space_toggle",
    kb_rules = "",
    accel_profile = "flat",
    follow_mouse = 1,
    sensitivity = 0.3,
    repeat_rate = 50,
    repeat_delay = 200,
    touchpad = {
      natural_scroll = false,
    },
  },

  cursor = {
    no_hardware_cursors = true,
    hotspot_padding = 2,
    no_warps = true,
  },

  debug = {
    damage_tracking = 1,
  },
})

------------------------------------------------------------------------------------------
--                              WINDOWS AND WORKSPACES
------------------------------------------------------------------------------------------

-- Window rules (both commented out in the original .conf, kept out here too)
-- hl.window_rule({ suppress_event = "maximize", class = ".*" })
-- hl.window_rule({ nofocus = true, class = "^$", title = "^$", xwayland = true, floating = true, fullscreen = false, pinned = false })
