local ls=require("luasnip")
local s=ls.s -->snippet
local i=ls.i --> insert mode
local t=ls.t --> action


local d=ls.dynamic_node
local c=ls.choice_node
local f=ls.function_node
local sn=ls.snippet_node


local fmt=require("luasnip.extras.fmt").fmt
local rep=require("luasnip.extras").rep

local snippets,autosnippets={},{}

local group=vim.api.nvim_create_augroup("Lua snippets",{clear=true})
local file_patterns="*.lua"


