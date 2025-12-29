return {
  "AstroNvim/astrocore",
  opts = function(_, opts)
    if not opts.mappings then opts.mappings = require("astrocore").empty_map_table() end
    local maps = opts.mappings.n

    local function generate_numbered_maps(prefix, callback, max_count)
      max_count = max_count or 9
      for i = 1, max_count do
        local cmd, desc = callback(i)
        maps[prefix .. i] = { cmd, desc = desc }
      end
    end

    maps["<leader>s"] = { name = "󱐋 Shortcuts" }

    maps["<leader>sg"] = { "ggVG", desc = "󰒆 Select all text" }
    maps["<leader>sS"] = { ":cd %:p:h<Cr>", desc = " Set project folder to current one" }
    generate_numbered_maps("<leader>ss", function(i)
      local parent_levels = string.rep(":h", i)
      return ":cd %:p:h" .. parent_levels .. "<Cr>", " Set project " .. i .. " levels up"
    end)

    return opts
  end,
}
