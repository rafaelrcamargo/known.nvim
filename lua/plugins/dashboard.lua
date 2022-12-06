local dashboard = require("dashboard")
local version = vim.version()

math.randomseed(os.time()) -- random initialize

dashboard.session_directory = vim.fn.stdpath("data") .. "/sessions"

local moods = {
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
        "⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀",
        "⣧⡀⠀⠀⠀⠉⠻⣦⣀⠀⠀⠀⠁⡀⠀⠉⠉⠁⠀⠈⢿⡀⣠⡤⠖⠛⠉⠀⠀⠀",
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

dashboard.custom_header = moods[math.random(1, 5)]

local icon_color = "Function"

dashboard.custom_center = {
    {
        desc = "Find File              ",
        shortcut = " ff",
        icon = "  ",
        icon_hl = {
            link = icon_color
         },
        action = "Telescope find_files"
     },
    {
        desc = "Recents                ",
        shortcut = " fr",
        icon = "  ",
        icon_hl = {
            link = icon_color
         },
        action = "Telescope oldfiles"
     },
    {
        desc = "New File               ",
        shortcut = " bn",
        icon = "  ",
        icon_hl = {
            link = icon_color
         },
        action = "DashboardNewFile"
     },
    {
        desc = "Update Plugins         ",
        shortcut = " pu",
        icon = "  ",
        icon_hl = {
            link = icon_color
         },
        action = "PackerUpdate"
     },
    {
        desc = "Setting                ",
        shortcut = " ns",
        icon = "  ",
        icon_hl = {
            link = icon_color
         },
        action = "edit $MYVIMRC"
     },
    {
        desc = "Exit                   ",
        shortcut = " qq",
        icon = "  ",
        icon_hl = {
            link = icon_color
         },
        action = "exit"
     }
 }

dashboard.custom_footer = {
    "Build: " .. version.major .. "." .. version.minor .. "." .. version.patch .. " - nightly"
 }

local header_height = #dashboard.custom_header
local center_height = (#dashboard.custom_center * 2) + dashboard.center_pad

local footer_height = dashboard.footer_pad
if dashboard.custom_footer ~= nil then
    footer_height = #dashboard.custom_footer + dashboard.footer_pad
end

local dashboard_height = header_height + center_height + footer_height

local function update_padding()
    local win_height = vim.fn.winheight(0)
    local padding = (win_height - dashboard_height) / 2
    dashboard.header_pad = padding
end

vim.api.nvim_create_autocmd("Filetype", {
    pattern = "dashboard",
    group = vim.api.nvim_create_augroup("dashboard_group", {
        clear = true
     }),
    callback = function()
        vim.cmd([[
          setlocal buftype=nofile
          setlocal nonumber norelativenumber nocursorline noruler
          nnoremap <buffer> q <cmd>exit<CR>
      ]])

        update_padding()
    end
 })
