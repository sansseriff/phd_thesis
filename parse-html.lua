function RawBlock(raw)
    -- return raw.format:match 'html'
    --   and pandoc.read(raw.text, 'html').blocks
    --   or raw
    -- print(raw.text)
    -- print("\n")
    -- if raw.text == "<p>" then
    --     out = raw.text
    -- end
    -- return out
    -- return raw.text
    -- print("Hello \n world")
    if raw.text == "\n" then
        return ""
    else
        text = string.gsub(raw.text, "\n\r", "\n\r")
        return pandoc.RawInline('markdown', text)
    end
end

-- function RawBlock(el)
--     if FORMAT:match 'markdown' and el.format:match 'latex' then
--         print(el)
--         return pandoc.RawInline('markdown', "")
--     else
--         return el
--     end
-- end

function RawInline(raw)
    if raw.text == "\n" then
        return ""
    else
        text = string.gsub(raw.text, "\n\r", "\n\r")
        return pandoc.RawInline('markdown', text)
    end
end

function figure_image(elem)
    local image = elem.content and elem.content[1]

    return (image.t == "Image" and image.title == 'fig:')
        and image
        or nil
end

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

-- if it's a figure crossref, change it to the markdown format.
-- I need to figure out how to have figures referenced by numbers...
-- That's normally what pandoc-crossref does.
-- function Cite(citation)
--     cite = citation.content[1].text
--     if cite:sub(0,4) == "@Fig" then
--         string = string.format("[f%s](./#f%s)", cite:sub(3), cite:sub(3))
--         return pandoc.RawInline('markdown', string)
--     end
-- end

-- I need to remove the escape shlash in front of percent signs inside of latex.

-- This function takes the src/ style of figures and converts it into a mkdocs format that supports
-- light and dark mode, and figure captions.

-- function Para(el)
--     print(el.identifier)
-- end

function Para(para)
    

    if para.content[1].identifier and string.sub(para.content[1].identifier, 1, 2) == "eq" then
        -- fix equations
        -- <a name='table:branches'></a>
        -- string = string.format("<a name='%s'></a>", para.content[1].identifier)
        -- math = para.content[1].content[1]
        local link = string.format("<a name='%s'></a>\n", para.content[1].identifier)
        local linkBlock = pandoc.RawBlock("markdown", link)
        -- table.insert(para.content.content, 1, linkBlock)
        -- local math = para.content[2].content[1]
        -- print


        -- print(para.content[1].content[1])
        -- table.insert(para.content, 1, pandoc.RawInline('markdown', string))
        -- table.insert(para.content, pandoc.RawInline('markdown', ''))
        -- print(para.content[1])



        -- this works
        -- print(para.content[1].content[1])
        table.insert(para.content[1].content, 1, linkBlock)
        table.insert(para.content[1].content, pandoc.RawInline('markdown', '\n'))


        return para.content[1].content
    end

    local img = figure_image(para)
    -- if img.attributes['style'] then
    --     print(img.attributes['style'])
    -- end

    if not img or not img.caption or not img.attributes['short-caption'] then
        -- print("here?")
        return nil
        -- if not img.attributes["style"] then
        --     return nil
        -- else:
        --     print(img.attributes["style"])
        -- end
    end

    -- print(img.attributes['style'])

    local short_caption = pandoc.Span(
        pandoc.read(img.attributes['short-caption']).blocks[1].c
    )

    -- print(img.attributes['width'])
    


    local hypertarget = "{%%\n"
    local label = "\n"
    if img.identifier ~= img.title then
        hypertarget = string.format("\\hypertarget{%s}{%%\n", img.identifier)
        label = string.format("\n\\label{%s}", img.identifier)
    end

    src_begin = img.src:sub(0, -10)
    file_type = img.src:sub(-4) -- could be png or jpg or svg. would break with jpeg
    check_light = img.src:sub(-9, -5)

    -- print(type(img.caption))

    -- caption = pandoc.utils.stringify(Maths2Markdown(pandoc.Span(img.caption)))
    caption = pandoc.Span(img.caption)

    short_caption = pandoc.utils.stringify(short_caption)

    -- inject markdown that works inside the html environment
    -- see: https://squidfunk.github.io/mkdocs-material/reference/images/#light-and-dark-mode
    -- light_src = string.format("![%s](%slight.svg#only-light)", img.identifier, src_begin)
    -- dark_src = string.format("![%s](%sdark.svg#only-dark)", img.identifier, src_begin)

    -- switch to injecting raw html

    html_style = string.format("style=\"width: %s; margin: auto;\"", img.attributes['width'])
    

    light_src = string.format("<img alt=\"%s\" %s src=\".%slight%s#only-light\" >", img.identifier, html_style, src_begin, file_type)
    dark_src = string.format("<img alt=\"%s\" %s src=\".%sdark%s#only-dark\" >", img.identifier, html_style, src_begin, file_type)

    if check_light == "light" then
        full_src = string.format("%s\n    %s", light_src, dark_src)
    else
        -- if light/dark options don't seem present, just use the src as is.
        full_src = string.format("![%s](%s)", img.identifier, img.src)
    end
    -- print(caption)
    -- print(type(caption))
    --     string = string.format("<figure markdown> \
    --     <a name='%s'></a> \
    --     %s \
    --     <figcaption markdown>%s</figcaption> \
    -- </figure>", img.identifier, full_src, caption)
    string = string.format("<figure markdown> \
    <a name='%s'></a> \
    %s \
    <figcaption markdown> ", img.identifier, full_src)
    return pandoc.Para { pandoc.RawInline('markdown', string), caption, pandoc.RawInline('markdown', "</figcaption>\
    </figure>") }
