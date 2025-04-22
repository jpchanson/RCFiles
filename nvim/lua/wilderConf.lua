local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
        language = 'vim',
        fuzzy = 2,
    }),
    wilder.search_pipeline({
        pattern = wilder.python_fuzzy_pattern(),
        sorter = wilder.python_difflib_sorter(),
        engine = 're',
    })
  ),
})

local highlighters = {
  wilder.basic_highlighter(),
  wilder.pcre2_highlighter(),
  wilder.lua_fzy_highlighter(),
}

local popupmenu_renderer = wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    highlights = {
        border = 'Normal',
        accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#f4468f'}}),
    },
    border = 'double',
    highlighter = highlighters,
    left = {
      ' ',
      wilder.popupmenu_devicons(),
      wilder.popupmenu_buffer_flags({
        flags = ' a + ',
        icons = {['+'] = '', a = '', h = ''},
      }),
    },
    right = {
      ' ',
      wilder.popupmenu_scrollbar(),
    },
    plumblend = 5,
  })
)

local wildmenu_renderer = wilder.wildmenu_renderer({
  highlighter = highlighters,
  separator = ' 🌀 ',
  left = {'', wilder.wildmenu_spinner(), '❱❱❱❱❱❱❱❱ '},
  right = {' ', wilder.wildmenu_index()},
  highlights = {
    accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#f4468f'}}),
  },
  plumblend = 0,
})

wilder.set_option('renderer', wilder.renderer_mux({
  [':'] = popupmenu_renderer,
  ['/'] = wildmenu_renderer,
  ['?'] = wildmenu_renderer,
  substitute = wildmenu_renderer,
}))

