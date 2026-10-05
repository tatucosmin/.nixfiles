local modkey = "Mod1"
local terminal = "alacritty"
local font = "GoogleSansCode Nerd Font:size=10"

oxwm.bar.set_font(font)

local tags = { "", "󰈹", "3", "4", "5", "6", "7", "8", "" }

oxwm.set_terminal(terminal)
oxwm.set_modkey(modkey)
oxwm.set_tags(tags)

-- https://git.symlinx.net/daccfiles/tree/.config/oxwm/config.lua
local colors = {
  black     = "#0f0f0f",
  gray_0    = "#141514",
  gray_1    = "#1e1f1e",
  gray_2    = "#272a28",
  gray_3    = "#3b403c",
  gray_4    = "#585f5b",
  gray_5    = "#6c756f",
  gray_6    = "#888e7b",
  gray_7    = "#9a9c8b",
  gray_8    = "#b6b69a",
  gray_9    = "#d9cdb5",
  gray_10   = "#e3d6c9",
  white     = "#f4decd",
  red_d     = "#f16e65",
  red_l     = "#f6a8a2",
  orange_d  = "#ef934d",
  orange_l  = "#f6be93",
  yellow    = "#efbf71",
  green_d   = "#7ec97e",
  green_l   = "#b4dfb4",
  cyan_d    = "#6fc3b5",
  cyan_l    = "#a5d9d0",
  blue_d    = "#71a1d6",
  blue_l    = "#accae7",
  magenta_d = "#e28dc6",
  magenta_l = "#ecb6da",
}

oxwm.bar.set_scheme_normal(colors.white, colors.black, colors.black)
oxwm.bar.set_scheme_occupied(colors.orange_l, colors.black, colors.orange_l)
oxwm.bar.set_scheme_selected(colors.orange_d, colors.black, colors.orange_d)

oxwm.set_layout_symbol("tiling", "[T]")
oxwm.set_layout_symbol("normie", "[F]")
oxwm.set_layout_symbol("tabbed", "[=]")
oxwm.set_layout_symbol("grid", "[G]")
oxwm.set_layout_symbol("monocle", "[M]")

local blocks = {
  oxwm.bar.block.systray({}),
  oxwm.bar.block.ram({
    format = "{used}/{total} GB",
    interval = 5,
    color = colors.orange_d,
    underline = true,
  }),
  oxwm.bar.block.static({
    text = "│",
    interval = 999999999,
    color = colors.white,
    underline = false,
  }),
  oxwm.bar.block.datetime({
    format = "{}",
    date_format = "%H:%M",
    interval = 60,
    color = colors.white,
    underline = true,
  }),
};

oxwm.bar.set_blocks(blocks)

-- keybinds
oxwm.key.bind({ modkey }, "Return", oxwm.spawn(terminal))
oxwm.key.bind({ modkey }, "Q", oxwm.client.kill())
oxwm.key.bind({ modkey, "Shift" }, "Q", oxwm.quit())

oxwm.key.bind({ modkey }, "Space", oxwm.spawn(
  "alacritty --class fsel -o window.dimensions.columns=60 -o window.dimensions.lines=20 -e fsel -d"
))

oxwm.rule.add({ class = "fsel", floating = true })
oxwm.set_floating_position("center")

oxwm.key.bind({ modkey }, "1", oxwm.tag.view(0));
oxwm.key.bind({ modkey }, "2", oxwm.tag.view(1));
oxwm.key.bind({ modkey }, "3", oxwm.tag.view(2));
oxwm.key.bind({ modkey }, "4", oxwm.tag.view(3));
oxwm.key.bind({ modkey }, "5", oxwm.tag.view(4));
oxwm.key.bind({ modkey }, "6", oxwm.tag.view(5));
oxwm.key.bind({ modkey }, "7", oxwm.tag.view(6));
oxwm.key.bind({ modkey }, "8", oxwm.tag.view(7));
oxwm.key.bind({ modkey }, "9", oxwm.tag.view(8));

oxwm.key.bind({ modkey, "Shift" }, "1", oxwm.tag.move_to(0));
oxwm.key.bind({ modkey, "Shift" }, "2", oxwm.tag.move_to(1));
oxwm.key.bind({ modkey, "Shift" }, "3", oxwm.tag.move_to(2));
oxwm.key.bind({ modkey, "Shift" }, "4", oxwm.tag.move_to(3));
oxwm.key.bind({ modkey, "Shift" }, "5", oxwm.tag.move_to(4));
oxwm.key.bind({ modkey, "Shift" }, "6", oxwm.tag.move_to(5));
oxwm.key.bind({ modkey, "Shift" }, "7", oxwm.tag.move_to(6));
oxwm.key.bind({ modkey, "Shift" }, "8", oxwm.tag.move_to(7));
oxwm.key.bind({ modkey, "Shift" }, "9", oxwm.tag.move_to(8));

oxwm.key.bind({ modkey, "Shift" }, "R", oxwm.restart())
oxwm.key.bind({ modkey, "Shift" }, "F", oxwm.client.toggle_fullscreen())


oxwm.border.set_width(1)
oxwm.border.set_focused_color(colors.orange_d)
