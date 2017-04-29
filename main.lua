local anim8 = require('lib/anim8')
local mc = require('lib/middleclass')

require('cloud')
require('cookie')
require('scrollcanvas')

C = { --table for constants
  g = 9.81,
  pixelpermeter = 64,
  W = love.graphics.getWidth(),
  H = love.graphics.getHeight(),
  }

-- DEBUG = require("mobdebug").start() -- start debugger for live-coding
-- DEBUG.on()
-- DEBUG.off()

function love.load()
  
  cloud1 = love.graphics.newImage("gfx/cloud1.png")
  cookie1 = love.graphics.newImage("gfx/Cookie1.1.png")

  
  love.physics.setMeter(C.pixelpermeter)
  world = love.physics.newWorld(0, C.g*love.physics.getMeter(), true)
  
  objects = {}
  
  objects.cookie = {}
  objects.cookie.body =  love.physics.newBody(world, C.W/2, C.H/2, "dynamic")
  objects.cookie.shape = love.physics.newCircleShape(40)
  objects.cookie.fixture = love.physics.newFixture(objects.cookie.body, objects.cookie.shape, 1)
  objects.cookie.fixture:setRestitution(0.9)

  objects.cloud = {}
  objects.cloud.body =  love.physics.newBody(world, C.W/2, C.H/2)
  objects.cloud.shape = love.physics.newRectangleShape(160, 0)
  objects.cloud.fixture = love.physics.newFixture(objects.cloud.body, objects.cloud.shape)

  canvas1 = love.graphics.newCanvas(C.W, C.H + 100)

  love.graphics.setBackgroundColor(177, 215, 231)
end
 

function love.update(dt)
  world:update(dt)
    
  update_cookies(dt)
  
  update_scrollcanvas(dt)
    
  
end
 

function love.draw()
  
  -- draw world
  love.graphics.rectangle("fill", 0, love.graphics.getHeight() - 100, love.graphics.getWidth(), 100)
  love.graphics.draw(cloud1, objects.cloud.body:getX(), objects.cloud.body:getY())
  
  draw_scrollcanvas()
  
  draw_cookies()

  
end