-- scrollcanvas class and related functionality
local class = require('lib/middleclass')

SC = class('SC')

speed = 30  -- scroll speed of the canvases (clouds)

function SC:initialize()

  self.dc = C.H*3 -- offset between canvases

  self.cb = love.graphics.newCanvas(C.W, self.dc)
  self.cby = -(5*C.H) -- start completely outside the screen

  self.ca = love.graphics.newCanvas(C.W, self.dc)
  self.cay = self.cby + self.dc -- start at screen position

  if DRAW_DEBUG then
    love.graphics.setCanvas(self.cb)
    love.graphics.clear()
    love.graphics.setColor(100, 100, 200)
    love.graphics.setLineWidth(10)
    love.graphics.rectangle("line", 0, 0, C.W, self.dc)

    love.graphics.setCanvas(self.ca)
    love.graphics.clear()
    love.graphics.setColor(200, 100, 100)
    love.graphics.setLineWidth(10)
    love.graphics.rectangle("line", 0, 0, C.W, self.dc)

    love.graphics.setCanvas()
    love.graphics.setLineWidth(1)
    love.graphics.setBlendMode("alpha")
  end
end


function SC:update(dt)
  local offset = speed * dt -- position delta in this update

  local tcby = self.cby + offset  -- temp. y position of 'canvas' b
  local tcay = self.cay + offset -- temp. y position of 'canvas' a

--normalize this stuff to the range -2*dc-C.H (-3840) and C.H (768) (-1?)
-- position of canvases is always their top
  local top = -5 * C.H
  local bottom = C.H-1

  if speed > 0 then -- scroll down, positive y
    if tcay > bottom then
      tcay = tcay - self.dc*2
    end
    if tcby > bottom then
      tcby = tcby - self.dc*2
    end
  elseif speed < 0 then -- scroll up, negative y
    if tcay < top then
      tcay = tcay + self.dc*2
    end
    if tcby < top then
      tcby = tcby + self.dc*2
    end  
  else -- 0
  end

  -- write back
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

  love.graphics.setColor(0,0,0)
  love.graphics.print("Speed: " .. speed, 450, 50)
  love.graphics.setColor(255, 255, 255, 255)
end