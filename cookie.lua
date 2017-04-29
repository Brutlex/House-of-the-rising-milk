-- cookie class and related functionality
local class = require('lib/middleclass')

Cookie = class('Cookie')

function Cookie:initialize(x, y)
  self.body = love.physics.newBody(world, x, y, "dynamic")
  self.body:setFixedRotation(true)
  self.shape = love.physics.newCircleShape(40)
  self.fixture = love.physics.newFixture(self.body, self.shape,1)
  self.fixture:setRestitution(0.5)
end

function update_cookies(dt)
  
end
function Cookie:rechtsGehen()
  self.body:applyLinearImpulse(10, 0)
  print ("rechts gehen")
end

--function draw_cookies()
 --- love.graphics.draw(cookie1, objects.cookie.body:getX(), objects.cookie.body:getY())
--end