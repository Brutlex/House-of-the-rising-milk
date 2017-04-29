-- cookie class and related functionality
local class = require('lib/middleclass')

Cookie = class('Cookie')

function Cookie:initialize(x, y, name, img)
  local radius = 40
  local sensorheight = 20
  self.body = love.physics.newBody(world, x, y, "dynamic")
  self.body:setFixedRotation(true)
  self.shape = love.physics.newCircleShape(radius)
  self.fixture = love.physics.newFixture(self.body, self.shape, 0)
  self.fixture:setRestitution(0)
  --self.fixture:setUserData(name)
  
  self.sensorbody = love.physics.newBody(world, x, y+radius*2, "dynamic")
  self.sensorshape = love.physics.newRectangleShape(radius*2, sensorheight)
  self.sensorfixture = love.physics.newFixture(self.sensorbody, self.sensorshape, 0)
  self.sensorfixture:setSensor(true)
  self.sensorfixture:setUserData(name)
  
  self.joint = love.physics.newWeldJoint( self.body, self.sensorbody, x, y+radius*2, false)
  
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
  self.body:applyLinearImpulse(0, -200)
  self.image = self.img.jumpUp
end

function Cookie:draw()
  love.graphics.draw(self.image, self.body:getX(), self.body:getY())
  
  topLeftX, topLeftY, bottomRightX, bottomRightY = self.sensorfixture:getBoundingBox()
  love.graphics.rectangle('line', self.sensorbody:getX(), self.sensorbody:getY(), bottomRightX - topLeftX, bottomRightY - topLeftY)
end

function beginContact(a, b, coll)
  if(b:getUserData() == "cookie1") then
    cookieA.contact = true
    cookieA.image = cookieA.img.normal
  end
  if(b:getUserData() == "cookie2") then
    cookieB.contact = true
    cookieB.image = cookieB.img.normal
  end 
end

function endContact(a, b, coll) 
  if(b:getUserData() == "cookie1") then
    cookieA.contact = false
  end
  if(b:getUserData() == "cookie2") then
    cookieB.contact = false
  end 
end

function preSolve(a, b, coll)
  --not used
end

function postSolve(a, b, coll, normalimpulse, tangentimpulse)
  --not used
end