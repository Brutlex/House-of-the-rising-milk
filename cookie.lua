-- cookie class and related functionality
local class = require('lib/middleclass')

Cookie = class('Cookie')


function Cookie:initialize(x, y, name, img)
  local radius = 35
  local sensorheight = 10
  self.speed = 25
  self.winner = false
  self.body = love.physics.newBody(world, x, y, "dynamic")
  self.body:setFixedRotation(true)
  self.shape = love.physics.newCircleShape(radius)
  self.fixture = love.physics.newFixture(self.body, self.shape, 1)
  self.fixture:setRestitution(1)
  self.fixture:setFriction(0.4)
  
  self.sensorbody = love.physics.newBody(world, x+radius/2, y+radius*2, "dynamic")
  self.sensorshape = love.physics.newRectangleShape(radius/2, sensorheight)
  self.sensorfixture = love.physics.newFixture(self.sensorbody, self.sensorshape, 0)
  self.sensorfixture:setSensor(true)
  self.sensorfixture:setUserData(name)
  
  self.joint = love.physics.newWeldJoint( self.body, self.sensorbody, x, y+radius*2, false)
  
  self.contact = false
  self.img = img
  self.image = self.img.normal  
end


function Cookie:rechtsGehen()
  self.body:applyLinearImpulse(self.speed, 0)
  self.image = self.img.right
end

function Cookie:linksGehen()
  self.body:applyLinearImpulse(-self.speed, 0)
  self.image = self.img.left
end

function Cookie:springen()
  self.body:applyLinearImpulse(0, -self.speed*5)
  self.image = self.img.jumpUp
end

function Cookie:draw()
  --wrong position
  --topLeftX, topLeftY, bottomRightX, bottomRightY = self.sensorfixture:getBoundingBox()
  --love.graphics.rectangle('line', self.sensorbody:getX(), self.sensorbody:getY(), bottomRightX - topLeftX, bottomRightY - topLeftY)
  
  love.graphics.draw(self.image, self.body:getX(), self.body:getY(), self.body:getAngle(),
      1, 1, self.image:getWidth()/2, self.image:getHeight()/2)
end

-- cookie A
function beginContact(a, b, coll)
  if(b:getUserData() == "cookie1") then
    cookieA.contact = true
    cookieA.image = cookieA.img.normal
    
    if(a:getUserData() == "end") then
      Gamestate.switch(win)
      cookieB.winner = true
      
      if sound then
       splashA:play()
      end
      
    else 
      
      if sound then
        --hit:play()
      end
    end
  end
  
  
-- cookie B
  if(b:getUserData() == "cookie2") then

    cookieB.contact = true
    cookieB.image = cookieB.img.normal
    
    if(a:getUserData() == "end") then
      Gamestate.switch(win)
      cookieA.winner = true
      
      if sound then
       splashB:play()
      end 
      
    else 
      if (sound) then
        --hit:play()
      end
    end
  end
  
end



function endContact(a, b, coll) 
  --A
  if(b:getUserData() == "cookie1") then
    cookieA.contact = false
    
    if (sound) then
    jumpA:play()
    end
  end
  
  --B
  if(b:getUserData() == "cookie2") then
    cookieB.contact = false
    
    if (sound) then
    jumpB:play()
    end
  end 
end

function preSolve(a, b, coll)
  --not used
end

function postSolve(a, b, coll, normalimpulse, tangentimpulse)
  --not used
end