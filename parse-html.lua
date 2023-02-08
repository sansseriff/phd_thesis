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
        text = string.gsub(raw.text, "[\n\r]", "")
        -- print(text)
        return pandoc.RawInline('markdown', text)
    end
end

function RawInline(raw)
    if raw.text == "\n" then
        return ""
    else
        text = string.gsub(raw.text, "[\n\r]", "")
        return pandoc.RawInline('markdown', text)
    end
end

function figure_image(elem)
    local image = elem.content and elem.content[1]
    return (image.t == 'Image' and image.title == 'fig:')
        and image
        or nil
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
    print(img.caption)
    string = string.format("<figure markdown> \
                            <a name='{%s}'></a> \
                            ![%s](./figs_05/fig1_light.svg#only-light) \
                            ![%s](./figs_05/fig1_dark.svg#only-dark) \
                            <figcaption><b>%s</b>And this is the second part</figcaption> \
                            </figure>", img.identifier, img.identifier, img.identifier, img.caption, short_caption)
    return pandoc.RawInline('markdown', string)
end

-- img.identifier is cryostat_concept


-- <figure markdown>
-- <a name="histogram_1"></a>
--   ![cryostat_1](./figs_05/fig1_light.svg#only-light)
--   ![cryostat_1](./figs_05/fig1_dark.svg#only-dark)
--   <figcaption>Image caption</figcaption>
-- </figure>
