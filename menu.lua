

function update_menu()
  suit.layout:reset(100,100, 20,20)
  
  local bw, bh = 300, 100
  local state = suit.Button("START", {font = buttonFont}, C.W/2-bw/2,500, bw,bh)
  
  
  if state.hit then Gamestate.switch(game) end
end