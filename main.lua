local anim8 = require('lib/anim8')
local mc = require('lib/middleclass')

require('assets')
require('cloud')
require('cookie')
require('scrollcanvas')
require('world')

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
  
  load_assets()

  
  love.physics.setMeter(C.pixelpermeter)
  world = love.physics.newWorld(0, C.g*love.physics.getMeter(), true)
  
  objects = {}
  
  cloud = Cloud:new()
  
  objects.cookie = {}
  objects.cookie.body =  love.physics.newBody(world, C.W/2, C.H/2-20, "dynamic")
  objects.cookie.body:setFixedRotation(true)
  objects.cookie.shape = love.physics.newCircleShape(40)
  objects.cookie.fixture = love.physics.newFixture(objects.cookie.body, objects.cookie.shape, 1)
  objects.cookie.fixture:setRestitution(0.5)
  
  canvas1 = love.graphics.newCanvas(C.W, C.H + 100)

  love.graphics.setBackgroundColor(177, 215, 231)
end
 

function love.update(dt)
  world:update(dt)
    
  update_cookies(dt)
  
  update_scrollcanvas(dt)
    
  
end
 

function love.draw()
  
  draw_world()
  
  love.graphics.draw(cloud1, objects.cloud.body:getX(), objects.cloud.body:getY())
  
  draw_scrollcanvas()
  
  draw_cookies()

  
end