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

function RawInline(raw)
    if raw.text == "\n" then
        return ""
    else
        text = string.gsub(raw.text, "\n\r", "\n\r")
        return pandoc.RawInline('markdown', text)
    end
end

function figure_image(elem)
    -- print(elem)
    local image = elem.content and elem.content[1]
    return (image.t == 'Image' and image.title == 'fig:')
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

function Para(para)
    local img = figure_image(para)
    if not img or not img.caption or not img.attributes['short-caption'] then
        return nil
    end

    local short_caption = pandoc.Span(
            pandoc.read(img.attributes['short-caption']).blocks[1].c
        )
    local hypertarget = "{%%\n"
    local label = "\n"
    if img.identifier ~= img.title then
        hypertarget = string.format("\\hypertarget{%s}{%%\n", img.identifier)
        label = string.format("\n\\label{%s}", img.identifier)
    end

    src_begin = img.src:sub(0, -10)
    check_light = img.src:sub( -9, -5)


    caption = pandoc.utils.stringify(img.caption)
    short_caption = pandoc.utils.stringify(short_caption)

    light_src = string.format("![%s](%slight.svg#only-light)", img.identifier, src_begin)
    dark_src = string.format("![%s](%sdark.svg#only-dark)", img.identifier, src_begin)

    if check_light == "light" then
        full_src = string.format("%s\n    %s", light_src, dark_src)
    else
        full_src = string.format("![%s](%s)", img.identifier, img.src)
    end
    string = string.format("<figure markdown> \
    <a name='%s'></a> \
    %s \
    <figcaption><b>%s</b>%s</figcaption> \
</figure>", img.identifier, full_src, short_caption, caption)
    return pandoc.RawInline('markdown', string)
end

function Div(el)
    -- this is useful for parsing divs: https://github.com/pandoc/lua-filters/blob/master/list-table/list-table.lua
    -- print(el.classes[1])
    -- print(el.content[1].t)
    -- print(el.content[1].content[1].t)

    if el.content[1].t == "Para" then
        if el.content[1].content[1].t == "Math" then
            string = string.format("<div class=%s markdown>\n\n$$%s$$\n\n</div>", el.classes[1], el.content[1].content[1].text)
            return pandoc.RawInline('markdown', string)
        end
    end
    return el
end

-- img.identifier is cryostat_concept


-- <figure markdown>
-- <a name="histogram_1"></a>
--   ![cryostat_1](./figs_05/fig1_light.svg#only-light)
--   ![cryostat_1](./figs_05/fig1_dark.svg#only-dark)
--   <figcaption>Image caption</figcaption>
-- </figure>
