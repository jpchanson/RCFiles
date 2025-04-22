local luasnip = require("luasnip")
local fmt     = require("luasnip.extras.fmt").fmt
local text    = luasnip.text_node
local insert  = luasnip.insert_node
local choice  = luasnip.choice_node
local snip    = luasnip.snippet_node

luasnip.add_snippets("cpp", {

-------------------------------------------------------------------------------
-- class snippets
-------------------------------------------------------------------------------
    luasnip.snippet({
            trig="class", 
            desc="A basic cpp class with no added extras"
        },
        fmt(
            [[
                class <classname><is_child> {
                    <>
                };
            ]],
            {
                classname = insert(1),
                is_child = choice(2, {
                                        snip(nil, {}),
                                        snip(nil, {text(" : <>"),insert(1)}),
                                     }),
                insert(3)

            },
            {
                delimiters="<>"
            }
        )
    )
})
