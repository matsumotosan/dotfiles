local ls = require("luasnip")
local s = ls.snippet
local c = ls.choice_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local generate_matchcase_dynamic = function(args, snip)
    if not snip.num_cases then
        snip.num_cases = tonumber(snip.captures[1]) or 1 -- default start at 1
    end
    local nodes = {}
    local ins_idx = 1
    for j = 1, snip.num_cases do
        vim.list_extend(nodes, fmta([[
        case <>:
            <>
        ]], {r(ins_idx, "var" .. j, i(1)), r(ins_idx+1, "next" .. j, i(0))}))
        table.insert(nodes, t({"", ""}))
        ins_idx = ins_idx + 2
    end
    table.remove(nodes, #nodes)
    return isn(nil, nodes, "$PARENT_INDENT\t")
end

-- local same = function(index)
--   return f(function (arg)
--     return arg[1]
--   end, { index })
--   end

return {
  -- -- Testing
  -- -- s("sametest", fmt([[example: {}, function: {}]], { i(1), same(1) })),
  --
  -- -- Imports
  -- s("imas", fmt([[import {} as {}]], { i(1, "package"), i(2, "name") })),
  -- s("frim", fmt([[from {} import {}]], { i(1, "package"), i(2, "module") })),
  --
  -- -- Class
  -- -- s("cl",
  -- --   fmt(
  -- --     [[
  -- --       class {}{}:
  -- --     ]],
  -- --     {
  -- --       i(1, "classname"),
  -- --       d(2, sn(s("({})"), t "" )),
  -- --     }
  -- --   )
  -- -- ),
  --
  -- -- Method
  -- s("mf", fmt("{}.{}({})", { i(1), i(2), i(3) })),
  --
  -- -- match case
  -- -- s({ trig='mc(%d*)', name='match case', dscr='match n cases', regTrig = true, hidden = true},
  -- -- fmta([[
  -- --   match <>:
  -- --       <>
  -- --       <>
  -- --   ]],
  -- --   { i(1), d(2, generate_matchcase_dynamic, {}, {
  -- --     user_args = {
  -- --       function(snip) snip.num_cases = snip.num_cases + 1 end,
  -- --       function(snip) snip.num_cases = math.max(snip.num_cases - 1, 1) end
  -- --     }
  -- --   }),
  -- --     c(3, {t(""), isn(nil, fmta([[
  -- --   case _:
  -- --       <>
  -- --   ]], {i(1, "pass")}), "$PARENT_INDENT\t")})}),
  --
  -- -- nn.Module
  -- s("nnmod",
  --   fmt(
  --     [[
  --       class {}(nn.Module):
  --         """{}
  --
  --         Args:
  --         """
  --
  --         def __init__(self, {}) -> None:
  --           {}
  --
  --         def forward(self, x: Tensor) -> Tensor:
  --           {}
  --     ]],
  --     {
  --       i(1, "module"),
  --       i(2, "docstring"),
  --       i(3, "args"),
  --       i(4, "init"),
  --       i(5, "forward"),
  --     }
  --   )
  -- ),
  --
  -- -- litmodule
  -- s("litmod",
  --   fmt(
  --     [[
  --       class {}(L.LightningModule):
  --         def __init__(self, {}):
  --           self.model = None
  --
  --       def forward(self, x: Tensor) -> Tensor:
  --         return self.model(x)
  --
  --       def training_step(self, batch: Any, batch_idx: int) -> Tensor:
  --         {}
  --
  --       def validation_step(self, batch: Any, batch_idx: int) -> Tensor:
  --         {}
  --
  --       def test_step(self, batch: Any, batch_idx: int) -> Tensor:
  --         {}
  --
  --       def configure_optimizers(self):
  --         return {}
  --     ]],
  --     {
  --       i(1, "modelname"),
  --       i(2, "args"),
  --       i(3, "training_step"),
  --       i(4, "validation_step"),
  --       i(5, "test_step"),
  --       i(6, "optimizers"),
  --     }
  --   )
  -- ),
}
