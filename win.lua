-- end functions

function update_win()
 
  if love.keyboard.isDown("m") then
      sound = false
      love.audio.pause()
  end
  --Ton an mit L
  if love.keyboard.isDown("l") then
      sound = true
      music:rewind()
      music:play()
      music:setVolume(0.8)
  end
  local bw, bh = 300, 100
  local state = suit.Button("AGAIN", {font = buttonFont}, C.W/2-bw/2,600, bw,bh)
  
  if state.hit then Gamestate.switch(game) end

  if love.keyboard.isDown("return") or love.keyboard.isDown("kpenter") then
    Gamestate.switch(game)
  end
end

function draw_win()
  if (cookieB.winner) then
  love.graphics.draw(cookieBmenu, C.W/2-150, 200)
  elseif (cookieA.winner) then
  love.graphics.draw(cookieAmenu, C.W/2-150, 200)
  end
end