end

function Maths2Markdown(sp)
    -- print(type(sp))
    -- for i, thing in ipairs(sp) do
    --     print(thing)
    -- end
    -- print(sp.content[15])
    -- print(#sp.content)

    for i, thing in ipairs(sp.content) do
        -- print(type(thing))
        -- print(thing)
        -- print(thing.t)
        -- print(thing)
        if thing.t == "Math" then
            print(thing.text)
            thing.t = "Str"
            thing.text = string.format("$%s$", thing.text)
            print(thing.text)
        end
    end
    return sp
end

-- math-printer.lua
-- function Math(el)
--     -- el.t can be 'Math', 'InlineMath', or 'DisplayMath'
--     -- el.text is the LaTeX code
--     print(el.text)
--     -- Return the element unchanged
--     return el
-- end

-- math-label-capture.lua
-- function Div(el)
--     -- Check if the Div contains a math block
--     if #el.content > 0 and el.content[1].t == "Math" then
--         -- Print the label of the math block
--         print(el.identifier)
--     end
--     -- Return the element unchanged
--     return el
-- end

-- This takes the native pandoc representation of Divs and outputs an html div with the markdown data attribute
-- For some reason, pandoc was stripping the markdown data attribute when deactivating the native_divs extension
function Div(el)
    -- this is useful for parsing divs: https://github.com/pandoc/lua-filters/blob/master/list-table/list-table.lua
    -- print(el.classes[1])
    -- print(el.content[1].t)
    -- print(el.content[1].content[1].t)
    -- color = el.attributes['color']
    -- -- if no color attribute, return unchanged
    -- if color ~= nil then
    --     print(color)
    -- end
    -- print("")

    -- success, color = pcall(function() return el.attributes['color'] end)
    -- print(el.content[1])
    -- if el.content[1].t == "Para" then

    -- if success then
    --     string = string.format("<div class=%s markdown>\n\n", color)

    --     table.insert(el.content, 1, pandoc.RawInline('markdown', string))
    --     table.insert(el.content, pandoc.RawInline('markdown', '</div>'))
    --     return el.content
    -- end

    -- if 

    if el.classes[1] == "latex" then
        return pandoc.RawInline('markdown', "")
      end

    if el.attributes.style then
        local style = el.attributes.style
        local color = style:match("color:%s*([^;]+)")
        if color then
            string = string.format("<div class=%s markdown>\n\n", color)

            table.insert(el.content, 1, pandoc.RawInline('markdown', string))
            table.insert(el.content, pandoc.RawInline('markdown', '</div>'))
            return el.content
        end
    end


    if el.content[1].t == "Para" then
        if el.content[1].content[1].t == "Math" then
            string = string.format("<div class=%s markdown>\n\n$$%s$$\n\n</div>", el.classes[1],
                el.content[1].content[1].text)
            -- print(el.content[1].content[1].text)
            return pandoc.RawInline('markdown', string)
        end
    end
    return el
end



function Span(el)
    -- <span class="bokeh" id="../code/test_1"></span>
    if el.classes:includes("bokeh") then
        local path = el.attributes.path
        string = string.format("<span class='bokeh' id='%s'></span>", path)
        return pandoc.RawInline('markdown', string)
    end

    -- <span class="html">This is some html</span>
    -- pass through unmodified spans marked "html"
    if el.classes[1] == "html" then
        -- print(el.content[1].text)
        return el.content
      end

    if el.classes[1] == "html_lineskip" then
    -- print(el.content[1].text)
    el.content[1].text = "\n" .. el.content[1].text
    return el.content
    end


    -- ignore stuff like <span class="latex"></span> that's only for latex output
    if el.classes[1] == "latex" then
        -- print(el)
        -- print("NOT including: ", el.content)
        return pandoc.RawInline('markdown', "")
    end


    -- switch style tags for colors to classes (for light/dark support)
    if el.attributes.style then
        local style = el.attributes.style
        -- print(style)
        local color = style:match("color:%s*([^;]+)")
        -- print(color)
        if color then
            string = string.format("<span class=%s markdown>", color)
            

            table.insert(el.content, 1, pandoc.RawInline('markdown', string))
            table.insert(el.content, pandoc.RawInline('markdown', '</span>'))
            return el.content
        end
    end
    -- success, color = pcall(function() return el.attributes['color'] end)
    -- print(el.content[1])
    -- if el.content[1].t == "Para" then
end

function Note (note)
    --- this can capture footnotes
    -- you might be able to customize this for turning footnotes into material mkdocs annotations
    local text = pandoc.utils.stringify(note.content)
  
    return note
  end

-- function Span(el)
--     -- print("dsf")
--     color = el.attributes['color']
--     -- if no color attribute, return unchanged
--     if color ~= nil then
--         print(color)

--         string = string.format("<span class=%s markdown></div>", el.classes[1],
--         el.content[1].content[1].text)
--         return pandoc.RawInline('markdown', string)
--     end
-- end


-- -- converts things like <span color=red>This text is red </span>
-- Span = function(el)
--     color = el.attributes['color']
--     -- if no color attribute, return unchanged
--     if color == nil then return el end

--     -- transform to <span style="color: red;"></span>
--     if FORMAT:match 'html' then
--       -- remove color attributes
--       el.attributes['color'] = nil
--       -- use style attribute instead
--       el.attributes['style'] = 'class: ' .. color .. ';'
--       -- return full span element
--       return el
--     elseif FORMAT:match 'latex' then
--       -- remove color attributes
--       el.attributes['color'] = nil
--       -- encapsulate in latex code
--       table.insert(
--         el.content, 1,
--         pandoc.RawInline('latex', '\\textcolor{'..color..'}{')
--       )
--       table.insert(
--         el.content,
--         pandoc.RawInline('latex', '}')
--       )
--       return el.content
--     else
--       -- for other format return unchanged
--       return el
--     end
--   end

-- Span = function(el)
--     color = el.attributes['color']
--     -- if no color attribute, return unchanged
--     if color == nil then return el end

--     -- transform to <span style="color: red;"></span>
--     if FORMAT:match 'html' then
--       -- remove color attributes
--       el.attributes['color'] = nil
--       -- use style attribute instead
--       el.attributes['style'] = 'color: ' .. color .. ';'
--       -- return full span element
--       return el
--     elseif FORMAT:match 'latex' then
--       -- remove color attributes
--       el.attributes['color'] = nil
--       -- encapsulate in latex code
--       table.insert(
--         el.content, 1,
--         pandoc.RawInline('latex', '\\textcolor{'..color..'}{')
--       )
--       table.insert(
--         el.content,
--         pandoc.RawInline('latex', '}')
--       )
--       return el.content
--     else
--       -- for other format return unchanged
--       return el
--     end
--   end

-- img.identifier is cryostat_concept


-- <figure markdown>
-- <a name="histogram_1"></a>
--   ![cryostat_1](./figs_05/fig1_light.svg#only-light)
--   ![cryostat_1](./figs_05/fig1_dark.svg#only-dark)
--   <figcaption>Image caption</figcaption>
-- </figure>

-- function serializeTable(val, name, skipnewlines, depth)
--     skipnewlines = skipnewlines or false
--     depth = depth or 0

--     local tmp = string.rep(" ", depth)

--     if name then tmp = tmp .. name .. " = " end

--     if type(val) == "table" then
--         tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

--         for k, v in pairs(val) do
--             tmp =  tmp .. serializeTable(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
--         end

--         tmp = tmp .. string.rep(" ", depth) .. "}"
--     elseif type(val) == "number" then
--         tmp = tmp .. tostring(val)
--     elseif type(val) == "string" then
--         tmp = tmp .. string.format("%q", val)
--     elseif type(val) == "boolean" then
--         tmp = tmp .. (val and "true" or "false")
--     else
--         tmp = tmp .. "\"[inserializeable datatype:" .. type(val) .. "]\""
--     end

--     return tmp
-- end
