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

--DEBUG = require("mobdebug").start() -- start debugger for live-coding
-- DEBUG.on()
-- DEBUG.off()

local clouds = {}
local scrollcanvas = SC:new()

function love.load()
  
  load_assets()
  
  love.physics.setMeter(C.pixelpermeter)
  world = love.physics.newWorld(0, C.g*love.physics.getMeter(), true)
  
  table.insert(clouds, Cloud:new(C.W/2, C.H/2))
  table.insert(clouds, Cloud:new(C.W/2+100, C.H/2+100))
  
  cookieA = Cookie:new(C.W/2, C.H/2)

  love.graphics.setBackgroundColor(177, 215, 231)
end
 

function love.update(dt)
  world:update(dt)
  
  if love.keyboard.isDown("right") then
    cookieA:rechtsGehen() 
  end
  
  update_cookies(dt)
  
  scrollcanvas:update(dt)
end
 

function love.draw()
  
  draw_world()
  
  for k,v in pairs(clouds) do
    v:draw()
  end
  
  love.graphics.draw(cookie1, cookieA.body:getX(), cookieA.body:getY())
  
  scrollcanvas:draw()
end