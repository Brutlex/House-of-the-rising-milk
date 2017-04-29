-- cloud class and related functionality

local class = require('lib/middleclass')

Cloud = class('Cloud')

function Cloud:initialize(x, y, canvas)
  self.canvas = canvas -- 'a' or 'b'
  self.relY = y
  self.body = love.physics.newBody(world, x, y)
  self.shape = love.physics.newRectangleShape(160, 0)
  self.fixture = love.physics.newFixture(self.body, self.shape)
end

function Cloud:update(dt)
  if self.canvas == 'a' then
    self.body:setY(scrollcanvas.cay + self.relY)
  elseif self.canvas == 'b' then
    self.body:setY(scrollcanvas.cby + self.relY)
  end
end

function Cloud:draw()
  love.graphics.draw(cloud1, self.body:getX(), self.body:getY())
end
