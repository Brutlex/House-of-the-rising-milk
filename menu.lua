

function update_menu()
  suit.layout:reset(100,100, 20,20)
  
  local bw, bh = 300, 100
  local state = suit.Button("START", {font = buttonFont}, C.W/2-bw/2,500, bw,bh)
  
  
  
  if state.hit then Gamestate.switch(game) end
end

function draw_menu()
  -- cookie A
  love.graphics.draw(Cookie1.normal, 770, 400, 0, 1)
  love.graphics.draw(keyLeft, 700, 300)
  love.graphics.draw(keyRight, 800, 300)
  love.graphics.draw(keyUp, 750, 200)
  
  -- cookie A
  love.graphics.draw(Cookie2.normal, 770, 400, 0, 1)
  love.graphics.draw(keyA, 700, 300)
  love.graphics.draw(keyD, 800, 300)
  love.graphics.draw(keyW, 750, 200)

end
