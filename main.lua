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



function love.load()

  
  scrollcanvas = SC:new()
  clouds = {}  
  load_assets()
  
  love.physics.setMeter(C.pixelpermeter)
  
  world = love.physics.newWorld(0, C.g*love.physics.getMeter(), true)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)
  
  --Test wolken --
  table.insert(clouds, Cloud:new(C.W/2+275, C.H/2+200, 'a', cloud2))
  table.insert(clouds, Cloud:new(C.W/2-50, C.H/2-100, 'a', cloud1))
  table.insert(clouds, Cloud:new(C.W/2-300, C.H/2+150, 'a', cloud2))
  table.insert(clouds, Cloud:new(C.W/2+150, C.H/2-300, 'a', cloud3))
  
  table.insert(clouds, Cloud:new(C.W/2+200, C.H/2+200, 'b', cloud1))
  table.insert(clouds, Cloud:new(C.W/2-50, C.H/2-100, 'b', cloud3))
  table.insert(clouds, Cloud:new(C.W/2-300, C.H/2+150, 'b', cloud2))
  table.insert(clouds, Cloud:new(C.W/2+150, C.H/2-350, 'b', cloud3))
  
  -- CookieSpieler --
  cookieA = Cookie:new(C.W/2+250, C.H/2+200, "cookie1", Cookie1)
  cookieB = Cookie:new(C.W/2-350, C.H/2+150,"cookie2", Cookie2)
  
  
  canvas1 = love.graphics.newCanvas(C.W, C.H + 100)

  love.graphics.setBackgroundColor(177, 215, 231)
end
 

function love.update(dt)
  world:update(dt)
  
  -- Bewegungen --
  if love.keyboard.isDown("right") then
     cookieA:rechtsGehen() 
  elseif love.keyboard.isDown("d") then
     cookieB:rechtsGehen()
  elseif love.keyboard.isDown("left") then
     cookieA:linksGehen() 
  elseif love.keyboard.isDown("a") then
     cookieB:linksGehen()
  elseif love.keyboard.isDown("up") then
    if cookieA.contact then
     cookieA:springen() 
    end
  elseif love.keyboard.isDown("w") then
    if cookieB.contact then
     cookieB:springen()
    end 
  end
  
  scrollcanvas:update(dt)
end
 

function love.draw()
  
  
  
  for k,v in pairs(clouds) do
    v:draw()
  end
  
  cookieA:draw()
  cookieB:draw()

  --Cookies zeichnen--
  --love.graphics.draw(cookieA.image, cookieA.body:getX(), cookieA.body:getY())
  --love.graphics.draw(cookie2, cookieB.body:getX(), cookieB.body:getY())
  
  scrollcanvas:draw()
  
end

function beginContact(a, b, coll)
  if(b:getUserData() == "cookie1") then
    cookieA.contact = true
    cookieA.image = cookieA.img.normal
  end
  if(b:getUserData() == "cookie2") then
    cookieB.contact = true
    cookieB.image = cookieB.img.normal
  end 
end
 
function endContact(a, b, coll) 
  if(b:getUserData() == "cookie1") then
    cookieA.contact = false
  end
  if(b:getUserData() == "cookie2") then
    cookieB.contact = false
  end 
end
 
function preSolve(a, b, coll)
 --not used
end
 
function postSolve(a, b, coll, normalimpulse, tangentimpulse)
 --not used
end