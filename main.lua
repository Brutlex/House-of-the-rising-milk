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
  
  cloudA = Cloud:new(C.W/2, C.H/2)
  cloudB = Cloud:new(C.W/2+10, C.H/2+10)
  
  cookieA = Cookie:new(C.W/2, C.H/2)
  
  
  canvas1 = love.graphics.newCanvas(C.W, C.H + 100)

  love.graphics.setBackgroundColor(177, 215, 231)
end
 

function love.update(dt)
  world:update(dt)
  
  if love.keyboard.isDown("right") then
    --cookieA.body:applyLinearImpulse(10, 0)
    cookieA:rechtsGehen() 
  end
  
  update_cookies(dt)
  
  update_scrollcanvas(dt)
    
  
end
 

function love.draw()
  
  draw_world()
  
  love.graphics.draw(cloud1, cloudA.x, cloudA.y)
  love.graphics.draw(cloud1, cloudB.x, cloudB.y)
  
  love.graphics.draw(cookie1, cookieA.x, cookieA.y)
  
  draw_scrollcanvas()
  
  --draw_cookies()

  
end