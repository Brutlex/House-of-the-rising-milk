-- cookie class and related functionality
local class = require('lib/middleclass')

Cookie = class('Cookie')

function Cookie:initialize(x, y, name, img)
  self.body = love.physics.newBody(world, x, y, "dynamic")
  self.body:setFixedRotation(true)
  self.shape = love.physics.newCircleShape(40)
  self.fixture = love.physics.newFixture(self.body, self.shape,1)
  self.fixture:setRestitution(0.5)
  self.fixture:setUserData(name)
  self.contact = false
  self.img = img
  self.image = self.img.normal  
end


function Cookie:rechtsGehen()
  self.body:applyLinearImpulse(10, 0)
  self.image = self.img.right
end

function Cookie:linksGehen()
  self.body:applyLinearImpulse(-10, 0)
  self.image = self.img.left
end
function Cookie:springen()
  self.body:applyLinearImpulse(0, -300)
  self.image = self.img.jumpUp
end
function Cookie:draw()
  love.graphics.draw(self.image, self.body:getX(), self.body:getY())
end