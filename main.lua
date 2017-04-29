local anim8 = require('lib/anim8')
local mc = require('lib/middleclass')

DEBUG = require("mobdebug").start() -- start debugger for live-coding
-- DEBUG.on()
-- DEBUG.off()

function love.load()
  
  cloud1 = love.graphics.newImage("gfx/cloud1.png")
  cookie1 = love.graphics.newImage("gfx/Cookie1.1.png")

  
  love.physics.setMeter(64)
  world = love.physics.newWorld(0, 9.81*64, true)
  
  objects = {}
  
  objects.cookie = {}
  objects.cookie.body =  love.physics.newBody(world, 1024/2, 768/2, "dynamic")
  objects.cookie.shape = love.physics.newCircleShape(40)
  objects.cookie.fixture = love.physics.newFixture(objects.cookie.body, objects.cookie.shape, 1)

  objects.cloud = {}
  objects.cloud.body =  love.physics.newBody(world, 1024/2, 768/2)
  objects.cloud.shape = love.physics.newRectangleShape(160, 0)
  objects.cloud.fixture = love.physics.newFixture(objects.cloud.body, objects.cloud.shape)

  canvas1 = love.graphics.newCanvas(love.graphics.getWidth(), love.graphics.getHeight() + 100)

  love.graphics.setBackgroundColor(177, 215, 231)
end
 

function love.update(dt)
  
  world:update(dt)
  if love.keyboard.isDown("right") then
    objects.cookie.body:applyForce (400,0)
  end 

end
 

function love.draw()
  
  objects.cookie.fixture:setRestitution(0.9)love.graphics.draw(cookie1, objects.cookie.body:getX(), objects.cookie.body:getY())
  objects.cookie.fixture:setRestitution(0.9)love.graphics.draw(cloud1, objects.cloud.body:getX(), objects.cloud.body:getY())
  love.graphics.rectangle("fill", 0, love.graphics.getHeight() - 234, love.graphics.getWidth(), 100)
  love.graphics.draw(canvas1, 0, 0)
  
end