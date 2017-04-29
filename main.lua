local anim8 = require('lib/anim8')
local mc = require('lib/middleclass')
Gamestate = require('lib/gamestate')
suit = require('lib/SUIT')

require('assets')
require('cloud')
require('cookie')
require('scrollcanvas')
require('world')
require('menu')

C = { --table for constants
  g = 9.81,
  pixelpermeter = 64,
  W = love.graphics.getWidth(),
  H = love.graphics.getHeight(),
}

--DEBUG = require("mobdebug").start() -- start debugger for live-coding
-- DEBUG.on()
-- DEBUG.off()

-- gamestate stuff
menu = {}
game = {}

function menu:update()
  update_menu()
end

function menu:draw()
  --love.graphics.print("Press Enter to continue", 10, 10)
  suit.draw()
end  

function menu:keypressed(key, code)
  suit.keypressed(key)
  if key == 'return' then
    Gamestate.switch(game)
  end
end

function game:enter()

  love.physics.setMeter(C.pixelpermeter)

  world = love.physics.newWorld(0, C.g*love.physics.getMeter(), true)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)
  
  border()
  
  --Test wolken --
  clouds = {}
  table.insert(clouds, Cloud:new(C.W/2+100, C.H/2+100, 'a'))
  table.insert(clouds, Cloud:new(C.W/2-100, C.H/2-100, 'a'))
  table.insert(clouds, Cloud:new(C.W/2-200, C.H/2+100, 'a'))
  table.insert(clouds, Cloud:new(C.W/2+100, C.H/2-300, 'a'))

  -- CookieSpieler --
  cookieA = Cookie:new(C.W/2-100, C.H/2-400, "cookie1", Cookie1)
  cookieB = Cookie:new(C.W/2+100, C.H/2+100,"cookie2", Cookie2)


end

function game:update(dt)
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

function game:draw()
  for k,v in pairs(clouds) do
    v:draw()
  end

  cookieA:draw()
  cookieB:draw()

  scrollcanvas:draw()

  love.graphics.draw(milch, 0, 550)
end

function love.load()

  scrollcanvas = SC:new()

  load_assets()

  love.graphics.setBackgroundColor(177, 215, 231)

  Gamestate.registerEvents()
  Gamestate.switch(menu)
end


function love.update(dt)
end


function love.draw()
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