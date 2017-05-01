-- cookie class and related functionality
local class = require('lib/middleclass')

Cookie = class('Cookie')


function Cookie:initialize(x, y, name, img)
  self.radius = 35
  --self.sensorheight = 30
  self.sensorradius = self.radius/2.5
  self.speed = 30
  self.winner = false
  self.maxvel = 300
  self.name = name
  self.body = love.physics.newBody(world, x, y, "dynamic")
  self.body:setFixedRotation(true)
  self.body:setLinearDamping(0.1)

  self.shape = love.physics.newCircleShape(self.radius)
  self.fixture = love.physics.newFixture(self.body, self.shape, 1)
  self.fixture:setRestitution(0.5)
  self.fixture:setFriction(0.1)
  self.fixture:setUserData(name.."body")

  self.sensorbody = love.physics.newBody(world, x, y+self.radius+self.sensorradius, "dynamic")
  self.sensorshape = love.physics.newCircleShape(self.sensorradius)
  self.sensorfixture = love.physics.newFixture(self.sensorbody, self.sensorshape, 0)
  self.sensorfixture:setSensor(true)
  self.sensorfixture:setUserData(name)

  self.joint = love.physics.newWeldJoint(self.body, self.sensorbody, x, y, false)

  self.contact = false
  self.img = img
  self.image = self.img.normal  
end


function Cookie:rechtsGehen()
  local x,y = self.body:getLinearVelocity()
  if math.abs(x) < self.maxvel then
    self.body:applyLinearImpulse(self.speed, 0)
    self.image = self.img.right
  end
end

function Cookie:linksGehen()
  local x,y = self.body:getLinearVelocity()
  if math.abs(x) < self.maxvel then
    self.body:applyLinearImpulse(-self.speed, 0)
    self.image = self.img.left
  end
end

function Cookie:springen()
  self.body:applyLinearImpulse(0, -self.speed*10)
  self.image = self.img.jumpUp

  if sound then
    if self.name == 'cookie1' then
      jumpA:play()
    else
      jumpB:play()
    end
  end
end

function Cookie:draw()
  love.graphics.draw(self.image, self.body:getX(), self.body:getY(), self.body:getAngle(),
    1, 1, self.image:getWidth()/2, self.image:getHeight()/2)

--[[
  love.graphics.setFont(smallFont)
  if self.name == 'cookie2' then
    love.graphics.setColor(255,0,0)
    love.graphics.print('Cookie B contact: ' .. tostring(self.contact), 50, 50)
  else
    love.graphics.setColor(0,0,255)
    love.graphics.print('Cookie A contact: ' .. tostring(self.contact), 700, 50)
  end
  love.graphics.setColor(0,255,0)
  --love.graphics.print(tostring(CA) .. " " .. tostring(CB), 300, 100)
  love.graphics.setColor(255,0,0)
  love.graphics.circle('line', self.body:getX(), self.body:getY(), self.radius)
  love.graphics.setColor(0,255,0)
  --love.graphics.rectangle('line', self.sensorbody:getX()-self.radius/2, self.sensorbody:getY()-self.sensorheight/2, self.radius, self.sensorheight)
  love.graphics.circle('line', self.sensorbody:getX(), self.sensorbody:getY(), self.sensorradius)
  love.graphics.setColor(255,255,255,255)
]]--
end


function beginContact(a, b, coll)

  local ca, cb = a:getUserData(), b:getUserData()

  -- collide with clouds
  if (ca == "cookie1" or ca == "cookie2") and cb == "cloud" then
    collideCloud(ca, cb)
  end

  if ca == "cloud" and (cb == "cookie1" or cb == "cookie2") then
    collideCloud(cb, ca)
  end



  -- collide with cookie
  if ca == "cookie1" and cb == "cookie2body" then
    -- A on B, A is ca
    cookieA.contact = true
    cookieA.image = cookieA.img.normal
  elseif cb == "cookie1" and ca == "cookie2body" then
    -- A on B, A is cb
    cookieA.contact = true
    cookieA.image = cookieA.img.normal
  elseif ca == "cookie2" and cb == "cookie1body" then
    -- B on A, B is ca
    cookieB.contact = true
    cookieB.image = cookieB.img.normal
  elseif cb == "cookie2" and ca == "cookie1body" then
    -- B on A, B is cb
    cookieB.contact = true
    cookieB.image = cookieB.img.normal
  end


  -- collide with milk
  if (ca == "cookie1" and cb == "end") or (ca == "end" and cb == "cookie1") then
    cookieB.winner = true
    if sound then splashA:play() end
    Gamestate.switch(win)
  end

  if (ca == "cookie2" and cb == "end") or (ca == "end" and cb == "cookie2") then
    cookieA.winner = true
    if sound then splashB:play() end
    Gamestate.switch(win)
  end
end

function endContact(a, b, coll) 
  local ca, cb = a:getUserData(), b:getUserData()

  if ca == "cookie1" and cb == "cookie2body" then
    -- A on B, A is ca
    cookieA.contact = false
  elseif cb == "cookie1" and ca == "cookie2body" then
    -- A on B, A is cb
    cookieA.contact = false
  elseif ca == "cookie2" and cb == "cookie1body" then
    -- B on A, B is ca
    cookieB.contact = false
  elseif cb == "cookie2" and ca == "cookie1body" then
    -- B on A, B is cb
    cookieB.contact = false
  elseif (ca == "cookie1" or ca == "cookie2") and cb == "cloud" then
    unCollideCloud(ca, cb)
  elseif ca == "cloud" and (cb == "cookie1" or cb == "cookie2") then
    unCollideCloud(cb, ca)
  else
    --[[
    print(ca)
    print(cb)
    print("")
    ]]--
  end
end

function collideCloud(ccookie, ccloud)
  if ccookie == "cookie1" then
    cookieA.contact = true
    cookieA.image = cookieA.img.normal
  elseif ccookie == "cookie2" then
    cookieB.contact = true
    cookieB.image = cookieB.img.normal
  else
    print("collide bug")
  end
end

function unCollideCloud(ccookie, ccloud)
  if ccookie == "cookie1" then
    cookieA.contact = false
  elseif ccookie == "cookie2" then
    cookieB.contact = false
  else
    print("uncollide bug!")
  end
end

function preSolve(a, b, coll)
  --not used
end

function postSolve(a, b, coll, normalimpulse, tangentimpulse)
  --not used
end