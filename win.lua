-- end functions

function update_win()
  
  local bw, bh = 300, 100
  local state = suit.Button("AGAIN", {font = buttonFont}, C.W/2-bw/2,500, bw,bh)
  
  if state.hit then Gamestate.switch(game) end

  if love.keyboard.isDown("return") or love.keyboard.isDown("kpenter") then
    Gamestate.switch(game)
  end
end

function draw_win()
end
