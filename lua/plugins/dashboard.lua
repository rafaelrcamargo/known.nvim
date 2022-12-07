local dashboard = require("dashboard")
local version = vim.version()

dashboard.session_directory = vim.fn.stdpath("data") .. "/sessions"

-----------------------------
----- Header randomizer -----
-----------------------------

--[[ local moods = { -- A collection of ASCII art tables
    {
        "",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠤⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠁⠀⡰⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⢀⡎⢀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀",
        "⣀⠀⠀⠀⠀⠀⠀⡠⠬⡡⠬⡋⠀⡄⠀⠀⠀⠀⠀⠀⠀",
        "⡀⠁⠢⡀⠀⠀⢰⠠⢷⠰⠆⡅⠀⡇⠀⠀⠀⣀⠔⠂⡂",
        "⠱⡀⠀⠈⠒⢄⡸⡑⠊⢒⣂⣦⠄⢃⢀⠔⠈⠀⠀⡰⠁",
        "⠀⠱⡀⠀⠀⡰⣁⣼⡿⡿⢿⠃⠠⠚⠁⠀⠀⢀⠜⠀⠀",
        "⠀⠀⠐⢄⠜⠀⠈⠓⠒⠈⠁⠀⠀⠀⠀⠀⡰⠃⠀⠀⠀",
        "⠀⠀⢀⠊⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠾⡀⠀⠀⠀⠀",
        "⠀⠀⢸⣄⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡇⠀⠀⠀⠀",
        "⠀⠀⠸⢸⣳⠦⣍⣁⣀⣀⣀⣀⣠⠴⠚⠁⠇⠀⠀⠀⠀",
        "⠀⠀⠀⢳⣿⠄⠸⠢⠍⠉⠉⠀⠀⡠⢒⠎⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠣⣀⠁⠒⡤⠤⢤⠀⠀⠐⠙⡇⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠣⡀⡼⠀⠀⠈⠱⡒⠂⡸⠁⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢒⠁⠀⠀⠀⠀⠀⠀⠀",
        ""
     },
    {
        "",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⣀⣠⣤⣶⣞⡛⠿⠭⣷⡦⢬⣟⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⢠⡾⣯⡙⠳⣍⠳⢍⡙⠲⠤⣍⠓⠦⣝⣮⣉⠻⣿⡄⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⡿⢿⣷⣯⣷⣮⣿⣶⣽⠷⠶⠬⠿⠷⠟⠻⠟⠳⠿⢷⡀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⣸⣁⣀⣈⣛⣷⠀⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⠀⠀⠀⠀⠀⠀",
        "⠀⣸⣯⣁⣤⣤⣀⠈⢧⠘⣆⢀⣠⠤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠘⡇⠀⠀⠀⠀⠀",
        "⠀⢙⡟⡛⣿⣿⣿⢷⡾⠀⢿⣿⣏⣳⣾⡆⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀",
        "⢀⡞⠸⠀⠉⠉⠁⠀⠀⣠⣼⣿⣿⠀⣽⡇⠀⠀⠀⠀⠀⠀⠀⡼⠁⠀⠀⠀⠀⠀",
        "⣼⡀⣀⡐⢦⢀⣀⠀⣴⣿⣿⡏⢿⣶⣟⣀⣀⣀⣀⣀⣤⣤⠞⠁⠀⠀⠀⠀⠀⠀",
        "⠀⣿⣿⣿⣿⣾⣿⣿⣿⣾⡻⠷⣝⣿⡌⠉⠉⠁⠀⠀⣸⠁⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠈⢻⣿⣿⣿⣿⡟⣿⣟⠻⣿⡿⢿⡇⠀⠀⠀⠀⠀⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⢠⣿⢿⣼⣿⣿⠿⣏⣹⡃⢹⣯⡿⠀⠀⠀⠀⠀⠀⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⣽⣿⣿⢿⠹⣿⣇⠿⣾⣷⣼⠟⠁⠀⠀⠀⢀⣠⣴⣶⣾⣷⣶⣄⡀⠀⠀⠀⠀",
        "⠀⢿⣾⡟⢺⣧⣏⣿⡷⢻⠅⠀⠀⠀⢀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⡀⠀",
        "⠀⠀⠙⠛⠓⠛⠋⣡⣿⣬⣤⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⠛",
        "⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠋⠉⠁⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠸⡿⠿⠿⠿⠿⠿⠿⠟⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        ""
     },
    {
        "",
        "⣀⣀⣀⣀⣀                       ⣀⣀⣀⣀",
        "⣧⡀⠀⠀⠀⠉⠻⣦⣀⠀⠀⠀      ⠀    ⣠⡤⠖⠛⠉⠀⠀",
        "⣼⣷⣄⠀⠀⠀⠀⠀⠙⠳⠦⠤⠤⠴⠶⠶⠶⠶⠶⠖⠛⠋⠁⠀⠀⠀⠀⠀⠀⣸",
        "⠀⢺⣿⣦⡀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢄⣠⣾⢯",
        "⣤⣶⣮⣿⣿⡞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣎⣴⠿⠉⠀⠀",
        "⣿⣿⣿⣿⡟⡀⠀⣠⢤⣄⠀⠀⠀⠀⠀⠀⠀⢀⡤⣦⣄⠀⠀⠀⠙⣿⠀⠀⠀⠀",
        "⠈⠀⠀⣿⠇⠃⠀⠻⣾⣿⠂⠀⠀⠀⠀⠀⠀⠈⠷⣿⡿⠀⠀⠀⠐⢹⡏⠀⠀⠀",
        "⠀⠀⣸⣯⣤⣀⠀⠀⠀⠀⠀⠈⠛⠿⠀⠀⠀⠀⠀⠈⠀⣀⡠⣀⠀⠀⣧⠀⠀⠀",
        "⠀⠀⣿⡇⠀⢹⠇⠀⠀⠀⠀⣀⣀⣀⣀⣀⠀⠀⠀⠀⢰⡇⠀⢸⡇⠀⢹⡆⠀⠀",
        "⠀⠰⣿⠙⠒⠛⠀⠀⠀⠀⠀⢿⡏⠀⠀⣹⠀⠀⠀⠀⠈⠳⠲⠞⠁⠀⠀⢷⠀⠀",
        "⠀⠀⠹⣧⠀⠀⠀⠀⠀⠀⠀⠈⠛⠲⠶⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀",
        "⠀⠀⠀⢻⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣧⠀",
        ""
     },
    {
        "",
        "⠀⠀⠀⠀⠀⠀⠀⠀⡠⠒⠈⠉⠉⠉⠐⠠⢀⣀⠤⠐⠂⠀⠒⠠⡀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⡠⠊⠀⠀⢀⡠⠤⠤⠤⣀⠀⢣⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⡰⠁⠀⠀⠊⠁⠀⠀⠀⠀⠀⠉⠚⢆⠀⠀⠀⠀⠀⠐⠒⠠⢀⠀⠀",
        "⠀⠀⠀⣀⢴⠁⠀⠀⠀⠀⢀⡠⣂⠭⠓⠒⠒⠒⠠⠵⣤⠲⠬⠉⠛⠋⠉⠼⢷⡄",
        "⠀⠀⡜⠁⠈⠀⠀⠀⢰⣚⣒⣈⣀⠠⢤⡴⣶⣤⡈⠉⢱⠄⠒⢀⣽⣿⣿⣍⠉⠻",
        "⠀⡜⠀⠀⠀⠀⠀⠀⠀⠀⠨⡑⠤⣀⣾⣿⣿⣽⠿⠤⡢⠤⠀⣸⡿⠿⠶⠿⣦⠎",
        "⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠐⠒⠒⢒⡲⠎⠉⠀⣀⠀⠀⠀⢀⡠⠔⠁⠀",
        "⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠊⠁⠀⠀⠀⠀⠀⠉⠋⠉⠀⠑⢄⠀⠀",
        "⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡆⠀",
        "⡀⠀⠀⠀⠀⠀⠀⠀⡰⠉⣀⣀⣉⠉⠐⠒⠂⠤⠤⠄⠀⠀⢀⣀⠠⠤⠐⠊⡽⠀",
        "⢃⠀⠀⠀⠀⠀⠀⡄⠣⠤⠤⠤⠄⣈⣉⠁⠐⠒⠒⠒⠀⠀⠀⠀⠒⠒⠒⡪⠀⠀",
        "⢈⣦⣀⠀⠀⠀⠀⠈⠒⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠁⠐⠒⢒⡲⠒⠈⠀⠀⠀",
        "⠀⠊⠑⠫⢕⡒⠠⠤⠄⢀⡀⠀⠀⠀⠀⠀⠀⠀⣀⣀⡠⠄⠂⠁⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠈⠉⠑⠒⠒⠒⠀⠀⠠⠤⠤⠤⠐⠒⠉⠈⠢⢄⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀",
        ""
     },
    {
        "",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠒⠋⠁⠀⠀⠀⠀⠀⠈⠉⠒⠤⡀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⣠⠞⠁⣠⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⣄⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⡴⠁⠔⣯⠤⠚⠛⠟⠀⠀⠀⠀⠀⠾⠿⠿⠿⢶⣄⠈⠣⡀⠀⠀",
        "⠀⢀⡠⠖⠉⢀⡠⣾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠳⡀⠀",
        "⣠⠋⠀⠀⠀⣠⠖⣡⠴⠒⠲⢤⡀⠀⠀⠀⠀⠀⢀⡤⠖⠒⠢⢄⡀⠀⠀⢷⠀",
        "⡇⠀⠀⣜⡵⢡⠞⠀⠀⠀⠀⠀⠘⣆⠀⠀⠀⣰⠋⠀⠀⠀⠀⠀⠙⡄⠀⢘⡄",
        "⠛⠒⢺⡉⠀⣾⠀⠀⠀⠀⢀⣀⡀⢹⠀⠀⠀⡏⠀⠀⠀⠀⣀⣀⠀⢻⠀⢸⡇",
        "⠀⠀⠸⡇⠀⠙⣆⠀⠀⠀⣿⣿⣿⡞⠀⠀⠀⠹⡄⠀⠀⢸⣿⣿⡷⡟⠀⢘⠟",
        "⠀⠀⠀⢧⠀⠀⠈⢷⣤⣤⠬⠿⠁⠀⠀⠀⠀⠀⠘⣶⣤⡤⡭⠟⠁⠀⠀⡾⠀",
        "⠀⠀⠀⠈⢦⠀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀⣴⠃⠀",
        "⠀⠀⠀⠀⠈⢧⡀⠀⠀⠀⠀⠀⢠⣶⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⡼⠁⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠙⢆⡀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠁⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠉⠒⠤⣀⡀⠀⠀⠀⠀⠀⢀⣀⡤⠒⠁⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        ""
     }
 }

math.randomseed(os.time()) -- Random seed
dashboard.custom_header = moods[math.random(1, 5)] -- Select a random mood ]]

