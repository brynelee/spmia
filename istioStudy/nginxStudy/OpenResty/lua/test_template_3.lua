--[[
--{* var *}：变量输出；
--
--{{ var }}：变量转义输出；
--
--{% code %}：代码片段；
--
--{# comment #}：注释；
--
--{-raw-}：中间的内容不会解析，作为纯文本输出；
--
--
--
--模板最终被转换为Lua代码进行执行，所以模板中可以执行任意Lua代码。
-
]]--

local template = require("resty.template")

local context = {
    title = "examination",
    name = "ZhangSan",
    description = "<script>alert(1);</script>",
    age = 20,
    hobby = {"Movie", "Music", "Reading"},
    score = {Language = 90, Maths = 80, English = 70},
    score2 = {
        {name = "Language", score = 90},
        {name = "Maths", score = 80},
        {name = "English", score = 70},
    }
}

template.render("t3.html", context)
