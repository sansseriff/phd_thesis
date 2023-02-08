function RawBlock (raw)
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
        text = string.gsub(raw.text,"[\n\r]","")
        print(text)
        return pandoc.RawInline('markdown', text)
    end
  end

  function RawInline(raw)
    if raw.text == "\n" then
        return ""
    else
        text = string.gsub(raw.text,"[\n\r]","")
        return pandoc.RawInline('markdown', text)
    end
  end