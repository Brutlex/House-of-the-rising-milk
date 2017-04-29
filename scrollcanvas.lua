-- scrollcanvas class and related functionality
local class = require('lib/middleclass')

SC = class('SC')

function SC:initialize()
  self.dc = C.H -- offset between canvases
  self.speed = 10

  self.cb = love.graphics.newCanvas(C.W, C.H)
  self.cby = -C.H -- start completely outside the screen

  self.ca = love.graphics.newCanvas(C.W, C.H)
  self.cay = self.cby + self.dc -- start at screen position

--[[
  love.graphics.setCanvas(self.cb)
  love.graphics.clear()
  love.graphics.setColor(100, 100, 200)
  love.graphics.rectangle("line", 0, 0, C.W, C.H)
  
  love.graphics.setCanvas(self.ca)
  love.graphics.clear()
  love.graphics.setColor(200, 100, 100)
  love.graphics.rectangle("line", 0, 0, C.W, C.H)
  
  love.graphics.setCanvas()
  love.graphics.setBlendMode("alpha")
]]-- 
end

function SC:update(dt)
  local offset = self.speed * dt
  
  
  local tcby = self.cby + offset
  local tcay = tcby + self.dc

  if tcay >= C.H-1 then tcay = tcay - 2*C.H end
  if tcby >= C.H-1 then tcby = tcby - 2*C.H end

  self.cay = tcay
  self.cby = tcby

  for k,v in pairs(clouds) do
    v:update(dt)
  end
end

function SC:draw()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.setBlendMode("alpha", "premultiplied")
  
  love.graphics.draw(self.ca, 0, self.cay)
  love.graphics.draw(self.cb, 0, self.cby)
  
  love.graphics.setBlendMode("alpha")
end