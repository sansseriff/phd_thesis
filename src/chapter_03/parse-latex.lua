if FORMAT ~= "latex" then
  return
end

function fix_path(path)
  -- say path=./figs_01/Figure_Data_Sept_2022.svg

  chapter = path:sub(8, 9) -- this pulls out the '01' from figs_01
  -- final_path = path
  -- return chapter
  if path:sub(-4) == '.svg' then -- if its a svg, switch to pdf of same name
    final_path = '.' .. path:sub(2, -5) .. '.pdf'
  else                           -- otherwise don't change filetype
    final_path = path:sub(2)
  end
  return final_path
end

function Image(element)
  element.src = fix_path(element.src)
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

-- Span = function(el)
--   color = el.attributes['color']
--   -- if no color attribute, return unchanged
--   if color == nil then return el end

--   -- transform to <span style="color: red;"></span>
--   if FORMAT:match 'html' then
--     -- remove color attributes
--     el.attributes['color'] = nil
--     -- use style attribute instead
--     el.attributes['style'] = 'color: ' .. color .. ';'
--     -- return full span element
--     return el
--   elseif FORMAT:match 'latex' then
--     -- remove color attributes
--     el.attributes['color'] = nil
--     -- encapsulate in latex code
--     table.insert(
--       el.content, 1,
--       pandoc.RawInline('latex', '\\textcolor{'..color..'}{')
--     )
--     table.insert(
--       el.content,
--       pandoc.RawInline('latex', '}')
--     )
--     return el.content
--   else
--     -- for other format return unchanged
--     return el
--   end
-- end


-- converts things like <span style="color: red">This text is red </span>
Span = function(el)
  -- color = el.attributes['color']
  target = el.attributes['target']

  if el.attributes.style then
    local style = el.attributes.style
    local color = style:match("color:%s*([^;]+)")
    if color then

      -- if color == "red" then
      --   color= "darkred"
      -- end
      -- if color == "blue" then
      --   color= "midnightblue"
      -- end

      -- use orange for todos
      if color == "orange" then 
        table.insert(
          el.content, 1,
          pandoc.RawInline('latex', '\\textbf{\\hl{')
        )
        table.insert(
          el.content,
          pandoc.RawInline('latex', '}}')
        )
        return el.content
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

  -- explicit todos from class name
  if el.classes[1] == "todo" then
    table.insert(
      el.content, 1,
      pandoc.RawInline('latex', '\\textbf{\\hl{')
    )
    table.insert(
      el.content,
      pandoc.RawInline('latex', '}}')
    )
    return el.content
  end


  if el.classes[1] == "latex" then
    -- table.insert(el.content, 1, pandoc.RawInline('latex', '\\mccorrect{'))
    -- table.insert(el.content, pandoc.RawInline('latex', '}'))
    -- return el.content
    print(pandoc.RawInline('latex', el.content[1].text))
    return pandoc.RawInline('latex', el.content[1].text)
  end

  if color == nil then return el end
end

-- for using $$ and $ for math instead of \(...\)
function Math(m)
  local delimiter = m.mathtype == 'InlineMath' and '$' or '$$'
  return pandoc.RawInline('tex', delimiter .. m.text .. delimiter)
end
