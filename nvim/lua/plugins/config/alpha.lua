local M = {}

    -- "            :h-                                  Nhy`               ",
    -- "           -mh.                           h.    `Ndho               ",
    -- "           hmh+                          oNm.   oNdhh               ",
    -- "          `Nmhd`                        /NNmd  /NNhhd               ",
    -- "          -NNhhy                      `hMNmmm`+NNdhhh               ",
    -- "          .NNmhhs              ```....`..-:/./mNdhhh+               ",
    -- "           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
    -- "           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
    -- "      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
    -- " .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
    -- " h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
    -- " hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
    -- " /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
    -- "  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
    -- "   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
    -- "     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
    -- "       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
    -- "       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
    -- "       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
    -- "       //+++//++++++////+++///::--                 .::::-------::   ",
    -- "       :/++++///////////++++//////.                -:/:----::../-   ",
    -- "       -/++++//++///+//////////////               .::::---:::-.+`   ",
    -- "       `////////////////////////////:.            --::-----...-/    ",
    -- "        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
    -- "         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
    -- "           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
    -- "            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
    -- "           s-`::--:::------:////----:---.-:::...-.....`./:          ",
    -- "          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
    -- "         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
    -- "        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
    -- "                        .-:mNdhh:.......--::::-`                    ",
    -- "                           yNh/..------..`                          ",
    -- "                                                                    ",
function M.opts()
  local dashboard = require("alpha.themes.dashboard")
  dashboard.section.header.val = {
    "                                   ",
    "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ",
    "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
    "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ",
    "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
    "          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
    "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
    "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
    " ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
    " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ",
    "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
    "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
    "     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶     ",
    "     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧    ",
    "     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆   ",
  }

  dashboard.section.buttons.val = {
    dashboard.button("f", icons.ui.FindFile .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button("n", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", icons.ui.Files .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("g", icons.ui.Text .. " Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", icons.ui.Gear .. " Config", ":e $MYVIMRC<CR>"),
    dashboard.button("l", icons.ui.Lazy .. " Lazy", ":Lazy<CR>"),
    dashboard.button("q", icons.ui.Exit .. " Quit", ":qa<CR>"),
  }

  for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = "AlphaButtons"
    button.opts.hl_shortcut = "AlphaShortcut"
  end

  dashboard.section.header.opts.hl = "AlphaHeader"
  dashboard.section.buttons.opts.hl = "AlphaButtons"
  dashboard.section.footer.opts.hl = "AlphaFooter"
  return dashboard
end

function M.config(_, dashboard)
  require("alpha").setup(dashboard.opts)
end

return M
