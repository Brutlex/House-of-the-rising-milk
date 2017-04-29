-- cloud class and related functionality

local class = require('lib/middleclass')

Cloud = class('Cloud')

function Cloud:initialize(x, y, canvas, form)
  self.canvas = canvas -- 'a' or 'b'
  self.relY = y
  self.Size = form
  self.body = love.physics.newBody(world, x, y)
<<<<<<< HEAD
  
  
  if self.Size == cloud1 then
    self.shape = love.physics.newRectangleShape(387,80)
  elseif self.Size == cloud2 then
    self.shape = love.physics.newRectangleShape(180,47)
  elseif self.Size == cloud3 then
    self.shape = love.physics.newRectangleShape(362,70)
  end
  
  
=======
  self.shape = love.physics.newRectangleShape(370,30)
>>>>>>> a564762bbc7eb4c5bf942b54894b5523db30a585
  self.fixture = love.physics.newFixture(self.body, self.shape, 100)
  self.fixture:setRestitution(0)
  self.fixture:setUserData("cloud")
  self.image = form
end

function Cloud:update(dt)
  if self.canvas == 'a' then
    self.body:setY(scrollcanvas.cay + self.relY)
  elseif self.canvas == 'b' then
    self.body:setY(scrollcanvas.cby + self.relY)
  end
end

function Cloud:draw()
  love.graphics.draw(self.image, self.body:getX(), self.body:getY(), self.body:getAngle(),
      1, 1, self.image:getWidth()/2)
end
