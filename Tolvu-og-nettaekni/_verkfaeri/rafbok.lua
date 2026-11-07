-- rafbok.lua – Pandoc-sía sem breytir Markdown-kennsluheftum í Typst.
--  * Mynd ein í málsgrein + skáletruð málsgrein sem byrjar á „Mynd N“
--    verður að Typst-figure með myndatexta.
--  * LaTeX-stærðfræði er þýdd yfir í Typst-stærðfræði; tugabrotskomma
--    (0{,}8) er látin halda sér án bils.
--  * Breidd mynda er reiknuð út frá pixlastærð (myndir eru 216 dpi).

local MAXW = 453 -- leturflatarbreidd í pt (A4, 2,5 cm spássíur)

local function png_width_pt(path)
  local f = io.open(path, "rb")
  if not f then return nil end
  local data = f:read(24); f:close()
  if not data or #data < 24 then return nil end
  local b1, b2, b3, b4 = data:byte(17, 20)
  local px = ((b1 * 256 + b2) * 256 + b3) * 256 + b4
  return px / 3 -- 216 dpi -> 72 pt á tommu
end

local function width_of(src)
  local w = png_width_pt(src)
  if not w then return "100%" end
  return string.format("%.0fpt", math.min(w, MAXW))
end

local function to_typst_inlines(inls)
  local doc = pandoc.Pandoc({ pandoc.Plain(inls) })
  local s = pandoc.write(doc, "typst")
  return (s:gsub("%s+$", ""))
end

local function fix_math(s)
  -- 0 comma 8  ->  0","8  (komma án bils í tugabrotum)
  local prev
  repeat
    prev = s
    s = s:gsub("(%d) comma (%d)", '%1","%2')
  until s == prev
  return s
end

function Math(el)
  local doc = pandoc.Pandoc({ pandoc.Plain({ el }) })
  local s = pandoc.write(doc, "typst")
  s = s:gsub("%s+$", "")
  return pandoc.RawInline("typst", fix_math(s))
end

local function lone_image(blk)
  if blk.t ~= "Para" then return nil end
  local img = nil
  for _, x in ipairs(blk.content) do
    if x.t == "Image" then
      if img then return nil end
      img = x
    elseif x.t ~= "Space" and x.t ~= "SoftBreak" then
      return nil
    end
  end
  return img
end

local function caption_para(blk)
  if not blk or blk.t ~= "Para" then return nil end
  local c = blk.content
  if #c == 1 and c[1].t == "Emph" then
    local txt = pandoc.utils.stringify(c[1])
    if txt:match("^Mynd%s+%d") then return c[1].content end
  end
  return nil
end

function Image(el)
  local w = el.attributes["width"] or width_of(el.src)
  return pandoc.RawInline("typst",
    string.format('#box(image("%s", width: %s))', el.src, w))
end

function Blocks(blocks)
  local out = pandoc.List()
  local i = 1
  while i <= #blocks do
    local b = blocks[i]
    local img = lone_image(b)
    if img then
      local cap = caption_para(blocks[i + 1])
      local w = img.attributes["width"] or width_of(img.src)
      local s
      if cap then
        s = string.format('#figure(image("%s", width: %s), caption: [%s], numbering: none)',
          img.src, w, to_typst_inlines(cap))
        i = i + 1
      else
        s = string.format('#figure(image("%s", width: %s), numbering: none)', img.src, w)
      end
      out:insert(pandoc.RawBlock("typst", s))
    else
      out:insert(b)
    end
    i = i + 1
  end
  return out
end

-- Typst túlkar „1.“, „+“, „-“ og „=“ fremst í línu sem lista/fyrirsagnir;
-- þessi tákn eru því „escape“-uð þegar þau standa ein og sér.
function Str(el)
  local t = el.text
  if t:match("^%d+%.$") then
    return pandoc.RawInline("typst", t:sub(1, -2) .. "\\.")
  elseif t == "+" or t == "-" or t == "=" then
    return pandoc.RawInline("typst", "\\" .. t)
  end
end

return {
  { Str = Str },
  { Math = Math },
  { Blocks = Blocks },
  { Image = Image },
}
