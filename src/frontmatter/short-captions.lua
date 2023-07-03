if FORMAT ~= "latex" then
    return
  end

  function fix_path (path)
    -- say path=./figs_01/Figure_Data_Sept_2022.svg

    chapter = path:sub(8, 9) -- this pulls out the '01' from figs_01
    -- final_path = path
    -- return chapter
    if path:sub(-4) == '.svg' then -- if its a svg, switch to pdf of same name
        final_path = 'chapter_' .. chapter .. path:sub(2,-5) .. '.pdf'
    else -- otherwise don't change filetype
        final_path = 'chapter_' .. chapter .. path:sub(2)
    end
    return final_path
  end
  
  
  function Image (element)
    element.src = fix_path(element.src)
    return element
  end
  
  local function latex(str)
    return pandoc.RawInline('latex', str)
  end
  
  function figure_image (elem)
    local image = elem.content and elem.content[1]
    return (image.t == 'Image' and image.title == 'fig:')
      and image
      or nil
  end
  
  function Para (para)
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
      hypertarget = string.format("\\hypertarget{%s}{%%\n",img.identifier)
      label = string.format("\n\\label{%s}",img.identifier)
    end
    return pandoc.Para {
      latex(hypertarget .. "\\begin{figure}\n\\centering\n"),
      img,
      latex("\n\\caption["), short_caption, latex("]"), pandoc.Span(img.caption),
      latex(label .."\n\\end{figure}\n}\n")
    }
  end

--   https://stackoverflow.com/questions/48569597/pandoc-filters-change-relative-paths-to-absolute-paths
  
function CodeBlock(el)
  print(el)
  print(el[0])
end