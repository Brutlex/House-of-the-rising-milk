-- cloud class and related functionality

local class = require('lib/middleclass')

Cloud = class('Cloud')

function Cloud:initialize(x, y )
  self.x = x
  self.y = y
  
  
  objects.cloud = {}
  objects.cloud.body =  love.physics.newBody(world, C.W/2, C.H/2)
  objects.cloud.shape = love.physics.newRectangleShape(160, 0)
  objects.cloud.fixture = love.physics.newFixture(objects.cloud.body, objects.cloud.shape)
  objects.cloud.fixture:setRestitution(0.5)
end