-----------------------------
------ Rainbow Header -------
-----------------------------

dashboard.preview_command = "cat | lolcat -F 0.3"
dashboard.preview_file_path = "~/.config/nvim/static/neovim.cat"
dashboard.preview_file_height = 15
dashboard.preview_file_width = 30

-----------------------------
------- Banner setup --------
-----------------------------

local icon_color = "Function"
dashboard.custom_center = { {
    desc = "Find File              ",
    shortcut = " ff",
    icon = "  ",
    icon_hl = {
        link = icon_color
     },
    action = "Telescope find_files"
 }, {
    desc = "Recents                ",
    shortcut = " fr",
    icon = "  ",
    icon_hl = {
        link = icon_color
     },
    action = "Telescope oldfiles"
 }, {
    desc = "New File               ",
    shortcut = " bn",
    icon = "  ",
    icon_hl = {
        link = icon_color
     },
    action = "DashboardNewFile"
 }, {
    desc = "Update Plugins         ",
    shortcut = " pu",
    icon = "  ",
    icon_hl = {
        link = icon_color
     },
    action = "PackerUpdate"
 }, {
    desc = "Setting                ",
    shortcut = " ns",
    icon = "  ",
    icon_hl = {
        link = icon_color
     },
    action = "edit $MYVIMRC"
 }, {
    desc = "Exit                   ",
    shortcut = " qq",
    icon = "  ",
    icon_hl = {
        link = icon_color
     },
    action = "exit"
 } }

dashboard.custom_footer = { "Build: " .. version.major .. "." .. version.minor .. "." .. version.patch .. " - nightly" }
