-- menu functions

function update_menu()
  local bw, bh = 200, 80
  local state = suit.Button("FIGHT!", {font = buttonFont}, C.W/2-bw/2,420, bw,bw-50)
  local credits_state = suit.Button("CREDITS", {font = smallFont}, C.W/2-bw/2,600, bw,bh)
  
  if state.hit then Gamestate.switch(game) end
  if credits_state.hit then Gamestate.switch(credits) end
end

function draw_menu()
    
  love.graphics.draw(logoB, 300, 50)
  
  -- cookie A
  love.graphics.draw(cookieBmenu, 50, C.H-400, 0, 1)
  love.graphics.draw(keyLeft, C.W-300, C.H-500)
  love.graphics.draw(keyRight, C.W-200, C.H-500)
  love.graphics.draw(keyUp, C.W-250, C.H-600)
  
  -- cookie A
  love.graphics.draw(cookieAmenu, C.W-350, C.H-400, 0, 1)
  love.graphics.draw(keyA, 100, C.H-500)
  love.graphics.draw(keyD, 200, C.H-500)
  love.graphics.draw(keyW, 150, C.H-600)

  love.graphics.setFont(smallFont)
  love.graphics.print("KLUJAM 2017 Entry", 410, C.H-30)
end
