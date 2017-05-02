local mc = require('lib/middleclass')
Gamestate = require('lib/gamestate')
suit = require('lib/SUIT')

require('assets')
require('cloud')
require('cookie')
require('scrollcanvas')
require('world')
require('menu')
require('win')
require('credits')

C = { --table for constants
  g = 9.81*2,
  pixelpermeter = 64,
  W = love.graphics.getWidth(),
  H = love.graphics.getHeight(),
}


--DEBUG = require("mobdebug").start() -- start debugger for live-coding
--DEBUG.on()
--DEBUG.off()


-- gamestate stuff
menu = {}
game = {}
win = {}
credits = {}
sound = true 


function menu:enter()
  if sound then
    music:play() 
  end
end

function menu:update()
  update_menu()
end

function menu:draw()
  draw_menu()
end  

function menu:keypressed(key, code)
  suit.keypressed(key)
  if key == 'return' then
    Gamestate.switch(game)
  end
  if key == 'escape' then
    love.event.quit()
  end
end

function game:enter()
  if sound then
    music:rewind()
    music:play()
  end
  love.physics.setMeter(C.pixelpermeter)

  world = love.physics.newWorld(0, C.g*love.physics.getMeter(), true)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)

  borderL()
  borderR()
  borderU()


  --Test wolken --
  scrollcanvas = SC:new()

  place_clouds()

  -- CookieSpieler --
  cookieA = Cookie:new(C.W/2+350, 400, "cookie1", Cookie1)
  cookieB = Cookie:new(C.W/2-350, 400, "cookie2", Cookie2)

end

function game:update(dt)
  world:update(dt)

  -- Bewegungen --
  -- cookie A
  if love.keyboard.isDown("left") then
    cookieA:linksGehen()
  end

  if love.keyboard.isDown("right") then
    cookieA:rechtsGehen()
  end

  if love.keyboard.isDown("up") then
    if cookieA.contact then
      cookieA:springen() 
    end
  end

  -- cookie B
  if love.keyboard.isDown("a") then
    cookieB:linksGehen()
  end

  if love.keyboard.isDown("d") then
    cookieB:rechtsGehen()
  end

  if love.keyboard.isDown("w") then
    if cookieB.contact then
      cookieB:springen()
    end 
  end

  scrollcanvas:update(dt)
end




function game:draw()
--  scrollcanvas:draw()

  love.graphics.draw(background, 0, 0)

  cookieA:draw()
  cookieB:draw()

  for k,v in pairs(clouds) do
    v:draw()
  end

  love.graphics.draw(milch, 0, 550)
end

function love.load()
  load_assets()

  love.graphics.setBackgroundColor(177, 215, 231)

  Gamestate.registerEvents()
  Gamestate.switch(menu)
end

function game:keypressed(key, code)
  if key == 'escape' then
    Gamestate.switch(menu)
  end
end


function win:update()
  update_win()
end

function win:draw()  
  draw_win()
end  

function credits:update()
  update_credits()
end

function credits:draw()  
  draw_credits()
end  


function love.update(dt)
end

function love.draw()
  suit.draw()
end

function love.keypressed(k, s, r)
  if k == 'm' then
    if sound then
      sound = false
      love.audio.pause()
    else
      sound = true
      love.audio.resume()
    end
  end

  if k == '0' then
    scrollcanvas.speed = scrollcanvas.speed + 5
  end

  if k == '9' then
    scrollcanvas.speed = scrollcanvas.speed - 5
  end
end