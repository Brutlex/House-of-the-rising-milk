-- cloud class and related functionality

local class = require('lib/middleclass')

Cloud = class('Cloud')

function Cloud:initialize(x, y, canvas, form)
  self.canvas = canvas -- 'a' or 'b'
  self.relY = y
  self.image = form
  self.w = self.image:getWidth()
  self.h = self.image:getHeight()
  self.sfw = 0.9 --shape scaling factor
  self.sfh = 0.8
  self.body = love.physics.newBody(world, x, y)
  self.shape = love.physics.newRectangleShape(self.w*self.sfw, self.h*self.sfh)
  self.fixture = love.physics.newFixture(self.body, self.shape)
  self.fixture:setFriction(1)
  self.fixture:setRestitution(0.3)
  self.fixture:setUserData("cloud")
end

function Cloud:update(dt)
  if self.canvas == 'a' then
    self.body:setY(scrollcanvas.cay + self.relY)
  elseif self.canvas == 'b' then
    self.body:setY(scrollcanvas.cby + self.relY)
  end
end

function Cloud:draw()
  local w,h = self.image:getWidth(), self.image:getHeight()
  
  love.graphics.draw(self.image, self.body:getX(), self.body:getY(), self.body:getAngle(),
    1, 1, self.image:getWidth()/2, self.image:getHeight()/2)
  
  love.graphics.setColor(255,0,0)
  love.graphics.rectangle('line', self.body:getX()-(w*self.sfw)/2, self.body:getY()-(h*self.sfh)/2, w*self.sfw, h*self.sfh)
  love.graphics.setColor(255,255,255,255)


end

function place_clouds()
  clouds = {}

  table.insert(clouds, Cloud:new(C.W/2+340, 2000, 'a', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2-340, 2000, 'a', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2, 1800, 'a', cloudM1))
  table.insert(clouds, Cloud:new(C.W/2-330, 1600, 'a', cloudM2))
  table.insert(clouds, Cloud:new(C.W/2+315, 1500, 'a', cloudM1))
  
  --table.insert(clouds, Cloud:new(C.W/2+50, 1350, 'a', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2-200, 1350, 'a', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2+340, 1250, 'a', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2-340, 1175, 'a', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2+100, 1000, 'a', cloudM1))
  
  table.insert(clouds, Cloud:new(C.W/2-300, 800, 'a', cloudM2))
  table.insert(clouds, Cloud:new(C.W/2+420, 800, 'a', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2+200, 600, 'a', cloudM1))
  table.insert(clouds, Cloud:new(C.W/2-340, 400, 'a', cloudM2))
  table.insert(clouds, Cloud:new(C.W/2+280, 400, 'a', cloudS1))

  table.insert(clouds, Cloud:new(C.W/2, 150, 'a', cloudM1))
  table.insert(clouds, Cloud:new(C.W/2+340, 50, 'a', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2-340, 30, 'a', cloudS1))
  
  table.insert(clouds, Cloud:new(C.W/2-290, 2100, 'b', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2-60, 2200, 'b', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2+10, 2000, 'b', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2+300, 2000, 'b', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2-300, 1800, 'b', cloudM1))
  table.insert(clouds, Cloud:new(C.W/2+410, 1800, 'b', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2+10, 1650, 'b', cloudM2))
  
  table.insert(clouds, Cloud:new(C.W/2+200, 1450, 'b', cloudM1))
  --table.insert(clouds, Cloud:new(C.W/2-200, 1450, 'b', cloudS1))
  
  --table.insert(clouds, Cloud:new(C.W/2+50, 1350, 'b', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2-200, 1250, 'b', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2+340, 1250, 'b', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2-340, 1175, 'b', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2+100, 1000, 'b', cloudM1))
  
  table.insert(clouds, Cloud:new(C.W/2-300, 800, 'b', cloudM2))
  table.insert(clouds, Cloud:new(C.W/2+420, 800, 'b', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2+200, 600, 'b', cloudM1))
  table.insert(clouds, Cloud:new(C.W/2-200, 550, 'b', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2-340, 400, 'b', cloudM2))
  table.insert(clouds, Cloud:new(C.W/2+280, 250, 'b', cloudS1))
  --table.insert(clouds, Cloud:new(C.W/2+200, 150, 'b', cloudS1))
  
  table.insert(clouds, Cloud:new(C.W/2-200, 150, 'b', cloudM2))
  table.insert(clouds, Cloud:new(C.W/2+200, 0, 'b', cloudM2))
  
  --table.insert(clouds, Cloud:new(C.W/2-150, 2400, 'a', cloudM1))
  table.insert(clouds, Cloud:new(C.W/2, 2150, 'a', cloudM2))

end
