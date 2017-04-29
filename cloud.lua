-- cloud class and related functionality

local class = require('lib/middleclass')

Cloud = class('Cloud')

function Cloud:initialize(x, y, canvas, form)
  self.canvas = canvas -- 'a' or 'b'
  self.relY = y
  self.Size = form
  self.body = love.physics.newBody(world, x, y)
    
  if self.Size == cloudM1 then
    self.shape = love.physics.newRectangleShape(387,80)
  elseif self.Size == cloudS1 then
    self.shape = love.physics.newRectangleShape(180,47)
  elseif self.Size == cloudM2 then
    self.shape = love.physics.newRectangleShape(362,70)
  end
  
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

function place_clouds()
  clouds = {}
  table.insert(clouds, Cloud:new(C.W/2+350, 2100, 'a', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2-350, 2100, 'a', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2+150, 1800, 'a', cloudM2))
  table.insert(clouds, Cloud:new(C.W/2-50, 1750, 'a', cloudM1))
  
  
  
  table.insert(clouds, Cloud:new(C.W/2+200, C.H/2+200, 'b', cloudM1))
  table.insert(clouds, Cloud:new(C.W/2-50, C.H/2-100, 'b', cloudM2))
  table.insert(clouds, Cloud:new(C.W/2-300, C.H/2+150, 'b', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2+150, C.H/2-350, 'b', cloudM2))
end
