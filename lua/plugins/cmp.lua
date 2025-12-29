return {
  "Saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-n>"] = { "snippet_forward", "fallback" },
    },
    completion = {
      ghost_text = { enabled = true },
      list = { selection = { auto_insert = false } },
      documentation = { auto_show = true },
      accept = { auto_brackets = { enabled = false } },
      trigger = {
        prefetch_on_insert = true,
        show_in_snippet = true,
        show_on_backspace = false,
        show_on_backspace_in_keyword = false,
        show_on_backspace_after_accept = true,
        show_on_backspace_after_insert_enter = false,
        show_on_keyword = false,
        show_on_trigger_character = false,
        show_on_insert = false,
        show_on_blocked_trigger_characters = { " ", "\n", "\t" },
        show_on_accept_on_trigger_character = false,
        show_on_insert_on_trigger_character = false,
        show_on_x_blocked_trigger_characters = { "'", '"', "(" },
      },
    },
  },
}
