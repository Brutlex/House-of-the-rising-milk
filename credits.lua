-- end functions

function update_credits()
  
  local bw, bh = 300, 100
  local state = suit.Button("BACK", {font = buttonFont}, C.W/2-bw/2,600, bw,bh)
  
  if state.hit then Gamestate.switch(menu) end

  if love.keyboard.isDown("return") or love.keyboard.isDown("kpenter") then
    Gamestate.switch(menu)
  end
end

function draw_credits()
  love.graphics.setFont(buttonFont)
  local start = 50
  local yoffset = 100
  love.graphics.print("Demi Dauerer", 310, start)
  love.graphics.print("Stephanie Kühnl", 280, start+yoffset)
  love.graphics.print("Bojan Miljevic", 310, start+yoffset*2)
  love.graphics.print("Philipp Überbacher", 250, start+yoffset*3)
  love.graphics.print("Music by Peter Hafele", 210, start+yoffset*4)
end
