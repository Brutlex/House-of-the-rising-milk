function love.load()
  cookie1 = love.graphics.newImage("Cookie1.1.png")
end
 

function love.update(dt)

end
 

function love.draw()
  love.graphics.draw(cookie1, 100, 100)
  love.graphics.rectangle("fill", 0, love.graphics.getHeight() - 100, love.graphics.getWidth(), 100)
end