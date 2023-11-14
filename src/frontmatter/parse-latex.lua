if FORMAT ~= "latex" then
  return
end

function fix_path(path)
  -- say path=./figs_01/Figure_Data_Sept_2022.svg

  chapter = path:sub(8, 9)   -- this pulls out the '01' from figs_01
  -- final_path = path
  -- return chapter
  if path:sub(-4) == '.svg' then   -- if its a svg, switch to pdf of same name
    final_path = 'chapter_' .. chapter .. path:sub(2, -5) .. '.pdf'
  else                             -- otherwise don't change filetype
    final_path = 'chapter_' .. chapter .. path:sub(2)
  end
  return final_path
end

function Image(element)
  local path = element.attributes

  if element.attributes["path"] ~= nil then
    -- print("path: " .. element.src:sub(-4, -1))
    -- Print the path to the console
    if element.src:sub(-4, -1) == ".svg" then
      local new_path = "./" .. element.attributes["path"] .. element.src:sub(2, -5) .. '.pdf'
      element.src = new_path
    else
      local new_path = "./" .. element.attributes["path"] .. element.src:sub(2, -1)
      element.src = new_path
    end
     -- fix_path(element.src)
  else
    -- Print the path to the console
    print("error: missing path attribute")
    print(element.attributes)
    print("missing: " .. element.src)
  end
  
  return element
end

local function latex(str)
  return pandoc.RawInline('latex', str)
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
  return pandoc.Para {
    latex(hypertarget .. "\\begin{figure}\n\\centering\n"),
    img,
    latex("\n\\caption["), short_caption, latex("]"), pandoc.Span(img.caption),
    latex(label .. "\n\\end{figure}\n}\n")
  }
end

--   https://stackoverflow.com/questions/48569597/pandoc-filters-change-relative-paths-to-absolute-paths


-- convert markdown code block to latex
function CodeBlock(el)
  local code_language = el.classes[1]
  lang_string = latex(string.format(
  "\n\\begin{minted}\n[\nframe=lines,\nframesep=2mm,\nbaselinestretch=1,\nbgcolor=extralightgray,\nfontsize=\\footnotesize,\nlinenos]\n{%s}\n",
    code_language))
  return pandoc.Para { lang_string, latex(el.text), latex("\n\\end{minted}")
  }
end

function Div(el)
  if el.classes:includes("latex") then
    -- return pandoc.Para(el.content)
    return el.content
  end

  if el.classes[1] == "html" then
    return pandoc.RawInline('latex', "")
  end

  if el.attributes.style then
    local style = el.attributes.style
    local color = style:match("color:%s*([^;]+)")
    if color then

      if color == "red" then
        color= "darkred"
      end
      if color == "blue" then
        color= "midnightblue"
      end
      
      table.insert(
        el.content, 1,
        pandoc.RawInline('latex', '\\textcolor{' .. color .. '}{')
      )
      table.insert(
        el.content,
        pandoc.RawInline('latex', '}')
      )
      return el.content
    end
  end

end


-- converts things like <span color=red>This text is red </span>
Span = function(el)
  -- color = el.attributes['color']
  target = el.attributes['target']

  if el.attributes.style then
    local style = el.attributes.style
    local color = style:match("color:%s*([^;]+)")
    if color then

      if color == "red" then
        color= "darkred"
      end
      if color == "blue" then
        color= "midnightblue"
      end

      table.insert(
        el.content, 1,
        pandoc.RawInline('latex', '\\textcolor{' .. color .. '}{')
      )
      table.insert(
        el.content,
        pandoc.RawInline('latex', '}')
      )
      return el.content
    end
  end


  if el.classes[1] == "latex" then
    -- table.insert(el.content, 1, pandoc.RawInline('latex', '\\mccorrect{'))
    -- table.insert(el.content, pandoc.RawInline('latex', '}'))
    -- return el.content
    -- print(pandoc.RawInline('latex', el.content[1].text))
    return el.content
  end

  if el.classes[1] == "html" then
    return pandoc.RawInline('latex', "")
  end

  if color == nil then return el end

  -- -- transform to <span style="color: red;"></span>
  -- if FORMAT:match 'html' then
  --   -- remove color attributes
  --   el.attributes['color'] = nil
  --   -- use style attribute instead
  --   el.attributes['style'] = 'class: ' .. color .. ';'
  --   -- return full span element
  --   return el

  -- elseif FORMAT:match 'latex' then
  --   -- remove color attributes
  --   el.attributes['color'] = nil
  --   -- encapsulate in latex code
  --   table.insert(
  --     el.content, 1,
  --     pandoc.RawInline('latex', '\\textcolor{'..color..'}{')
  --   )
  --   table.insert(
  --     el.content,
  --     pandoc.RawInline('latex', '}')
  --   )
  --   return el.content
  -- else
  --   -- for other format return unchanged
  --   return el
  -- end
end

-- added 10.4.02023
-- for using $$ and $ for math instead of \(...\)
-- function Math (m)
--   local delimiter = m.mathtype == 'InlineMath' and '$' or '$$'
--   return pandoc.RawInline('tex', delimiter .. m.text .. delimiter)
-- end

function Math (m)
  local delimiter = m.mathtype == 'InlineMath' and '$' or '$$'
  print(string.sub(m.text, 3, 14))
  if string.sub(m.text, 3, 14) == 'begin{align}' then
    print("################ correct")
    delimiter = ''
  end
  -- print("working")
  return pandoc.RawInline('tex', delimiter .. m.text .. delimiter)
end