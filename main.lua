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

function love.load()
  
  
  text= ""  
  
  load_assets()

  love.physics.setMeter(C.pixelpermeter)
  
  world = love.physics.newWorld(0, C.g*love.physics.getMeter(), true)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)
  
  table.insert(clouds, Cloud:new(C.W/2, C.H/2))
  table.insert(clouds, Cloud:new(C.W/2+100, C.H/2+100))

  
  cookieA = Cookie:new(C.W/2, C.H/2, "CookieA")
  
  cookieB = Cookie:new(C.W/2+100, C.H/2+100,"CookieB")
  
  
  canvas1 = love.graphics.newCanvas(C.W, C.H + 100)

  love.graphics.setBackgroundColor(177, 215, 231)
end
 

function love.update(dt)
  world:update(dt)
  
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
  
    update_scrollcanvas(dt)
   
  if string.len(text) > 768 then    -- cleanup when 'text' gets too long
    text = "" 
  end
end
 

function love.draw()
  
  draw_world()
  
  for k,v in pairs(clouds) do
    v:draw()
  end
  
  love.graphics.draw(cookie1, cookieA.body:getX(), cookieA.body:getY())
  love.graphics.draw(cookie1, cookieB.body:getX(), cookieB.body:getY())
  
  draw_scrollcanvas()
  
  love.graphics.print(text, 10, 10)
end

function beginContact(a, b, coll)
  x,y = coll:getNormal()
  text = text.."\n"..a:getUserData().." colliding with "..b:getUserData().." with a vector normal of: "..x..", "..y 
    
  if(b:getUserData() == "CookieA") then
    cookieA.contact = true
  elseif(b:getUserData() == "CookieB") then
    cookieB.contact = true
  end 
end
 
function endContact(a, b, coll)
  x,y = coll:getNormal()
  text = text.."\n"..a:getUserData().." end colliding with "..b:getUserData().." with a vector normal of: "..x..", "..y 
  
  if(b:getUserData() == "CookieA") then
    cookieA.contact = false
  elseif(b:getUserData() == "CookieB") then
    cookieB.contact = false
  end 
end
 
function preSolve(a, b, coll)
 
end
 
function postSolve(a, b, coll, normalimpulse, tangentimpulse)
 
end