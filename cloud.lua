-- cloud class and related functionality

local class = require('lib/middleclass')

Cloud = class('Cloud')

function Cloud:initialize(x, y, canvas, form)
  self.canvas = canvas -- 'a' or 'b'
  self.relY = y
  self.image = form
  self.w = self.image:getWidth()
  self.h = self.image:getHeight()
  self.body = love.physics.newBody(world, x, y)

  if form == cloudM1 then
    self.shape = love.physics.newRectangleShape(387,30)
  elseif form == cloudS1 then
    self.shape = love.physics.newRectangleShape(180,47)
  elseif form == cloudM2 then
    self.shape = love.physics.newRectangleShape(362,30)
  end

  self.fixture = love.physics.newFixture(self.body, self.shape)
  self.fixture:setFriction(0.3)
  self.fixture:setRestitution(0.5)
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

  love.graphics.setColor(255,0,0)
  --love.graphics.rectangle('line', self.body:getX()-w/2, self.body:getY()+h/2, w, h)
  love.graphics.polygon("line", self.body:getWorldPoints(self.shape:getPoints()))
  love.graphics.setColor(255,255,255,255)

  love.graphics.draw(self.image, self.body:getX(), self.body:getY(), self.body:getAngle(),
    1, 1, self.image:getWidth()/2, self.image:getHeight()/2)
end

function place_clouds()
  clouds = {}
  table.insert(clouds, Cloud:new(C.W/2+350, 2100, 'a', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2-350, 2100, 'a', cloudS1))
  table.insert(clouds, Cloud:new(0, 1900, 'a', cloudM2))
  table.insert(clouds, Cloud:new(C.W, 1900, 'a', cloudM1))
  table.insert(clouds, Cloud:new(C.W/2, 2100, 'a', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2, 1850, 'a', cloudS1))

  table.insert(clouds, Cloud:new(C.W/2+200, C.H/2+200, 'b', cloudM1))
  table.insert(clouds, Cloud:new(C.W/2-50, C.H/2-100, 'b', cloudM2))
  table.insert(clouds, Cloud:new(C.W/2-300, C.H/2+150, 'b', cloudS1))
  table.insert(clouds, Cloud:new(C.W/2+150, C.H/2-350, 'b', cloudM2))
end
