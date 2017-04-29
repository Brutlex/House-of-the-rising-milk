-- menu functions

function update_menu()
  
  local bw, bh = 300, 100
  local state = suit.Button("FIGHT!", {font = buttonFont}, C.W/2-bw/2,370, bw,bw)
  
  if state.hit then Gamestate.switch(game) end
end

function draw_menu()
  love.graphics.setFont(buttonFont)
  love.graphics.print("Survival of the", 260, 50)
  love.graphics.print("COOKIEST", 335, 150)
  
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

end
