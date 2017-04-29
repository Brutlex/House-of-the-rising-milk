-- cloud class and related functionality

local class = require('lib/middleclass')

Cloud = class('Cloud')

function Cloud:initialize(x, y)
  self.body = love.physics.newBody(world, x, y)
  self.shape = love.physics.newRectangleShape(160, 0)
  self.fixture = love.physics.newFixture(self.body, self.shape)
  self.fixture:setRestitution(0.5)
end

function Cloud:draw()
  love.graphics.draw(cloud1, self.body:getX(), self.body:getY())
end
