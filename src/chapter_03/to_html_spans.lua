function Span(elem)
    print("starting")
    -- print(elem)
    -- print(elem.attributes.style:sub(8))

    -- print(elem.attributes.style:sub(1, 5))
    -- print(elem.attributes.style)
    -- print(elem)
    -- print(pandoc.Span(elem.content))
    if elem.attributes.style and elem.attributes.style:sub(1, 5) == "color" then
      print("found color")
      local color = elem.attributes.style:sub(8)
      string = string.format("<span style='color:red' markdown>", color)
      
      content = pandoc.Span(elem.content)
      print(pandoc.utils.stringify(elem.content))

    --   return elem.content

      local span_content = {
        pandoc.RawInline('markdown', string),
        pandoc.utils.stringify(elem.content),
        pandoc.RawInline('markdown', "</span>"),
      }
    --   print(elem.content)
      return pandoc.Span(span_content)

    --   return pandoc.Para { pandoc.RawInline('markdown', string), pandoc.utils.blocks_to_inlines(elem.content), pandoc.RawInline('markdown', "</span>") }
    --   return pandoc.RawInline('markdown', string)
    end
  end