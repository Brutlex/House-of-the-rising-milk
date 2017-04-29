-- menu functions

function update_menu()
  
  local bw, bh = 300, 100
  local state = suit.Button("START", {font = buttonFont}, C.W/2-bw/2,500, bw,bh)
  
  if state.hit then Gamestate.switch(game) end
end

function draw_menu()
  -- cookie A
  love.graphics.draw(cookieAmenu, C.W-200-80, 400, 0, 1)
  love.graphics.draw(keyLeft, 700, 300)
  love.graphics.draw(keyRight, 800, 300)
  love.graphics.draw(keyUp, 750, 200)
  
  -- cookie A
  love.graphics.draw(cookieBmenu, 200, 400, 0, 1)
  love.graphics.draw(keyA, 100, 300)
  love.graphics.draw(keyD, 200, 300)
  love.graphics.draw(keyW, 150, 200)

end
