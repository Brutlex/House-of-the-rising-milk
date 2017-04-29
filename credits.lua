-- end functions

function update_credits()
  
  local bw, bh = 300, 100
  local state = suit.Button("BACK", {font = buttonFont}, C.W/2-bw/2,600, bw,bh)
  
  if state.hit then Gamestate.switch(game) end

  if love.keyboard.isDown("return") or love.keyboard.isDown("kpenter") then
    Gamestate.switch(menu)
  end
end

function draw_credits()
  love.graphics.newFont()
  love.graphics.print("Demi Dauerer", 310, 100)
  love.graphics.print("Stephanie Kühnl", 280, 200)
  love.graphics.print("Bojan Miljevic", 310, 300)
  love.graphics.print("Philipp Überbacher", 250, 400)
  love.graphics.print("Music by Peter Hafele", 210, 500)
end
