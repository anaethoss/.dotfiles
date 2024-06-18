return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  opts = function()
    local ucolors = require("catppuccin.utils.colors")
    local mocha = require("catppuccin.palettes").get_palette("mocha")

    -- mocha color palettes
    -- rosewater = "#f5e0dc",
    -- flamingo = "#f2cdcd",
    -- pink = "#f5c2e7",
    -- mauve = "#cba6f7",
    -- red = "#f38ba8",
    -- maroon = "#eba0ac",
    -- peach = "#fab387",
    -- yellow = "#f9e2af",
    -- green = "#a6e3a1",
    -- teal = "#94e2d5",
    -- sky = "#89dceb",
    -- sapphire = "#74c7ec",
    -- blue = "#89b4fa",
    -- lavender = "#b4befe",
    -- text = "#cdd6f4",
    -- subtext1 = "#bac2de",
    -- subtext0 = "#a6adc8",
    -- overlay2 = "#9399b2",
    -- overlay1 = "#7f849c",
    -- overlay0 = "#6c7086",
    -- surface2 = "#585b70",
    -- surface1 = "#45475a",
    -- surface0 = "#313244",
    -- base = "#1e1e2e",
    -- mantle = "#181825",
    -- crust = "#11111b",

    return {
      flavour = "mocha",
      integrations = {
        neotree = true,
        mason = true,
        window_picker = true,
        diffview = true,
        which_key = true,
        lsp_trouble = true,
      },
      custom_highlights = function(colors)
        return {
          -- cmp colors
          CmpItemAbbr = { fg = mocha.subtext1 },
          CmpItemAbbrMatch = { fg = mocha.blue, bold = true },
          CmpDoc = { bg = mocha.surface0 },
          CmpDocBorder = { fg = mocha.crust, bg = mocha.crust },
          CmpPmenu = { bg = mocha.crust },
          CmpSel = { link = "PmenuSel", bold = true },
          CmpBorder = { fg = mocha.surface0 },
          -- PmenuSel = { fg = colors.base, bg = colors.maroon, style = { "bold" } },

          -- cmp item kinds
          -- CmpItemKindConstant = { fg = base16.base09 },
          -- CmpItemKindFunction = { fg = base16.base0D },
          -- CmpItemKindIdentifier = { fg = base16.base08 },
          -- CmpItemKindField = { fg = base16.base08 },
          -- CmpItemKindVariable = { fg = base16.base0E },
          -- CmpItemKindSnippet = { fg = colors.red },
          -- CmpItemKindText = { fg = base16.base0B },
          -- CmpItemKindStructure = { fg = mocha.red },
          -- CmpItemKindType = { fg = base16.base0A },
          -- CmpItemKindKeyword = { fg = base16.base07 },
          -- CmpItemKindMethod = { fg = base16.base0D },
          -- CmpItemKindConstructor = { fg = colors.blue },
          -- CmpItemKindFolder = { fg = base16.base07 },
          -- CmpItemKindModule = { fg = base16.base0A },
          -- CmpItemKindProperty = { fg = base16.base08 },
          -- CmpItemKindEnum = { fg = colors.blue },
          -- CmpItemKindUnit = { fg = base16.base0E },
          -- CmpItemKindClass = { fg = colors.teal },
          -- CmpItemKindFile = { fg = base16.base07 },
          -- CmpItemKindInterface = { fg = colors.green },
          -- CmpItemKindColor = { fg = colors.white },
          -- CmpItemKindReference = { fg = base16.base05 },
          -- CmpItemKindEnumMember = { fg = colors.purple },
          -- CmpItemKindStruct = { fg = base16.base0E },
          -- CmpItemKindValue = { fg = colors.cyan },
          -- CmpItemKindEvent = { fg = colors.yellow },
          -- CmpItemKindOperator = { fg = base16.base05 },
          -- CmpItemKindTypeParameter = { fg = base16.base08 },
          -- CmpItemKindCopilot = { fg = colors.green },
          -- CmpItemKindCodeium = { fg = colors.vibrant_green },
          -- CmpItemKindTabNine = { fg = colors.baby_pink },

          -- CmpItemAbbr = { fg = C.overlay2 },
          -- CmpItemAbbrDeprecated = { fg = C.overlay0, style = { "strikethrough" } },
          -- CmpItemKind = { fg = C.blue },
          -- CmpItemMenu = { fg = C.text },
          -- CmpItemAbbrMatch = { fg = C.text, style = { "bold" } },
          -- CmpItemAbbrMatchFuzzy = { fg = C.text, style = { "bold" } },
          --
          -- -- kind support
          -- CmpItemKindSnippet = { fg = C.mauve },
          -- CmpItemKindKeyword = { fg = C.red },
          -- CmpItemKindText = { fg = C.teal },
          -- CmpItemKindMethod = { fg = C.blue },
          -- CmpItemKindConstructor = { fg = C.blue },
          -- CmpItemKindFunction = { fg = C.blue },
          -- CmpItemKindFolder = { fg = C.blue },
          -- CmpItemKindModule = { fg = C.blue },
          -- CmpItemKindConstant = { fg = C.peach },
          -- CmpItemKindField = { fg = C.green },
          -- CmpItemKindProperty = { fg = C.green },
          -- CmpItemKindEnum = { fg = C.green },
          -- CmpItemKindUnit = { fg = C.green },
          -- CmpItemKindClass = { fg = C.yellow },
          -- CmpItemKindVariable = { fg = C.flamingo },
          -- CmpItemKindFile = { fg = C.blue },
          -- CmpItemKindInterface = { fg = C.yellow },
          -- CmpItemKindColor = { fg = C.red },
          -- CmpItemKindReference = { fg = C.red },
          -- CmpItemKindEnumMember = { fg = C.red },
          -- CmpItemKindStruct = { fg = C.blue },
          -- CmpItemKindValue = { fg = C.peach },
          -- CmpItemKindEvent = { fg = C.blue },
          -- CmpItemKindOperator = { fg = C.blue },
          -- CmpItemKindTypeParameter = { fg = C.blue },
          -- CmpItemKindCopilot = { fg = C.teal },

          -- Telescope highlight groups
          -- TelescopePromptPrefix = {
          --   fg = colors.red,
          --   bg = colors.black2,
          -- },
          -- TelescopeNormal = { bg = colors.darker_black },
          -- TelescopePreviewTitle = {
          --   fg = colors.black,
          --   bg = colors.green,
          -- },
          -- TelescopePromptTitle = {
          --   fg = colors.black,
          --   bg = colors.red,
          -- },
          -- TelescopeSelection = { bg = colors.black2, fg = colors.white },
          -- TelescopeResultsDiffAdd = { fg = colors.green },
          -- TelescopeResultsDiffChange = { fg = colors.yellow },
          -- TelescopeResultsDiffDelete = { fg = colors.red },
          -- TelescopeMatching = { bg = colors.one_bg, fg = colors.blue },
          -- TelescopeBorder = { fg = colors.darker_black, bg = colors.darker_black },
          -- TelescopePromptBorder = { fg = colors.black2, bg = colors.black2 },
          -- TelescopePromptNormal = { fg = colors.white, bg = colors.black2 },
          -- TelescopeResultsTitle = { fg = colors.darker_black, bg = colors.darker_black },
        }
      end,
    }
  end,

  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}

-- `vim.tbl_deep_extend` function which is used for merging tables and their values recursively.
-- local result = vim.tbl_deep_extend("force", hlgroups, styles[telescope_style])
