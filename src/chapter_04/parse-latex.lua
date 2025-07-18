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

  if para.content[1].identifier and string.sub(para.content[1].identifier, 1, 2) == "eq" then
    print(para.content[1].content[1])
  end

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


  -- if el.classes[1] == "latex" then
  --   -- table.insert(el.content, 1, pandoc.RawInline('latex', '\\mccorrect{'))
  --   -- table.insert(el.content, pandoc.RawInline('latex', '}'))
  --   -- return el.content
  --   -- print(pandoc.RawInline('latex', el.content[1].text))
  --   return pandoc.RawInline('latex', el.content[1].text)
  -- end

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
end

-- for using $$ and $ for math instead of \(...\)
function Math(m)
  local delimiter = m.mathtype == 'InlineMath' and '$' or '$$'
  return pandoc.RawInline('tex', delimiter .. m.text .. delimiter)
end





-- if you want to pass comments

-- Default: Don't export comments
-- local comments = nil

-- function Meta(meta)
--   -- If there is a "comments" field in the YAML frontmatter, extract this
--   if meta.comments then
--     comments = pandoc.utils.stringify(meta.comments)
--   end
--   return meta
-- end

-- function RawBlock(raw)
--   -- Only export if the input format is HTML (== HTML comment)
--   -- and if we have a comments value
--   -- if not comments then return end
--   -- if raw.format ~= 'html' then return end

--   -- Let's see if we actually have a comment
--   local comment = raw.text:match '%<%!%-%-%s*(.*)%s*%-%-%>'
--   if not comment then return end


--   local new_comment = "%" .. comment
--   new_comment = string.gsub(new_comment, "\n", "\n%%")

--   return new_comment

-- end

-- -- This line is required so that the meta values are read in first and THEN the
-- -- RawBlocks are traversed
-- return {
--   { Meta = Meta },
--   { RawBlock = RawBlock }
-- }
